#!/usr/bin/env python3
"""Check rendered HTML using only the Python standard library.

Usage: python3 scripts/check_site.py [_site] [--baseurl /my-project]
Run after `bundle exec jekyll build`. This checks the built pages, not the source
templates. It does not make network requests or assess external link uptime.
"""
from __future__ import annotations

import argparse
import json
import re
import sys
from collections import Counter
from html.parser import HTMLParser
from pathlib import Path
from urllib.parse import unquote, urlsplit


class Page(HTMLParser):
    def __init__(self, path: Path):
        super().__init__(convert_charrefs=True)
        self.path = path
        self.raw = path.read_text(encoding="utf-8")
        self.ids: list[str] = []
        self.references: list[tuple[str, str, int]] = []
        self.id_references: list[tuple[str, str, int]] = []
        self.errors: list[str] = []
        self.metadata: dict[str, str] = {}
        self.title: list[str] = []
        self.title_count = 0
        self.h1_count = 0
        self.lang = ""
        self.charset = ""
        self.canonical = ""
        self.json_ld: list[str] = []
        self._in_title = False
        self._ld_parts: list[str] | None = None
        self.feed(self.raw)
        self.close()

    def handle_starttag(self, tag, attrs):
        attrs = {key: value or "" for key, value in attrs}
        line = self.getpos()[0]
        if "id" in attrs:
            if attrs["id"]:
                self.ids.append(attrs["id"])
            else:
                self.errors.append(f"line {line}: empty id")
        if tag == "html":
            self.lang = attrs.get("lang", "")
        if tag == "h1":
            self.h1_count += 1
        if tag == "title":
            self.title_count += 1
            self._in_title = True
        if tag == "meta":
            key = attrs.get("name") or attrs.get("property")
            if key:
                self.metadata[key.lower()] = attrs.get("content", "")
            if "charset" in attrs:
                self.charset = attrs["charset"] or ""
        if tag == "link" and "canonical" in attrs.get("rel", "").split():
            self.canonical = attrs.get("href", "")
        if tag == "script" and attrs.get("type", "").lower() == "application/ld+json":
            self._ld_parts = []
        if tag == "img" and "alt" not in attrs:
            self.errors.append(f"line {line}: image is missing an alt attribute")
        for attr in ("href", "src", "poster"):
            if attr in attrs:
                value = attrs[attr]
                if not value or not value.strip() or value == "#":
                    self.errors.append(f"line {line}: <{tag}> has an empty or placeholder {attr}")
                else:
                    self.references.append((value, f"<{tag}> {attr}", line))
        if "srcset" in attrs:
            for candidate in attrs["srcset"].split(","):
                parts = candidate.strip().split()
                if parts:
                    self.references.append((parts[0], f"<{tag}> srcset", line))
        for attr in ("aria-labelledby", "aria-describedby", "aria-controls", "data-copy-target"):
            for target in attrs.get(attr, "").split():
                self.id_references.append((target, attr, line))

    def handle_startendtag(self, tag, attrs):
        self.handle_starttag(tag, attrs)
        self.handle_endtag(tag)

    def handle_endtag(self, tag):
        if tag == "title":
            self._in_title = False
        if tag == "script" and self._ld_parts is not None:
            self.json_ld.append("".join(self._ld_parts))
            self._ld_parts = None

    def handle_data(self, text):
        if self._in_title:
            self.title.append(text)
        if self._ld_parts is not None:
            self._ld_parts.append(text)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("output", nargs="?", default="_site", type=Path)
    parser.add_argument("--baseurl", default="", help='Use the build baseurl, e.g. "/my-project".')
    args = parser.parse_args()
    root = args.output.resolve()
    baseurl = args.baseurl.rstrip("/")
    if baseurl and (not baseurl.startswith("/") or baseurl.startswith("//")):
        parser.error('--baseurl must be empty or a path such as "/my-project"')
    errors: list[str] = []
    pages: dict[Path, Page] = {}

    def get_page(path: Path) -> Page:
        if path not in pages:
            pages[path] = Page(path)
        return pages[path]

    for name in ("index.html", "404.html"):
        path = root / name
        if not path.is_file():
            errors.append(f"{name}: missing built page (run Jekyll first)")
            continue
        try:
            page = get_page(path)
        except (OSError, UnicodeError) as exc:
            errors.append(f"{name}: cannot read HTML: {exc}")
            continue

        def fail(message: str):
            errors.append(f"{name}: {message}")

        for message in page.errors:
            fail(message)
        for id_value, count in Counter(page.ids).items():
            if count > 1:
                fail(f"duplicate id {id_value!r} ({count} occurrences)")
        if page.h1_count != 1:
            fail(f"expected one h1, found {page.h1_count}")
        if page.title_count != 1 or len("".join(page.title).strip()) < 3:
            fail("expected one nonempty document title")
        if not page.lang.strip():
            fail("html element needs a language")
        if page.charset.lower().replace("-", "") != "utf8":
            fail("missing UTF-8 charset declaration")
        if "width=device-width" not in page.metadata.get("viewport", "").replace(" ", ""):
            fail("viewport must include width=device-width")
        if len(page.metadata.get("description", "").strip()) < 20:
            fail("description should be a meaningful sentence (at least 20 characters)")
        try:
            canonical = urlsplit(page.canonical)
        except ValueError:
            fail("canonical URL is malformed")
            canonical = urlsplit("")
        if canonical.scheme != "https" or not canonical.netloc:
            fail("canonical URL must be an absolute HTTPS URL")
        if baseurl and not (canonical.path == baseurl or canonical.path.startswith(baseurl + "/")):
            fail(f"canonical URL does not contain baseurl {baseurl!r}")
        for key in ("og:title", "og:description", "og:url", "og:image"):
            if not page.metadata.get(key, "").strip():
                fail(f"missing {key} metadata")
        if re.search(r"{{[\s\S]*?}}|{%[\s\S]*?%}", page.raw):
            fail("unrendered Liquid markup remains in the HTML")
        if not page.json_ld:
            fail("missing JSON-LD metadata")
        for i, value in enumerate(page.json_ld, 1):
            try:
                parsed = json.loads(value)
                if not isinstance(parsed, (dict, list)):
                    fail(f"JSON-LD block {i} must contain an object or array")
            except json.JSONDecodeError as exc:
                fail(f"invalid JSON-LD block {i}: {exc}")
        ids = set(page.ids)
        for target, attr, line in page.id_references:
            if target not in ids:
                fail(f"line {line}: {attr} refers to missing id {target!r}")

        references = list(page.references)
        if page.metadata.get("og:image"):
            references.append((page.metadata["og:image"], "og:image", 0))
        for value, label, line in references:
            try:
                url = urlsplit(value)
            except ValueError:
                fail(f"line {line}: malformed URL in {label}: {value!r}")
                continue
            if url.scheme in ("mailto", "tel", "data", "blob"):
                continue
            if url.netloc and url.netloc != canonical.netloc:
                continue
            if url.scheme and url.scheme not in ("http", "https"):
                fail(f"line {line}: unsupported URL scheme in {label}: {value!r}")
                continue
            path_part = unquote(url.path)
            if not path_part:
                target_path = path
            elif path_part.startswith("/"):
                if baseurl:
                    if path_part == baseurl:
                        path_part = "/"
                    elif path_part.startswith(baseurl + "/"):
                        path_part = path_part[len(baseurl):]
                    else:
                        fail(f"line {line}: {label} omits baseurl {baseurl!r}: {value!r}")
                        continue
                target_path = root / path_part.lstrip("/")
            else:
                target_path = path.parent / path_part
            target_path = target_path.resolve()
            if not target_path.is_relative_to(root):
                fail(f"line {line}: local URL escapes the build directory: {value!r}")
                continue
            if target_path.is_dir():
                target_path = target_path / "index.html"
            if not target_path.is_file():
                fail(f"line {line}: missing local target for {label}: {value!r}")
                continue
            if url.fragment and target_path.suffix.lower() in (".html", ".htm"):
                try:
                    target_ids = set(get_page(target_path).ids)
                    if unquote(url.fragment) not in target_ids:
                        fail(f"line {line}: broken anchor {value!r}")
                except (OSError, UnicodeError) as exc:
                    fail(f"cannot read anchor target {value!r}: {exc}")

    if errors:
        print(f"Rendered-site validation failed ({len(errors)} issues):", file=sys.stderr)
        for message in errors:
            print(f"  - {message}", file=sys.stderr)
        return 1
    print(f"Rendered-site validation passed: index.html and 404.html in {root} (baseurl {baseurl or '/'}).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

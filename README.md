# Yoonsik Park · Research Homepage

기존 GitHub Pages 홈페이지의 차분한 스타일을 유지하면서, 연구 소개와 논문을 중심으로 정리한 Jekyll 사이트입니다. 일상적인 업데이트는 `_data/`의 YAML 파일만 수정하면 됩니다.

- 홈페이지 주소: <https://yoonsik-ai.github.io/>
- 저장소: <https://github.com/yoonsik-ai/yoonsik-ai.github.io>
- 자세한 편집 방법: [콘텐츠 업데이트 가이드](docs/CONTENT_GUIDE.md)
- 이력·논문 확인 근거: [검증한 콘텐츠와 출처](docs/VERIFIED_CONTENT.md)

이 소스 패키지를 받은 것만으로 기존 홈페이지가 변경되지는 않습니다. 아래와 같이 기존 저장소에 반영하고 GitHub Pages 배포가 완료되면 공개 사이트에 적용됩니다.

## 먼저 화면 보기

ZIP 안의 **`PREVIEW.html`을 더블 클릭**하면 별도 설치 없이 완성된 화면을 볼 수 있습니다. 이 파일은 전달 시점의 정적 미리보기이며, 이후 YAML을 수정해도 자동으로 갱신되지는 않습니다. 실제 홈페이지는 아래의 소스를 GitHub에 반영하면 Jekyll이 다시 생성합니다.

`PREVIEW.html`은 배포와 Git 관리에서 제외되어 있습니다. 홈페이지 진입 파일로 사용하거나 `index.md` 대신 올리지 마세요.

## 자주 수정하는 파일

| 수정할 내용 | 파일 |
| --- | --- |
| 자기소개, 연구 관심사, 연락처, 외부 프로필 | `_data/profile.yml` |
| 논문·preprint, 저자, 링크, BibTeX | `_data/publications.yml` |
| 논문 그룹 순서·제목, 학회별 배지 색상 | `_data/publication_settings.yml` |
| 새 소식 | `_data/news.yml` |
| 학력 | `_data/education.yml` |
| 연구·인턴 경험 | `_data/experience.yml` |
| 프로필 사진 | `assets/img/profile.jpg`, `assets/img/profile.webp` |
| 사이트 주소와 빌드 설정 | `_config.yml` |
| 색상, 글자 크기, 여백 | `assets/css/style.css` |
| 글꼴 파일·라이선스 | `assets/fonts/source-sans-3.woff2`, `assets/fonts/source-sans-3-italic.woff2`, `assets/fonts/OFL-Source-Sans-3.md` |

화면의 글꼴은 [Adobe Source Sans 3](https://github.com/adobe-fonts/source-sans)로 통일했으며 정체와 이탤릭체 모두 사이트에 포함된 실제 글꼴 파일을 사용합니다. OFL 라이선스도 함께 포함했습니다.

논문은 **International Conferences → Preprints → Domestic Conferences** 순서로 표시되며, 각 그룹 안에서는 최신순으로 정렬됩니다. 저자 목록의 `Yoonsik Park`는 자동으로 강조됩니다. BibTeX를 등록한 항목은 인용 정보를 펼쳐 읽고 복사할 수 있습니다. 뉴스도 최신순으로 정렬됩니다.

학회는 `venue: WWW`, 연도는 `year: 2026`처럼 따로 입력하면 배지에 함께 표시됩니다. 학회별 색상과 그룹 설정은 `_data/publication_settings.yml`에서 수정할 수 있습니다. 색상은 이 홈페이지의 구분용 팔레트이며 공식 학회 색상이나 순위를 뜻하지 않습니다.

**News는 소개글 다음, Publications & Preprints 위에 배치합니다. 기존 홈페이지의 6개 항목과 원래 문구·이모지를 유지하고, 6개 모두 바로 표시합니다.** 이후 소식은 `_data/news.yml`에서 직접 추가하거나 수정하면 됩니다. 공개 소식이 6개를 넘으면 지난 항목을 펼쳐 보는 기능이 나타납니다.

## 기존 GitHub 홈페이지에 적용하기

1. 기존 `yoonsik-ai.github.io` 저장소를 열고 현재 소스를 보관하거나 현재 commit을 확인합니다.
2. 전달받은 ZIP을 풉니다. 바깥의 폴더 자체가 아니라, 그 안의 소스 파일과 `_data/`, `_includes/`, `_layouts/`, `assets/` 폴더를 **기존 저장소 루트**에 반영합니다. 이름이 같은 파일은 새 파일로 교체합니다. `_config.yml`이 저장소의 최상위에 있어야 합니다.
3. **기존 `index.md`를 새 패키지의 `index.md`로 교체합니다.** 진입 파일 이름은 그대로 유지합니다. 저장소에 별도로 만든 `index.html`도 있다면 같은 홈페이지 경로를 생성하므로 중복 파일을 제거하세요. Git 저장소의 `.git` 정보나 별도로 관리하던 파일까지 지울 필요는 없습니다.
4. 변경 내용을 `main` 브랜치에 commit합니다. GitHub 웹에서는 **Add file → Upload files**로 폴더와 파일을 올리거나, 개별 파일의 편집 버튼으로 수정할 수 있습니다.
5. 저장소의 **Settings → Pages → Build and deployment**에서 **Source: Deploy from a branch**, **Branch: main**, **Folder: /(root)**를 선택하고 **Save**를 누릅니다. 이미 같은 설정이면 다시 바꾸지 않아도 됩니다.
6. **Actions**에서 Pages 빌드·배포 결과를 확인한 뒤 <https://yoonsik-ai.github.io/>를 엽니다. 실패하면 해당 실행의 오류 메시지를 먼저 확인합니다.

이 사이트는 GitHub Pages의 Jekyll 빌드를 사용합니다. 루트에 `.nojekyll`을 추가하지 마세요. 위 배포 설정은 [GitHub 공식 Pages 안내](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)에 따릅니다.

계정과 저장소 이름을 유지할 때 `_config.yml`의 주소는 다음과 같습니다.

```yaml
url: "https://yoonsik-ai.github.io"
baseurl: ""
```

## 이후에는 이렇게 업데이트하세요

**논문 추가:** GitHub에서 `_data/publications.yml`을 열고 [가이드의 템플릿](docs/CONTENT_GUIDE.md#새-논문preprint-추가)을 복사해 제목·저자·실제 공개 링크를 채웁니다. 공개할 준비가 되면 `published: true`로 저장합니다.

**소식 추가:** `_data/news.yml`에 `date`, `text`, `published`를 가진 항목을 하나 추가합니다. 화면 구성 파일을 수정할 필요는 없습니다.

**소개 수정:** `_data/profile.yml`의 `bio`가 화면의 소개 문단을, `links`가 연락처·외부 프로필 링크를 관리합니다. `interests`는 검색용 구조화 데이터에 쓰이는 선택 항목입니다.

`published: false`는 홈페이지에서 항목을 숨기는 표시입니다. **공개 저장소에 commit한 원문까지 비공개로 만드는 기능은 아닙니다.** 공개하지 않을 원고나 연구 정보는 저장소에 넣지 마세요.

## 로컬 미리보기

Ruby와 Bundler가 설치된 환경에서 저장소 폴더를 열고 실행합니다.

```bash
bundle install
bundle exec jekyll serve
```

브라우저에서 <http://127.0.0.1:4000/>를 열면 됩니다. 빌드만 확인하려면 다음 명령을 사용합니다.

```bash
bundle exec jekyll build
```

Jekyll의 템플릿과 데이터는 빌드 과정에서 HTML로 변환됩니다. 소스인 `index.md`를 직접 열면 완성된 화면 대신 템플릿이 보입니다. 설치 없이 전달된 화면을 보려면 `PREVIEW.html`, 수정 후 화면을 확인하려면 위 로컬 서버를 이용하세요. 환경 준비 방법은 [GitHub의 로컬 Jekyll 안내](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)를 참고하세요.

### 콘텐츠·빌드 결과 검사

검사 스크립트는 필수 데이터와 생성된 사이트의 링크·구조를 확인합니다. 아래 순서로 실행하면 됩니다. 마지막 검사는 Python 3가 필요하며, GitHub 웹에서 내용을 수정하고 배포하는 데에는 로컬 환경 설치가 필요하지 않습니다.

```bash
ruby scripts/check_content.rb
bundle exec jekyll build
python3 scripts/check_site.py _site
```

## 배포 전 확인할 부분

- 새 논문의 저자 순서, 공개 상태, 링크를 원문과 대조합니다.
- 휴대전화 너비에서 제목, 메뉴, 사진이 잘 보이는지 확인합니다.
- `Paper`, `Code`, `Project` 링크와 이메일 링크를 한 번씩 엽니다.
- 날짜는 따옴표를 포함한 `"2026-11-22"` 형태로 입력합니다.
- YAML 들여쓰기는 공백을 사용합니다. 탭을 넣거나 기존 항목의 정렬을 흐트러뜨리지 않습니다.

이 README와 `docs/`의 편집용 문서는 Jekyll의 사이트 출력에서 제외됩니다. 공개 저장소에서는 소스 문서로 읽을 수 있습니다.

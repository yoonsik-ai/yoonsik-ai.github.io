# Yoonsik GitHub Pages Site Guide

이번 버전은 **문장 과장 없이, content 중심으로 정리한 미니멀 레이아웃**입니다.

핵심 방향:
- About Me를 페이지 상단의 메인 블록으로 사용
- 사진은 **원형이 아니라 부드러운 모서리의 네모**
- 섹션 제목은 정확히 아래 순서만 사용
  - About Me
  - News
  - Education
  - Experiences
  - Publication
  - Projects
- 카드 느낌은 최소화하고, 내용이 먼저 보이도록 정리
- 인터랙션은 sticky nav / active section highlight / reveal 정도만 유지

---

## 1) 파일 구조

```text
yoonsik-githubio-minimal/
├── _config.yml
├── index.md
├── SITE_GUIDE.md
├── _layouts/
│   └── default.html
└── assets/
    ├── css/
    │   └── style.css
    └── img/
        └── profile.jpg
```

---

## 2) 어디를 수정하면 되는지

### `index.md`
실제 콘텐츠가 들어 있는 핵심 파일입니다.

대부분의 수정은 여기서 하면 됩니다.

포함된 섹션:
- About Me
- News
- Education
- Experiences
- Publication
- Projects

이력, 문장, 날짜, 링크를 바꾸려면 거의 항상 `index.md`만 수정하면 됩니다.

---

### `_layouts/default.html`
전체 사이트 레이아웃 파일입니다.

여기서 관리되는 것:
- 상단 sticky navigation
- footer
- active section highlight
- reveal animation

수정 추천 포인트:
- 상단 메뉴 텍스트
- footer 문구
- 섹션 순서 변경 시 nav 순서

---

### `assets/css/style.css`
디자인 전체를 담당합니다.

현재 스타일 방향:
- white / gray / black tone
- Calibri 우선 폰트
- 작은 그림자
- 얇은 보더
- 부드러운 둥근 모서리
- 과하지 않은 hover

가장 먼저 보면 좋은 곳:

```css
:root {
  --bg: #f7f7f5;
  --text: #141414;
  --text-soft: #4f4f4b;
  --line: rgba(20, 20, 20, 0.08);
  ...
}
```

여기 값만 바꿔도 전체 분위기가 많이 바뀝니다.

---

### `_config.yml`
사이트 기본 설정 파일입니다.

주로 수정할 것:
- `title`
- `email`
- `description`
- `url` / `baseurl` (배포 시 필요하면)

---

## 3) 프로필 사진 넣는 위치

프로필 사진 파일 경로:

```text
assets/img/profile.jpg
```

여기에 본인 사진을 **같은 파일명으로 덮어쓰기** 하면 됩니다.

현재 스타일:
- 원형 아님
- 부드러운 사각형
- 세로 비율이 잘 보이는 형태
- 자동 crop (`object-fit: cover`)

추천:
- 세로 사진 또는 정사각형에 가까운 사진
- 얼굴이 너무 아래로 내려가지 않은 사진
- 최소 800px 이상

사진 모서리 둥근 정도를 바꾸려면 `style.css`에서 아래 부분을 보면 됩니다.

```css
.photo-frame {
  border-radius: 28px;
}
```

---

## 4) News 추가 방법

`index.md`에서 `News` 섹션 아래에 있는 `.news-row` 하나를 복사해서 추가하면 됩니다.

템플릿:

```html
<article class="news-row">
  <div class="row-date">Apr. 2026</div>
  <div class="row-body">✨ Add your update here.</div>
</article>
```

작성 팁:
- 최대한 짧게
- 한 줄 느낌으로
- 이모지는 1개 정도만
- 최신 항목을 위에 두기

예시:

```html
<article class="news-row">
  <div class="row-date">Apr. 2026</div>
  <div class="row-body">✈️ Visiting Rio for ICLR 2026.</div>
</article>
```

---

## 5) Education / Experiences 추가 방법

`entry` 블록 하나가 항목 하나입니다.

템플릿:

```html
<article class="entry">
  <div class="entry-head">
    <div>
      <h3 class="entry-title">Role or Degree</h3>
      <p class="entry-subtitle">Institution · Lab · Advisor</p>
    </div>
    <div class="entry-date">Start — End</div>
  </div>
  <ul class="entry-points">
    <li>Point 1</li>
    <li>Point 2</li>
  </ul>
</article>
```

작성 팁:
- bullet 1~2개면 충분히 깔끔함
- contribution 중심으로 짧게 쓰기
- 문장을 너무 꾸미지 않기

---

## 6) Publication 추가 방법

현재는 publication 1개가 간단한 리스트 스타일로 들어가 있습니다.

템플릿:

```html
<article class="publication-item simple-list-item">
  <h3 class="entry-title">Paper Title</h3>
  <p class="publication-authors">Author A, <strong>Your Name</strong>, Author B</p>
  <div class="publication-meta">
    <span class="meta-chip">Venue</span>
    <span class="meta-chip">Year</span>
  </div>
</article>
```

논문 링크를 넣고 싶으면 제목을 `<a>`로 감싸면 됩니다.

예시:

```html
<h3 class="entry-title">
  <a href="https://..." target="_blank" rel="noreferrer">Paper Title ↗</a>
</h3>
```

---

## 7) Projects 추가 방법

프로젝트는 카드형으로 남겨두었습니다.

템플릿:

```html
<article class="project-card">
  <h3>Project Title</h3>
  <p class="project-meta">Category · Date</p>
  <p>Short description here.</p>
  <div class="project-tags">
    <span class="tag">Tag 1</span>
    <span class="tag">Tag 2</span>
  </div>
</article>
```

프로젝트 카드만 남긴 이유:
- 프로젝트는 리스트보다 카드가 더 구분이 잘 됨
- 하지만 보더와 그림자를 아주 약하게 해서 전체 톤은 미니멀하게 유지

---

## 8) 자주 만지는 CSS 포인트

### 전체 최대 너비

```css
:root {
  --site-width: 1080px;
}
```

### 이름 크기

```css
.page-title {
  font-size: clamp(2.65rem, 5vw, 4rem);
}
```

### About Me 정보 크기

```css
.about-meta dd {
  font-size: 0.95rem;
}
```

### 사진 크기
사진 너비는 `index.md`에서 왼쪽 컬럼 너비와 연결됩니다.

```css
.about-layout {
  grid-template-columns: 240px minmax(0, 1fr);
}
```

사진을 더 작게 하고 싶으면 `240px`를 `220px` 정도로 줄이면 됩니다.

---

## 9) CV 다운로드 링크 추가하고 싶을 때

현재 기본 버전에는 CV 링크를 넣지 않았습니다.
이유는 파일이 없는 상태에서 404가 나지 않게 하기 위해서입니다.

추가하려면 예를 들어 아래처럼 하면 됩니다.

1. `assets/files/` 폴더를 만들고
2. `cv.pdf`를 넣은 뒤
3. `index.md`의 링크 줄에 아래를 추가

```html
<a href="{{ '/assets/files/cv.pdf' | relative_url }}" target="_blank" rel="noreferrer">CV ↗</a>
```

---

## 10) GitHub Pages 배포 방법

보통 아래 구조로 올리면 됩니다.

1. GitHub repository 생성
2. 이 파일들을 repository root에 업로드
3. Repository Settings → Pages 진입
4. Branch를 `main` / root 로 설정
5. 저장 후 몇 분 기다리기

보통 주소는 이런 형태가 됩니다.

```text
https://<github-username>.github.io/
```

프로젝트 페이지라면:

```text
https://<github-username>.github.io/<repo-name>/
```

그 경우 `_config.yml`의 `baseurl`을 `/<repo-name>`으로 잡아야 할 수 있습니다.

---

## 11) 이번 버전의 핵심 수정 포인트

이전 버전 대비 바뀐 점:
- hero 문구를 줄이고 About Me 중심으로 재구성
- 섹션 설명 문장들을 제거해서 덜 오글거리게 정리
- info 영역을 작고 조용하게 축소
- 사진을 원형에서 rounded rectangle로 변경
- News / Education / Experiences / Publication은 카드보다 리스트 중심으로 단순화
- Projects만 약한 카드 형태 유지


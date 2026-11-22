# 콘텐츠 업데이트 가이드

홈페이지의 내용은 `_data/`에서 관리합니다. 레이아웃과 CSS를 건드리지 않고 논문, 소식, 소개를 갱신할 수 있습니다. `_data`는 [Jekyll에서 지원하는 데이터 파일 방식](https://jekyllrb.com/docs/datafiles/)입니다.

## 가장 자주 하는 작업

| 하고 싶은 일 | 수정할 파일 | 핵심 항목 |
| --- | --- | --- |
| 새 논문·preprint 올리기 | `_data/publications.yml` | 제목, 저자, 날짜, `category`, `links`, `published` |
| preprint를 학회 논문으로 바꾸기 | `_data/publications.yml` | 기존 항목의 `category`, `venue`, `year`, `highlight`, `bibtex` |
| 논문 그룹·학회 색상 바꾸기 | `_data/publication_settings.yml` | 그룹 순서·제목, 학회별 배지 색상 |
| 새 소식 올리기 | `_data/news.yml` | `date`, `text`, `published` |
| 자기소개·연락처 갱신 | `_data/profile.yml` | `bio`, `links` |
| 학력·경험 갱신 | `_data/education.yml`, `_data/experience.yml` | 기존 항목을 복사해 내용 수정 |

GitHub에서 해당 파일을 열고 편집한 뒤 `main`에 commit하면, 설정된 Pages 빌드가 실행됩니다. 먼저 수정된 화면을 확인하려면 README의 로컬 미리보기를 이용하세요. ZIP의 `PREVIEW.html`은 전달 시점의 화면을 바로 보는 파일이며 YAML 수정 내용이 자동으로 반영되는 편집기는 아닙니다.

## 새 논문·preprint 추가

아래 블록을 `_data/publications.yml`에 추가하고 예시 문구를 실제 공개 메타데이터로 바꾸세요. 파일 안에서 어디에 추가하든 해당 그룹 안에서 `date`를 기준으로 최신 항목이 먼저 표시됩니다.

```yaml
- id: my-paper-2026
  title: "Your paper title"
  year: 2026
  date: "2026-11-22"
  category: preprint
  venue: "arXiv"
  authors:
    - "Yoonsik Park"
    - "Coauthor Name"
  summary: >-
    A concise description of the research question and contribution.
  links: []
  published: false
```

이 템플릿의 날짜와 이름은 예시입니다. 실제 논문의 공개일과 저자 정보를 입력하세요. 필드를 모두 확인한 뒤 `published: true`로 바꾸면 홈페이지에 표시됩니다.

### 각 필드의 의미

| 필드 | 입력 방법 |
| --- | --- |
| `id` | 항목마다 다른 영문 소문자·숫자·하이픈 식별자. 이미 공개한 항목은 가능하면 유지합니다. |
| `title` | 논문의 정식 제목. 콜론이 들어갈 수 있으므로 따옴표로 감쌉니다. |
| `year` | 표시할 연도. 예: `2026`. 학회명과 따로 입력합니다. |
| `date` | 정렬에 사용할 날짜. 항상 `"YYYY-MM-DD"`로 입력합니다. |
| `category` | `international`, `preprint`, `domestic` 중 하나. 각각 국제학회, preprint, 국내학회 그룹에 표시됩니다. |
| `venue` | 연도를 제외한 학회 약칭 또는 공개처. 예: `WWW`, `KCC`, `CVPR`, `arXiv`. |
| `highlight` | 선택 사항. `Oral Presentation`, 확인된 수상 내역 등. 없으면 줄을 생략합니다. |
| `authors` | 논문 원문과 같은 순서의 이름 목록. `Yoonsik Park`는 프로필의 이름과 일치하여 자동으로 강조됩니다. |
| `summary` | 논문을 처음 보는 연구자가 이해할 수 있는 짧은 설명. 공개 초록·본문으로 뒷받침되는 내용만 적습니다. |
| `links` | 실제 존재하는 자료의 `label`, `url` 목록. 링크가 없으면 `[]`로 둡니다. |
| `bibtex` | 선택 사항. 실제 인용 정보를 여러 줄로 넣습니다. |
| `published` | 홈페이지 표시 여부. `true`이면 표시, `false`이면 숨김. |
| `image`, `image_alt` | 선택 사항. 논문 이미지 경로와 그 내용을 설명하는 대체 텍스트. |

저자 이름에 HTML이나 강조 기호를 직접 넣을 필요는 없습니다. 임의로 저자 순서를 바꾸거나 공동 제1저자 표시를 추가하지 마세요.

### 논문·코드·프로젝트 링크

`links: []`를 아래와 같은 목록으로 바꿀 수 있습니다. 아래는 이미 공개된 GRAFT의 실제 논문 주소를 이용한 형식 예시입니다. 새 논문에는 **해당 논문의 실제 URL**을 넣으세요.

```yaml
  links:
    - label: Paper
      url: https://arxiv.org/abs/2609.37868
```

같은 형식으로 `Code`, `Project`, `Dataset`, `Award` 등을 추가하면 됩니다. 아직 자료가 없으면 링크 항목을 만들지 않습니다. 빈 주소나 `#`를 넣어 버튼을 만들 필요는 없습니다. 학교의 수상 소개 페이지는 `Paper` 대신 `Award` 또는 `Announcement`로 표시하세요.

### BibTeX 등록

arXiv나 출판사의 인용 정보를 가져와 같은 항목 안에 붙여 넣습니다. `bibtex: |` 아래의 각 줄에는 두 칸 더 들여쓰기를 합니다. 아래는 형식만 보여주는 템플릿입니다.

```yaml
  bibtex: |
    @misc{yourkey2026,
      title={Your paper title},
      author={Yoonsik Park and Coauthor Name},
      year={2026}
    }
```

실제로 공개할 때는 해당 자료의 정확한 제목, 저자, 연도, arXiv ID 또는 학회·DOI를 사용하세요. BibTeX가 있는 항목에는 인용 정보를 펼쳐 읽는 기능과 복사 버튼이 생깁니다. 브라우저가 클립보드 접근을 허용하지 않더라도 펼쳐진 텍스트를 선택해 직접 복사할 수 있습니다.

### 논문 이미지 추가

공개한 논문의 대표 그림을 `assets/img/` 안에 넣고 해당 항목에 경로를 지정합니다. 다음 파일명은 형식 예시이므로 실제로 업로드한 파일명으로 바꾸세요.

```yaml
  image: /assets/img/my-paper.webp
  image_alt: "Diagram of the method's main components."
```

`image`를 생략하면 빈 썸네일 공간 없이 논문 정보를 표시합니다. 실제 이미지 파일이 있을 때만 경로를 추가하세요. 대체 텍스트에는 단순히 “figure”라고 쓰기보다 그림이 보여주는 내용을 설명하는 것이 좋습니다.

### 그룹 순서와 학회 색상

기본 표시 순서는 **International Conferences → Preprints → Domestic Conferences**입니다. 각 그룹 안에서는 날짜가 최신인 항목부터 표시됩니다. 그룹의 순서와 제목은 `_data/publication_settings.yml`에서 수정할 수 있습니다.

같은 파일에 CVPR, ICCV, ECCV, NeurIPS, ICML, ICLR, AAAI, IJCAI, ACL, EMNLP, NAACL, WWW, KDD, SIGIR, KCC의 배지 색상이 준비되어 있습니다. 설정에 없는 학회는 기본 슬레이트색으로, preprint는 중립적인 색으로 표시됩니다. 색상은 이 홈페이지의 구분용 팔레트이며 학회의 공식 브랜드나 순위를 의미하지 않습니다.

`venue`에는 약칭만, `year`에는 연도만 입력하세요. 예를 들어 `venue: WWW`, `year: 2026`은 `WWW 2026`으로 표시됩니다. `category: preprint`인 항목은 배지에 `Preprint`와 연도가 표시됩니다. 학회 채택 후에는 데이터만 갱신하면 되며, CSS 수정은 필요하지 않습니다.

### Preprint가 학회에 채택되면

같은 논문을 새 항목으로 중복 추가하지 말고 기존 항목을 수정합니다. 아래는 형식 예시이며, 실제로 확인한 학회와 연도로 바꾸세요.

```yaml
  category: international
  venue: "CVPR"
  year: 2027
```

국내학회라면 `category: domestic`을 사용합니다. 채택이 확정되면 실제 학회 약칭, 연도, 발표 구분을 기입합니다. 공개된 최종 인용 정보가 있으면 BibTeX도 갱신합니다. arXiv 링크는 유지하면서 출판사 링크를 추가할 수 있습니다. `date`는 공개일을 유지하거나 출판일로 바꾸되, 홈페이지 전체에서 일관된 기준을 사용하세요.

## 새 소식 추가

News는 소개글 다음, Publications & Preprints 위에 표시됩니다. 기존 홈페이지의 6개 소식이 원래 문구와 이모지로 들어 있으며 모두 바로 표시됩니다. 뉴스는 `_data/news.yml`에서 직접 관리하며, 필요할 때 원하는 소식을 추가하면 됩니다.

`_data/news.yml`에 다음 형식으로 항목을 추가합니다.

```yaml
- date: "2026-11-22"
  text: >-
    A new research update goes here.
  published: false
```

날짜와 문구를 실제 정보로 수정하고 `published: true`로 바꾸세요. `text`에는 Markdown 링크를 넣을 수 있습니다. 화면에서는 최신 소식 6개가 먼저 표시됩니다. 공개 소식이 6개를 넘으면 오래된 항목을 펼쳐 보는 기능이 나타나므로 이전 소식을 삭제하지 않아도 됩니다.

논문의 공개일, 채택 소식을 받은 날, 학교가 수상 소식을 게시한 날은 서로 다를 수 있습니다. 뉴스 문장의 의미와 날짜를 맞추세요. 월만 아는 기록은 정렬용 날짜를 해당 월 1일로 두되, 정확한 일자를 주장하는 문구는 쓰지 않습니다.

## 소개·프로필 사진·CV

`_data/profile.yml`의 `bio`가 화면에 보이는 소개 문단을 관리합니다. 문단 하나를 추가하려면 기존 항목처럼 `- >-`로 시작하면 됩니다. `links`는 연락처와 외부 프로필 링크 목록이며 각 항목에는 `label`, `url`을 입력합니다.

현재 연구 소개 문장은 다음과 같습니다.

> My research focuses on **reliable GUI agents and multimodal reasoning**.

`interests`는 선택적인 연구 키워드 목록으로, 검색용 JSON-LD 구조화 데이터에 사용됩니다. 화면의 소개 문장을 바꾸려면 `bio`를 수정하세요. `role`과 `affiliation`도 프로필 메타데이터로 유지합니다.

현재 프로필 사진 설정은 다음 두 파일을 사용합니다.

```yaml
image: /assets/img/profile.jpg
image_webp: /assets/img/profile.webp
```

사진을 바꿀 때 두 파일을 함께 교체하세요. JPG만 교체한다면 `image_webp` 항목을 제거해야 이전 WebP 사진이 우선 표시되는 일을 막을 수 있습니다. 원본 비율을 크게 바꾸면 모바일에서도 얼굴이 잘 보이는지 확인하세요.

CV는 파일이 실제로 준비되었을 때 추가합니다. 예를 들어 PDF를 `assets/files/cv.pdf`에 업로드한 뒤 `links` 목록에 아래 항목을 추가할 수 있습니다.

```yaml
  - label: CV
    url: /assets/files/cv.pdf
```

파일을 올리기 전에 CV 링크만 먼저 추가하지 마세요. Google Scholar나 ORCID도 본인의 정확한 프로필 주소를 확인한 뒤 같은 방식으로 등록합니다.

## 숨김 표시와 공개 범위

`published: false`는 **이 홈페이지의 화면에서만** 항목을 숨깁니다. 공개 GitHub 저장소에 commit한 파일과 과거 commit에서는 내용을 읽을 수 있습니다. 숨김 항목을 비공개 초안 저장소처럼 사용하지 마세요.

새로운 preprint는 공개 제목·저자·URL이 확인된 뒤 입력하면 됩니다. 공개하지 않은 원고, 익명 심사 정보, 내부 실험 수치는 이 저장소에 적지 않는 것이 맞습니다.

## YAML 편집 팁과 문제 해결

- 들여쓰기는 공백 두 칸 단위로 맞추고 탭은 사용하지 않습니다.
- 날짜는 `"2026-11-22"`처럼 따옴표를 붙입니다. `published`의 `true`와 `false`에는 따옴표를 붙이지 않습니다.
- 제목에 콜론이나 따옴표가 들어가면 YAML 문자열의 따옴표를 올바르게 닫습니다. 길거나 복잡한 설명은 기존 항목처럼 `>-`로 줄을 나눌 수 있습니다.
- 논문이 보이지 않으면 `published: true`인지, `category`가 `international`, `preprint`, `domestic` 중 하나인지, Pages 빌드가 성공했는지 확인합니다.
- 링크가 깨지면 URL과 파일명의 대소문자를 확인합니다. `assets/img/Paper.webp`와 `assets/img/paper.webp`는 다릅니다.
- 변경이 반영되지 않으면 Actions의 최신 Pages 실행과 마지막 commit을 확인하고 브라우저를 새로고침합니다.

편집용 문서는 사이트 출력에서 제외되지만 공개 저장소에서는 읽을 수 있습니다. 설정·템플릿을 수정한 경우에는 `bundle exec jekyll build`와 PC·모바일 화면을 함께 확인하세요.

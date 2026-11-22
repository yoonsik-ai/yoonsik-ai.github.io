# 콘텐츠 확인 기록

**확인 기준일: 2026-11-22**

이 문서는 홈페이지 내용을 유지·보수할 때 참고하는 출처 기록입니다. 사용자 제공 홈페이지의 내용과 별도의 공식 자료로 확인한 내용을 구분합니다. 이 문서에 기록했다는 사실이 해당 연구의 채택이나 성과를 새로 인증하는 것은 아닙니다.

## 기본 프로필

| 항목 | 사용한 정보 | 근거와 범위 |
| --- | --- | --- |
| 이름·소속 | Yoonsik Park, KAIST, MLILAB, M.S. Student | [KAIST MLILAB People](https://mli.kaist.ac.kr/people/)에 석사과정, Spring 2026 입학으로 기재되어 있음. |
| 이메일 | yoonsik.park@kaist.ac.kr | 같은 공식 연구실 페이지에서 확인. |
| 지도교수 | Prof. Eunho Yang | 제공된 기존 홈페이지에 명시되어 있으며, 소속 연구실의 교수 정보와 일치. |
| 학부 | Hanyang University, B.S. in Data Science | 기존 홈페이지의 정보. [한양대 공식 수상 소식](https://hyds.hanyang.ac.kr/front/notice/unNews/view?id=1841)에서도 데이터사이언스학부 졸업생임을 확인. |
| 학위 기간·성적·졸업 석차 | 기존 홈페이지의 날짜, GPA, Summa Cum Laude, 조기 졸업·수석 정보 | 사용자가 제공한 `yoonsik-ai.github.io-main.zip`의 `index.md`를 보존·정리한 정보. 성적표 등 별도 자료로 재검증하지 않음. |
| 인턴 경력·내부 성능 수치 | NAVER Place AI, KAIST MLILAB, Hanyang BAIKLAB | 제공된 기존 홈페이지에 근거. 기업 내부 성과·수치는 독립적으로 확인하지 않음. |
| 현재 연구 소개 | My research focuses on **reliable GUI agents and multimodal reasoning**. | 사용자가 직접 지정한 본인 연구 소개. 공식 연구실 페이지는 더 넓은 범위의 Multimodal Learning / Reliable AI로 소개함. |

기존 공개 홈페이지는 <https://yoonsik-ai.github.io/>입니다. 홈페이지 내용은 이후 수정될 수 있으므로, 이번 개편의 원본 근거는 사용자가 제공한 ZIP입니다.

## 공개 논문·Preprint

### GRAFT

- **정식 제목:** Learning Beyond What You Sample: Off-Policy-Aware Cross-Model Trajectory Exchange for RLVR
- **저자 순서:** Doohyuk Jang, Yoonsik Park, Gyouk Chu, Sihwan Park, Eunho Yang
- **상태:** 공개 preprint
- **arXiv 최초 제출일:** 2026-09-29
- **확인한 자료:** [arXiv 초록 페이지](https://arxiv.org/abs/2609.37868), [arXiv 본문](https://arxiv.org/html/2609.37868v1)
- **요약 범위:** 자신의 rollout이 실패한 상황에서 다른 모델의 reasoning trajectory를 활용하는 연구라는 점을 공개 초록·본문에서 확인.
- **링크 처리:** 논문 링크를 제공. 공식 코드나 프로젝트 페이지는 확인하지 못해 추가하지 않음.

### FlipDir

- **정식 제목:** Looks the Same, Answers Differently: Flip-Direction Steering for Robust Vision-Language Reasoning
- **저자 순서:** Yeonsung Jung, Joonhyun Jeong, Hoang Pham, Joowon Kim, Yoonsik Park, Viet Dac Lai, Eunho Yang
- **상태:** 공개 preprint
- **arXiv 최초 제출일:** 2026-09-23
- **확인한 자료:** [arXiv](https://arxiv.org/abs/2609.28851), [공식 프로젝트 페이지](https://yeonsungjung.github.io/projects/flipdir/)
- **요약 범위:** 미세한 이미지 변화에 따른 답변 변화를 줄이기 위해 추론 중 activation을 선택적으로 조정한다는 내용을 공개 자료에서 확인.
- **링크 처리:** 논문·프로젝트 링크를 제공. 프로젝트 페이지에 코드는 coming soon으로 표시되어 있었으므로 Code 링크는 추가하지 않음. 연결된 데이터셋 주소는 확인 도구에서 접근이 제한되어 링크를 추가하지 않음.

GRAFT와 FlipDir는 확인 기준일에 공개 preprint로 확인되었습니다. 향후 채택 정보가 발표되면 해당 공식 자료에 따라 `category`, `venue`, BibTeX를 갱신하면 됩니다.

### BiasEdit

- **정식 제목:** BiasEdit: A Training-Free Bias-Detect-and-Edit Framework for Learning Fair Visual Classifiers
- **저자 순서:** Jungwook Seo, Yoonsik Park, Changmin Lee, Sungyong Baik
- **학회:** The ACM Web Conference 2026 / WWW 2026
- **발표 구분:** Oral Presentation
- **출판 DOI:** [10.1145/3774904.3792411](https://doi.org/10.1145/3774904.3792411)
- **arXiv:** [2605.28450](https://arxiv.org/abs/2605.28450), 2026-05-27 제출
- **공식 코드:** [BAIKLAB/BiasEdit](https://github.com/BAIKLAB/BiasEdit)
- **교차 확인:** [한양대 공식 연구 소식](https://hyds.hanyang.ac.kr/front/notice/unNews/view?id=1844), [한양대 학술성과 기록](https://hanyang.scholarworks.kr/item/9792a44e-035b-4498-8e2a-1c717231eb83), [WWW 2026 공식 일정](https://www2026.thewebconf.org/program/full-schedule.html)
- **날짜 구분:** 학술성과 기록은 2026년 4월 출판으로 기재. 2026년 1월 채택 소식은 기존 홈페이지에서 가져온 기록이며, 5월 arXiv 제출일과 다른 의미임.
- **요약 범위:** 데이터의 편향 속성을 자동으로 탐지·편집해 편향 주석 없이 시각 분류의 공정성·강건성을 개선한다는 내용을 공개 논문과 공식 저장소에서 확인.

### HBD

- **정식 제목:** Harnessing Bias for Debiasing: Annotation-Free Prompt Learning for Robustness in CLIP
- **저자 순서:** Yoonsik Park, Sungyong Baik
- **학회:** Korea Computer Congress 2026 / KCC 2026
- **수상:** 학부생부문 최우수상. 기존 홈페이지의 영문 표기는 Best Paper Award · Undergraduate Division.
- **확인한 공식 자료:** [한양대 수상 소식](https://hyds.hanyang.ac.kr/front/notice/unNews/view?id=1841)
- **확인 범위:** 논문 제목, 박윤식 졸업생·지도교수 백성용, 졸업프로젝트 기반 연구 및 수상 사실을 공식 기사에서 확인. 저자 순서는 제공된 기존 홈페이지와 일치.
- **링크 처리:** 사용자 요청에 따라 홈페이지의 Award 링크는 표시하지 않음. 공식 수상 소식은 이 문서의 확인 근거로만 보관하며, 수상 내역 텍스트는 유지.
- **날짜 구분:** 학교의 수상 소개 게시일은 2026-09-07로 확인. 이 날짜를 실제 수상식 날짜나 논문 출판일로 해석하지 않음.

## 날짜를 저장하는 기준

YAML의 `date`는 항목 정렬에도 사용됩니다. 정확한 공개일이 확인된 arXiv preprint는 그 날짜를 사용합니다. 기존 학회 기록처럼 월까지만 확인된 경우의 `YYYY-MM-01`은 **해당 월의 정렬용 값**이며 실제 1일에 발표·출판되었다는 주장이 아닙니다. HBD의 6월 기록과 BiasEdit의 4월 기록은 이 기준으로 관리합니다.

## 기존 소식 유지

News는 사용자가 제공한 기존 홈페이지의 다음 6개 항목만 유지하고 모두 바로 표시합니다. 문구와 이모지를 보존했으며, 날짜의 1일은 기존의 월·연도 표기를 정렬 가능한 값으로 저장하기 위한 값입니다.

| 기존 표시 월 | 소식 |
| --- | --- |
| Mar. 2026 | KAIST AI 석사과정 시작 및 MLILAB 합류 |
| Jan. 2026 | 첫 논문 BiasEdit의 WWW 2026 Oral 채택 |
| Dec. 2025 | NAVER Place AI 연구 인턴 시작 |
| Aug. 2025 | 한양대 조기 졸업·Summa Cum Laude·학과 수석 및 감사 문구 |
| Jun. 2025 | KAIST MLILAB 학부 연구 인턴 시작 |
| Feb. 2024 | Hanyang BAIKLAB 학부 연구 인턴 시작 |

이후 뉴스는 `_data/news.yml`에서 직접 추가·수정할 수 있습니다. 공개 항목이 6개를 넘으면 지난 소식을 펼쳐 볼 수 있습니다. 논문 정보와 뉴스는 각각의 데이터 파일에서 관리합니다.

## 프로필 링크와 제외한 정보

- GitHub: <https://github.com/yoonsik-ai>
- LinkedIn: <https://linkedin.com/in/yoonsik-park-7473a838a>
- Google Scholar와 ORCID는 본인의 정확한 공개 프로필 주소를 독립적으로 확인하지 못해 추가하지 않았습니다.
- 동명이인의 기계·항공공학, OpenFOAM 관련 논문을 검색 결과에서 발견했으나 이 홈페이지의 연구 이력과 연결하지 않았습니다.
- 아직 공개 메타데이터가 확인되지 않은 연구는 새 논문 템플릿으로 추가할 수 있도록 준비했으며, 그 제목·수치·심사 상태를 임의로 기재하지 않았습니다.

## 운영 방식의 공식 참고 자료

- [GitHub Pages의 배포 원본 설정](https://docs.github.com/en/pages/getting-started-with-github-pages/configuring-a-publishing-source-for-your-github-pages-site)
- [Jekyll 사이트를 로컬에서 확인하는 방법](https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/testing-your-github-pages-site-locally-with-jekyll)
- [Jekyll Data Files](https://jekyllrb.com/docs/datafiles/)
- [Adobe Source Sans 3](https://github.com/adobe-fonts/source-sans): 화면 전체에 사용하는 글꼴. 정체·이탤릭체의 로컬 WOFF2 파일과 OFL 라이선스를 `assets/fonts/`에 포함.

위 운영 문서는 2026-11-22에 확인했습니다. 실제 GitHub 저장소 설정과 공개 배포 완료 여부는 저장소의 Pages 설정 및 Actions 결과에서 확인해야 합니다.

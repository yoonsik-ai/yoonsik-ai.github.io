---
layout: default
title: Home
description: Yoonsik Park
---

<!-- =========================================================
     ABOUT ME
     Replace the profile image at: assets/img/profile.jpg
========================================================== -->

<section id="about" class="section section-first reveal is-visible">
  <h2 class="section-title">About Me</h2>

  <div class="about-layout">
    <aside class="about-photo-column" aria-label="Profile">
      <div class="photo-frame">
        <img
          class="profile-photo"
          src="{{ '/assets/img/profile.jpg' | relative_url }}"
          alt="Profile photo of Yoonsik Park">
      </div>

      <div class="about-links" aria-label="External links">
        <a href="mailto:yoonsik.park@kaist.ac.kr">Email</a>
        <a href="https://github.com/yoonsik-ai" target="_blank" rel="noreferrer">GitHub ↗</a>
        <a href="https://linkedin.com/in/yoonsik-park-7473a838a" target="_blank" rel="noreferrer">LinkedIn ↗</a>
      </div>
    </aside>

    <div class="about-content">
      <h1 class="page-title">Yoonsik Park</h1>
      <p class="page-subtitle">M.S. Student · KAIST AI · MLILAB</p>

      <div class="about-copy">
        <p>
          I am an M.S. student in the Kim Jaechul Graduate School of AI at KAIST,
          working in MLILAB advised by Prof. Eunho Yang.
        </p>
        <p>
          My current research focuses on visual reasoning in multimodal large language models,
          with interests in faithfulness, hallucination mitigation, and robust multimodal learning.
        </p>
      </div>

      <dl class="about-meta">
        <div>
          <dt>Affiliation</dt>
          <dd>KAIST AI · MLILAB</dd>
        </div>
        <div>
          <dt>Research</dt>
          <dd>Visual reasoning in multimodal large language models</dd>
        </div>
        <div>
          <dt>Skills</dt>
          <dd>Python · PyTorch</dd>
        </div>
      </dl>
    </div>
  </div>
</section>

<!-- =========================================================
     NEWS
     Copy one .news-row block to add a new update.
========================================================== -->

<section id="news" class="section reveal">
  <h2 class="section-title">News</h2>

  <div class="news-list simple-list">
    <article class="news-row">
      <div class="row-date">2026</div>
      <div class="row-body">📄 BiasEdit accepted to WWW 2026 (Oral Presentation). My first Paper!</div>
    </article>

    <article class="news-row">
      <div class="row-date">Mar. 2026</div>
      <div class="row-body">🎓 Started M.S. at KAIST AI and joined MLILAB.</div>
    </article>

    <article class="news-row">
      <div class="row-date">Dec. 2025</div>
      <div class="row-body">🔬 Joined NAVER Place AI as a research intern.</div>
    </article>

    <article class="news-row">
      <div class="row-date">Aug. 2025</div>
      <div class="row-body">🏅 Graduated early from Hanyang University with Summa Cum Laude (Ranked 1st) in 7 semesters. Thanks Hanyang! 🦁</div>
    </article>

    <article class="news-row">
      <div class="row-date">Jun. 2025</div>
      <div class="row-body">🧪 Joined KAIST MLILAB as an undergraduate research intern.</div>
    </article>

    <article class="news-row">
      <div class="row-date">Feb. 2024</div>
      <div class="row-body">🌱 Joined BAIKLAB at Hanyang University as an undergraduate research intern.</div>
    </article>
  </div>
</section>

<!-- =========================================================
     EDUCATION
========================================================== -->

<section id="education" class="section reveal">
  <h2 class="section-title">Education</h2>

  <div class="entry-list simple-list">
    <article class="entry">
      <div class="entry-head">
        <div>
          <h3 class="entry-title">M.S. in Kim Jaechul Graduate School of AI</h3>
          <p class="entry-subtitle">KAIST · MLILAB · Advisor: Prof. Eunho Yang</p>
        </div>
        <div class="entry-date">Mar 2026 — Expected 2028</div>
      </div>
      <ul class="entry-points">
        <li>Research on visual reasoning in multimodal large language models.</li>
      </ul>
    </article>

    <article class="entry">
      <div class="entry-head">
        <div>
          <h3 class="entry-title">B.S. in Data Science</h3>
          <p class="entry-subtitle">Hanyang University (Seoul)</p>
        </div>
        <div class="entry-date">Mar 2022 — Aug 2025</div>
      </div>
      <ul class="entry-points">
        <li>Cumulative GPA: 4.35/4.5 · Major GPA: 4.38/4.5.</li>
        <li>Early graduation with Summa Cum Laude (Ranked 1st).</li>
      </ul>
    </article>
  </div>
</section>

<!-- =========================================================
     EXPERIENCES
========================================================== -->

<section id="experiences" class="section reveal">
  <h2 class="section-title">Experiences</h2>

  <div class="entry-list simple-list">
    <article class="entry">
      <div class="entry-head">
        <div>
          <h3 class="entry-title">Research Intern</h3>
          <p class="entry-subtitle">NAVER Place AI</p>
        </div>
        <div class="entry-date">Dec 2025 — Jan 2026</div>
      </div>
      <ul class="entry-points">
        <li>Worked on passage-level domain detection for review verification.</li>
        <li>Designed a classification head and task-specific loss for fine-grained text–metadata alignment.</li>
      </ul>
    </article>

    <article class="entry">
      <div class="entry-head">
        <div>
          <h3 class="entry-title">Undergraduate Research Intern</h3>
          <p class="entry-subtitle">KAIST · MLILAB · Advisor: Prof. Eunho Yang</p>
        </div>
        <div class="entry-date">Jun 2025 — Aug 2025</div>
      </div>
      <ul class="entry-points">
        <li>Investigated methods to mitigate hallucinations in multimodal large language models.</li>
        <li>Focused on improving visual faithfulness so generated text remains grounded in image evidence.</li>
      </ul>
    </article>

    <article class="entry">
      <div class="entry-head">
        <div>
          <h3 class="entry-title">Undergraduate Research Intern</h3>
          <p class="entry-subtitle">Hanyang University · BAIKLAB · Advisor: Prof. Sungyong Baik</p>
        </div>
        <div class="entry-date">Feb 2024 — Jun 2025</div>
      </div>
      <ul class="entry-points">
        <li>Conducted research on debiasing vision models trained on web-sourced image data.</li>
        <li>Extended the study to vision-language models such as CLIP, focusing on bias-robust soft prompts and worst-group robustness.</li>
      </ul>
    </article>
  </div>
</section>

<!-- =========================================================
     PUBLICATION
========================================================== -->

<section id="publication" class="section reveal">
  <h2 class="section-title">Publication</h2>

  <article class="publication-item simple-list-item">
    <h3 class="entry-title">BiasEdit: A Training-Free Bias-Detect-and-Edit Framework for Learning Fair Visual Classifiers</h3>
    <p class="publication-authors">Jungwook Seo, <strong>Yoonsik Park</strong>, Changmin Lee, and Sungyong Baik</p>
    <div class="publication-meta">
      <span class="meta-chip">WWW 2026</span>
      <span class="meta-chip">Oral Presentation</span>
    </div>
  </article>
</section>

<!-- =========================================================
     PROJECTS
========================================================== -->

<section id="projects" class="section reveal">
  <h2 class="section-title">Projects</h2>

  <div class="project-grid">
    <article class="project-card">
      <h3>HBD (Harnessing Bias for Debiasing)</h3>
      <p class="project-meta">Graduation Project · Hanyang University · Feb 2025 — Jun 2025</p>
      <p>
        Developed a plug-in debiasing framework with PCA-based class-stratified analysis and bias-aware soft prompt refinement.
      </p>
      <div class="project-tags">
        <span class="tag">Fairness</span>
        <span class="tag">Vision-Language</span>
        <span class="tag">Robustness</span>
      </div>
    </article>

    <article class="project-card">
      <h3>Notify: LLM-based Personal Schedule Assistant</h3>
      <p class="project-meta">DL Application Project · Mar 2025 — Jun 2025</p>
      <p>
        Built a mobile app that predicts personalized departure times by combining schedules, traffic signals, and persona-aware LLM reasoning.
      </p>
      <div class="project-tags">
        <span class="tag">LLM</span>
        <span class="tag">Flutter</span>
        <span class="tag">AWS</span>
      </div>
    </article>

    <article class="project-card">
      <h3>The Motivational Organizer &amp; Mentor (M.O.M.)</h3>
      <p class="project-meta">Google Gemma Sprint · Sep 2024 — Oct 2024</p>
      <p>
        Developed a Gemma-based assistant for reminders, motivation, and lightweight productivity support.
      </p>
      <div class="project-tags">
        <span class="tag">Gemma</span>
        <span class="tag">Personal AI</span>
        <span class="tag">Productivity</span>
      </div>
    </article>

    <article class="project-card">
      <h3>F.D.A.: Fine Dining Assistant</h3>
      <p class="project-meta">HCI Project · Sep 2024 — Dec 2024</p>
      <p>
        Built an LLM-powered RAG chatbot for personalized fine dining recommendations and evaluated it with a 30-participant user study.
      </p>
      <div class="project-tags">
        <span class="tag">RAG</span>
        <span class="tag">HCI</span>
        <span class="tag">User Study</span>
      </div>
    </article>

    <article class="project-card">
      <h3>Cooling with Nature</h3>
      <p class="project-meta">Time Series Project · Sep 2024 — Dec 2024</p>
      <p>
        Forecasted data-center cooling energy consumption using weather and energy signals with ARIMAX and Transformer models.
      </p>
      <div class="project-tags">
        <span class="tag">Time Series</span>
        <span class="tag">ARIMAX</span>
        <span class="tag">Transformer</span>
      </div>
    </article>
  </div>
</section>

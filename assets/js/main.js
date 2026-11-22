/* Optional enhancements. The complete homepage is rendered by Jekyll. */
(() => {
  'use strict';

  const header = document.querySelector('.site-header');
  const menu = document.querySelector('.menu-toggle');
  const navigation = document.querySelector('.site-nav');
  const navLinks = Array.from(document.querySelectorAll('[data-nav]'));

  if (header && menu && navigation) {
    const closeMenu = (returnFocus = false) => {
      menu.setAttribute('aria-expanded', 'false');
      navigation.classList.remove('is-open');
      if (returnFocus) menu.focus();
    };
    menu.addEventListener('click', () => {
      const open = menu.getAttribute('aria-expanded') !== 'true';
      menu.setAttribute('aria-expanded', String(open));
      navigation.classList.toggle('is-open', open);
    });
    navLinks.forEach(link => link.addEventListener('click', () => closeMenu()));
    document.addEventListener('keydown', event => {
      if (event.key === 'Escape' && menu.getAttribute('aria-expanded') === 'true') closeMenu(true);
    });
    document.addEventListener('click', event => {
      if (!header.contains(event.target)) closeMenu();
    });
    menu.hidden = false;
    header.classList.add('navigation-enhanced');
  }

  // Use one scroll measurement rather than competing section observers.
  const sections = Array.from(document.querySelectorAll('main > section[id]'));
  if (sections.length && navLinks.length) {
    let scheduled = false;
    const updateActiveSection = () => {
      const offset = (header ? header.offsetHeight : 70) + 70;
      let current = sections[0];
      sections.forEach(section => {
        if (section.getBoundingClientRect().top <= offset) current = section;
      });
      if (window.innerHeight + window.scrollY >= document.documentElement.scrollHeight - 4) {
        current = sections[sections.length - 1];
      }
      navLinks.forEach(link => {
        if (link.hash === '#' + current.id) link.setAttribute('aria-current', 'location');
        else link.removeAttribute('aria-current');
      });
      scheduled = false;
    };
    const requestUpdate = () => {
      if (!scheduled) {
        scheduled = true;
        requestAnimationFrame(updateActiveSection);
      }
    };
    window.addEventListener('scroll', requestUpdate, { passive: true });
    window.addEventListener('resize', requestUpdate, { passive: true });
    window.addEventListener('load', requestUpdate, { once: true });
    updateActiveSection();
  }

  const toast = document.querySelector('.toast');
  let toastTimeout;
  const announce = message => {
    if (!toast) return;
    clearTimeout(toastTimeout);
    toast.textContent = message;
    toast.classList.add('is-visible');
    toastTimeout = setTimeout(() => toast.classList.remove('is-visible'), 3600);
  };
  document.querySelectorAll('[data-copy-target]').forEach(button => {
    button.addEventListener('click', async () => {
      const citation = document.getElementById(button.dataset.copyTarget);
      if (!citation) return;
      try {
        if (!navigator.clipboard || !window.isSecureContext) throw new Error('Clipboard not available');
        await navigator.clipboard.writeText(citation.textContent.trim());
        announce('BibTeX copied.');
      } catch (_) {
        const selection = window.getSelection();
        if (selection) {
          const range = document.createRange();
          range.selectNodeContents(citation);
          selection.removeAllRanges();
          selection.addRange(range);
          citation.closest('pre').focus();
        }
        announce('Citation selected. Press Ctrl+C or ⌘C to copy.');
      }
    });
    button.hidden = false;
  });
})();


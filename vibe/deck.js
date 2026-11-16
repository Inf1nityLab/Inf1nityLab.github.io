// Движок презентаций курса.
// → / Пробел / клик — дальше (сначала шаги на слайде, потом следующий слайд), ← — назад,
// L — сменить язык, F — во весь экран. ?lang=ky — открыть на кыргызском, ?all=1 — показать все шаги.
(function () {
  const root = document.documentElement;
  const stage = document.querySelector('.stage');
  const slides = Array.from(document.querySelectorAll('.slide'));
  const progress = document.querySelector('.progress');
  const counter = document.querySelector('.counter');
  const params = new URLSearchParams(location.search);
  const showAll = params.get('all') === '1';

  // Язык: из адреса, иначе из прошлого раза, иначе русский.
  function savedLang() {
    try { return localStorage.getItem('deck-lang'); } catch (e) { return null; }
  }
  function setLang(lang) {
    root.dataset.lang = lang;
    root.lang = lang === 'ky' ? 'ky' : 'ru';
    try { localStorage.setItem('deck-lang', lang); } catch (e) { /* без памяти — не страшно */ }
    document.querySelectorAll('[data-set-lang]').forEach(b => b.classList.toggle('on', b.dataset.setLang === lang));
  }
  setLang(params.get('lang') || savedLang() || 'ru');

  // Кнопка «☰ Уроки» — назад к списку всех уроков (index.html рядом).
  const controls = document.querySelector('.controls');
  // В приложении Okurmen (?embed=1) списка уроков нет — кнопку не рисуем.
  if (controls && !controls.querySelector('.home') && params.get('embed') !== '1') {
    const home = document.createElement('a');
    home.className = 'home';
    home.href = 'index.html';
    home.innerHTML = '☰ <span data-l="ru">Уроки</span><span data-l="ky">Сабактар</span>';
    controls.prepend(home);
  }

  // Масштаб сцены 1920×1080 под любое окно, с полями по краям.
  function fit() {
    const s = Math.min(innerWidth / 1920, innerHeight / 1080);
    const x = (innerWidth - 1920 * s) / 2;
    const y = (innerHeight - 1080 * s) / 2;
    stage.style.transform = `translate(${x}px, ${y}px) scale(${s})`;
  }
  addEventListener('resize', fit);
  fit();

  // Индекс --i для «лесенки» внутри .stagger.
  document.querySelectorAll('.stagger').forEach(g => Array.from(g.children).forEach((c, i) => c.style.setProperty('--i', i)));

  let cur = 0;
  let step = 0;
  const stepsOf = i => Array.from(slides[i].querySelectorAll('.step'));

  function render() {
    slides.forEach((s, i) => {
      s.classList.toggle('active', i === cur);
      s.classList.toggle('past', i < cur);
    });
    stepsOf(cur).forEach((el, i) => el.classList.toggle('shown', showAll || i < step));
    // SVG-анимации движения (animateMotion и т. п.) запускаем заново при каждом входе на слайд.
    slides[cur].querySelectorAll('animate, animateMotion, animateTransform').forEach(a => {
      try { a.beginElement(); } catch (e) { /* старый браузер — просто без движения */ }
    });
    if (progress) progress.style.width = ((cur + 1) / slides.length * 100) + '%';
    if (counter) counter.textContent = (cur + 1) + ' / ' + slides.length;
    history.replaceState(null, '', location.pathname + location.search + '#/' + (cur + 1));
    // Запоминаем, где остановились: список уроков покажет «Продолжить».
    try { localStorage.setItem('deck-last', JSON.stringify({ file: location.pathname.split('/').pop(), slide: cur + 1 })); } catch (e) { /* без памяти — не страшно */ }
  }

  function go(i, atEnd) {
    cur = Math.max(0, Math.min(slides.length - 1, i));
    step = atEnd ? stepsOf(cur).length : 0;
    render();
  }
  function next() {
    if (!showAll && step < stepsOf(cur).length) { step++; render(); }
    else if (cur < slides.length - 1) go(cur + 1);
  }
  function prev() {
    if (!showAll && step > 0) { step--; render(); }
    else if (cur > 0) go(cur - 1, true);
  }

  addEventListener('keydown', e => {
    if (['ArrowRight', ' ', 'PageDown', 'Enter'].includes(e.key)) { e.preventDefault(); next(); }
    else if (['ArrowLeft', 'PageUp', 'Backspace'].includes(e.key)) { e.preventDefault(); prev(); }
    else if (e.key === 'Home') go(0);
    else if (e.key === 'End') go(slides.length - 1, true);
    else if (e.key === 'l' || e.key === 'L' || e.key === 'д' || e.key === 'Д') setLang(root.dataset.lang === 'ru' ? 'ky' : 'ru');
    else if (e.key === 'f' || e.key === 'F' || e.key === 'а' || e.key === 'А') {
      if (document.fullscreenElement) document.exitFullscreen(); else root.requestFullscreen().catch(() => {});
    }
  });
  // Ссылки на слайдах (резюме, проекты) открываются, а не листают слайд.
  stage.addEventListener('click', e => { if (e.target.closest('a')) return; next(e); });
  document.querySelectorAll('[data-set-lang]').forEach(b => b.addEventListener('click', e => { e.stopPropagation(); setLang(b.dataset.setLang); }));

  // Панель управления прячется, когда мышь не двигается 2 секунды (не мешает записи).
  let idleTimer;
  function wake() { document.body.classList.remove('idle'); clearTimeout(idleTimer); idleTimer = setTimeout(() => document.body.classList.add('idle'), 2000); }
  addEventListener('mousemove', wake);
  wake();

  const start = parseInt((location.hash.match(/#\/(\d+)/) || [])[1], 10);
  go(Number.isFinite(start) ? start - 1 : 0);
})();

# Recipes: plain HTML/CSS

All snippets assume `tokens.css` is loaded. Class names are suggestions; keep the values.
Where a snippet shows a desktop px value for padding or gaps, use the fluid tokens instead
(`--a-section-pad`, `--a-tile-pad`, `--a-bento-gap`) and size grids with `auto-fit`/`minmax` (SKILL.md, Responsive).
`demos/kestrel/` in the agent-skills repo is the full, tested responsive page.
Placeholders like `[Product]` are for real content. Never use any real company's logo, product names, photos or copy.

## Presets

Load `tokens.css`, then `styles/<preset>.css`; every recipe below reads the variables, so the same HTML works in
every preset. The recipes show the keynote shape. Each preset's differences are in the "Component deltas" of
`styles/<preset>.md`; patterns several presets share are under "Shared preset patterns" at the end of this file.

## Page skeleton (section rhythm)

```html
<body>
  <nav class="gnav">…</nav>                       <!-- 52px glass bar; presets: --a-nav-* -->
  <nav class="lnav">…</nav>                       <!-- 56px sticky product bar, product pages only -->
  <main>
    <section class="hero">…</section>             <!-- white -->
    <section class="a-section-block a-alt">…</section>   <!-- #f3f4f6: highlights gallery -->
    <section class="a-section-block">…</section>         <!-- white: eyebrow + intro + tiles -->
    <section class="a-section-block a-dark">…</section>  <!-- optional black chapter -->
    <section class="a-section-block a-alt">…</section>
  </main>
  <footer class="gfoot">…</footer>                <!-- #f3f4f6, 12px -->
</body>
```

Alternate white and `#f3f4f6` sections. One dark chapter per page at most, for the "pro" or cinematic moment.
Tiles inside a white section are `#f3f4f6`; inside a grey section they are white.

## Global nav (52px, frosted, centered, tiny type)

```html
<nav class="gnav" aria-label="Global">
  <ul class="gnav-list">
    <li><a href="/" aria-label="Home" class="gnav-mark"><!-- your own 14-18px mark --></a></li>
    <li class="gnav-link"><a href="#">Store</a></li><li class="gnav-link"><a href="#">Products</a></li>…
    <li><a href="#" aria-label="Search"><svg width="15" height="44" aria-hidden="true">…</svg></a></li>
  </ul>
</nav>
```
```css
.gnav { position: sticky; top: 0; z-index: 100; height: var(--a-nav-h);
  background: var(--a-nav-bg); -webkit-backdrop-filter: var(--a-nav-blur); backdrop-filter: var(--a-nav-blur); }
.gnav-list { list-style: none; margin: 0 auto; padding: 0 22px; max-width: 1024px; height: 100%;
  display: flex; align-items: center; justify-content: space-between; }
.gnav :where(a:not(.a-button)) { display: flex; align-items: center; height: var(--a-nav-h); padding: 0 8px;
  font-size: 12px; letter-spacing: -0.01em; color: var(--a-nav-text); transition: color var(--a-dur) var(--a-ease); }
.gnav :where(a:not(.a-button)):hover { color: var(--a-text); text-decoration: none; }   /* :not() keeps a nav CTA's own text color */
@media (max-width: 833px) { .gnav .gnav-link { display: none; } .gnav .gnav-burger { display: flex; } }
```
Hide the `<li class="gnav-link">`, not the `<a>`: base link styles sit in `:where()` and the hide rule has two
classes, so the links really disappear below the breakpoint whatever order the CSS loads in. A nav with no text
links (only search, account, cart) needs no burger.

### Menu on narrow screens (native popover, no JS)

```html
<li class="gnav-end">
  <a href="#" aria-label="Search">…</a>
  <button class="gnav-burger" type="button" popovertarget="gnav-menu" aria-label="Menu">…two-line icon…</button>
</li>
…
<div class="gnav-flyout" id="gnav-menu" popover>
  <button type="button" popovertarget="gnav-menu" popovertargetaction="hide" aria-label="Close menu">…</button>
  <ul><li><a href="#">Store</a></li>…</ul>
</div>
```
```css
.gnav-burger { display: none; min-width: 44px; height: 44px; }
.gnav-flyout { position: fixed; inset: 0; width: 100%; height: 100dvh; max-width: none; max-height: none; margin: 0; border: 0;
  padding: calc(var(--a-nav-h) + 16px) var(--a-gutter) env(safe-area-inset-bottom, 24px); background: var(--a-bg-elevated); overflow-y: auto; }
.gnav-flyout a { display: block; padding: 6px 0; font-size: clamp(1.5rem, 1.2rem + 1.5vw, 1.75rem); font-weight: 600; color: var(--a-text); }
```
The local nav does the same on phones: title + chevron button (`popovertarget`) + Buy; the chapter list is a
popover placed at the nav's current bottom edge (`beforetoggle` → `style.top = nav.getBoundingClientRect().bottom + 'px'`).
Close popovers when a link inside is clicked.

## Local nav (product name + chapter links + tiny Buy pill)

Sticks under the global nav while scrolling. Hairline only appears once it is stuck.
```html
<nav class="lnav" aria-label="[Product]">
  <div class="lnav-inner">
    <a class="lnav-title" href="#">[Product]</a>
    <div class="lnav-menu">
      <a href="#overview" aria-current="page">Overview</a><a href="#specs">Tech Specs</a>
      <a class="a-button a-button-tiny" href="#buy">Buy</a>
    </div>
  </div>
</nav>
```
```css
.lnav { position: sticky; top: 0; z-index: 99; height: var(--a-localnav-h);
  background: var(--a-nav-bg); -webkit-backdrop-filter: var(--a-nav-blur); backdrop-filter: var(--a-nav-blur);
  border-bottom: 1px solid rgba(0,0,0,.16); }
.lnav-inner { max-width: 980px; margin: 0 auto; padding: 0 22px; height: 100%; display: flex; align-items: center; justify-content: space-between; }
.lnav-title { font-size: 21px; font-weight: 600; letter-spacing: 0.011em; color: var(--a-text); }
.lnav-menu { display: flex; align-items: center; gap: 24px; }
.lnav-menu a:not(.a-button) { font-size: 12px; color: var(--a-text); opacity: .8; }
.lnav-menu a[aria-current] { opacity: 1; pointer-events: none; box-shadow: inset 0 -1px 0 currentColor; } /* current chapter: full ink + thin underline */
```
If both navs exist, only the local nav is sticky; the global nav scrolls away.
Many chapter links (6+): collapse them behind the chevron when they stop fitting, not only below 834px.
Make the nav a container and switch on its own width:
```css
.lnav { container-type: inline-size; }
.lnav-chevron { display: none; }
@container (max-width: 60rem) {   /* ~title + Buy + 110px per link; raise it for more links */
  .lnav-menu a:not(.a-button) { display: none; } .lnav-chevron { display: flex; } }
```

## Hero (product name, 2-5 word headline, one line, buttons, big centered visual)

```html
<section class="hero a-center">
  <h1 class="a-eyebrow hero-name">[Product]</h1>
  <p class="a-hero">Short. Confident.</p>
  <p class="a-violator">New: one-line promo</p>
  <div class="a-buttons hero-cta">
    <a class="a-button" href="#buy">Buy</a>
    <a class="a-more" href="#learn">Learn more</a>
  </div>
  <img class="hero-visual" src="product.png" alt="[Product] shown from the front" width="1200" height="700">
</section>
```
```css
.hero { padding-top: 64px; overflow: hidden; }
.hero-name { font-size: 28px; letter-spacing: .007em; }          /* product name sits above the headline */
.hero .a-hero { margin-top: 6px; }
.hero .a-violator { margin-top: 14px; }
.hero-cta { margin-top: 24px; align-items: center; }
.hero-visual { margin: 48px auto 0; width: min(1200px, 100%); height: auto; }
```
The visual does the selling: product/subject large, on a flat background that matches the section, no frame,
no shadow box, no stock photo. Without real imagery, use a neutral object rendered in CSS/SVG, never a gradient blob.

Homepage variant ("billboard tile"): full-bleed block 580-692px tall, headline 56px + subhead 28px at the top
center (padding-top ~60px), two buttons (filled + outline), image fills the rest. Stack billboards with a
12px gap and alternate dark and `#f3f4f6` backgrounds.

## Highlight intro (grey paragraph with a dark lead-in)

The keynote copy pattern: one 17-21px grey paragraph with the key phrase in near-black.
```html
<div class="a-container">
  <h2 class="a-eyebrow">Design</h2>
  <p class="a-hero a-gradient" style="margin-top:12px">Thin. Light. Ready.</p>   <!-- chapter headlines use the hero size -->
  <p class="a-intro" style="margin-top:24px;max-width:816px">
    <strong>Built to go everywhere.</strong> The rest of the sentence explains the benefit in plain words,
    one idea, two lines at most.</p>
</div>
```

## Two-up tile grid (homepage promo tiles)

```html
<div class="a-grid tiles-2up">
  <a class="a-tile tile-promo" href="#">
    <h3 class="a-tile-head">[Name]</h3><p class="a-subhead">One short line.</p>
    <span class="a-buttons"><span class="a-button a-button-small">Learn more</span></span>
    <img src="…" alt="…">
  </a>
  …
</div>
```
```css
.tiles-2up { padding: 0 12px; }   /* homepage: 12px outer margin and 12px gap, tiles ~490-580px tall */
.tile-promo { border-radius: 0;   /* homepage billboards and promo tiles are square-cornered (measured 0px) */ display: flex; flex-direction: column; align-items: center; text-align: center;
  min-height: 490px; padding-top: 44px; color: var(--a-text); text-decoration: none; }
.tile-promo .a-subhead { margin-top: 4px; }
.tile-promo .a-buttons { margin-top: 16px; }
.tile-promo img { margin-top: auto; }
```
The whole tile is the link; the button inside is a `span` so there is only one tab stop.

## Bento feature grid (product page)

```html
<div class="a-container bento">
  <article class="a-tile bento-item span-2">
    <p class="a-caption">Label</p>
    <h3 class="a-tile-head">Big number or claim</h3>
    <p class="a-body">One supporting sentence.</p>
  </article>
  <article class="a-tile bento-item">…</article>
  <article class="a-tile bento-item">…</article>
</div>
```
```css
.bento { display: grid; grid-template-columns: repeat(auto-fit, minmax(min(100%, 18rem), 1fr)); gap: var(--a-bento-gap); }
.bento-item { padding: var(--a-tile-pad); min-height: clamp(180px, 10rem + 6vw, 260px); display: flex; flex-direction: column; gap: 8px; min-width: 0; }
.bento-item.span-2 { grid-column: 1 / -1; }
.bento .stat { font-size: clamp(3rem, 2.3rem + 3vw, 5rem); line-height: 1; font-weight: 600; letter-spacing: -0.015em; font-variant-numeric: tabular-nums; }
```
Rules: radius 24px, no border, no shadow, padding 40px. Numbers are huge and the label tiny.
Colored stats (green "18 hrs", a gradient headline) are the only place color appears outside links/buttons.

## Horizontal gallery ("Get the highlights")

```css
.gallery { display: grid; grid-auto-flow: column; grid-auto-columns: min(80vw, 1000px); gap: 20px;
  overflow-x: auto; scroll-snap-type: x mandatory; padding-inline: max(6.25%, calc((100vw - 1280px)/2));
  scrollbar-width: none; }
.gallery > * { scroll-snap-align: center; border-radius: var(--a-radius-tile); aspect-ratio: 16/10; overflow: hidden;
  background: var(--a-bg); padding: 40px; }
.gallery .caption { font-size: 17px; font-weight: 600; letter-spacing: -0.022em; max-width: 640px; }
```
Captions sit on the card's top-left, 17px semibold. Add round 36px play/pause and paddle buttons
(`background: rgba(210,210,215,.64)`, backdrop blur) for autoplaying media.

## Gradient headline (sparingly)

`.a-gradient` in `tokens.css`: a tonal gradient from near-black into one muted product hue (navy, slate, a
desaturated version of the product color). Measured product pages use it on a few big headlines per page. Never rainbow,
never purple-to-pink.

## Ribbon (promo strip under the navs)

```html
<div class="ribbon"><p>One-line offer in plain words. <a class="a-more" href="#">Shop</a></p></div>
```
```css
.ribbon { background: var(--a-bg-alt); padding: 16px 0; text-align: center; }
.ribbon p { font-size: 14px; line-height: 1.42859; letter-spacing: -0.016em; width: min(692px, 87.5%); margin: 0 auto; }
```

## Local nav goes dark over black chapters

Mark black chapters with `data-nav="dark"`; the nav flips its color scheme while one sits under it.
```css
.lnav { transition: background-color .5s var(--a-ease), color .5s var(--a-ease); color: var(--a-text); }
.lnav.is-dark { color-scheme: dark; }   /* every light-dark() token follows */
```
```js
const lnav = document.querySelector('.lnav'), under = new Set();
const io = new IntersectionObserver(es => {
  es.forEach(e => e.isIntersecting ? under.add(e.target) : under.delete(e.target));
  lnav.classList.toggle('is-dark', under.size > 0);
}, { rootMargin: '-56px 0px -100% 0px' });   // a line at the nav's bottom edge
document.querySelectorAll('[data-nav="dark"]').forEach(s => io.observe(s));
```

## Product art as one recolorable SVG symbol

```html
<svg width="0" height="0" style="position:absolute" aria-hidden="true">   <!-- not display:none, gradients break -->
  <defs><linearGradient id="shade" x1="0" x2="1">…white→transparent→black alpha stops…</linearGradient></defs>
  <symbol id="product" viewBox="0 64 400 376">   <!-- crop to the drawing, no empty margin -->
    <rect … style="fill:var(--body)"/> <rect … fill="url(#shade)"/>   <!-- base color, then a shading overlay -->
  </symbol>
</svg>
<div class="art silver" role="img" aria-label="[Product] in Silver"><svg viewBox="0 0 400 376"><use href="#product"/></svg></div>
```
```css
.art { --body: #3a3b40; } .art.silver { --body: #dcdde1; }   /* one class per finish */
.art svg { width: 100%; height: auto; display: block; }
.art svg * { transition: fill .6s var(--a-ease); }            /* color picker cross-fades */
```
Use `style="fill:var(--x)"`, not the `fill="var(--x)"` attribute. The outer `viewBox` starts at 0 0 with the
symbol's width and height. Shading is a separate overlay so every finish gets the same light.

## Color picker

```html
<p class="color-name" aria-live="polite">Silver</p>
<fieldset class="swatches"><legend class="a-visually-hidden">Choose a color</legend>
  <input class="swatch" type="radio" name="color" value="silver" aria-label="Silver" style="--c:#dcdde1" checked>
  …
</fieldset>
```
```css
.color-name { margin-top: 36px; font-size: 12px; color: var(--a-text-secondary); }
.swatches { display: flex; justify-content: center; gap: 14px; border: 0; padding: 0; margin: 12px 0 0; }
.swatch { appearance: none; width: 28px; height: 28px; border-radius: 50%; margin: 0; cursor: pointer; background: var(--c);
  box-shadow: inset 0 0 0 1px color-mix(in srgb, var(--a-text) 22%, transparent); }
.swatch:checked { box-shadow: inset 0 0 0 1px color-mix(in srgb, var(--a-text) 22%, transparent),
  0 0 0 2px var(--a-bg-alt), 0 0 0 3.5px var(--a-text-secondary); }
```
On change: swap the finish class on the art, update the name and the art's `aria-label`.

## Segmented control (mode switch inside a tile)

```html
<div class="segmented" role="group" aria-label="Mode">
  <button type="button" aria-pressed="true">First</button><button type="button" aria-pressed="false">Second</button>
</div>
```
```css
.segmented { display: inline-flex; padding: 2px; border-radius: var(--a-radius-pill); background: var(--a-fill-quaternary); max-width: 100%; }
.segmented button { appearance: none; border: 0; background: transparent; font: inherit; font-size: 14px; color: var(--a-text);
  padding: 8px 18px; border-radius: var(--a-radius-pill); cursor: pointer; transition: background-color .3s var(--a-ease); }
.segmented button[aria-pressed="true"] { background: var(--a-bg); box-shadow: 0 1px 3px rgba(0,0,0,.12); }
@media (max-width: 734px) { .segmented button { padding: 7px 10px; font-size: 12px; } }
```
Put the visual it controls in a grid with `grid-template-columns: minmax(0, 1fr)` so it can never push the tile
wider than the phone.

## Gallery paddles

Two 36px round buttons right-aligned under the gallery, `background: color-mix(in srgb, var(--a-text) 10%, transparent)`,
disabled (opacity .36) at either end; click scrolls by one card width (`behavior: 'auto'` under reduced motion).

## Compare section

```html
<section class="a-section-block a-alt"><div class="a-container-wide"><div class="compare-card">
  <h2 class="a-headline">Which [Product] is right for you?</h2>
  <div class="compare-links"><a class="a-more" href="#">Compare all models</a><a class="a-more" href="#">Help me choose</a></div>
  <div class="models">
    <article class="model">
      <div class="art"></div> <div class="dots"><span style="--c:#dcdde1"></span>…</div>
      <p class="a-violator">New</p> <h3>Model</h3> <p class="tag">One-line positioning</p> <p class="price">From $449</p>
      <ul><li>Spec in plain words</li><li class="no">Missing feature, in grey</li></ul>
      <div class="actions"><a class="a-button a-button-tiny" href="#">Buy</a><a class="a-more" href="#">Learn more</a></div>
    </article> …
  </div></div></div></section>
```
```css
.compare-card { background: var(--a-bg); border-radius: var(--a-radius-tile); padding: 72px 40px 80px; }
.compare-card > h2 { text-align: center; }
.compare-links { display: flex; justify-content: center; flex-wrap: wrap; gap: 8px 32px; margin-top: 28px; font-size: 21px; }
.models { display: flex; flex-wrap: wrap; justify-content: center; gap: 48px clamp(24px, 1rem + 2.5vw, 56px); margin-top: 72px; }
.model { flex: 0 1 220px; min-width: min(100%, 10.5rem); }   /* a wrapped model sits centered, never orphaned left */
.model .art { height: 150px; display: flex; align-items: flex-end; justify-content: center; }   /* bottoms align */
.dots { display: flex; gap: 6px; margin-top: 24px; }
.dots span { width: 9px; height: 9px; border-radius: 50%; background: var(--c); box-shadow: inset 0 0 0 1px color-mix(in srgb, var(--a-text) 22%, transparent); }
.model .a-violator { font-size: 12px; margin-top: 18px; min-height: 16px; }   /* keeps names aligned */
.model h3 { font-size: 21px; font-weight: 600; letter-spacing: .011em; margin-top: 4px; }
.model .tag { font-size: 14px; font-weight: 600; margin-top: 4px; }
.model .price { font-size: 14px; margin-top: 18px; }
.model ul { list-style: none; padding: 0; margin: 28px 0 0; font-size: 14px; line-height: 1.42859; }
.model li + li { margin-top: 14px; } .model li.no { color: var(--a-text-tertiary); }
.model .actions { display: flex; flex-direction: column; align-items: flex-start; gap: 14px; margin-top: 28px; font-size: 14px; }
@media (max-width: 480px) { .models { text-align: center; } .dots, .model .actions { justify-content: center; align-items: center; } }
```

## Closing CTA with "why buy" cards

Hero-size headline, highlight intro, filled + outline pill, then three 16px-radius `#f3f4f6` cards (padding 32px 28px):
a 40px blue line icon, 21px semibold title, 17px grey sentence, "Learn more ›" link. One column below 1068px.

## Footer (#f3f4f6, 12px, quiet)

```html
<footer class="gfoot">
  <div class="gfoot-inner">
    <p class="gfoot-notes">1. Footnote text in 12px grey.</p>
    <div class="gfoot-crumbs"><a href="/" aria-label="Home">[mark]</a> › <a href="#">Category</a> › <span>Page</span></div>
    <nav class="gfoot-cols" aria-label="Footer">
      <div><h3>Shop</h3><ul><li><a href="#">Link</a></li>…</ul></div>
      …
    </nav>
    <div class="gfoot-legal"><span>Copyright © 2026 Your Company. All rights reserved.</span>
      <a href="#">Privacy</a><a href="#">Terms</a></div>
  </div>
</footer>
```
```css
.gfoot { background: var(--a-bg-alt); font-size: 12px; line-height: 1.33337; letter-spacing: -0.01em; color: var(--a-text-secondary); }
.gfoot-inner { max-width: 980px; margin: 0 auto; padding: 17px 22px 21px; }
.gfoot-notes { padding-bottom: 17px; border-bottom: 1px solid var(--a-hairline); }
.gfoot-crumbs { display: flex; align-items: center; gap: 8px; padding: 14px 0; border-bottom: 1px solid var(--a-hairline); color: var(--a-text); }
.gfoot-cols { display: grid; grid-template-columns: repeat(5, 1fr); gap: 20px; padding: 20px 0; }
.gfoot h3 { font-size: 12px; font-weight: 600; color: var(--a-text); margin-bottom: 8px; }
.gfoot ul { list-style: none; margin: 0; padding: 0; }
.gfoot li { margin-bottom: 8px; }
.gfoot a { color: var(--a-text-secondary); }
.gfoot-legal { display: flex; flex-wrap: wrap; gap: 8px 20px; padding-top: 16px; border-top: 1px solid var(--a-hairline); }
@media (max-width: 734px) { .gfoot-cols { grid-template-columns: 1fr; } }
```

### Footer columns as accordions on phones (no JS)
Each column is a `<details>`; on wider screens CSS forces it open and the summary becomes a plain heading.
```html
<details class="gfoot-col"><summary><h3>Shop</h3></summary><ul><li><a href="#">Link</a></li>…</ul></details>
```
```css
.gfoot-col summary { display: flex; justify-content: space-between; align-items: center; min-height: var(--a-hit);
  list-style: none; cursor: pointer; border-bottom: 1px solid var(--a-hairline); }
.gfoot-col summary::-webkit-details-marker { display: none; }
.gfoot-col summary::after { content: "+"; font-size: 1rem; color: var(--a-text-secondary); }
.gfoot-col[open] summary::after { content: "\2212"; }
.gfoot-col summary h3 { margin: 0; }
.gfoot-col ul { padding-block: 8px 12px; }
@media (min-width: 735px) {
  .gfoot-col summary { min-height: 0; border: 0; pointer-events: none; margin-bottom: 8px; }
  .gfoot-col summary::after { content: none; }
  .gfoot-col::details-content { content-visibility: visible; }   /* open on desktop; older browsers keep the accordion */
  .gfoot-col ul { padding: 0; } }
```

## Scroll reveal (10 lines, respects reduced motion)

```html
<script>
  document.documentElement.classList.add('a-js');   // content stays visible if JS never runs
  const io = new IntersectionObserver(es => es.forEach(e => {
    if (e.isIntersecting) { e.target.classList.add('is-in'); io.unobserve(e.target); }
  }), { rootMargin: '0px 0px -15% 0px' });
  document.querySelectorAll('.a-reveal').forEach(el => io.observe(el));
</script>
```
Use it on chapter headlines and tiles below the fold, never on the hero or anything visible on load, not on every paragraph. Stagger siblings with `transition-delay: 0.1s` steps.
Sticky "scrollytelling" (an image pinned with `position: sticky` while copy scrolls past) is the one
bigger motion the measured pages use; keep it to one per page.

## Shared preset patterns

Used by several presets; the preset md names which. Values come from the variables, so write them once.

### Flipped bands (dark stage with light sections, or one dark band on a light page)
```html
<section class="a-section-block a-light">…</section>   <!-- dark-default presets: a white band -->
<section class="a-section-block a-dark">…</section>    <!-- light-default presets: the one dark band -->
```
Both only set `color-scheme`; every token flips. A preset whose nav must stay dark pins it with `.gnav { color-scheme: dark; }`.

### Nav over a full-bleed hero (transparent, solid after scroll)
```css
.gnav.over-hero { background: transparent; }
.gnav.over-hero.is-stuck { background: var(--a-nav-bg); }
```
Toggle `.is-stuck` with an IntersectionObserver on the hero (same pattern as the dark local nav). Text over art
always sits on a scrim (`linear-gradient` to 60-85% black) so it passes AA.

### Search hero (one wide search bar above the fold)
```html
<form class="search" role="search">
  <label>Where<input name="where" placeholder="Search destinations"></label>
  <label>When<input name="when" placeholder="Add dates"></label>
  <button class="a-button a-button-accent" type="submit">Search</button>
</form>
```
```css
.search { display: flex; align-items: center; width: min(860px, 100%); padding: 8px 8px 8px 24px; border-radius: 9999px;
  background: var(--a-bg-elevated); border: 1px solid var(--a-hairline); box-shadow: var(--a-shadow-float, none); }
.search label { flex: 1; min-width: 0; padding: 4px 16px; font-size: 14px; border-left: 1px solid var(--a-hairline); }
.search label:first-child { border: 0; padding-left: 0; }
.search input { all: unset; display: block; width: 100%; color: var(--a-text-secondary); }
@media (max-width: 734px) { .search { flex-direction: column; align-items: stretch; border-radius: var(--a-radius-tile); padding: 16px; }
  .search label { border: 0; border-bottom: 1px solid var(--a-hairline); padding: 12px 0; } }
```

### Rails (shelves, poster rows, listing carousels)
`.a-rail` in `tokens.css`; put it straight in the section (not inside a container) so it bleeds to both edges.
```html
<div class="a-container-wide rail-head"><h2 class="a-section">Row title</h2><a class="a-more" href="#">Show all</a></div>
<div class="a-rail" style="--ratio: 2/3"><a href="#"><img src="…" alt="…"><b>Title</b> <span>Meta</span></a>…</div>
```
Heading row above with "Show all" and two 44px paddles (see Gallery paddles); caption below the image: title,
muted meta, bold tabular price. Item width: `--a-rail-item`.

### Plan cards (pricing)
Two to four equal cards in an `auto-fit` grid, each: plan name, one-line who-it-is-for, big tabular price with
a muted period, a short check list (5-7 items), a full-width button at the bottom (`margin-top: auto` in a flex
column). Only the recommended plan's button uses the primary fill; the others are secondary.

### Spec table (sticky head)
```css
.specs { width: 100%; border-collapse: collapse; font-variant-numeric: tabular-nums; }
.specs thead th { position: sticky; top: var(--a-nav-h); background: var(--a-bg); z-index: 1; }
.specs th, .specs td { padding: 12px 16px; border-bottom: 1px solid var(--a-hairline); text-align: left; }
```
No `overflow: hidden/auto` ancestor (`.a-tile` uses `clip`, so tiles are fine). On phones stack rows or hide
columns instead of scrolling the table sideways; the sticky head stays under a third of the screen.

### Stat row (big numbers, small labels)
`.a-stats` in `tokens.css`; 3-4 across on desktop. The label stays first in the markup; `--a-stats-dir:
column-reverse` puts the number on top, `--a-stats-weight` sets its weight.
```html
<dl class="a-stats"><div><dt>Range</dt><dd>520 km</dd></div>…</dl>
```

### Code frame (install command, code, terminal)
```html
<div class="a-tile codeframe"><pre><code>npm i [package]</code></pre><button class="a-button a-button-small a-button-secondary" type="button">Copy</button></div>
```
`pre` scrolls inside its own box (`overflow-x: auto`), mono 13-14px; the frame takes the card radius and border.
Copy buttons announce "Copied" through an `aria-live` region.


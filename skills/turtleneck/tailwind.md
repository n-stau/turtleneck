# Tailwind

Same values as `tokens.css`. Pick the block for the project's Tailwind version.

## Tailwind v4 (`@theme` in the main CSS file)

```css
@import "tailwindcss";

@theme {
  --font-sans: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Helvetica, Arial, sans-serif;

  --color-ink: #1a1c1f;
  --color-ink-2: #5d6067;
  --color-ink-3: #6a6d74;
  --color-link: #2264ee;
  --color-link-dark: #6e9cff;
  --color-violator: #a8400c;
  --color-paper: #f3f4f6;
  --color-paper-2: #fafbfc;
  --color-chip: #e6e8eb;
  --color-hairline: #e3e5e8;
  --color-action: #2264ee;
  --color-action-hover: #1c58e2;
  --color-night: #17181b;

  /* name--line-height / name--letter-spacing are applied together with text-<name> */
  --text-hero: clamp(3rem, 2.472rem + 2.254vw, 4.5rem);         --text-hero--line-height: 1.05; --text-hero--letter-spacing: -0.02em;
  --text-headline: clamp(2.25rem, 1.898rem + 1.502vw, 3.25rem); --text-headline--line-height: 1.08; --text-headline--letter-spacing: -0.015em;
  --text-section: clamp(1.875rem, 1.567rem + 1.315vw, 2.75rem); --text-section--line-height: 1.1; --text-section--letter-spacing: -0.015em;
  --text-tile: clamp(1.375rem, 1.243rem + 0.5634vw, 1.75rem);   --text-tile--line-height: 1.2; --text-tile--letter-spacing: -0.01em;
  --text-sub: clamp(1.188rem, 1.077rem + 0.4695vw, 1.5rem);     --text-sub--line-height: 1.25; --text-sub--letter-spacing: 0em;
  --text-eyebrow: clamp(1.062rem, 0.9745rem + 0.3756vw, 1.312rem); --text-eyebrow--line-height: 1.17; --text-eyebrow--letter-spacing: 0em;
  --text-intro: clamp(1.062rem, 0.9745rem + 0.3756vw, 1.312rem); --text-intro--line-height: 1.45; --text-intro--letter-spacing: 0em;
  --text-body: 1.0625rem;     --text-body--line-height: 1.5; --text-body--letter-spacing: -0.01em;
  --text-small: 0.875rem;    --text-small--line-height: 1.42859; --text-small--letter-spacing: -0.016em;
  --text-caption: 0.75rem;  --text-caption--line-height: 1.33337; --text-caption--letter-spacing: -0.01em;

  --radius-tile: 24px;
  --radius-card: 16px;
  --radius-pill: 999px;

  --breakpoint-md: 735px;   /* small <=734, medium 735-1068, large >=1069 */
  --breakpoint-lg: 1069px;

  --ease-brand: cubic-bezier(0.4, 0, 0.3, 1);
}

@layer base {
  body { @apply bg-white text-ink font-sans text-body antialiased; }
}
```

## Tailwind v3 (`tailwind.config.js`)

```js
module.exports = {
  theme: {
    screens: { md: '735px', lg: '1069px' },
    extend: {
      fontFamily: { sans: ['-apple-system', 'BlinkMacSystemFont', '"Segoe UI"', 'Roboto', '"Helvetica Neue"', 'Helvetica', 'Arial', 'sans-serif'] },
      colors: { ink: { DEFAULT: '#1a1c1f', 2: '#5d6067', 3: '#6a6d74' }, link: { DEFAULT: '#2264ee', dark: '#6e9cff' },
        violator: '#a8400c', paper: { DEFAULT: '#f3f4f6', 2: '#fafbfc' }, chip: '#e6e8eb', hairline: '#e3e5e8',
        action: { DEFAULT: '#2264ee', hover: '#1c58e2' }, night: '#17181b' },
      fontSize: {
        hero: ['clamp(3rem, 2.472rem + 2.254vw, 4.5rem)', { lineHeight: '1.05', letterSpacing: '-0.02em', fontWeight: '600' }],
        headline: ['clamp(2.25rem, 1.898rem + 1.502vw, 3.25rem)', { lineHeight: '1.08', letterSpacing: '-0.015em', fontWeight: '600' }],
        section: ['clamp(1.875rem, 1.567rem + 1.315vw, 2.75rem)', { lineHeight: '1.1', letterSpacing: '-0.015em', fontWeight: '600' }],
        tile: ['clamp(1.375rem, 1.243rem + 0.5634vw, 1.75rem)', { lineHeight: '1.2', letterSpacing: '-0.01em', fontWeight: '600' }],
        sub: ['clamp(1.188rem, 1.077rem + 0.4695vw, 1.5rem)', { lineHeight: '1.25', letterSpacing: '0' }],
        eyebrow: ['clamp(1.062rem, 0.9745rem + 0.3756vw, 1.312rem)', { lineHeight: '1.17', letterSpacing: '0', fontWeight: '600' }],
        intro: ['clamp(1.062rem, 0.9745rem + 0.3756vw, 1.312rem)', { lineHeight: '1.45', letterSpacing: '0', fontWeight: '400' }],
        body: ['17px', { lineHeight: '1.5', letterSpacing: '-0.01em' }],
        small: ['14px', { lineHeight: '1.42859', letterSpacing: '-0.016em' }],
        caption: ['12px', { lineHeight: '1.33337', letterSpacing: '-0.01em' }],
      },
      borderRadius: { tile: '24px', card: '16px', pill: '999px' },
      transitionTimingFunction: { brand: 'cubic-bezier(0.4, 0, 0.3, 1)' },
    },
  },
};
```
In v3 add `font-semibold` yourself where v4 relied on the token (hero, headline, section, tile, eyebrow).

## Class recipes (v4 names; v3 is the same apart from the font weight note)

Type and spacing tokens are fluid (`clamp`), so they need no `md:`/`lg:` prefixes. Follow the Responsive rules in SKILL.md.

| Element | Classes |
|---|---|
| Hero / chapter headline | `text-hero font-semibold` (fluid, no breakpoint prefixes needed) |
| Gallery headline | `text-headline font-semibold` |
| Eyebrow (not uppercase) | `text-eyebrow font-semibold` |
| Highlight intro | `text-intro text-ink-2 [&_strong]:text-ink [&_strong]:font-semibold` |
| Section | `py-[clamp(4.5rem,3.62rem+3.756vw,7rem)]` (72->112px fluid) alternate `bg-white` / `bg-paper` |
| Container | `mx-auto w-[calc(100%-2*max(6.25vw,env(safe-area-inset-left)))] max-w-[980px]` (wide: `max-w-[1280px]`) |
| Tile | `rounded-tile bg-paper p-10 overflow-hidden` (on grey sections `bg-white`) |
| Tile grid | `grid gap-5 grid-cols-[repeat(auto-fit,minmax(min(100%,20rem),1fr))]` |
| Small hit target | `relative before:absolute before:content-[''] before:-inset-2.5` (tiny pills, swatches, icons) |
| Primary button | `inline-flex min-h-11 items-center rounded-pill bg-action px-[22px] text-base font-medium text-white transition-colors duration-[240ms] ease-brand hover:bg-action-hover` |
| Secondary button | same + `bg-transparent border border-action text-link hover:bg-action hover:text-white` |
| Small button | `min-h-9 px-[15px] py-2 text-small` |
| Text link | `text-link hover:underline after:content-['›'] after:pl-[0.3em]` |
| Global nav | `sticky top-0 z-50 h-13 bg-white/80 backdrop-blur-xl backdrop-saturate-[1.8] text-caption text-ink/80` |
| Footer | `bg-paper text-caption text-ink-2` with `border-t border-hairline` dividers |
| Focus | `focus-visible:outline-2 focus-visible:outline-offset-1 focus-visible:outline-action` |
| Reveal | `motion-safe:opacity-0 motion-safe:translate-y-4 transition duration-[600ms] ease-brand` + JS toggles to `opacity-100 translate-y-0` |

shadcn/ui: keep its components but map `--radius` to `16px` for cards (`24px` for section tiles), `--primary` to `#2264ee`,
buttons to `rounded-full`, and drop every `shadow-*` on cards.

## Presets

The blocks above hard-code keynote values. For any other preset, map the theme to the `--a-*` variables instead
and load `tokens.css` + `styles/<preset>.css`; switching preset is then just swapping that one file.

```css
@import "tailwindcss";
@import "./turtleneck/tokens.css";
@import "./turtleneck/styles/devtool.css";   /* the chosen preset, after tokens */

@theme inline {   /* inline: utilities read the variables at runtime, so dark mode and .a-light/.a-dark work */
  --font-sans: var(--a-font);
  --font-display: var(--a-font-display);
  --font-mono: var(--a-font-mono, ui-monospace, monospace);
  --color-ink: var(--a-text);  --color-ink-2: var(--a-text-secondary);  --color-ink-3: var(--a-text-tertiary);
  --color-page: var(--a-bg);   --color-paper: var(--a-bg-alt);  --color-raised: var(--a-bg-elevated);
  --color-chip: var(--a-fill-quaternary);  --color-hairline: var(--a-hairline);  --color-link: var(--a-link);
  --color-brand: var(--a-blue);  --color-on-brand: var(--a-on-accent);  --color-brand-text: var(--a-accent-text);   /* not "accent": shadcn owns it */
  --color-action: var(--a-button-bg, var(--a-blue));  --color-action-hover: var(--a-button-hover-bg, var(--a-blue-hover));
  --color-on-action: var(--a-button-text, var(--a-on-accent));
  --radius-tile: var(--a-radius-tile);  --radius-card: var(--a-radius-card);  --radius-button: var(--a-radius-button);
  --shadow-tile: var(--a-tile-shadow);
  --ease-brand: var(--a-ease);
}
```
- Buttons: `bg-action text-on-action rounded-button hover:bg-action-hover`; cards: `rounded-tile shadow-tile` with
  the preset's tile fill, plus `border border-hairline` when the preset sets `--a-tile-border`.
- Dark mode: the tokens are `light-dark()`, so set `color-scheme` (`.a-dark`, `.a-light`, `data-theme`) instead of
  `dark:` variants; utilities follow automatically.
- Display sizes and weights differ per preset: use the `.a-hero` / `.a-headline` / `.a-section` / `.a-tile-head`
  classes from the preset file (they work next to Tailwind), or copy that file's `clamp()` values into `--text-*`.
- v3: put the same `var(--a-*)` strings into `theme.extend.colors` etc. Opacity modifiers (`bg-action/50`) do
  not work on hex variables; use `color-mix()` in plain CSS instead.
- shadcn/ui: `--background: var(--a-bg)`, `--foreground: var(--a-text)`, `--primary: var(--a-button-bg, var(--a-blue))`,
  `--primary-foreground: var(--a-button-text, var(--a-on-accent))`, `--muted: var(--a-bg-alt)`, `--muted-foreground: var(--a-text-secondary)`,
  `--border: var(--a-hairline)`, `--ring: var(--a-focus)`, `--radius: var(--a-radius-card)`. Keep each preset's
  shadow rule: `--a-tile-shadow` (it is `none` unless the preset sets one).

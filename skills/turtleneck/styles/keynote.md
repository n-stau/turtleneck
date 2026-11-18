# Preset: keynote (default)

Premium hardware product pages: calm, product first, few words, lots of space, system font, big semibold headlines,
one blue, pill buttons, flat 24px tiles. Its values ARE `tokens.css`, so there is no `keynote.css`. Light and dark,
following the OS. Source: blend of five reference sites (research notes kept outside the skill).

## When to use
Physical products, consumer devices, launch pages, "clean / minimal / premium", SwiftUI marketing screens, and
whenever Step 0 finds no clear signal.

## Tokens (`tokens.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | system stack, no web font | 5 proprietary grotesks |
| Hero / headline / section / tile | 48-72 / 36-52 / 30-44 / 22-28px, 600 | hero 40-80px, 400-700 |
| Tracking | hero -0.02em, headline and section -0.015em, tile -0.01em, body -0.01em | 0 to -0.015em |
| Eyebrow / intro | 17-21px 600 sentence case / 17-21px 400 grey with an ink lead-in | |
| Body | 17px / 1.5 | 16-18px |
| Page / alt / dark band | `#fff` / `#f3f4f6` / `#0d0e10` + `#17181b` | white + one cool, warm or tinted light band; dark bands on 2 of 5 |
| Text / secondary / tertiary | `#1a1c1f` / `#5d6067` / `#6a6d74` | near-black `#000`-`#2f353d` |
| Accent | `#2264ee` button and link, hover `#1c58e2`; dark-mode link `#6e9cff` | 4 blues + 1 red |
| Radius tile / card / button | 24 / 16 / 999px | cards 0-28 (24-28 on 3), buttons 1px to pill (pill on 4) |
| Shadows / borders | none; tone-on-tone surfaces | none on 4 of 5 |
| Nav / local nav | 52px glass / 56px sticky local nav with a Buy pill | sticky product bar with buy CTA on 4 of 5 |
| Section pad / widths | 72 -> 112px / 980 text, 1280 grids | 40-162px / 1200-1440px |
| Motion | `cubic-bezier(.4,0,.3,1)` 240ms; reveal 600ms, 16px | 80-500ms soft ease-in-out |

## Rules
1. The product carries the page: renders or photos on flat backgrounds that match the section, no illustration.
2. Headlines 1-4 words, product name first, semibold 600 with negative tracking; one short supporting line.
3. Eyebrow is the section name in sentence case, never uppercase, mono or colored.
4. Alternate white and `#f3f4f6`; at most one dark band per page for drama. Tiles take the opposite fill.
5. One blue, on buttons and inline links only, never as a background.
6. Big flat tiles: 24px radius, no border, no shadow; separate by tone, not lines.
7. Generous rhythm: 112px between sections on desktop; centered hero, left-aligned feature grids.
8. Product pages: global nav, sticky local nav (name, chapter links, one Buy pill), hero, highlights gallery,
   3-5 chapters, compare, closing CTA, footer.

## Component deltas
None: the recipes in `recipes-html.md` are keynote. Glass belongs only to navs and media controls.

## Fonts
None. The system stack is the look; never load a web font to imitate a platform font.

## Avoid
- A copy of one reference: its exact blue as the fallback accent, its light grey, its 980px pill radius, or its 80px+ headlines.
- Web fonts, bold 700+ headlines, all-caps tracked eyebrows, mono labels.
- Card shadows, outlined cards, gradient buttons, a second accent; dense spec tables in the hero.

## Checklist
- [ ] System font stack, headlines 600 with negative tracking, body 17px.
- [ ] Only white / `#f3f4f6` / one dark band; blue on actions and links only; text `#1a1c1f`.
- [ ] Section padding 72 (phone) -> 112px (desktop); widths 980 / 1280.
- [ ] Tiles 24px, no border, no shadow; buttons are pills 44px tall.
- [ ] Sticky local nav with one Buy pill; both themes screenshotted.

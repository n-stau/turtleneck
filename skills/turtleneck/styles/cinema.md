# Preset: cinema

Streaming: a blue-black stage, title art under a gradient scrim, one electric-indigo action color, a heavy short
promise, rows of posters running off the edge. Dark only. Source: blend of five reference sites (research notes kept outside the skill).

## When to use
Streaming, video, film/TV, trailers, VOD, live events, video podcasts; film, photo and motion portfolios;
story-driven games.

## Tokens (`styles/cinema.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Figtree 800 display, 400-700 UI | 5 proprietary or licensed faces |
| Hero / headline / section / row title | 36-56 / 28-40 (800) / 20-32 / 18-20px (700) | hero 40-60px, 700-900, lh 0.95-1.25 |
| Eyebrow | 14px 600 sentence case, muted | |
| Body | 16px / 1.5 (18px lead) | 14-18px, 70% white or `#b3`-`#b8` grey |
| Canvas / panel / raised | `#0b0c12` / `#1b1d25` / `#262935` | near-black on all 5: neutral, navy or violet tint |
| Text / muted / dim | `#fff` / `#b4b6bd` / `#8a8d97` | |
| Accent | `#5b5cff` primary fill, hover `#4d4ef0`, white text; focus `#9798ff` + glow | red, cyan, azure, cobalt, white |
| Links | white, underlined | |
| Radius button / poster / panel | 8 / 8 / 12px | 4px to pill (4-10 on 4) |
| Buttons | 52px (hero 60px), `0 28px`, 16px 700; secondary white 16% | 40-72px; translucent secondary on 3 |
| Section pad / widths | 48 -> 72px / 720 hero copy, 1280 content; rows full-bleed, 4vw gutter, 8px gap | compact rows to 100px hero |
| Nav | 64px, transparent over the hero, `rgba(11,12,18,.95)` once scrolled | transparent on 4 of 5 |
| Motion | 200ms ease-in-out; 400ms fades; poster scale 1.04 over 250ms | 0.1-0.4s ease-in-out |

## Rules
1. Content art is the hero: full-bleed title art or a poster wall, always under `--a-scrim`.
2. Hero = a 3-6 word heavy headline, one muted value or price line, one primary CTA.
3. One accent, on the primary CTA and focus states only; everything else white, grey and translucent.
4. Secondary actions are translucent white, never a second hue.
5. Rows of 2:3 posters or 16:9 tiles run full-bleed and off the edge (`.a-rail`, `--ratio: 2/3`).
6. Plans and FAQ sit in raised `#1b1d25` panels with 12px radius; hairlines only on inputs and plan cards.
7. Focus is visible and glowing (TV and remote friendly); hit areas 48px or more.
8. Text is white or muted grey; never colored body text.

## Component deltas
- **Nav**: recipes "Nav over a full-bleed hero"; logo left, text sign-in and one accent CTA right.
- **Hero**: centered or left over art; copy column 720px; price line under the headline.
- **Posters**: 8px radius, flat at rest; hover and focus scale 1.04 with `0 8px 24px rgba(0,0,0,.5)`.
- **Buttons**: 8px; `.a-button-large` 60px for the hero CTA (uppercase allowed only there).
- **Input**: 52px, 8px radius, `--a-bg-alt` fill, 1px hairline.
- **FAQ**: full-width panel rows, "+" right, 8px gaps.

## Fonts (free)
**Figtree** (Google Fonts, OFL). Fallback `system-ui`.

## Avoid
- Red or cyan as the fallback accent, a pure `#000` canvas, a pill-everything look: one reference site's signature each.
- Light themes, white cards, drop shadows on everything, thin display weights, long hero paragraphs.
- Several competing CTAs in the hero; autoplaying sound; uppercase everywhere.

## Checklist
- [ ] Blue-black canvas, white text, indigo only on the primary CTA and focus.
- [ ] Hero art under the scrim; headline 800, short; price line below.
- [ ] Radii 8 / 8 / 12px; no shadows at rest.
- [ ] Rails scroll inside their box, full-bleed, paddles 44px; focus glow visible.
- [ ] Reduced motion: no autoplay trailers, no poster scale.

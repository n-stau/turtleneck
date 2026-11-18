# Preset: drive

Automotive and mobility: every chapter opens on a full-bleed square-cornered photo, a transparent nav over the
hero, large light headlines with zero tracking, a monochrome base with one steel-blue action color, near-square
buttons in pairs, light spec numerals, slow smooth motion. Light default with dark scenes; dark mode follows the OS.
Source: blend of five reference sites (research notes kept outside the skill).

## When to use
Cars, motorcycles, e-bikes, EV charging, mobility services, boats and other vehicles; model pages, configurator
entry pages, dealer and test-drive flows. Rentals and rides as a booking flow go to `journey`.

## Tokens (`styles/drive.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Hanken Grotesk 300/400/500 | 5 proprietary faces |
| Hero / headline / section / tile | 44-80 / 36-56 / 28-36 / 20-22px; 400, tiles 500; tracking 0 | hero 40-95px, 300-600, tracking normal on all 5 |
| Spec numeral | 32-40px 300 over a 13px 500 label | |
| Eyebrow | 13px 500, muted, sentence case | |
| Body | 16px / 1.6; small 14; fine print 12 | 14-16px |
| Page / alt / dark scene | `#fff` / `#f3f3f4` / `#0b0c0e` + `#16171a` | white, `#f2f2f2`-`#f6f6f6`, near-black scenes on all 5 |
| Text / body / muted | `#0e0f11` / `#3a3d42` / `#6a6d73`; scene text `#f4f5f7` | |
| Accent | `#4a6fa5` button and link, hover `#3467a1`; on dark scenes link `#8eaad6` | 3 saturated blues, monochrome, black + link blue |
| Radius button / card / media | 4 / 6 / 0px | buttons 2-4 on 3; media square on all 5 |
| Shadows | none; separate by tone or a 1px `#dcdddf` line | none at rest on all 5 |
| Buttons | 48px, `0 28px`, 15px 500; pairs at equal width (240px); secondary 1px currentColor | 40-56px |
| Section pad / widths | 64 -> 96px / 640 text, 1200 grids, media 1440 or full-bleed | 40-160px |
| Nav | 72px, transparent with light text over the hero, solid with hairline after it | transparent on 4 of 5, 56-84px |
| Motion | UI 300ms `cubic-bezier(.4,0,.2,1)`; reveals 800ms, 24px; media 1.05 -> 1 over 1.2s | 0.3-0.8s, smooth |

## Rules
1. The image carries the page: the hero and every major chapter open on a full-bleed photo or video, square edges.
2. Headlines are light 400 and large with zero tracking; never bold display.
3. Color is one steel-blue CTA; everything else greyscale.
4. Specs are big light numerals with small labels, 3-4 across (`.a-stats`).
5. Buttons are nearly square (4px) and come in pairs: primary plus outline, same width.
6. Alternate light sections and dark full-width scenes (`.a-dark`), with lots of space.
7. Headlines: the model name plus at most 5 words; facts go in the specs, not adjectives.
8. Motion is slow and smooth, one scroll-linked effect per page at most; never bouncy.

## Component deltas
- **Hero**: `.a-scene` (set `--scene: url(...)`): 100svh photo under `--a-scrim`, copy and the CTA pair anchored
  bottom-left or bottom-center, nav on top with `.gnav.over-hero` (recipes: Nav over a full-bleed hero).
- **Tiles**: `#f3f3f4` on white, 6px, no border; image tiles edge to edge with the caption below.
- **Buttons**: secondary uses currentColor, so it works on photos and dark scenes unchanged.
- **Specs**: `.a-stats` puts the light numeral above its label in this preset (`--a-stats-dir`, `--a-stats-weight`).
- **Footer**: quiet, light, fine print 12px for range and price disclaimers.

## Fonts (free)
**Hanken Grotesk** (Google Fonts, OFL). Fallback `system-ui`.

## Avoid
- Saturated blue as the fallback accent on grey cards, a condensed serif hero, 200px model numerals, glass pills
  in rounded frames, black pill CTAs: one reference site's signature each.
- Drop shadows, gradients, chrome or metallic effects, neon green.
- Bold or tracked uppercase headlines; busy grids of small images; rounded hero media; spring easing.

## Checklist
- [ ] Hero photo full-bleed, square, under the scrim; nav transparent until scrolled past it.
- [ ] Headlines 400, tracking 0; specs light 300 numerals with small labels.
- [ ] Steel blue only on primary actions and links; buttons 4px, in equal-width pairs.
- [ ] No shadows; light sections alternate with dark scenes.
- [ ] Reduced motion: no media scale, no autoplay.

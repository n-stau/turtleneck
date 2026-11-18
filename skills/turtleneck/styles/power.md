# Preset: power

Gaming hardware: a dark, image-led hero, tight corners, bordered dark cards, uppercase labels and CTAs, dense spec
content, one arc-cyan accent. Dark hero by default with `.a-light` bands below for long pages. Source: blend of five reference sites (research notes kept outside the skill).

## When to use
GPUs, PC parts, consoles, peripherals, monitors, esports, benchmarks, drivers, competitive games and studios with a
hardware angle. Story-driven games and trailers go to `cinema`.

## Tokens (`styles/power.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Barlow 700 display, 400/500 body | DIN-like grotesks on 4 of 5 |
| Hero | 36 -> 64px, 700, -0.01em, lh 1.1 | 42-62px, 300-700, 0 to -0.01em |
| Headline / section / tile | 28-40 / 22-28 / 18-22px | h2 28-49px |
| Eyebrow | 13px 600 uppercase +0.08em, link color | uppercase labels on 2 of 5 |
| Body | 16px / 1.5 | 15-16px |
| Page / card / raised (dark) | `#07090c` / `#14171c` / `#1e232a` | `#000`, navy, `#121314` |
| Page / alt (light bands) | `#fff` / `#f2f4f6` | white, `#f2f2f2`-`#f8f4f1` |
| Text / muted | `#eef1f4` / `#8c95a3` (light `#111418` / `#5b6470`) | `#eee`-`#fff` on dark |
| Accent (button fill) | `#19d3e6`, text on it `#07090c` | green, red, blue, blue + orange, lime; none cyan |
| Link / focus | `#19d3e6` dark, `#00798a` light | |
| Radius button / card / media / chip | 4 / 12 / 8 / 2px | buttons 0-4px on 3 of 5; cards 12-16px |
| Card border + shadow | dark: 1px `rgba(255,255,255,.12)` + `0 4px 12px rgba(0,0,0,.35)`; light: 1px `#e3e7ec` | border or real shadow on 3 of 5 |
| Section / card pad / gap | 48 -> 72 / 20-24 / 16px | 26-120px |
| Widths | text 720, container 1440px | 1320-1680px |
| Nav | 64px solid dark, stays dark over light bands | 54-88px |
| Motion | 150ms `cubic-bezier(.4,0,.2,1)`, media hover 1.02 | 0.15-0.2s |

## Rules
1. The hero is a dark full-bleed product render or key art with a 4-9 word headline, bottom- or top-left.
2. One cyan accent per view: the primary CTA, the active tab underline or one key spec number.
3. Corners are tight (2-4px controls, 12px cards); the look is engineered, not soft.
4. Eyebrows and CTA labels are uppercase; headings stay sentence or title case.
5. Pack content densely: tab rails, spec tables, 3-4 column product cards.
6. Alternate the dark hero with `.a-light` or charcoal bands so long pages stay readable.
7. Numbers (FPS, cores, TB) get display weight; one of them may take the accent.
8. Feedback is snappy (150ms); motion lives in the media, not the layout.

## Component deltas
- **Buttons**: 44px, 4px radius, 14px 700 uppercase +0.04em, `0 22px`; secondary is a 1px current-color ghost.
- **Cards**: card fill on every band, border + shadow from the table; hover turns the border to 40% accent.
- **Nav**: solid dark bar, one accent CTA right; an optional 32px utility strip above it.
- **Hero**: `.a-button-large` pair; render or video behind a dark gradient; text never over bright art.
- **Specs**: sticky-head spec table (recipes: Spec table); footnote markers on benchmark claims.

## Fonts (free)
**Barlow** 400/500/600/700 (Google Fonts). Fallback `system-ui` / Arial is acceptable.

## Avoid
- Any single reference brand's green, red, blue, lime or orange as the fallback accent; stripes or "eye" motifs.
- Pill CTAs, 24px+ card radii, pastel or cream backgrounds, thin 300 display type on images.
- Glow on everything (one glow per hero at most), gradient text, RGB rainbow decoration.
- Long paragraphs in the hero.

## Checklist
- [ ] Dark hero, `.a-light` bands below where the page is long; nav stays dark.
- [ ] Cyan only on the primary CTA / active tab / one number, always with dark text; `#00798a` for links on light.
- [ ] Buttons 4px, uppercase, 44px; cards 12px with border (+ shadow on dark).
- [ ] Specs in a real table whose sticky head covers less than a third of a phone screen.
- [ ] Hero video paused or static under reduced motion.

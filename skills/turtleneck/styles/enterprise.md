# Preset: enterprise

Business software: clear, structured and sober. Regular-weight headlines, white cards with a hairline and a
1-2px shadow, a steel-cobalt accent for actions and links, navy for weight, framed product UI as imagery.
Light default; dark mode (deep navy) follows the OS. Source: blend of five reference sites (research notes kept outside the skill).

## When to use
Office and productivity, B2B, CRM/ERP, intranet, IT, compliance, healthcare, banks' business pages, team plans
and pricing, admin dashboards and back office for business users.

## Tokens (`styles/enterprise.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Source Sans 3 (display and body), Source Code Pro | 4 proprietary + 1 open family |
| Hero / headline / section / tile | 36-56 / 30-40 / 26-32 / 20-24px; 400, tiles 600; -0.015em | hero 32-80px, 300-500 |
| Eyebrow | 13px 600 uppercase +0.04em, grey | |
| Body | 16px / 1.5 (14px in app UI) | 16px / 1.5 on all 5 |
| Page / band / card | `#fff` / `#f4f5f7` / `#fff`; dark `#14213a` / `#0f1a2f` / `#1b2a47` | white + cool grey or warm tint |
| Text / body / muted | `#161a22` / `#4f5866` / `#5f6876` | near-black or navy ink |
| Accent | `#2b59c3` button and link, hover `#2249a6`; dark-mode link `#8eacf0` | 5 blues `#0057d2`-`#0f62fe`; 2 sites use ink buttons |
| Radius button / card | 6 / 10px | buttons 0 to pill (4-8 on 3); cards 0-24 |
| Card | 1px `#d9dde3` + `0 1px 2px rgba(16,24,40,.06)`; hover `0 4px 12px .08` | flat tint, hairline or faint shadow |
| Section pad / widths | 56 -> 80px / 1024 text, 1360 grid | 40-96px / 1152-1744px |
| Nav / local nav | 64px solid, hairline / optional 48px anchor bar | 48-96px, solid on all 5 |
| Motion | 150ms `cubic-bezier(.2,0,.2,1)`; panels 240ms; no parallax | 70-300ms, linear or standard |

## Rules
1. Clarity over flourish: every section answers what the product does for the business.
2. Display type is regular 400 at large sizes; 600 only for card titles and small headings.
3. The cobalt accent is for actions and links only; navy or ink carries the brand weight.
4. Cards are flat: hairline plus a 1-2px shadow, radius 10px or less; deeper shadow only on hover.
5. Show the real product: framed UI screenshots, tables and dashboards beat stock photos.
6. Wide 12-column grid, 24px gutters, predictable 80px section rhythm.
7. Headlines 5-9 words, outcome first, with one concrete benefit line below.
8. Two CTAs per block at most: primary (try or buy) and secondary outline (learn or contact).

## Component deltas
- **Buttons**: 44px, 6px radius, 15px 600; secondary = 1px accent outline on transparent.
- **Cards**: white on every band, hairline + faint shadow, 24-32px padding, underlined "Learn more" at the bottom.
- **Nav**: solid page color with a hairline; optional sticky 48px anchor bar with one primary and one secondary.
- **Links**: underlined in body copy; nav, menu and footer links stay plain.
- **App UI**: 14px body, 32px controls inside a 44px hit area, data tables with hairline rows, left nav rail.

## Fonts (free)
**Source Sans 3** + **Source Code Pro** (Google Fonts, OFL). Fallback `"Segoe UI", system-ui`.

## Avoid
- Pill buttons with coloured glows, or square 0px everything: one reference site's signature each.
- Light 300 display next to bold, glassmorphism, neon gradients, mascots.
- Pure black text in long tables; hype words without proof; red except for errors.

## Checklist
- [ ] Display 400, tile heads 600; body 16px; eyebrow small uppercase only.
- [ ] Cobalt only on actions and links; content links underlined.
- [ ] Cards 10px with hairline and faint shadow; buttons 6px rectangles.
- [ ] Imagery is real product UI in frames.
- [ ] Dark mode checked: navy `#14213a` page, `#1b2a47` cards, links `#8eacf0`.

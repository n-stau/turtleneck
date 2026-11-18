# Preset: vault

Finance: deep navy ink and one navy band, white and cool off-white sections, a calm trust-blue accent, semibold
tight headlines, bordered 16px cards, pill CTAs, numbers shown big with their label and fine print close by.
Light default; dark mode (navy) follows the OS. Source: blend of five reference sites (research notes kept outside the skill).

## When to use
Banks, credit cards, payments, wallets, insurance, lending, investing and savings products, account dashboards.
Developer-facing payment APIs go to `devtool`.

## Tokens (`styles/vault.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Manrope 600 display, Inter body and numbers (tabular) | 4 proprietary + 1 open family |
| Hero / headline / section / tile | 40-56 / 32-44 / 24-32 / 20px, 600, -0.02em, lh 1.1 | hero 32-67px, 300-900, -0.02 to -0.03em |
| Eyebrow | 13px 600 uppercase +0.04em | |
| Body | 16px / 1.55; small 14; legal 12 | 16px on all 5 |
| Page / alt / navy band | `#fff` / `#f3f5f7` / `#121a3a` (dark mode: navy throughout) | white + cool or warm off-white on all 5 |
| Text / body / muted | `#121a3a` / `#4a5163` / `#5e6573` | navy headings on 4 of 5; body `#333`-`#3d3d3d` |
| Accent | `#1f6fb8` button and link, hover `#1d65a8`; dark-mode link `#7cb2ea` | 5 blues `#0066f5`-`#1434cb` + 1 orange |
| Data | positive `#1e7f4f`, negative `#c23a3a`, data only | |
| Radius button / card / panel / input | 999 / 16 / 24 / 10px | buttons pill on 3; cards 5-24 |
| Card | 1px `#e1e4ea`, no shadow; `.a-raised` `0 8px 28px rgba(18,26,58,.10)` | no resting shadow on 4 of 5 |
| Buttons | 48px, `0 24px`, 16px 600; secondary 1.5px navy outline | 48-50px on 4 of 5 |
| Section pad / widths | 48 -> 80px / 720 text, 1280 grid; gutter 24 -> 48 | 24-400px / 1140-1600px |
| Nav | 72px solid, hairline; optional 40px navy notice bar | solid on 3, 61-138px |
| Motion | 200ms `cubic-bezier(.2,.8,.2,1)`; reveal 500ms, 12px, once | 200-300ms on 4 of 5 |

## Rules
1. Blue means action and trust: buttons and links only, never large fills; navy is the only big color.
2. One headline per view at 44-56px with tight tracking; everything else calm 16px text.
3. Numbers lead: rates, fees and bonuses big and tabular, label above the value (`.a-stats`).
4. Every claim has its fine print nearby (`.a-legal`, 12px, AA), never hidden.
5. Product comparison in 16px bordered cards, 3 across at 1280px.
6. Alternate white and `#f3f5f7`; at most one navy band (`.a-dark`) per page.
7. One filled pill CTA per view; secondary is an outline pill or a text link with an arrow.
8. Visible 2px focus rings with a 2px offset; every form field labelled.

## Component deltas
- **Nav**: solid page color, hairline, sign-in as text plus one primary pill; optional navy notice bar above.
- **Hero**: headline, one benefit line, one CTA, then a card render or a calm lifestyle photo in a 24px frame.
- **Rate cards**: label, big tabular figure, one-line condition, `.a-legal` footnote, outline button.
- **Forms**: 10px inputs, 48px tall, labels above, inline help in `--a-text-secondary`.
- **Dashboards**: data colors `--a-green` / `--a-red` only on values and deltas, never on backgrounds.

## Fonts (free)
**Manrope** + **Inter** (Google Fonts, OFL). Fallback `system-ui`.

## Avoid
- Black pills with giant 900 words, cream with orange and a floating glass nav, a blue header bar or royal-blue
  band as the fallback accent: one reference site's signature each.
- Heavy drop shadows, gradient buttons, neon or crypto-style glow; red or green as decoration.
- Light grey legal text under 4.5:1; mixing 300 and 900 weights.

## Checklist
- [ ] Navy ink, one navy band at most; trust blue only on actions and links.
- [ ] Headlines 600 with tight tracking; key numbers tabular with labels above.
- [ ] Cards 16px with a hairline, no resting shadow; pill buttons 48px.
- [ ] Fine print next to each claim, AA contrast.
- [ ] Both themes screenshotted; focus rings visible on every control.

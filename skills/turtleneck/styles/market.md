# Preset: market

Retail and shops: white pages, a wide pill search in a solid nav, bold compact headings, flat 8px product cards
on hairlines or grey fills, square product images, pill buttons and chips, one signal-orange action color,
prices as the loudest text. Light only. Source: blend of five reference sites (research notes kept outside the skill).

## When to use
Online shops, catalogs, marketplaces, product listing and detail pages, carts and checkouts, deals pages,
grocery and fashion stores. A few premium products on one page go to `keynote`.

## Tokens (`styles/market.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Figtree 400/500/700 | 5 proprietary faces |
| Hero / headline / section / tile | 36-56 / 28-40 / 22-28 / 18-20px, 700, -0.02em | H1 21-48px, 700 on 4 (one 76px uppercase campaign outlier) |
| Eyebrow | 14px 500, muted, sentence case | |
| Body | 16px / 1.5; dense lists 14px | 14-16px |
| Page / alt / chip | `#fff` / `#f2f3f4` / `#f2f3f4` | white + `#edeeee`-`#f5f5f5` on 4 of 5 |
| Text / muted | `#121212` / `#5c5f66` | `#000`-`#111` |
| Accent | `#e8590c` fill with ink text, hover `#ee6418` | yellow, 2 blues, red, none |
| Accent as text (links, sale prices) | `#a8400c` | |
| Radius button and chip / card / image | 999px / 8px / 0 | pills on 4 of 5; cards 0-24 (8 on 3) |
| Card | 1px `#dadce0` or grey fill, no shadow; hover `0 2px 8px rgba(0,0,0,.08)` | flat on all 5 |
| Buttons / chips | 48px, `0 24px`, 16px 700 / 36px, 14px 500 | 32-52px |
| Section pad / grid | 48 -> 80px / 16px gaps, 16px card padding | tile gaps 16-24 / sections 48-150 |
| Widths / gutter | 1600px / 24 -> 40px | 1200-1920px |
| Nav | 64px solid white + optional 40px chip row, hairline, no blur | 96-138px solid, search row on 4 of 5 |
| Motion | 160ms ease-out; drawers 240ms | 0.15-0.3s |

## Rules
1. One saturated action color; everything else ink, white and light grey.
2. Every button and chip is a pill; cards stay at 8px; no other radii.
3. Headings bold 700 and compact; big type only for one campaign banner per page.
4. Cards separate by hairline or grey fill, never a resting shadow.
5. The search field lives in the nav and is its widest element.
6. Product images keep square corners on white or `#f2f3f4`; lifestyle images full-bleed or in large tiles.
7. Prices are the loudest text in a card (`.a-price`, bold, tabular); sale prices use the accent text step.
8. Browse grids run 4-6 columns at 1440px with 16px gaps; density beats whitespace there.

## Component deltas
- **Nav**: logo, pill search (fills the free width), account and cart icons with 44px hit areas; chip row below.
- **Product card**: whole card is the link; square image, 2-line title, rating, `.a-price`, small secondary button.
- **Chips**: `.a-chip`, `aria-pressed="true"` turns ink; filter rows scroll inside their box on phones.
- **Buttons**: primary orange with ink text; secondary white with a 1px ink border.
- **Grids**: product cards `repeat(auto-fill, minmax(min(100%, 14rem), 1fr))`; small tiles without body text
  (categories, brands) `minmax(7.5rem, 1fr)` and stay 2-up at 320; rails for "recently viewed" (`.a-rail`).
- **Headlines**: benefit or deal first, 3-8 words, sentence case.

## Fonts (free)
**Figtree** (Google Fonts, OFL). Fallback `system-ui`.

## Avoid
- Yellow, blue or red as the fallback accent (a yellow CTA, an all-blue header bar, a red pill on black), condensed uppercase everywhere: one reference site's signature each.
- Glass or blurred navs, gradient buttons, glowing shadows; 16px+ card radii next to pills.
- Long editorial paragraphs on browse pages; a second accent or a second sale color.

## Checklist
- [ ] Orange only on the primary action (ink text on it); links and sale prices in `#a8400c`.
- [ ] Pills for buttons, chips and search; 8px cards; square product images.
- [ ] Search is the widest thing in the nav; nav solid with a hairline.
- [ ] Prices bold and tabular; grids 4-6 columns at 1440; at 320 product cards with text go one column, small image tiles may stay 2-up; no overflow.
- [ ] Hover and press feedback under 250ms.

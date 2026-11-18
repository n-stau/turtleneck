# Preset: journey

Travel and booking: a white page where the search bar is the hero, ink pill buttons, bold plain headlines, photo
cards with captions below, dense rows and carousels, one soft shadow level for floating things, a coral accent kept
to search submit and favourites. Light only. Source: blend of five reference sites (research notes kept outside the skill).

## When to use
Stays, flights, rides, hotels, rentals, experiences, itineraries, booking flows, listing and results pages.

## Tokens (`styles/journey.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Plus Jakarta Sans 700 display, 400 body | geometric sans on 4 of 5 |
| Hero | 32 -> 44px, 700, tracking 0, lh 1.15 | 28-52px, 700 on 4 of 5, normal tracking on 5 |
| Headline / section / card title | 26-32 / 20-24 / 16px | h2 24-36px |
| Body / meta | 16px / 1.45; cards and meta 14px | 14-16px, 14 the norm |
| Page / surface | `#fff` / `#f5f5f4` | white or `#f4f4f4`; `#f5f5f5`-`#f7f7f7` |
| Text / muted / hairline | `#1d1e24` / `#6a6c73` / `#e3e3e3` | `#1a1a1a`-`#222`, one navy ink |
| Primary action | ink pill `#1d1e24`, white text | near-black on 4 of 5 |
| Accent (search submit, favourites, badges) | `#f45d52` fill with ink text; as text `#c2362c` | red-pink, blue, none, coral, blue |
| Link / focus | `#3439D6` | two blues |
| Radius button + search / card + image / input / badge | 9999 / 16 / 12 / 6px | 4px to pill; images 8-20px |
| Shadows | search `0 4px 24px rgba(16,18,24,.10)`; card `0 2px 8px rgba(16,18,24,.06)`; hover `0 6px 20px ...10` | none to 16% |
| Section / card pad / gap | 32 -> 48 / 16 / 16-24px | 32-96px |
| Widths | container 1200px, gutter 16 -> 24px | 1110-1280px |
| Nav | 72px solid white, hairline once scrolled, no blur | 64-124px, solid, no blur on 5 |
| Motion | 200ms `cubic-bezier(.2,0,0,1)`; card hover: shadow + image 1.03 | 0.12-0.3s; carousels slower |

## Rules
1. Search comes first: one wide pill search bar above the fold, fields split by hairlines (recipes: Search hero).
2. Primary CTAs are ink pills; coral only on the search submit, favourites and key badges.
3. Photos, not illustrations: places and people at true ratios, 16px radius.
4. Cards: image on top, then a 14-16px title, muted meta, a bold tabular price; no boxed border on photo cards.
5. Headlines are bold, plain and under 6 words; they name a place, an action or a benefit.
6. Dense, scannable rows: carousels and 4-7 column grids, 48px between sections.
7. One soft shadow level for floating elements (search, popovers); everything else flat or near-flat.
8. The nav is functional: product tabs (stays, flights, cars) beat marketing links.

## Component deltas
- **Buttons**: 48px pills, 16px 600, `0 24px`; secondary outlined ink; `.a-button-accent` = coral with ink text.
- **Cards**: white, 16px radius, faint card shadow; linked cards lift the shadow and scale the image 1.03.
- **Nav**: logo left, product tabs centered, account pill right.
- **Hero**: short headline + search bar; no big product visual.
- **Lists**: listing grids and carousels (`.a-rail`); prices 600 with tabular numerals.

## Fonts (free)
**Plus Jakarta Sans** 400/600/700 (Google Fonts, OFL). Fallback `system-ui`.

## Avoid
- The accent as the main CTA everywhere; yellow or navy as the fallback accent (a thick yellow search frame, a navy header band); a serif sale headline.
- Glass or blurred navs, dark-mode-first pages, gradient fills, mixing 4px and pill buttons.
- Stock-illustration heroes, long marketing copy, exclamation-mark sale shouting.

## Checklist
- [ ] Search bar above the fold; coral only on submit, favourites and badges (ink text or icon on it).
- [ ] Ink pill primary; every button a pill.
- [ ] Photo cards 16px, caption below, bold tabular price.
- [ ] One soft shadow level; nav solid white.
- [ ] Carousels scroll inside their box; image hover scale off under reduced motion.

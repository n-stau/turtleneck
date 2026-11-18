# Preset: devtool

Developer and cloud platforms: light pages with a pale tinted band, medium-weight tight headlines, hairline-bordered
8px cards, a deep-teal primary, product UI and code as the imagery, one dark band lower down. Light default; dark mode
follows the OS. Source: blend of five reference sites (research notes kept outside the skill).

## When to use
APIs, SDKs, CLIs, hosting, deploy, databases, observability, payment APIs, code hosting, docs sites, changelogs,
developer-facing dashboards. AI as the product goes to `lab`.

## Tokens (`styles/devtool.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Inter Tight 450 display, Inter body, JetBrains Mono code | 5 proprietary grotesks |
| Hero | 36 -> 52px, 450, -0.02em, lh 1.1 | 40-57px, 300-500, 0 to -0.025em |
| Headline / section / tile | 28-40 / 24-32 / 20px | h2 21-48px |
| Eyebrow | 13px mono, muted | |
| Body | 16px / 1.6 (UI 14px) | 14-16px |
| Page / band / tile | `#fff` / `#f5f7f6` / `#eef1f0` | white or warm off-white + pale tinted band on 4 of 5 |
| Dark band / dark mode | `#121514` / `#1b1f1e` | one dark band on all 5 |
| Text / body / muted | `#0f1a1c` / `#4f5b60` / `#637077` | grey-blue or warm grey body on 4 of 5 |
| Accent (button fill + link) | `#087f7a`, white text; dark mode `#2bb3a8` with dark text | green, orange, orange, indigo, blue; none teal |
| Radius button / card / badge | 6 / 8 / 4px | cards 4-8px on 5; buttons 4-6px on 3 |
| Border / raised shadow | 1px `#dde2e0`; `.a-raised` `0 12px 28px rgba(15,26,28,.10)` | flat on 4 of 5 |
| Section / card pad / gap | 64 -> 96 / 24 / 24px | 36-128px |
| Widths | prose 720, container 1280px | 1200-1440px |
| Nav | 68px, solid page color, no blur | 68-76px, no blur on 4 of 5 |
| Motion | 200ms `cubic-bezier(.16,1,.3,1)`; reveal 500ms, 8px | 0.2-0.3s strong ease-out |

## Rules
1. Headline at medium weight, tight, one sentence; an optional muted second clause (`.a-two-tone` + `.a-mute`).
2. One teal primary plus one outlined secondary per hero; no third button.
3. Show the product: UI screenshots, code, diagrams in 8px frames with a 1px border.
4. Separate with hairlines and tinted bands, not shadows; `.a-raised` only for menus and one featured card.
5. Body copy in grey-blue, headings near-black, never pure black.
6. Disciplined spacing: 96px between sections, 24px gaps, 1280px container, 720px prose.
7. Mono only for real code, CLI commands and API values.
8. Plain, technical voice; every claim backed by a number or a capability.

## Component deltas
- **Buttons**: 44px, 6px radius, 15px 500, `0 20px`; secondary = page-color fill with a hairline border.
- **Cards**: page-color fill on every band, 1px hairline, 8px radius, 24px padding.
- **Nav**: solid page color, hairline bottom once scrolled; mega-menu panels 8px radius.
- **Hero**: two-tone headline, one grey line, CTA pair, then a code or UI frame (recipes: Code frame).
- **Docs**: left sidebar (14px grey, active ink), 720px column, right "On this page" rail, `pre` on `--a-code-bg`.
- **Pricing**: plan cards (recipes); the accent only on the recommended plan.

## Fonts (free)
**Inter Tight** + **Inter** + **JetBrains Mono** (Google Fonts, OFL). Fallback `system-ui` / `ui-monospace`.

## Avoid
- A multicolour wave gradient, orange as the fallback accent or a flat orange field, a grid-pattern hero: one reference site's signature each.
- Bold 700+ display, pill-everything, 16px+ card radii, heavy or dark shadows, glass navs.
- Stock photos of people pointing at screens; competing accent colours.

## Checklist
- [ ] Display 450, -0.02em; body 16px grey-blue; mono only for code.
- [ ] Teal on the primary button and links only; white text on it (dark text in dark mode).
- [ ] Cards 8px with a hairline, no shadow; buttons 6px.
- [ ] Imagery is real UI or code; code blocks scroll inside their box at 320px.
- [ ] Both themes screenshotted; the dark band reads as one chapter.

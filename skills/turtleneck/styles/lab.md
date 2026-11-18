# Preset: lab

AI products: calm white pages with a warm off-white surface, medium-weight tight display type, ink pills for
actions, a blue-violet accent kept to links and one highlighted word, airy narrow text columns, no shadows. Light
default with at most one dark band; dark mode follows the OS. Source: blend of five reference sites (research notes kept outside the skill).

## When to use
Models, assistants, chat products, agents, research labs, AI APIs sold on the product rather than the docs.
AI as a feature of another product keeps that product's preset.

## Tokens (`styles/lab.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Inter Tight 500 display, Inter body; optional Newsreader serif for one statement | four grotesks, one serif display |
| Hero | 44 -> 72px, 500, -0.025em, lh 1.05 | 41-108px, 400-500, -0.01 to -0.04em |
| Headline / section / tile | 36-56 / 28-40 / 22-28px | h2 27-70px |
| Eyebrow | 12px 500 uppercase, muted | small uppercase on 1 of 5, medium on others |
| Body | 17px / 1.55 | 13-18px, lh 1.45-1.55 |
| Page / surface | `#fff` / `#f6f5f2` | white (4 of 5) + one warm off-white |
| Dark band | `#111113` / `#1c1c1f` | none (2), black hero or band (2) |
| Text / muted | `#111113` / `#60646c` | `#000`-`#141413` / `#5d6c7b`-`#5f6368` |
| Primary action | ink pill (`#111113`, white text) | ink or monochrome on 3 of 5 |
| Accent (links, one word, focus) | `#2C3ABB`; dark `#8f96ff` | none (2), blue (2), indigo-purple gradient word (1) |
| Radius button / card / media / input | 9999 / 16 / 20 / 12px | pills on 5; cards 6-32px |
| Borders, shadows | fill or 1px `rgba(17,17,19,.08)`, never both; no shadows | no shadows on 5 |
| Section / card pad / gap | 64 -> 96 / 24-32 / 16px | 48-120px+ |
| Widths | text 720, container 1280px, gutter 16 -> 24px | text 440-840, container 1280-1440 |
| Nav | 64px, sticky, solid page color, no border, no blur | 64-84px, solid, no blur on 5 |
| Motion | hover 160ms `cubic-bezier(.4,0,.2,1)`; reveal 600ms `cubic-bezier(.22,1,.36,1)`, 12px | 0.15-0.3s; slow reveals on 3 |

## Rules
1. Every action is a pill: primary solid ink, secondary tinted fill.
2. The accent is for links, one highlighted word (`<em>` in a headline) and focus; never a big fill.
3. Display is medium weight, tight, at most two lines; headlines under 8 words, calm and declarative.
4. One plain subhead sentence; no hype-word stacks.
5. Separate by whitespace and tint, never shadow.
6. Narrow text columns in a wide grid; media may run the full container width.
7. At most one dark band per page, for the hero or a showcase.
8. Imagery: product UI, chat transcripts, generative or abstract art, restrained illustration.

## Component deltas
- **Buttons**: 44px pills, 15px 500, `0 20px`; secondary on `--a-fill-quaternary`.
- **Cards**: surface fill or hairline, 16px radius; large media 20px.
- **Nav**: solid page color, 14px 500 links, one ink pill right.
- **Hero**: left or centered, accent on one word, a prompt box or product UI frame below (recipes: Code frame).
- **Statement**: `.a-statement` serif line, once per page at most.

## Fonts (free)
**Inter Tight** + **Inter**, optional **Newsreader** (Google Fonts, OFL). Fallback `system-ui`.

## Avoid
- 100px+ display, cream-and-serif as the whole page, all-grey pills, 12px button labels: one reference site's tell each.
- Drop shadows, glassmorphism, blurred navs; gradient buttons; gradients outside one keyword or the art.
- Square or 4px buttons; 700-800 display weights; exclamation marks.

## Checklist
- [ ] Ink pill primary, tinted pill secondary; accent only on links, one word and focus.
- [ ] Display 500, -0.025em, max two lines; body 17px muted where secondary.
- [ ] No shadows anywhere; cards are fill or hairline, not both.
- [ ] Text columns <= 720px; at most one dark band.
- [ ] Reveals once, 12px, off under reduced motion.

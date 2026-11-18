# Preset: vibe

Music and social apps: a near-black stage, one huge heavy headline, rounded tiles separated by tone, one violet
pill for the main action, people and media as the imagery. Dark default, warm-cream light variant
(`data-theme="light"` or `.a-light`). Source: blend of five reference sites (research notes kept outside the skill).

## When to use
Music, audio, podcasts, playlists, creators, social feeds, dating, fitness classes, youth subscriptions, consumer
media app screens. Not for tools people use at work (`devtool`, `enterprise`).

## Tokens (`styles/vibe.css`)

| Token | Blend | Range across the 5 reference sites |
|---|---|---|
| Font | Figtree 800 display, 400/500 body | geometric-humanist sans on all 5 |
| Hero | 48 -> 96px, 800, -0.02em, lh 1.04 | 48-128px, 400-900, +0.05 to -0.035em |
| Headline / section / tile | 36-48 / 28-32 / 20-24px | h2 18-48px |
| Body | 16px / 1.5 | 16px on all 5 |
| Page / surface / raised (dark) | `#0e0e10` / `#1c1c20` / `#26262b` | `#000`-`#121212` page, `#212121`-`#242424` tiles |
| Page / surface (light) | `#fff` / `#f6f4ef` cream | white plus cream or pastel blocks (2 of 5) |
| Text / muted | `#f3f3f5` / `#a7a7af` (light `#0e0e10` / `#62656c`) | `#fff`-`#dedede` / `#aaa`-`#b3b3b3` |
| Accent (button fill) | `#9b6cff`, text on it `#0e0e10` | green, blue, pink-red, yellow, blue; none violet |
| Link / focus | `#9b6cff` dark, `#6a3fe0` light | accent or blue |
| Radius button / card / media | 9999 / 24 / 20px | pill on 4 of 5; cards 16-26px |
| Borders, shadows | none; elevation = one surface step | no border on 5, no shadow on 4 |
| Section / card pad / gap | 64 -> 96 / 24-32 / 16-24px | 64-160px |
| Widths | text 1120, shell 1440px | 1000-1296 text |
| Nav | 64px, solid page color, no border | 56-80px |
| Motion | 160ms `cubic-bezier(.3,0,0,1)`, press 0.97 | 0.1-0.25s ease-out |

## Rules
1. One huge, heavy, short headline (3-8 words); one word may break onto its own line for punch.
2. One accent pill per view with dark text; every other action is a white (dark mode) or outlined (light) pill.
3. Tiles are rounded and separated by tone, never by borders or shadows.
4. Imagery is people, faces, phone screens and short muted loops, cropped into rounded 9:16 or 4:5 tiles.
5. Dark is the default; the light mode is warm cream, never stark grey.
6. UI motion stays under 250ms; the media provides the movement.
7. Copy speaks to "you": upbeat, concrete, one idea per section; the offer leads the CTA.
8. Body stays 16px; captions 12-14px muted.

## Component deltas
- **Buttons**: 48px pills, 16px 700, `0 28px`; press scales to 0.97 (off under reduced motion).
- **Cards**: surface fill, 24px radius, 24-32px padding; media inside at 20px.
- **Nav**: solid page color; over a full-bleed hero image use the transparent-nav pattern (recipes).
- **Hero**: left-aligned giant headline, one line, accent pill + white pill, a media tile or cut-out portrait.
- **Rails**: shelves of square or 9:16 tiles with a "Show all" link (`.a-rail`).
- **Plans**: plan cards (recipes), the accent only on the recommended plan's button.

## Fonts (free)
**Figtree** 400/500/700/800 (Google Fonts). Fallback `system-ui` works without download.

## Avoid
- Any single reference brand's green, pink-red, yellow or blue as the fallback accent, or a logo gradient.
- Square or 4px buttons, 1px card borders, heavy shadows, thin 300 display type.
- Long two-line subheads under the hero; abstract 3D blobs instead of people and media.
- More than one saturated color on a screen (color blocks per plan or campaign included).

## Checklist
- [ ] Near-black stage (or cream light mode); violet only on the one main action, with dark text.
- [ ] Hero 800 weight, tight, 3-8 words; body 16px.
- [ ] Every action a pill; tiles rounded, no borders, no shadows.
- [ ] Imagery is people and media in rounded tiles; rails scroll inside their own box.
- [ ] Press scale and autoplay off under reduced motion.

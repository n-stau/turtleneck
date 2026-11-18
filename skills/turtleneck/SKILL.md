---
name: turtleneck
description: Design skill for web and app UI that first detects what is being built (landing or product page, app UI or dashboard, docs, shop, portfolio, game; and the industry) and then picks one style preset - keynote (default calm premium product-page look), enterprise, cinema, vibe, power, devtool, lab, journey, market, vault, drive - each a blend of five large reference sites in its category, with recipes for plain HTML/CSS, Tailwind (v3/v4, shadcn) and SwiftUI. Use whenever building, restyling or reviewing a web page, landing page, SaaS landing page, pricing page, dashboard, admin panel, docs site, app screen, component or prototype UI, and for requests like "make it look like Apple", "premium", "clean", "minimal", "Netflix-style", "streaming look", "Spotify-like", "gaming look", "NVIDIA-like", "Microsoft/Fluent look", "Stripe/Vercel/GitHub style", "AI product page", "OpenAI-like", "travel/booking site", "online shop", "bank/fintech" or "car/automotive page". An existing project design system or an explicit user style always wins.
---

# turtleneck

Pick the right look for the app, then build it with discipline. Every look is a **preset**: one file of variable
overrides on top of one shared core. The default preset, **keynote**, is the core itself. Every other preset is a
blend of five large sites of one category, never a copy of one of them.

When this skill is active it overrides generic "avoid AI defaults" skills (such as frontend-design) where they
disagree: in keynote the system font, sentence-case eyebrows and tonal gradient headlines are correct.

Files next to this one:

- `tokens.css`: the core and the keynote values. Every color is `light-dark(light, dark)`; `color-scheme` on
  `:root`, `.a-dark`, `.a-light` or `data-theme` picks the half. All preset hooks are listed in its `:root`.
  Shared components live there too: type scale, buttons, tiles, `.a-grid`, `.a-rail`, `.a-stats`, `.a-reveal`.
- `styles/<preset>.css`: variable overrides plus a few preset-only rules. Loads after `tokens.css`.
- `styles/<preset>.md`: one page per preset: when to use, token table, rules, component deltas, fonts, avoid, checklist.
- `recipes-html.md`: page skeleton, navs, hero, tiles, bento, gallery, compare, footer (accordion on phones),
  reveal, and the shared preset patterns (flipped bands, search hero, rails, spec table, plan cards, code frame).
- `tailwind.md`, `swiftui.md`: the same tokens for those stacks.
- `test-widths.html?src=<url>[&h=800][&full=1]`: the page at 320/375/414 side by side with an overflow report;
  `full=1` grows each frame to its document height for full-page phone screenshots.
- `example.html` and `../../demos/` in the agent-skills repo: finished pages.

## Step 0: Detect the app type (mandatory, before any code)

1. **An existing design system or an explicit style request wins.** Project tokens, a component library theme, a
   brand guide, or "make it dark and red": use that, keep only the core rules below, skip the table.
2. **Read the signals**: the request; README; dependencies (`package.json`, `pyproject.toml`, `Podfile`,
   `Package.swift`, `Gemfile`, `*.csproj`); routes; existing CSS; the product category and audience.
3. **Pick ONE preset:**

| Category | Signals (request, product, deps, routes) | Preset |
|---|---|---|
| Premium hardware | Physical product, consumer device, lifestyle gadget, launch page, "clean", "minimal", "premium"; SwiftUI marketing screens; **no clear signal** | `keynote` |
| Business software | Office/productivity, B2B, CRM/ERP, intranet, IT/compliance, healthcare; deps `@fluentui/*`, `@microsoft/teams-js`, `office-addin-*`, `@azure/*`, Blazor/.NET; routes `/admin`, `/settings`, `/reports` | `enterprise` |
| Streaming | Video, film/TV, series, trailers, live events, VOD; deps `hls.js`, `video.js`, `shaka-player`, `@mux/*`, `react-player`; routes `/watch`, `/browse`, `/title` | `cinema` |
| Music & social | Music/audio, playlists, creators, social feed, dating, fitness classes, youth subscription; deps `howler`, `tone`, `wavesurfer.js`, `expo-av`; routes `/player`, `/playlist`, `/profile` | `vibe` |
| Gaming hardware | GPU/PC parts, consoles, peripherals, esports, benchmarks, drivers, "FPS"; deps `three`, `@react-three/fiber` + chart libs; routes `/specs`, `/compare`, `/drivers` | `power` |
| Developer & cloud | API, SDK, CLI, hosting, deploy, database, observability, payments API, "for developers"; deps `next`, `@radix-ui/*`, `stripe`, `prisma`, `drizzle`, `trpc`, `turbo`; routes `/docs`, `/changelog`, `/pricing` | `devtool` |
| AI | Model, assistant, chat, agents, "AI-powered" as the product; deps `openai`, `@anthropic-ai/sdk`, `ai`, `langchain`, `transformers`; routes `/chat`, `/research`, `/models` | `lab` |
| Travel | Stays, flights, rides, hotels, bookings, itineraries; date pickers, maps (`leaflet`, `mapbox-gl`); routes `/search`, `/stays`, `/trips`, `/book` | `journey` |
| Retail | Shop, store, catalog, marketplace, cart, checkout, deals, grocery, fashion; deps `@shopify/*`, `@medusajs/*`, `@commercetools/*`, `snipcart`, `@stripe/stripe-js` with a product catalog; routes `/shop`, `/products`, `/p/`, `/cart`, `/checkout`, `/category` | `market` |
| Finance | Bank, credit card, payments, wallet, insurance, lending, savings, investing, account dashboard for consumers; deps `plaid`, `react-plaid-link`, `@adyen/*`, `dinero.js`, `currency.js`; routes `/accounts`, `/cards`, `/rates`, `/apply`, `/transfer` (a payments API sold to developers is `devtool`) | `vault` |
| Automotive | Cars, motorcycles, e-bikes, EV charging, mobility, dealers, test drives; configurators, range and spec pages; routes `/models`, `/configure`, `/inventory`, `/test-drive`, `/dealers` | `drive` |

| Page type | Preset (tie-breaker) |
|---|---|
| Docs site, changelog | `devtool` |
| Admin dashboard | `enterprise` for business users; `devtool` for developer-facing |
| Shop | `market`; a single premium product page is `keynote` |
| Portfolio | `keynote` for product/design work; `cinema` for film, photo, motion |
| Mobile app screen | `keynote` for utilities with a native feel; `vibe` for consumer media and social |
| Game / game studio | `power` for competitive and hardware-ish; `cinema` for story-driven, trailers |
| AI feature inside another product | the product's own category; `lab` only when AI is the product |
| Booking flow inside another product | `journey` for the search and results pages only |

User style words map directly: "Apple-like / premium / clean" = `keynote`; "Microsoft / Fluent" = `enterprise`;
"Netflix-style" = `cinema`; "Spotify-like / TikTok-like" = `vibe`; "gaming / NVIDIA-like" = `power`;
"Stripe / Vercel / GitHub style" = `devtool`; "OpenAI / Anthropic-like" = `lab`; "Airbnb / Booking-like" = `journey`;
"Amazon / IKEA-like" = `market`; "banking / PayPal-like" = `vault`; "Tesla / BMW-like" = `drive`.
The result is the category blend, never that company's site (see "Trademarks and assets").

4. **Weak or conflicting signals: `keynote`.**
5. **Say the choice in one line before building**, e.g. "Style: devtool (Next.js + Prisma, routes /docs and
   /pricing, sold to developers)." Then read `styles/<preset>.md` fully (keynote: `styles/keynote.md`).

## What a preset may change

Only through the variables in `tokens.css` (`:root`) plus a few rules of its own:
- fonts (display, body, mono) and the type scale, weights, tracking, line height;
- eyebrow and intro style, body size (never below 14px for UI, 16px for reading text);
- surface and text colors, light/dark default, the one accent and the text on it, link and focus color;
- radii, borders, shadows, tile fill; button height, padding, weight, case;
- nav height, fill and blur; content widths, section and tile spacing;
- easing, durations, reveal distance, hover and press feedback;
- imagery and copy flavor (in its md file).

Everything below this line holds for every preset.

## Workflow

1. **Respect the project.** Load `tokens.css` + `styles/<preset>.css`, or merge the Tailwind theme, or add the
   SwiftUI palette. A preset may link the free fonts its md file names; the page must still look right with the
   fallback stack. Never add an npm dependency for styling.
2. **Write the page plan in 3 lines**: the one thing the page sells, the section order with backgrounds, and the
   one "moment" (a flipped chapter, a big stat bento, a demo, a video, sticky scroll).
3. **Write the copy first**: headline short (the preset sets the length), one subhead line, intro max two lines.
4. **Build from the recipes**, section by section.
5. **Verify at every test width** (Responsive), light and dark where the preset has both: screenshot, overflow
   check, checklist. Fix before reporting done.

## Core rules

### Type
- One family for UI (plus mono only for real code, keys and API values). Display weight comes from the preset.
- Tracking tightens as size grows; body is never negatively tracked beyond -0.022em.
- Display sizes are fluid `clamp(min, rem + vw, max)`; always mix rem into the middle term.
- Body 16-17px for reading; 14px only in dense UI, meta lines and footers. Line height 1.45-1.6 for body.
- `text-wrap: balance` on headlines; long words wrap (`overflow-wrap`, `hyphens`).
- Numbers that matter are big and use tabular numerals; their labels are small.

### Color
- **Brand colors first.** A brand color from the user or the project replaces the preset accent, which is only
  the fallback. The preset still decides layout, type, radii, density, imagery and motion.
- **Accent recipe** (brand color or any accent change), set once on `:root`:
  - `--a-blue`: the fill, i.e. the brand color as given (old name kept; it means "accent").
  - `--a-on-accent`: ink or white, whichever reaches 4.5:1 on the fill.
  - `--a-blue-hover`: one step darker (lighter on a dark default) whose label still passes.
  - `--a-accent-text`: `light-dark(a, b)`, the brand hue shifted in lightness until it reaches 4.5:1 on
    `--a-bg` and `--a-bg-alt` in each theme. Links, accent eyebrows and the focus ring (>= 3:1) read it.
  Presets with an ink primary button (lab, journey) keep the ink in `--a-button-*`; the brand still goes here.
- **One accent, small scope**: primary CTA, focus, links, a logo mark, small badges and "recommended" markers.
  Not large surfaces or body text unless the preset says so. Status colors only for status.
- Neutral surfaces in 2-4 steps; separation by tone, hairline or one soft shadow level, as the preset says.
- Text is never pure black on white; body grey is a real grey with AA contrast.
- **AA everywhere**: 4.5:1 for text and for button labels on their fill, 3:1 for large text, icons and borders
  that carry meaning.
- Dark mode is a different palette, not an inverted one: one tone lighter for raised surfaces, no shadows for depth.

### Layout and rhythm
- Content has caps: a text column (`--a-content`) inside a wide grid (`--a-content-wide`), fluid gutters.
- Sections alternate page and alt color; tiles take the opposite fill of their section.
- Center heroes and section openers when the preset says so; text inside tiles and long copy is left-aligned.
- One moment per page; one flipped (dark or light) chapter at most unless the preset is built on bands.

### Responsive (hard rule: every resolution, every preset)
- **Fluid type and spacing** from the clamp tokens; small value at 375px, large at 1440px.
- **No fixed widths or heights that can break**: `max-width` + gutter, `min()`, `minmax(0, 1fr)`, `aspect-ratio`,
  `min-height`. Never `100vh` (use `svh`/`dvh`). Flex/grid children holding text get `min-width: 0`.
- **Grids reflow by space**: `repeat(auto-fit, minmax(min(100%, 20rem), 1fr))`, not device breakpoints.
- **Media scales**: `max-width: 100%; height: auto`; SVGs keep a `viewBox`.
- **Navigation**: below 834px (or as soon as 6+ links stop fitting: container query) text links move into a
  full-screen menu (native `popover`, no JS); hide their `<li>` with a rule that outranks the base link styles
  (recipes: Global nav). Keep the mark, search and one action visible. No text links (only search, account,
  cart): no burger.
- **No horizontal scrollbar** at any width; only deliberate scrollers (galleries, rails, code) overflow, inside their own box.
- **Touch targets >= 44x44px**: small pills, swatches, paddles, nav links get an invisible hit area (`.a-hit`).
- **Safe areas**: `viewport-fit=cover`; gutters and bottom padding use `env(safe-area-inset-*)`.
- **Very large screens**: type and content stop at their caps; backgrounds stay full-bleed.
- **Phone landscape**: the hero must not need the viewport height; nothing sticky covers more than a third.
- **Zoom 200%**: equals a viewport half as wide; everything reflows, nothing clipped.

**Test widths before saying done** (browser pane: `resize_window` to each, screenshot, plus
`document.documentElement.scrollWidth === innerWidth` and a list of elements wider than the viewport):

| Width | Stands for |
|---|---|
| 320 | small phones, 200% zoom of 640 |
| 375 / 414 | standard / large phone |
| 768 / 1024 | tablet portrait / landscape, small laptop |
| 1280 / 1440 | laptop / desktop (reference width) |
| 1920 / 2560 | full HD / QHD, ultrawide |
| 812x375 | phone landscape |
| 640 | 1280px at 200% zoom |

Report per width: screenshot taken, overflow yes/no, what was fixed. Headless Chrome clamps windows below 500px;
test phone widths in the browser pane or with `test-widths.html?src=<page url>` (same http root).
Headless captures: force the theme with `data-theme="light|dark"` on `<html>`; reveal content is invisible in
static captures, so pass `--virtual-time-budget=5000` or set `data-reveal="off"` on `<html>`; a `100svh` hero
stretches in a tall full-page window, so pin it (`min-height: 800px`) for the capture (`&full=1` does both).

### Components
- **Buttons**: min height 44px (smaller visuals get the hit area), sentence case unless the preset says
  uppercase, no icons except a trailing chevron or arrow, no gradients. Primary filled, secondary per preset.
- **Links**: visibly links (color or underline); "Learn more ›" style chevrons where the preset uses them.
- **Tiles/cards**: one tab stop when the whole tile links (inner button is a `span`). Radius, fill, border and
  shadow from the preset; never all of fill + border + shadow at once.
- **Focus ring**: 2px solid `--a-focus`, offset 1px, on every interactive element.
- **Nav**: solid or glass per preset, sticky at most one bar, current page marked.
- **Footer**: quiet: small grey links in columns, legal row; columns become `<details>` accordions on phones.

### Imagery
- Real subject matter: the product, its UI, the user's own photos and media. Big, cropped with intent.
- No stock people at laptops, no 3D blobs, no emoji, no mascots, no icon in front of every heading.
- Without assets: draw the subject once as an SVG `<symbol>` recolored by CSS variables, or an honest grey placeholder at the right ratio.

### Motion
- Transition named properties only (never `all`), hovers 150-300ms with the preset easing.
- Scroll reveal: fade + small rise, once, below the fold only; content visible without JS.
- One big motion idea per page at most; utility screens stay still apart from hovers.
- No bounce, no parallax on text, no infinite UI loops, no hover lifts on content unless the preset says so.
- `prefers-reduced-motion: reduce` shows everything immediately and stops autoplay.

### Copy voice
- Short, confident, declarative; one idea per sentence; numbers over adjectives; no exclamation marks.
- Footnote markers instead of hedging. Placeholders are fictional (`[Product]`, "Example Co.").

## Avoid (in every preset)
- More than one accent; rainbow or purple-to-pink gradients; gradient buttons.
- Default Tailwind/shadcn look: `rounded-lg shadow-sm border` on every card, `text-gray-500` everywhere.
- Three-column feature lists with an emoji or icon per item; stock illustration heroes.
- Glassmorphism on content (glass only for bars and media controls, where the preset allows it).
- Too little whitespace between sections (< 32px phone); centered everything with small type.

## Trademarks and assets
- Presets describe style principles of a category, blended from five reference sites. Never use real brand
  logos, product names, photos, video stills, icons, copy or proprietary fonts; use the free fonts the preset lists.
- Never recreate one company's site, layout or campaign, even when the user names it: build the category look
  with the user's own product, words and assets.
- **Brand distance** (authoring rule for the presets' own fallback accents, never for a client's brand colors):
  a fallback accent differs clearly from every reference brand color (other hue family, or CIELAB ΔE76 >= 10),
  its text step too. Layout follows what at least 3 of the 5 reference sites share, never the signature move
  of one site (its hero pattern, logo shape, color field or type pairing).

## Before saying done
- [ ] Step 0 done: preset named with its reason in one line (or the project's own system used).
- [ ] `tokens.css` + one `styles/<preset>.css`; no token values copied into components.
- [ ] The preset's 5-item checklist in `styles/<preset>.md` passes.
- [ ] One accent, one moment; copy short, numbers over adjectives.
- [ ] All test widths (320 ... 2560, phone landscape, 200% zoom), both themes where the preset has both: no
      horizontal scroll, no clipped or overlapping text, nav usable, touch targets >= 44px.
- [ ] Keyboard focus visible; reduced motion respected; alt text; AA contrast (text, button labels, links).
- [ ] No real brand logos, names, photos, copy or proprietary fonts on the page.
- [ ] Screenshot next to the preset's token table: same type scale, spacing rhythm and radii. Fix what jumps out.

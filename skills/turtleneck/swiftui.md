# SwiftUI

On Apple platforms the system font already is SF Pro, so `.system` fonts are right. Two cases:

- **Native app screens** (settings, lists, forms): follow the platform. Use text styles (`.largeTitle`, `.body`),
  Dynamic Type, `List`, `Form`, system colors and materials. Do not force web sizes onto them.
- **Marketing-style screens** (onboarding, paywall, "what's new", product/landing views, macOS about pages):
  use the keynote web scale below. That is where this skill applies.

## Tokens

```swift
import SwiftUI

extension Color {
    static let aText       = Color(light: 0x1a1c1f, dark: 0xf3f4f6)
    static let aText2      = Color(light: 0x5d6067, dark: 0xa6a9b0)
    static let aText3      = Color(light: 0x6a6d74, dark: 0x8f9299)
    static let aLink       = Color(light: 0x2264ee, dark: 0x6e9cff)
    static let aBlue       = Color(hex: 0x2264ee)
    static let aBg         = Color(light: 0xffffff, dark: 0x0d0e10)
    static let aBgAlt      = Color(light: 0xf3f4f6, dark: 0x17181b)
    static let aHairline   = Color(light: 0xe3e5e8, dark: 0x3a3c41)

    init(hex: UInt32) {
        self.init(red: Double((hex >> 16) & 0xff) / 255, green: Double((hex >> 8) & 0xff) / 255, blue: Double(hex & 0xff) / 255)
    }
    init(light: UInt32, dark: UInt32) {
        #if canImport(UIKit)
        self.init(UIColor { $0.userInterfaceStyle == .dark ? UIColor(Color(hex: dark)) : UIColor(Color(hex: light)) })
        #else
        self.init(NSColor(name: nil) { $0.bestMatch(from: [.darkAqua, .aqua]) == .darkAqua ? NSColor(Color(hex: dark)) : NSColor(Color(hex: light)) })
        #endif
    }
}

/// Keynote type scale (SwiftUI cannot go below its default leading, so tight display leading is implicit).
enum AType {
    case hero, headline, section, tile, sub, eyebrow, intro, body, caption

    var spec: (size: CGFloat, weight: Font.Weight, tracking: CGFloat) {
        switch self {
        case .hero:     (72, .semibold, -0.02)
        case .headline: (52, .semibold, -0.015)
        case .section:  (44, .semibold, -0.015)
        case .tile:     (28, .semibold, -0.01)
        case .sub:      (24, .regular, 0)
        case .eyebrow:  (21, .semibold, 0)
        case .intro:    (21, .regular, 0)
        case .body:     (17, .regular, -0.01)
        case .caption:  (12, .regular, -0.01)
        }
    }
}

extension View {
    /// Shrink iPhone sizes one step like the web scale's small breakpoint by passing `compact: true`.
    func aType(_ t: AType, compact: Bool = false) -> some View {
        let s = t.spec, size = compact ? max(s.size * 0.6, 17) : s.size
        return self
            .font(.system(size: size, weight: s.weight, design: .default))   // SF Pro picks Display/Text optically
            .tracking(s.tracking * size)
    }
}
```

## Components

```swift
struct PillButtonStyle: ButtonStyle {
    var filled = true
    var tiny = false   // 12pt "Buy" pill for the local nav
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .aType(tiny ? .caption : .body)
            .padding(.horizontal, tiny ? 11 : 22).frame(minHeight: tiny ? 24 : 44)
            .foregroundStyle(filled ? .white : Color.aLink).fontWeight(.medium)
            .background(Capsule().fill(filled ? Color.aBlue : .clear))
            .overlay(Capsule().strokeBorder(Color.aBlue, lineWidth: filled ? 0 : 1))
            .opacity(configuration.isPressed ? 0.8 : 1)
            .animation(.easeOut(duration: 0.3), value: configuration.isPressed)
    }
}

struct Hero: View {
    var body: some View {
        VStack(spacing: 0) {
            Text("[Product]").aType(.eyebrow)
            Text("Short. Confident.").aType(.hero).padding(.top, 6)
            HStack(spacing: 16) {
                Button("Buy") {}.buttonStyle(PillButtonStyle())
                Button("Learn more \u{203A}") {}.buttonStyle(.plain).foregroundStyle(Color.aLink).aType(.body)
            }.padding(.top, 24)
            Image("hero").resizable().scaledToFit().padding(.top, 48)   // your own image
        }
        .multilineTextAlignment(.center)
        .foregroundStyle(Color.aText)
        .padding(.top, 64)
        .frame(maxWidth: .infinity)
        .background(Color.aBg)
    }
}

struct Tile<Content: View>: View {
    var onAlt = false
    @ViewBuilder var content: Content
    var body: some View {
        VStack(alignment: .leading, spacing: 8) { content }
            .padding(40)
            .frame(maxWidth: .infinity, minHeight: 240, alignment: .topLeading)
            .background(onAlt ? Color.aBg : Color.aBgAlt,
                        in: RoundedRectangle(cornerRadius: 24, style: .continuous))
    }
}

struct HighlightIntro: View {
    let lead: String, rest: String
    var body: some View {
        (Text(lead).foregroundStyle(Color.aText).fontWeight(.semibold) + Text(" " + rest).foregroundStyle(Color.aText2))
            .aType(.intro)
            .frame(maxWidth: 816, alignment: .leading)
    }
}

/// Frosted sticky bar: put it in .safeAreaInset(edge: .top) of a ScrollView.
struct LocalNav: View {
    var body: some View {
        HStack {
            Text("[Product]").font(.system(size: 21, weight: .semibold))
            Spacer()
            Button("Buy") {}.buttonStyle(PillButtonStyle(tiny: true))
        }
        .padding(.horizontal, 22).frame(height: 56)
        .background(.ultraThinMaterial)
        .overlay(alignment: .bottom) { Color.aHairline.frame(height: 0.5) }
    }
}
```

Scroll reveal: `.scrollTransition { c, phase in c.opacity(phase.isIdentity ? 1 : 0).offset(y: phase.isIdentity ? 0 : 16) }`
(iOS 17 / macOS 14). Gate it on `@Environment(\.accessibilityReduceMotion)`.

Layout: wrap content in `.frame(maxWidth: 980)` (galleries 1280), section padding 72 on iPhone, 112 on Mac/iPad,
alternate `Color.aBg` / `Color.aBgAlt` sections in a `ScrollView`, tiles 12-20pt apart.

## Every screen size

- No fixed `.frame(width:height:)` for content; use `maxWidth`, `.containerRelativeFrame` and `aspectRatio`.
- Switch layouts with `ViewThatFits { HStack {…}; VStack {…} }` or `@Environment(\.horizontalSizeClass)`
  (compact = iPhone portrait, split view; regular = iPad, Mac).
- Fixed display sizes must still respect Dynamic Type: use `@ScaledMetric(relativeTo: .largeTitle) var hero = 72`
  and `.font(.system(size: hero, weight: .semibold))`, and cap with `.dynamicTypeSize(...DynamicTypeSize.accessibility2)`.
- Content respects safe areas by default; only backgrounds use `.ignoresSafeArea()`.
- Every tap target at least 44x44pt: `.frame(minWidth: 44, minHeight: 44).contentShape(.rect)`.
- Check iPhone SE, a Pro Max in portrait and landscape, iPad split view and a large Mac window in the previews.

## Presets

`Color.a*` above is keynote. For another preset, put its values (token table in `styles/<preset>.md`) into one
palette and read it from the environment, so views stay the same:

```swift
struct TNPreset {
    var accent: Color, onAccent: Color, bg: Color, bgAlt: Color, text: Color, text2: Color, hairline: Color
    var displayWeight: Font.Weight, displayWidth: Font.Width = .standard, design: Font.Design = .default
    var radiusTile: CGFloat, radiusButton: CGFloat   // radiusButton >= 100 means Capsule
    var dark: Bool                                   // dark-only presets force .preferredColorScheme(.dark)

    static let keynote = TNPreset(accent: .aBlue, onAccent: .white, bg: .aBg, bgAlt: .aBgAlt, text: .aText,
        text2: .aText2, hairline: .aHairline, displayWeight: .semibold, radiusTile: 24, radiusButton: 999, dark: false)
    static let vibe = TNPreset(accent: Color(hex: 0x9b6cff), onAccent: Color(hex: 0x0e0e10), bg: Color(hex: 0x0e0e10),
        bgAlt: Color(hex: 0x1c1c20), text: Color(hex: 0xf3f3f5), text2: Color(hex: 0xa7a7af), hairline: .white.opacity(0.08),
        displayWeight: .heavy, radiusTile: 24, radiusButton: 999, dark: true)
    // every other preset: same shape, values from the token table in styles/<preset>.md.
}
private struct TNPresetKey: EnvironmentKey { static let defaultValue = TNPreset.keynote }
extension EnvironmentValues { var tn: TNPreset { get { self[TNPresetKey.self] } set { self[TNPresetKey.self] = newValue } } }
```
- Fonts without bundling: the system font at the preset's display weight gets close (`.heavy` 800, `.bold` 700,
  `.semibold` 600, `.medium` 500/450) with `.tracking(trackingEm * size)` from the token table;
  `.fontDesign(.monospaced)` for code; `.fontWidth(.condensed)` for uppercase labels where the preset uses them.
  The free fonts from the preset files are OFL, so bundling them in the app is allowed if needed.
- Shapes: `RoundedRectangle(cornerRadius: preset.radiusButton)` or `Capsule()`; presets with a tile border add
  `.overlay(RoundedRectangle(...).strokeBorder(preset.hairline, lineWidth: 1))`, presets with a tile shadow add
  `.shadow(...)` with the table's values.
- Native app screens still follow the platform (see top); presets only tint accent, surfaces and display type.

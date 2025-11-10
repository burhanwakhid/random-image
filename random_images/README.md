# Aurora Random Image

A polished single-screen experience that fetches a random image, extracts its color palette, and animates the UI to match.

![Random Image Demo](../screenshot/random_image_demo.gif)

## Features

- Animated gradient background that adapts to the dominant colors of the loaded image.
- Square hero image with custom 3D/blur transition, cached loading, and graceful error states.
- Accessible controls with haptic-ready “Another” button, inline error messaging, and light/dark support.

## Getting started

1. Install dependencies: `flutter pub get`.
2. Run the random image module (e.g., `flutter run -t lib/main_development.dart` from the root app).
3. Tap **Another** to trigger additional `/image` fetches and see the palette-driven transitions.

## Testing

This package ships with `bloc_test` + `mocktail` coverage for the random image bloc and repository. Execute:

```bash
flutter test
```

to validate fetching, palette extraction, and error fallback behavior.

## Problem-solving approach

We lean on a few principles to keep the experience smooth and maintainable:

1. **Progressive enhancement** – ship a functional baseline first, then layer polish (animated gradients, palette-aware theming, bespoke transitions) once UX is validated.
2. **Async isolation** – move heavy work (palette extraction, caching) off the UI isolate via `compute` or repositories so that animations stay jitter-free even on mid-tier hardware.
3. **Deterministic state** – model UI flows through Bloc so every state has the data it needs (image, palette, error), which makes rendering predictable and testable.
4. **Tight feedback loops** – pair UI tweaks with visual artifacts (GIFs) and regression tests, which helps reviewers understand the changes and trust the implementation.

This process keeps the focus on user experience while giving reviewers insight into the technical reasoning behind each iteration.

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

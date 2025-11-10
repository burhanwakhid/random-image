## About the Author 👤

I’m Burhanudin Nugroho, a software engineer focused on building scalable consumer products. I helped build super-app payment experiences similar to GoPay that now serve more than 50 million people, and I bring the same standards for reliability, experimentation, and observability into every project—including Aurora Random Image.

# Aurora Random Image

![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

Aurora Random Image is a cross-platform Flutter experience that fetches beautiful, unexpected imagery to inspire ideation and onboarding flows. The project started from the [Very Good CLI][very_good_cli_link] scaffolding and has grown into a production-ready codebase with opinionated tooling, CI-ready coverage, and batteries-included localization.

---

## Monorepo Architecture 🧱

This repository follows a monorepo structure so shared code, services, and UI elements live side-by-side with the app:

- `random_images/` – the Flutter application with feature modules and routing.
- `packages/` – reusable SDKs (auth, network, persistence, infrastructure, UI kit) consumed by the app and future surfaces.
- `aurora_random_image/` – integration shell plus platform runners.

Within `packages/` you’ll find dedicated SDKs surfaced from this project:

- `auth_sdk` for authentication/session handling and token refresh flows.
- `persistence_sdk` for secure local storage and shared preferences.
- `service_provider` for dependency injection and module wiring.

Keeping everything in one repo keeps versioning atomic, makes refactors safer, and allows every package to reuse the same linting and testing pipeline.

---

## Running the App 🚀

Three flavors keep environment-specific configuration isolated while sharing the same code:

- `development`
- `staging`
- `production`

Launch from your IDE or use the CLI:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*Aurora Random Image works on iOS, Android, Web, and Windows._

---

## Testing & Quality 🧪

Unit, widget, and integration-style smoke tests live across the packages and the main app so regressions are caught before release. Run the full suite with:

```sh
$ very_good test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:aurora_random_image/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>es</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_en.arb
│   │   └── app_es.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

`app_es.arb`

```arb
{
    "@@locale": "es",
    "counterAppBarTitle": "Contador",
    "@counterAppBarTitle": {
        "description": "Texto mostrado en la AppBar de la página del contador"
    }
}
```

### Generating Translations

To use the latest translations changes, you will need to generate them:

1. Generate localizations for the current project:

```sh
flutter gen-l10n --arb-dir="lib/l10n/arb"
```

Alternatively, run `flutter run` and code generation will take place automatically.

---



[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli

# JSN Theme
The package provides a set of predefined color themes that you can easily apply to your Flutter application. These color themes include a well-thought-out palette of colors, making it simple to maintain a consistent and visually appealing design throughout your app.

## Getting Started
To use this package, add `jsn_ui` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  jsn_ui:
    git:
      url: https://github.com/jobsninja/jsnapp.git
      path: packages/jsn_ui
```
Then, run `flutter pub get` to fetch the package.

## Initialization
Follow these steps:

### 1. Import
In your Dart code, import the `jsn_ui` package:

```dart
import 'package:jsn_ui/jsn_ui.dart';
```

### 2. Wrap the `MaterialApp` (optional)
You can wrap your `MaterialApp` widgets with `JSNApp` to apply themes.

```dart
import 'package:flutter/material.dart';
import 'package:jsn_ui/jsn_ui.dart';
import 'package:jsnapp/core/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return JSNApp(
      theme: JSNThemeData.jsnThemeLight(),
      themeMode: JSNThemeMode.system,
      darkTheme: JSNThemeData.jsnThemeLight(),
      title: 'Material App Title',
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      showPerformanceOverlay: false,
      checkerboardRasterCacheImages: false,
      checkerboardOffscreenLayers: false,
      showSemanticsDebugger: false,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Bar Title'),
        ),
        body: const Center(
          child: Text('This is scaffold body.'),
        ),
      ),
    );
  }
}
```

## Usage
You can start using the components and utilities provided by `jsn_ui` in your Flutter application. Here are a few examples:

Example 1: Implementing colors

```dart
Container(
  width: 20,
  height: 20,
  color: context.jsnColorTokens.fillBackgroundPrimary,
),
```

Example 2: Implementing text theme

```dart
Text(
  'This is a title.',
  style: context.jsnTextTheme.titleLargeDefault,
),
```

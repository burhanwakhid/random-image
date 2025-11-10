// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jsn_ui/jsn_ui.dart';

/// Describes if a theme should be in dark or light mode. Analogous
/// to [ThemeMode].
enum JSNThemeMode {
  /// Use either the light or dark theme based on what the user has selected in
  /// the system settings.
  system,

  /// Always use the light mode regardless of system preference.
  light,

  /// Always use the dark mode regardless of system preference.
  dark,
}

/// This widget implements the JSN theming system. Wrapping a widget tree
/// using this widget allows accessing current JSN theme tokens from
/// anywhere in the subtree. JSN components expect this widget to be present
/// as an ancestor to theme themselves automatically based on the current theme.
///
/// All JSN tokens and configurations are encapsulated in [JSNThemeData]. To
/// get access to [JSNThemeData] for current JSN theme from anywhere in the
/// widget subtree, use:
///
/// ```dart
/// JSNThemeData JSNThemeData = JSNTheme.of(context);
/// ```
class JSNTheme extends StatefulWidget {
  /// Creates an JSN theme that controls the configurations for
  /// all JSN components in it's subtree.
  const JSNTheme({
    Key? key,
    required this.theme,
    required this.darkTheme,
    this.themeMode = JSNThemeMode.system,
    required this.child,
  }) : super(key: key);

  /// The data from the closest [JSNTheme] instance that encloses the given
  /// context.
  ///
  /// Typical usage is as follows:
  ///
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///   return Text(
  ///     'Example',
  ///     style: JSNTheme.of(context).colors.fillActivePrimary,
  ///   );
  /// }
  /// ```
  ///
  /// The context passed must be a descendant of the [JSNTheme] or [JSNApp].
  ///
  /// When the [JSNApp] or [JSNTheme] is created in the same `build`
  /// function, the `context` argument to the `build` function can't be used
  /// to find the [Theme] (since it's "above" the widget being returned). In
  /// such cases, the following technique with a [Builder] can be used to
  /// provide a new scope with a [BuildContext] that is "under" the [Theme]:
  ///
  /// ```dart
  /// @override
  /// Widget build(BuildContext context) {
  ///     return JSNApp(
  ///       theme: JSNThemeData.greenThemeLight(),
  ///       darkTheme: JSNThemeData.greenThemeDark(),
  ///       themeMode: JSNThemeMode.system,
  ///       home: Builder(
  ///       // Create an inner BuildContext so that we can refer to
  ///       // the JSNTheme with JSNTheme.of().
  ///       builder: (BuildContext context) {
  ///         return Center(
  ///           child: Text(
  ///             'Example',
  ///             style: JSNTheme.of(context).textTheme.titleExtraLargeActive,
  ///           ),
  ///         );
  ///       },
  ///     ),
  ///   );
  /// }
  /// ```
  static JSNThemeData of(BuildContext context) {
    final inheritedJSNTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedJSNTheme>();
    assert(
      inheritedJSNTheme != null,
      """JSNTheme widget does not enclose this context. 
        Make sure JSNTheme is one of the ancestor widgets.""",
    );
    return inheritedJSNTheme!.theme;
  }

  /// The [JSNThemeData] to use when a 'light mode' is active.
  ///
  /// A [darkTheme] [JSNThemeData] value, which is used to provide a
  /// dark version. [themeMode] will control which theme will be used.
  ///
  /// See also:
  ///
  ///  * [themeMode], which controls which theme to use.
  final JSNThemeData theme;

  /// The [JSNThemeData] to use when a 'dark mode' is active.
  ///
  /// Use [theme] [JSNThemeData] to provide a light version. [themeMode] will
  /// control which theme will be used.
  ///
  /// See also:
  ///
  ///  * [themeMode], which controls which theme to use.
  final JSNThemeData darkTheme;

  /// Determines which theme will be used by the application.
  ///
  /// If set to [JSNThemeMode.system], the choice of which theme to use will
  /// be based on the user's system preferences. If the [WidgetsBinding.instance.window.platformBrightness]
  /// is [Brightness.light], [theme] will be used. If it is [Brightness.dark],
  /// [darkTheme] will be used.
  ///
  /// If set to [JSNThemeMode.light] the [theme] will always be used,
  /// regardless of the user's system preference.
  ///
  /// If set to [JSNThemeMode.dark] the [darkTheme] will be used
  /// regardless of the user's system preference. If [darkTheme] is null
  /// then it will fallback to using [theme].
  ///
  /// The default value is [JSNThemeMode.system].
  ///
  /// See also:
  ///
  ///  * [theme], which is used when a light mode is selected.
  ///  * [darkTheme], which is used when a dark mode is selected.
  final JSNThemeMode themeMode;

  /// The child widget that will be wrapped with JSNTheme.
  ///
  /// [JSNTheme] rebuilds this child when platform brightness changes.
  final Widget child;

  @override
  _JSNThemeState createState() {
    return _JSNThemeState();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<JSNThemeData>('theme', theme));
    properties.add(DiagnosticsProperty<JSNThemeData>('darkTheme', darkTheme));
    properties.add(EnumProperty<JSNThemeMode>('themeMode', themeMode));
  }
}

/// The state object for [JSNTheme] stateful widget.
// ignore can be removed after WidgetsBindingObserver is converted to a mixin
// https://github.com/flutter/flutter/pull/77826
// ignore: prefer_mixin
class _JSNThemeState extends State<JSNTheme> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    setState(() {});
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  JSNThemeData _resolveTheme() {
    switch (widget.themeMode) {
      case JSNThemeMode.system:
        return WidgetsBinding.instance.platformDispatcher.platformBrightness ==
                Brightness.light
            ? widget.theme
            : widget.darkTheme;
      case JSNThemeMode.light:
        return widget.theme;
      case JSNThemeMode.dark:
        return widget.darkTheme;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = _resolveTheme();

    return _InheritedJSNTheme(
      state: this,
      theme: theme,
      child: widget.child,
    );
  }
}

class _InheritedJSNTheme extends InheritedWidget {
  const _InheritedJSNTheme({
    Key? key,
    required this.state,
    required this.theme,
    required Widget child,
  }) : super(key: key, child: child);

  final _JSNThemeState state;
  final JSNThemeData theme;

  @override
  bool updateShouldNotify(_InheritedJSNTheme old) =>
      theme != old.theme || state != old.state;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<JSNThemeData>('theme', theme));
    properties.add(DiagnosticsProperty<_JSNThemeState>('state', state));
  }
}

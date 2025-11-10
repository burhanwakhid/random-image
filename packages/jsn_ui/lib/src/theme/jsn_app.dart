// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:jsn_ui/src/theme/jsn_theme.dart';
import 'package:jsn_ui/src/theme/jsn_token.dart';

class JSNApp extends StatelessWidget {
  const JSNApp({
    Key? key,
    required this.theme,
    required this.themeMode,
    required this.darkTheme,
    this.navigatorKey,
    this.scaffoldMessengerKey,
    this.home,
    this.routes,
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.navigatorObservers,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.builder,
    required this.title,
    this.onGenerateTitle,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    required this.supportedLocales,
    required this.showPerformanceOverlay,
    required this.checkerboardRasterCacheImages,
    required this.checkerboardOffscreenLayers,
    required this.showSemanticsDebugger,
    required this.debugShowCheckedModeBanner,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.routerConfig,
    required this.debugShowMaterialGrid,
  }) : super(key: key);

  /// Equivalent to [MaterialApp.router].
  const JSNApp.router({
    Key? key,
    this.scaffoldMessengerKey,
    this.routeInformationProvider,
    this.routeInformationParser,
    this.routerDelegate,
    this.backButtonDispatcher,
    this.builder,
    this.title = '',
    this.onGenerateTitle,
    required this.theme,
    required this.darkTheme,
    required this.themeMode,
    this.locale,
    this.localizationsDelegates,
    this.localeListResolutionCallback,
    this.localeResolutionCallback,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowMaterialGrid = false,
    this.showPerformanceOverlay = false,
    this.checkerboardRasterCacheImages = false,
    this.checkerboardOffscreenLayers = false,
    this.showSemanticsDebugger = false,
    this.debugShowCheckedModeBanner = true,
    this.shortcuts,
    this.actions,
    this.restorationScopeId,
    this.scrollBehavior,
    this.routerConfig,
  })  : navigatorObservers = null,
        navigatorKey = null,
        onGenerateRoute = null,
        home = null,
        onGenerateInitialRoutes = null,
        onUnknownRoute = null,
        routes = null,
        initialRoute = null,
        super(key: key);

  final JSNThemeData theme;

  final JSNThemeMode themeMode;

  final JSNThemeData darkTheme;

  /// See [MaterialApp.navigatorKey]
  final GlobalKey<NavigatorState>? navigatorKey;

  /// See [MaterialApp.scaffoldMessengerKey]
  final GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey;

  /// See [MaterialApp.home].
  final Widget? home;

  /// See [MaterialApp.routes].
  final Map<String, WidgetBuilder>? routes;

  /// See [MaterialApp.initialRoute].
  final String? initialRoute;

  /// See [MaterialApp.onGenerateRoute].
  final RouteFactory? onGenerateRoute;

  /// See [MaterialApp.onGenerateInitialRoutes].
  final InitialRouteListFactory? onGenerateInitialRoutes;

  /// See [MaterialApp.onUnknownRoute].
  final RouteFactory? onUnknownRoute;

  /// See [MaterialApp.navigatorObservers].
  final List<NavigatorObserver>? navigatorObservers;

  /// See [MaterialApp.routeInformationProvider].
  final RouteInformationProvider? routeInformationProvider;

  /// See [RouterConfig<Object>?].
  final RouterConfig<Object>? routerConfig;

  /// See [MaterialApp.routeInformationParser].
  final RouteInformationParser<Object>? routeInformationParser;

  /// See [MaterialApp.routerDelegate].
  final RouterDelegate<Object>? routerDelegate;

  /// See [MaterialApp.backButtonDispatcher].
  final BackButtonDispatcher? backButtonDispatcher;

  /// See [MaterialApp.builder].
  final TransitionBuilder? builder;

  /// See [MaterialApp.title].
  final String title;

  /// See [MaterialApp.onGenerateTitle].
  final GenerateAppTitle? onGenerateTitle;

  /// See [MaterialApp.locale].
  final Locale? locale;

  /// See [MaterialApp.localizationsDelegates].
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;

  /// See [MaterialApp.localeListResolutionCallback].
  final LocaleListResolutionCallback? localeListResolutionCallback;

  /// See [MaterialApp.localeResolutionCallback].
  final LocaleResolutionCallback? localeResolutionCallback;

  /// See [MaterialApp.supportedLocales].
  final Iterable<Locale> supportedLocales;

  /// See [MaterialApp.showPerformanceOverlay].
  final bool showPerformanceOverlay;

  /// See [MaterialApp.checkerboardRasterCacheImages].
  final bool checkerboardRasterCacheImages;

  /// See [MaterialApp.checkerboardOffscreenLayers].
  final bool checkerboardOffscreenLayers;

  /// See [MaterialApp.showSemanticsDebugger].
  final bool showSemanticsDebugger;

  /// See [MaterialApp.debugShowCheckedModeBanner].
  final bool debugShowCheckedModeBanner;

  /// See [MaterialApp.shortcuts].
  final Map<LogicalKeySet, Intent>? shortcuts;

  /// See [MaterialApp.actions].
  final Map<Type, Action<Intent>>? actions;

  /// See [MaterialApp.restorationScopeId].
  final String? restorationScopeId;

  /// See [MaterialApp.scrollBehavior].
  final ScrollBehavior? scrollBehavior;

  /// See [MaterialApp.debugShowMaterialGrid].
  final bool debugShowMaterialGrid;

  bool get _usesRouter => routerConfig != null;

  @override
  Widget build(BuildContext context) {
    return JSNTheme(
      theme: theme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      child: Builder(
        builder: (context) {
          final jsnTheme = JSNTheme.of(context);

          // [ThemeData] created using [ColorScheme] does not set background
          // colors to all components correctly, hence set them explicitly to
          // ensure backgrounds match the JSN guidelines.
          final theme = jsnTheme.material.theme.copyWith(
              scaffoldBackgroundColor: jsnTheme.colors.fillBackgroundPrimary,
              bottomSheetTheme:
                  jsnTheme.material.theme.bottomSheetTheme.copyWith(
                modalBackgroundColor: jsnTheme.colors.fillBackgroundPrimary,
                backgroundColor: jsnTheme.colors.fillBackgroundPrimary,
              ));
          final darkTheme = jsnTheme.material.darkTheme.copyWith(
              scaffoldBackgroundColor: jsnTheme.colors.fillBackgroundPrimary,
              bottomSheetTheme:
                  jsnTheme.material.darkTheme.bottomSheetTheme.copyWith(
                modalBackgroundColor: jsnTheme.colors.fillBackgroundPrimary,
                backgroundColor: jsnTheme.colors.fillBackgroundPrimary,
              ));

          if (_usesRouter) {
            return MaterialApp.router(
              theme: theme,
              darkTheme: darkTheme,
              themeMode: jsnTheme.brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
              color: jsnTheme.colors.fillActivePrimary,
              supportedLocales: supportedLocales,
              showSemanticsDebugger: showSemanticsDebugger,
              showPerformanceOverlay: showPerformanceOverlay,
              shortcuts: shortcuts,
              scrollBehavior: scrollBehavior,
              restorationScopeId: restorationScopeId,
              localizationsDelegates: localizationsDelegates,
              localeResolutionCallback: localeResolutionCallback,
              localeListResolutionCallback: localeListResolutionCallback,
              locale: locale,
              debugShowCheckedModeBanner: debugShowCheckedModeBanner,
              checkerboardRasterCacheImages: checkerboardRasterCacheImages,
              checkerboardOffscreenLayers: checkerboardOffscreenLayers,
              actions: actions,
              title: title,
              onGenerateTitle: onGenerateTitle,
              builder: builder,
              routerDelegate: routerDelegate,
              routeInformationParser: routeInformationParser,
              routeInformationProvider: routeInformationProvider,
              routerConfig: routerConfig,
            );
          } else {
            return MaterialApp(
              theme: theme,
              darkTheme: darkTheme,
              themeMode: jsnTheme.brightness == Brightness.light
                  ? ThemeMode.light
                  : ThemeMode.dark,
              color: jsnTheme.colors.fillActivePrimary,
              supportedLocales: supportedLocales,
              showSemanticsDebugger: showSemanticsDebugger,
              showPerformanceOverlay: showPerformanceOverlay,
              shortcuts: shortcuts,
              scrollBehavior: scrollBehavior,
              restorationScopeId: restorationScopeId,
              onUnknownRoute: onUnknownRoute,
              navigatorObservers: const <NavigatorObserver>[],
              localizationsDelegates: localizationsDelegates,
              localeResolutionCallback: localeResolutionCallback,
              localeListResolutionCallback: localeListResolutionCallback,
              locale: locale,
              debugShowCheckedModeBanner: debugShowCheckedModeBanner,
              checkerboardRasterCacheImages: checkerboardRasterCacheImages,
              checkerboardOffscreenLayers: checkerboardOffscreenLayers,
              actions: actions,
              title: title,
              navigatorKey: navigatorKey,
              initialRoute: initialRoute,
              onGenerateTitle: onGenerateTitle,
              onGenerateRoute: onGenerateRoute,
              home: home,
              builder: builder,
              onGenerateInitialRoutes: onGenerateInitialRoutes,
            );
          }
        },
      ),
    );
  }
}

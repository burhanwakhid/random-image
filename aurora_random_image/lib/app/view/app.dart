import 'package:aurora_random_image/app/view/bloc/app_bloc.dart';
import 'package:aurora_random_image/l10n/l10n.dart';
import 'package:aurora_random_image/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsn_ui/jsn_ui.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(),
      child: const AppView(),
      //
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return JSNApp.router(
          routerConfig: appRouter.config(),
          theme: JSNThemeData.purpleThemeLight(),
          themeMode: state.themeMode,
          darkTheme: JSNThemeData.purpleThemeDark(),
          title: 'Aurora Random Image',
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          showPerformanceOverlay: false,
          checkerboardRasterCacheImages: false,
          checkerboardOffscreenLayers: false,
          showSemanticsDebugger: false,
          debugShowCheckedModeBanner: false,
          debugShowMaterialGrid: false,
        );
      },
    );
  }
}

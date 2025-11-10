import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jsn_ui/jsn_ui.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState.initial()) {
    on<ChangeTheme>(_changeTheme);
  }

  FutureOr<void> _changeTheme(ChangeTheme event, Emitter<AppState> emit) {
    final newThemeMode = switch (state.themeMode) {
      JSNThemeMode.light => JSNThemeMode.dark,
      JSNThemeMode.dark => JSNThemeMode.light,
      JSNThemeMode.system => _checkSystemTheme(),
    };
    emit(AppState.load(themeMode: newThemeMode));
  }

  JSNThemeMode _checkSystemTheme() {
    final brightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return brightness == Brightness.light
        ? JSNThemeMode.dark
        : JSNThemeMode.light;
  }
}

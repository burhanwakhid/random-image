part of 'app_bloc.dart';

class AppState extends Equatable {
  const AppState({required this.themeMode});

  final JSNThemeMode themeMode;

  factory AppState.initial() => AppState(themeMode: JSNThemeMode.system);

  factory AppState.load({required JSNThemeMode themeMode}) =>
      AppState(themeMode: themeMode);

  @override
  List<Object?> get props => [themeMode];
}

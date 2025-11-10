import 'package:flutter/material.dart';
import 'package:jsn_ui/jsn_ui.dart';

extension JSNExtensions on BuildContext {
  JSNThemeData get jsnTheme => JSNTheme.of(this);

  /// returns JSN color tokens
  JSNColorTokens get jsnColorTokens => jsnTheme.colors;

  /// returns JSN textTheme (typography styles)
  JSNTextTheme get jsnTypography => jsnTheme.textTheme;

  /// returns JSN shadow tokens
  JSNShadowTokens get jsnShadow => jsnTheme.shadow;

  /// returns JSN lightEffect tokens
  JSNLightEffectTokens get jsnLightEffect => jsnTheme.lightEffect;

  /// returns JSN Text Theme
  JSNTextTheme get jsnTextTheme => jsnTheme.textTheme;
}

// ignore_for_file: public_member_api_docs
// ignore_for_file: deprecated_member_use_from_same_package
// coverage:ignore-file

import 'package:flutter/material.dart';
import 'package:jsn_ui/jsn_ui.dart';
import 'package:jsn_ui/src/theme/jsn_theme_name.dart';

/// Holds all JSN tokens & configurations for an JSN theme.
///
/// Use one of the factory constructors to initialize an JSN theme. The
/// factory constructors are typically used to initialize the [JSNApp].
///
/// Note that [JSNApp] is the recommended way of using JSN design system. It
/// internally uses [JSNTheme] and configures [MaterialApp].
///
/// # Example app using JSNTheme
///
/// This following app changes background color when system brightness changes.
///
/// ```dart
/// void main() {
///   runApp(const DemoApp());
/// }
///
/// class DemoApp extends StatelessWidget {
///   const DemoApp({Key? key}) : super(key: key);
///
///   @override
///   Widget build(BuildContext context) {
///     return JSNTheme(
///       theme: JSNThemeData.greenThemeLight(),
///       darkTheme: JSNThemeData.greenThemeDark(),
///       themeMode: JSNThemeMode.system,
///       child: Builder(
///         builder: (context) => MaterialApp(
///           themeMode: JSNTheme.of(context).brightness == Brightness.light
///               ? ThemeMode.light
///               : ThemeMode.dark,
///           darkTheme: JSNTheme.of(context).material.darkTheme,
///           theme: JSNTheme.of(context).material.theme,
///           color: JSNTheme.of(context).colors.fillActivePrimary,
///           home: Container(
///             padding: EdgeInsets.all(JSNSpacing.spacing16),
///             color: JSNTheme.of(context).colors.fillBackgroundPrimary,
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
///
/// To get the [JSNThemeData] for the currently active theme from anywhere in
/// the subtree of [JSNTheme] or [JSNApp]:
///
/// ```dart
/// JSNThemeData themeData = JSNTheme.of(context);
/// ```
///
/// See also:
///   * [JSNColorTokens] - Defines all color tokens for JSN.
///   * [JSNSpacing] - Defines all spacing tokens for JSN.
///   * [JSNShadowTokens] - Defines all shadow tokens for JSN.
///   * [JSNTypographyTokens] - Defines all typography tokens for JSN.
///   * [JSNTextTheme] - Defines all text styles for JSN.
///   * [JSNApp] - The equivalent of [MaterialApp] for JSN Design System.
@immutable
class JSNThemeData {
  final JSNThemeName themeName;
  final JSNColorTokens colors;

  final JSNShadowTokens shadow;
  final JSNTextTheme textTheme;
  final JSNMaterialTokens material;
  final JSNLightEffectTokens lightEffect;
  final Brightness brightness;
  final String debugLabel;

  const JSNThemeData._({
    required this.themeName,
    required this.colors,
    required this.shadow,
    required this.textTheme,
    required this.material,
    required this.lightEffect,
    required this.brightness,
    required this.debugLabel,
  });

  factory JSNThemeData.jsnThemeLight() {
    return JSNThemeData._(
      themeName: JSNThemeName.primary,
      colors: JSNColorTokens.jsnThemeLight(),
      shadow: JSNShadowTokens.jsnThemeLight(),
      textTheme: JSNTextTheme.jsnThemeLight(),
      material: JSNMaterialTokens.jsnThemeLight(),
      lightEffect: JSNLightEffectTokens.jsnThemeLight(),
      debugLabel: 'jsnThemeLight',
      brightness: Brightness.light,
    );
  }

  factory JSNThemeData.jsnThemeDark() {
    return JSNThemeData._(
      themeName: JSNThemeName.primary,
      colors: JSNColorTokens.jsnThemeDark(),
      shadow: JSNShadowTokens.jsnThemeDark(),
      textTheme: JSNTextTheme.jsnThemeDark(),
      material: JSNMaterialTokens.jsnThemeDark(),
      lightEffect: JSNLightEffectTokens.jsnThemeDark(),
      debugLabel: 'jsnThemeDark',
      brightness: Brightness.dark,
    );
  }

  factory JSNThemeData.greenThemeLight() {
    return JSNThemeData._(
      themeName: JSNThemeName.green,
      colors: JSNColorTokens.greenThemeLight(),
      shadow: JSNShadowTokens.greenThemeLight(),
      textTheme: JSNTextTheme.greenThemeLight(),
      material: JSNMaterialTokens.greenThemeLight(),
      lightEffect: JSNLightEffectTokens.greenThemeLight(),
      debugLabel: 'greenThemeLight',
      brightness: Brightness.light,
    );
  }

  factory JSNThemeData.greenThemeDark() {
    return JSNThemeData._(
      themeName: JSNThemeName.green,
      colors: JSNColorTokens.greenThemeDark(),
      shadow: JSNShadowTokens.greenThemeDark(),
      textTheme: JSNTextTheme.greenThemeDark(),
      material: JSNMaterialTokens.greenThemeDark(),
      lightEffect: JSNLightEffectTokens.greenThemeDark(),
      debugLabel: 'greenThemeDark',
      brightness: Brightness.dark,
    );
  }

  factory JSNThemeData.pinkThemeLight() {
    return JSNThemeData._(
      themeName: JSNThemeName.pink,
      colors: JSNColorTokens.pinkThemeLight(),
      shadow: JSNShadowTokens.pinkThemeLight(),
      textTheme: JSNTextTheme.pinkThemeLight(),
      material: JSNMaterialTokens.pinkThemeLight(),
      lightEffect: JSNLightEffectTokens.pinkThemeLight(),
      debugLabel: 'pinkThemeLight',
      brightness: Brightness.light,
    );
  }

  factory JSNThemeData.pinkThemeDark() {
    return JSNThemeData._(
      themeName: JSNThemeName.pink,
      colors: JSNColorTokens.pinkThemeDark(),
      shadow: JSNShadowTokens.pinkThemeDark(),
      textTheme: JSNTextTheme.pinkThemeDark(),
      material: JSNMaterialTokens.pinkThemeDark(),
      lightEffect: JSNLightEffectTokens.pinkThemeDark(),
      debugLabel: 'pinkThemeDark',
      brightness: Brightness.dark,
    );
  }

  factory JSNThemeData.purpleThemeLight() {
    return JSNThemeData._(
      themeName: JSNThemeName.purple,
      colors: JSNColorTokens.purpleThemeLight(),
      shadow: JSNShadowTokens.purpleThemeLight(),
      textTheme: JSNTextTheme.purpleThemeLight(),
      material: JSNMaterialTokens.purpleThemeLight(),
      lightEffect: JSNLightEffectTokens.purpleThemeLight(),
      debugLabel: 'purpleThemeLight',
      brightness: Brightness.light,
    );
  }

  factory JSNThemeData.purpleThemeDark() {
    return JSNThemeData._(
      themeName: JSNThemeName.purple,
      colors: JSNColorTokens.purpleThemeDark(),
      shadow: JSNShadowTokens.purpleThemeDark(),
      textTheme: JSNTextTheme.purpleThemeDark(),
      material: JSNMaterialTokens.purpleThemeDark(),
      lightEffect: JSNLightEffectTokens.purpleThemeDark(),
      debugLabel: 'purpleThemeDark',
      brightness: Brightness.dark,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JSNThemeData &&
          themeName == other.themeName &&
          colors == other.colors &&
          shadow == other.shadow &&
          textTheme == other.textTheme &&
          material == other.material &&
          lightEffect == other.lightEffect &&
          brightness == other.brightness &&
          debugLabel == other.debugLabel;

  @override
  int get hashCode =>
      themeName.hashCode ^
      colors.hashCode ^
      shadow.hashCode ^
      textTheme.hashCode ^
      material.hashCode ^
      lightEffect.hashCode ^
      brightness.hashCode ^
      debugLabel.hashCode;
}

/// Holds all color tokens for an JSN theme. Each factory constructor
/// initializes color tokens for one of the JSN themes.
///
/// Consumers can get access to the color tokens for the currently active theme
/// by using [JSNTheme], example:
///
/// ```dart
/// Color color = JSNTheme.of(context).colors.fillBackgroundPrimary;
/// ```
///
/// Consumers never need to initialize these tokens as it's automatically
/// done when using [JSNTheme] widget.
@immutable
class JSNColorTokens {
  const JSNColorTokens._({
    required this.borderActive,
    required this.borderDefault,
    required this.borderError,
    required this.borderFocus,
    required this.borderInactive,
    required this.borderMutePrimary,
    required this.borderPressed,
    required this.borderStaticBlack,
    required this.borderStaticWhite,
    required this.borderWarning,
    required this.fillActivePrimary,
    required this.fillActiveSecondary,
    required this.fillBackgroundPrimary,
    required this.fillBackgroundQuaternary,
    required this.fillBackgroundSecondary,
    required this.fillBackgroundTertiary,
    required this.fillErrorPrimary,
    required this.fillErrorSecondary,
    required this.fillInactivePrimary,
    required this.fillInactiveSecondary,
    required this.fillMutePrimary,
    required this.fillMuteSecondary,
    required this.fillOverlay,
    required this.fillPressed,
    required this.fillStaticBlack,
    required this.fillStaticWhite,
    required this.fillWarningPrimary,
    required this.fillWarningSecondary,
    required this.iconDynamicActive,
    required this.iconDynamicDefault,
    required this.iconDynamicError,
    required this.iconDynamicInactive,
    required this.iconDynamicInverted,
    required this.iconDynamicWarning,
    required this.iconStaticWhite,
    required this.typographyActive,
    required this.typographyDefaultBody,
    required this.typographyDefaultCaption,
    required this.typographyDefaultTitle,
    required this.typographyError,
    required this.typographyInactive,
    required this.typographyInverted,
    required this.typographyStaticBlack,
    required this.typographyStaticWhite,
    required this.typographyWarning,
  });

  factory JSNColorTokens.jsnThemeLight() {
    return const JSNColorTokens._(
      borderActive: Color(0xFFBCD0FF),
      borderDefault: Color(0xFF9E9E9E),
      borderError: Color(0xFFDA5858),
      borderFocus: Color(0xFF71808E),
      borderInactive: Color(0xFFB3BAC1),
      borderMutePrimary: Color(0xFFEBECEF),
      borderPressed: Color(0x1A000000),
      borderStaticBlack: Color(0xFF1E2125),
      borderStaticWhite: Color(0xFFFCFCFD),
      borderWarning: Color(0xFFE8900E),
      fillActivePrimary: Color(0xFF3772FF),
      fillActiveSecondary: Color(0xFFD7E2FF),
      fillBackgroundPrimary: Color(0xFFFFFFFF),
      fillBackgroundQuaternary: Color(0xFFEEEFF2),
      fillBackgroundSecondary: Color(0xFFD7E2FF),
      fillBackgroundTertiary: Color(0xFF1E2125),
      fillErrorPrimary: Color(0xFFDA5858),
      fillErrorSecondary: Color(0xFFFFF8F8),
      fillInactivePrimary: Color(0xFFB3BAC1),
      fillInactiveSecondary: Color(0xFFEAECEE),
      fillMutePrimary: Color(0xFFE2E5E9),
      fillMuteSecondary: Color(0xFFF4F5F7),
      fillOverlay: Color(0x991C1D1D),
      fillPressed: Color(0x1A000000),
      fillStaticBlack: Color(0xFF1E2125),
      fillStaticWhite: Color(0xFFFCFCFD),
      fillWarningPrimary: Color(0xFFE8900E),
      fillWarningSecondary: Color(0xFFFFF8ED),
      iconDynamicActive: Color(0xFF202C42),
      iconDynamicDefault: Color(0xFF424A52),
      iconDynamicError: Color(0xFFDA5858),
      iconDynamicInactive: Color(0xFF76819B),
      iconDynamicInverted: Color(0xFFFCFCFD),
      iconDynamicWarning: Color(0xFFBD5204),
      iconStaticWhite: Color(0xFFFCFCFD),
      typographyActive: Color(0xFF00CCFB),
      typographyDefaultBody: Color(0xFF202C42),
      typographyDefaultCaption: Color(0xFF616E7A),
      typographyDefaultTitle: Color(0xFF1E2225),
      typographyError: Color(0xFFDA5858),
      typographyInactive: Color(0xFF76819B),
      typographyInverted: Color(0xFFFCFCFD),
      typographyStaticBlack: Color(0xFF1E2125),
      typographyStaticWhite: Color(0xFFFCFCFD),
      typographyWarning: Color(0xFFBD5204),
    );
  }

  factory JSNColorTokens.jsnThemeDark() {
    return const JSNColorTokens._(
      borderActive: Color(0xFF00CCFB),
      borderDefault: Color(0xFFA3ABB3),
      borderError: Color(0xFFF1525F),
      borderFocus: Color(0xFF727A80),
      borderInactive: Color(0xFF545A5E),
      borderMutePrimary: Color(0xFF1F2326),
      borderPressed: Color(0x1AFFFFFF),
      borderStaticBlack: Color(0xFF101214),
      borderStaticWhite: Color(0xFFE3E5E8),
      borderWarning: Color(0xFFA66300),
      fillActivePrimary: Color(0xFF00CCFB),
      fillActiveSecondary: Color(0xFF080708),
      fillBackgroundPrimary: Color(0xFF1E2325),
      fillBackgroundQuaternary: Color(0xFF131517),
      fillBackgroundSecondary: Color(0xFF080708),
      fillBackgroundTertiary: Color(0xFFE3E5E8),
      fillErrorPrimary: Color(0xFFFF323D),
      fillErrorSecondary: Color(0xFF210001),
      fillInactivePrimary: Color(0xFF545A5E),
      fillInactiveSecondary: Color(0xFF3E4245),
      fillMutePrimary: Color(0xFF08090A),
      fillMuteSecondary: Color(0xFF171A1C),
      fillOverlay: Color(0xB3000000),
      fillPressed: Color(0x1AFFFFFF),
      fillStaticBlack: Color(0xFF101214),
      fillStaticWhite: Color(0xFFFCFCFD),
      fillWarningPrimary: Color(0xFFA66300),
      fillWarningSecondary: Color(0xFF3E321F),
      iconDynamicActive: Color(0xFF00CCFB),
      iconDynamicDefault: Color(0xFFA3ABB3),
      iconDynamicError: Color(0xFFFF323D),
      iconDynamicInactive: Color(0xFF606161),
      iconDynamicInverted: Color(0xFF101214),
      iconDynamicWarning: Color(0xFFFFA927),
      iconStaticWhite: Color(0xFFE3E5E8),
      typographyActive: Color(0xFF00CCFB),
      typographyDefaultBody: Color(0xFFB2B5B9),
      typographyDefaultCaption: Color(0xFFB2B5B9),
      typographyDefaultTitle: Color(0xFFE3E5E8),
      typographyError: Color(0xFFFF323D),
      typographyInactive: Color(0xFF727A80),
      typographyInverted: Color(0xFF101214),
      typographyStaticBlack: Color(0xFF101214),
      typographyStaticWhite: Color(0xFFFCFCFD),
      typographyWarning: Color(0xFFFFA927),
    );
  }

  factory JSNColorTokens.greenThemeLight() {
    return const JSNColorTokens._(
      borderActive: Color(0xFF00CCFB),
      borderDefault: Color(0xFF494A4A),
      borderError: Color(0xFFDA5858),
      borderFocus: Color(0xFF1C1D1D),
      borderInactive: Color(0xFFBDBDBD),
      borderMutePrimary: Color(0xFFE8E8E8),
      borderPressed: Color(0x1A000000),
      borderStaticBlack: Color(0xFF1C1D1D),
      borderStaticWhite: Color(0xFFFFFFFF),
      borderWarning: Color(0xFFE8900E),
      fillActivePrimary: Color(0xFF00CCFB),
      fillActiveSecondary: Color(0xFFE0FFE0),
      fillBackgroundPrimary: Color(0xFFFFFFFF),
      fillBackgroundQuaternary: Color(0xFFF1F2F4),
      fillBackgroundSecondary: Color(0xFFFFFFFF),
      fillBackgroundTertiary: Color(0xFF1C1D1D),
      fillErrorPrimary: Color(0xFFDA5858),
      fillErrorSecondary: Color(0xFFFFF5F5),
      fillInactivePrimary: Color(0xFFBDBDBD),
      fillInactiveSecondary: Color(0xFFF0F0F0),
      fillMutePrimary: Color(0xFFE8E8E8),
      fillMuteSecondary: Color(0xFFF7F7F7),
      fillOverlay: Color(0x991C1D1D),
      fillPressed: Color(0x1A000000),
      fillStaticBlack: Color(0xFF1C1D1D),
      fillStaticWhite: Color(0xFFFFFFFF),
      fillWarningPrimary: Color(0xFFE8900E),
      fillWarningSecondary: Color(0xFFFFF5E5),
      iconDynamicActive: Color(0xFF00CCFB),
      iconDynamicDefault: Color(0xFF494A4A),
      iconDynamicError: Color(0xFFDA5858),
      iconDynamicInactive: Color(0xFFBDBDBD),
      iconDynamicInverted: Color(0xFFFFFFFF),
      iconDynamicWarning: Color(0xFFA54703),
      iconStaticWhite: Color(0xFFFFFFFF),
      typographyActive: Color(0xFF00700B),
      typographyDefaultBody: Color(0xFF494A4A),
      typographyDefaultCaption: Color(0xFF494A4A),
      typographyDefaultTitle: Color(0xFF1C1D1D),
      typographyError: Color(0xFFC7001B),
      typographyInactive: Color(0xFF757575),
      typographyInverted: Color(0xFFFFFFFF),
      typographyStaticBlack: Color(0xFF1C1D1D),
      typographyStaticWhite: Color(0xFFFFFFFF),
      typographyWarning: Color(0xFFA54703),
    );
  }

  factory JSNColorTokens.greenThemeDark() {
    return const JSNColorTokens._(
      borderActive: Color(0xFF008A0E),
      borderDefault: Color(0xFFFFFFFF),
      borderError: Color(0xFFEB001F),
      borderFocus: Color(0xFF757575),
      borderInactive: Color(0xFF4A4A4A),
      borderMutePrimary: Color(0xFF383838),
      borderPressed: Color(0x1AFFFFFF),
      borderStaticBlack: Color(0xFF0F0F0F),
      borderStaticWhite: Color(0xFFFFFFFF),
      borderWarning: Color(0xFFA86500),
      fillActivePrimary: Color(0xFF008A0E),
      fillActiveSecondary: Color(0xFF002400),
      fillBackgroundPrimary: Color(0xFF0F0F0F),
      fillBackgroundQuaternary: Color(0xFF121417),
      fillBackgroundSecondary: Color(0xFF212121),
      fillBackgroundTertiary: Color(0xFFFFFFFF),
      fillErrorPrimary: Color(0xFFEB001F),
      fillErrorSecondary: Color(0xFF470000),
      fillInactivePrimary: Color(0xFF4A4A4A),
      fillInactiveSecondary: Color(0xFF292929),
      fillMutePrimary: Color(0xFF383838),
      fillMuteSecondary: Color(0xFF1C1C1C),
      fillOverlay: Color(0xB3000000),
      fillPressed: Color(0x1AFFFFFF),
      fillStaticBlack: Color(0xFF0F0F0F),
      fillStaticWhite: Color(0xFFFFFFFF),
      fillWarningPrimary: Color(0xFFA86500),
      fillWarningSecondary: Color(0xFF251E13),
      iconDynamicActive: Color(0xFF008A0E),
      iconDynamicDefault: Color(0xFFFFFFFF),
      iconDynamicError: Color(0xFFEB001F),
      iconDynamicInactive: Color(0xFF4A4A4A),
      iconDynamicInverted: Color(0xFF0F0F0F),
      iconDynamicWarning: Color(0xFFFFAB2E),
      iconStaticWhite: Color(0xFFFFFFFF),
      typographyActive: Color(0xFF00990F),
      typographyDefaultBody: Color(0xFFBCBDBD),
      typographyDefaultCaption: Color(0xFFBCBDBD),
      typographyDefaultTitle: Color(0xFFFFFFFF),
      typographyError: Color(0xFFFF2E4A),
      typographyInactive: Color(0xFF757575),
      typographyInverted: Color(0xFF0F0F0F),
      typographyStaticBlack: Color(0xFF0F0F0F),
      typographyStaticWhite: Color(0xFFFFFFFF),
      typographyWarning: Color(0xFFFFAB2E),
    );
  }

  factory JSNColorTokens.pinkThemeLight() {
    return const JSNColorTokens._(
      borderActive: Color(0xFFCD378D),
      borderDefault: Color(0xFF494A4A),
      borderError: Color(0xFFDA5858),
      borderFocus: Color(0xFF1C1D1D),
      borderInactive: Color(0xFFBDBDBD),
      borderMutePrimary: Color(0xFFE8E8E8),
      borderPressed: Color(0x1A000000),
      borderStaticBlack: Color(0xFF1C1D1D),
      borderStaticWhite: Color(0xFFFFFFFF),
      borderWarning: Color(0xFFE8900E),
      fillActivePrimary: Color(0xFFCD378D),
      fillActiveSecondary: Color(0xFFFDF2F5),
      fillBackgroundPrimary: Color(0xFFFFFFFF),
      fillBackgroundQuaternary: Color(0xFFF1F2F4),
      fillBackgroundSecondary: Color(0xFFFFFFFF),
      fillBackgroundTertiary: Color(0xFF1C1D1D),
      fillErrorPrimary: Color(0xFFDA5858),
      fillErrorSecondary: Color(0xFFFFF0F0),
      fillInactivePrimary: Color(0xFFBDBDBD),
      fillInactiveSecondary: Color(0xFFF0F0F0),
      fillMutePrimary: Color(0xFFE8E8E8),
      fillMuteSecondary: Color(0xFFF7F7F7),
      fillOverlay: Color(0x991C1D1D),
      fillPressed: Color(0x1A000000),
      fillStaticBlack: Color(0xFF1C1D1D),
      fillStaticWhite: Color(0xFFFFFFFF),
      fillWarningPrimary: Color(0xFFE8900E),
      fillWarningSecondary: Color(0xFFFFF5E5),
      iconDynamicActive: Color(0xFFCD378D),
      iconDynamicDefault: Color(0xFF494A4A),
      iconDynamicError: Color(0xFFDA5858),
      iconDynamicInactive: Color(0xFFBDBDBD),
      iconDynamicInverted: Color(0xFFFFFFFF),
      iconDynamicWarning: Color(0xFFA54703),
      iconStaticWhite: Color(0xFFFFFFFF),
      typographyActive: Color(0xFFAF2C76),
      typographyDefaultBody: Color(0xFF494A4A),
      typographyDefaultCaption: Color(0xFF494A4A),
      typographyDefaultTitle: Color(0xFF1C1D1D),
      typographyError: Color(0xFFC7001B),
      typographyInactive: Color(0xFF757575),
      typographyInverted: Color(0xFFFFFFFF),
      typographyStaticBlack: Color(0xFF1C1D1D),
      typographyStaticWhite: Color(0xFFFFFFFF),
      typographyWarning: Color(0xFFA54703),
    );
  }

  factory JSNColorTokens.pinkThemeDark() {
    return const JSNColorTokens._(
      borderActive: Color(0xFFCE3B8E),
      borderDefault: Color(0xFFFFFFFF),
      borderError: Color(0xFFEB001F),
      borderFocus: Color(0xFF757575),
      borderInactive: Color(0xFF4A4A4A),
      borderMutePrimary: Color(0xFF383838),
      borderPressed: Color(0x1AFFFFFF),
      borderStaticBlack: Color(0xFF0F0F0F),
      borderStaticWhite: Color(0xFFFFFFFF),
      borderWarning: Color(0xFFA86500),
      fillActivePrimary: Color(0xFFCE3B8E),
      fillActiveSecondary: Color(0xFF3D0F29),
      fillBackgroundPrimary: Color(0xFF0F0F0F),
      fillBackgroundQuaternary: Color(0xFF121417),
      fillBackgroundSecondary: Color(0xFF212121),
      fillBackgroundTertiary: Color(0xFFFFFFFF),
      fillErrorPrimary: Color(0xFFEB001F),
      fillErrorSecondary: Color(0xFF470000),
      fillInactivePrimary: Color(0xFF4A4A4A),
      fillInactiveSecondary: Color(0xFF292929),
      fillMutePrimary: Color(0xFF383838),
      fillMuteSecondary: Color(0xFF1C1C1C),
      fillOverlay: Color(0xB3000000),
      fillPressed: Color(0x1AFFFFFF),
      fillStaticBlack: Color(0xFF0F0F0F),
      fillStaticWhite: Color(0xFFFFFFFF),
      fillWarningPrimary: Color(0xFFA86500),
      fillWarningSecondary: Color(0xFF251E13),
      iconDynamicActive: Color(0xFFCE3B8E),
      iconDynamicDefault: Color(0xFFFFFFFF),
      iconDynamicError: Color(0xFFEB001F),
      iconDynamicInactive: Color(0xFF4A4A4A),
      iconDynamicInverted: Color(0xFF0F0F0F),
      iconDynamicWarning: Color(0xFFFFAB2E),
      iconStaticWhite: Color(0xFFFFFFFF),
      typographyActive: Color(0xFFD4549C),
      typographyDefaultBody: Color(0xFFBCBDBD),
      typographyDefaultCaption: Color(0xFFBCBDBD),
      typographyDefaultTitle: Color(0xFFFFFFFF),
      typographyError: Color(0xFFFF2E4A),
      typographyInactive: Color(0xFF757575),
      typographyInverted: Color(0xFF0F0F0F),
      typographyStaticBlack: Color(0xFF0F0F0F),
      typographyStaticWhite: Color(0xFFFFFFFF),
      typographyWarning: Color(0xFFFFAB2E),
    );
  }

  factory JSNColorTokens.purpleThemeLight() {
    return const JSNColorTokens._(
      borderActive: Color(0xFF8F2E9E),
      borderDefault: Color(0xFF494A4A),
      borderError: Color(0xFFDA5858),
      borderFocus: Color(0xFF1C1D1D),
      borderInactive: Color(0xFFBDBDBD),
      borderMutePrimary: Color(0xFFE8E8E8),
      borderPressed: Color(0x1A000000),
      borderStaticBlack: Color(0xFF1C1D1D),
      borderStaticWhite: Color(0xFFFFFFFF),
      borderWarning: Color(0xFFE8900E),
      fillActivePrimary: Color(0xFF8F2E9E),
      fillActiveSecondary: Color(0xFFFBF2FD),
      fillBackgroundPrimary: Color(0xFFFFFFFF),
      fillBackgroundQuaternary: Color(0xFFF1F2F4),
      fillBackgroundSecondary: Color(0xFFFFFFFF),
      fillBackgroundTertiary: Color(0xFF1C1D1D),
      fillErrorPrimary: Color(0xFFDA5858),
      fillErrorSecondary: Color(0xFFFFF0F0),
      fillInactivePrimary: Color(0xFFBDBDBD),
      fillInactiveSecondary: Color(0xFFF0F0F0),
      fillMutePrimary: Color(0xFFE8E8E8),
      fillMuteSecondary: Color(0xFFF7F7F7),
      fillOverlay: Color(0x991C1D1D),
      fillPressed: Color(0x1A000000),
      fillStaticBlack: Color(0xFF1C1D1D),
      fillStaticWhite: Color(0xFFFFFFFF),
      fillWarningPrimary: Color(0xFFE8900E),
      fillWarningSecondary: Color(0xFFFFF5E5),
      iconDynamicActive: Color(0xFF8F2E9E),
      iconDynamicDefault: Color(0xFF494A4A),
      iconDynamicError: Color(0xFFDA5858),
      iconDynamicInactive: Color(0xFFBDBDBD),
      iconDynamicInverted: Color(0xFFFFFFFF),
      iconDynamicWarning: Color(0xFFA54703),
      iconStaticWhite: Color(0xFFFFFFFF),
      typographyActive: Color(0xFF8F2E9E),
      typographyDefaultBody: Color(0xFF494A4A),
      typographyDefaultCaption: Color(0xFF494A4A),
      typographyDefaultTitle: Color(0xFF1C1D1D),
      typographyError: Color(0xFFC7001B),
      typographyInactive: Color(0xFF757575),
      typographyInverted: Color(0xFFFFFFFF),
      typographyStaticBlack: Color(0xFF1C1D1D),
      typographyStaticWhite: Color(0xFFFFFFFF),
      typographyWarning: Color(0xFFA54703),
    );
  }

  factory JSNColorTokens.purpleThemeDark() {
    return const JSNColorTokens._(
      borderActive: Color(0xFFB641C8),
      borderDefault: Color(0xFFFFFFFF),
      borderError: Color(0xFFEB001F),
      borderFocus: Color(0xFF757575),
      borderInactive: Color(0xFF4A4A4A),
      borderMutePrimary: Color(0xFF383838),
      borderPressed: Color(0x1AFFFFFF),
      borderStaticBlack: Color(0xFF0F0F0F),
      borderStaticWhite: Color(0xFFFFFFFF),
      borderWarning: Color(0xFFA86500),
      fillActivePrimary: Color(0xFFB641C8),
      fillActiveSecondary: Color(0xFF380A42),
      fillBackgroundPrimary: Color(0xFF0F0F0F),
      fillBackgroundQuaternary: Color(0xFF121417),
      fillBackgroundSecondary: Color(0xFF212121),
      fillBackgroundTertiary: Color(0xFFFFFFFF),
      fillErrorPrimary: Color(0xFFEB001F),
      fillErrorSecondary: Color(0xFF470000),
      fillInactivePrimary: Color(0xFF4A4A4A),
      fillInactiveSecondary: Color(0xFF292929),
      fillMutePrimary: Color(0xFF383838),
      fillMuteSecondary: Color(0xFF1C1C1C),
      fillOverlay: Color(0xB3000000),
      fillPressed: Color(0x1AFFFFFF),
      fillStaticBlack: Color(0xFF0F0F0F),
      fillStaticWhite: Color(0xFFFFFFFF),
      fillWarningPrimary: Color(0xFFA86500),
      fillWarningSecondary: Color(0xFF251E13),
      iconDynamicActive: Color(0xFFB641C8),
      iconDynamicDefault: Color(0xFFFFFFFF),
      iconDynamicError: Color(0xFFEB001F),
      iconDynamicInactive: Color(0xFF4A4A4A),
      iconDynamicInverted: Color(0xFF0F0F0F),
      iconDynamicWarning: Color(0xFFFFAB2E),
      iconStaticWhite: Color(0xFFFFFFFF),
      typographyActive: Color(0xFFBF59CF),
      typographyDefaultBody: Color(0xFFBCBDBD),
      typographyDefaultCaption: Color(0xFFBCBDBD),
      typographyDefaultTitle: Color(0xFFFFFFFF),
      typographyError: Color(0xFFFF2E4A),
      typographyInactive: Color(0xFF757575),
      typographyInverted: Color(0xFF0F0F0F),
      typographyStaticBlack: Color(0xFF0F0F0F),
      typographyStaticWhite: Color(0xFFFFFFFF),
      typographyWarning: Color(0xFFFFAB2E),
    );
  }

  final Color borderActive;
  final Color borderDefault;
  final Color borderError;
  final Color borderFocus;
  final Color borderInactive;
  final Color borderMutePrimary;
  final Color borderPressed;
  final Color borderStaticBlack;
  final Color borderStaticWhite;
  final Color borderWarning;
  final Color fillActivePrimary;
  final Color fillActiveSecondary;
  final Color fillBackgroundPrimary;
  final Color fillBackgroundQuaternary;
  final Color fillBackgroundSecondary;
  final Color fillBackgroundTertiary;
  final Color fillErrorPrimary;
  final Color fillErrorSecondary;
  final Color fillInactivePrimary;
  final Color fillInactiveSecondary;
  final Color fillMutePrimary;
  final Color fillMuteSecondary;
  final Color fillOverlay;
  final Color fillPressed;
  final Color fillStaticBlack;
  final Color fillStaticWhite;
  final Color fillWarningPrimary;
  final Color fillWarningSecondary;
  final Color iconDynamicActive;
  final Color iconDynamicDefault;
  final Color iconDynamicError;
  final Color iconDynamicInactive;
  final Color iconDynamicInverted;
  final Color iconDynamicWarning;
  final Color iconStaticWhite;
  final Color typographyActive;
  final Color typographyDefaultBody;
  final Color typographyDefaultCaption;
  final Color typographyDefaultTitle;
  final Color typographyError;
  final Color typographyInactive;
  final Color typographyInverted;
  final Color typographyStaticBlack;
  final Color typographyStaticWhite;
  final Color typographyWarning;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JSNColorTokens &&
          borderActive == other.borderActive &&
          borderDefault == other.borderDefault &&
          borderError == other.borderError &&
          borderFocus == other.borderFocus &&
          borderInactive == other.borderInactive &&
          borderMutePrimary == other.borderMutePrimary &&
          borderPressed == other.borderPressed &&
          borderStaticBlack == other.borderStaticBlack &&
          borderStaticWhite == other.borderStaticWhite &&
          borderWarning == other.borderWarning &&
          fillActivePrimary == other.fillActivePrimary &&
          fillActiveSecondary == other.fillActiveSecondary &&
          fillBackgroundPrimary == other.fillBackgroundPrimary &&
          fillBackgroundQuaternary == other.fillBackgroundQuaternary &&
          fillBackgroundSecondary == other.fillBackgroundSecondary &&
          fillBackgroundTertiary == other.fillBackgroundTertiary &&
          fillErrorPrimary == other.fillErrorPrimary &&
          fillErrorSecondary == other.fillErrorSecondary &&
          fillInactivePrimary == other.fillInactivePrimary &&
          fillInactiveSecondary == other.fillInactiveSecondary &&
          fillMutePrimary == other.fillMutePrimary &&
          fillMuteSecondary == other.fillMuteSecondary &&
          fillOverlay == other.fillOverlay &&
          fillPressed == other.fillPressed &&
          fillStaticBlack == other.fillStaticBlack &&
          fillStaticWhite == other.fillStaticWhite &&
          fillWarningPrimary == other.fillWarningPrimary &&
          fillWarningSecondary == other.fillWarningSecondary &&
          iconDynamicActive == other.iconDynamicActive &&
          iconDynamicDefault == other.iconDynamicDefault &&
          iconDynamicError == other.iconDynamicError &&
          iconDynamicInactive == other.iconDynamicInactive &&
          iconDynamicInverted == other.iconDynamicInverted &&
          iconDynamicWarning == other.iconDynamicWarning &&
          iconStaticWhite == other.iconStaticWhite &&
          typographyActive == other.typographyActive &&
          typographyDefaultBody == other.typographyDefaultBody &&
          typographyDefaultCaption == other.typographyDefaultCaption &&
          typographyDefaultTitle == other.typographyDefaultTitle &&
          typographyError == other.typographyError &&
          typographyInactive == other.typographyInactive &&
          typographyInverted == other.typographyInverted &&
          typographyStaticBlack == other.typographyStaticBlack &&
          typographyStaticWhite == other.typographyStaticWhite &&
          typographyWarning == other.typographyWarning;

  @override
  int get hashCode =>
      borderActive.hashCode ^
      borderDefault.hashCode ^
      borderError.hashCode ^
      borderFocus.hashCode ^
      borderInactive.hashCode ^
      borderMutePrimary.hashCode ^
      borderPressed.hashCode ^
      borderStaticBlack.hashCode ^
      borderStaticWhite.hashCode ^
      borderWarning.hashCode ^
      fillActivePrimary.hashCode ^
      fillActiveSecondary.hashCode ^
      fillBackgroundPrimary.hashCode ^
      fillBackgroundQuaternary.hashCode ^
      fillBackgroundSecondary.hashCode ^
      fillBackgroundTertiary.hashCode ^
      fillErrorPrimary.hashCode ^
      fillErrorSecondary.hashCode ^
      fillInactivePrimary.hashCode ^
      fillInactiveSecondary.hashCode ^
      fillMutePrimary.hashCode ^
      fillMuteSecondary.hashCode ^
      fillOverlay.hashCode ^
      fillPressed.hashCode ^
      fillStaticBlack.hashCode ^
      fillStaticWhite.hashCode ^
      fillWarningPrimary.hashCode ^
      fillWarningSecondary.hashCode ^
      iconDynamicActive.hashCode ^
      iconDynamicDefault.hashCode ^
      iconDynamicError.hashCode ^
      iconDynamicInactive.hashCode ^
      iconDynamicInverted.hashCode ^
      iconDynamicWarning.hashCode ^
      iconStaticWhite.hashCode ^
      typographyActive.hashCode ^
      typographyDefaultBody.hashCode ^
      typographyDefaultCaption.hashCode ^
      typographyDefaultTitle.hashCode ^
      typographyError.hashCode ^
      typographyInactive.hashCode ^
      typographyInverted.hashCode ^
      typographyStaticBlack.hashCode ^
      typographyStaticWhite.hashCode ^
      typographyWarning.hashCode;
}

class _ColorScheme {
  static ColorScheme jsnThemeLight() {
    return const ColorScheme(
      /// fill_background_primary
      error: Color(0xFFDA5858),

      /// fill_background_primary
      onError: Color(0xFFFFFFFF),

      /// fill_background_primary
      onPrimary: Color(0xFFFAFAFA),

      /// fill_background_primary
      onSecondary: Color(0xFFFFFFFF),

      /// fill_background_tertiary
      onSurface: Color(0xFF1E2125),

      /// fill_active_primary
      primary: Color(0xFF3772FF),

      /// fill_active_primary
      primaryContainer: Color(0xFF00CCFB),

      /// fill_active_primary
      secondary: Color(0xFF452DDC),

      /// fill_active_primary
      secondaryContainer: Color(0xFF00CCFB),

      /// fill_background_primary
      surface: Color(0xFFD8E2FB),

      /// brightness
      brightness: Brightness.light,
    );
  }

  static ColorScheme jsnThemeDark() {
    return const ColorScheme(
      /// fill_background_primary
      error: Color(0xFFF4ACB7),

      /// fill_background_primary
      onError: Color(0xFF1E2325),

      /// fill_background_primary
      onPrimary: Color(0xFF282F3E),

      /// fill_background_primary
      onSecondary: Color(0xFF1E2325),

      /// fill_background_tertiary
      onSurface: Color(0xFFE3E5E8),

      /// fill_active_primary
      primary: Color(0xFF00CCFB),

      /// fill_active_primary
      primaryContainer: Color(0xFF00CCFB),

      /// fill_active_primary
      secondary: Color(0xFF282F3E),

      /// fill_active_primary
      secondaryContainer: Color(0xFF00CCFB),

      /// fill_background_primary
      surface: Color(0xFF080708),

      /// brightness
      brightness: Brightness.dark,
    );
  }

  static ColorScheme greenThemeLight() {
    return const ColorScheme(
      /// fill_background_primary
      error: Color(0xFFDA5858),

      /// fill_background_primary
      onError: Color(0xFFFFFFFF),

      /// fill_background_primary
      onPrimary: Color(0xFFFFFFFF),

      /// fill_background_primary
      onSecondary: Color(0xFFFFFFFF),

      /// fill_background_tertiary
      onSurface: Color(0xFF1C1D1D),

      /// fill_active_primary
      primary: Color(0xFF00CCFB),

      /// fill_active_primary
      primaryContainer: Color(0xFF00CCFB),

      /// fill_active_primary
      secondary: Color(0xFF00CCFB),

      /// fill_active_primary
      secondaryContainer: Color(0xFF00CCFB),

      /// fill_background_primary
      surface: Color(0xFFFFFFFF),

      /// brightness
      brightness: Brightness.light,
    );
  }

  static ColorScheme greenThemeDark() {
    return const ColorScheme(
      /// fill_background_primary
      error: Color(0xFFEB001F),

      /// fill_background_primary
      onError: Color(0xFF0F0F0F),

      /// fill_background_primary
      onPrimary: Color(0xFF0F0F0F),

      /// fill_background_primary
      onSecondary: Color(0xFF0F0F0F),

      /// fill_background_tertiary
      onSurface: Color(0xFFFFFFFF),

      /// fill_active_primary
      primary: Color(0xFF008A0E),

      /// fill_active_primary
      primaryContainer: Color(0xFF008A0E),

      /// fill_active_primary
      secondary: Color(0xFF008A0E),

      /// fill_active_primary
      secondaryContainer: Color(0xFF008A0E),

      /// fill_background_primary
      surface: Color(0xFF0F0F0F),

      /// brightness
      brightness: Brightness.dark,
    );
  }

  static ColorScheme pinkThemeLight() {
    return const ColorScheme(
      /// fill_background_primary
      error: Color(0xFFDA5858),

      /// fill_background_primary
      onError: Color(0xFFFFFFFF),

      /// fill_background_primary
      onPrimary: Color(0xFFFFFFFF),

      /// fill_background_primary
      onSecondary: Color(0xFFFFFFFF),

      /// fill_background_tertiary
      onSurface: Color(0xFF1C1D1D),

      /// fill_active_primary
      primary: Color(0xFFCD378D),

      /// fill_active_primary
      primaryContainer: Color(0xFFCD378D),

      /// fill_active_primary
      secondary: Color(0xFFCD378D),

      /// fill_active_primary
      secondaryContainer: Color(0xFFCD378D),

      /// fill_background_primary
      surface: Color(0xFFFFFFFF),

      /// brightness
      brightness: Brightness.light,
    );
  }

  static ColorScheme pinkThemeDark() {
    return const ColorScheme(
      /// fill_background_primary
      error: Color(0xFFEB001F),

      /// fill_background_primary
      onError: Color(0xFF0F0F0F),

      /// fill_background_primary
      onPrimary: Color(0xFF0F0F0F),

      /// fill_background_primary
      onSecondary: Color(0xFF0F0F0F),

      /// fill_background_tertiary
      onSurface: Color(0xFFFFFFFF),

      /// fill_active_primary
      primary: Color(0xFFCE3B8E),

      /// fill_active_primary
      primaryContainer: Color(0xFFCE3B8E),

      /// fill_active_primary
      secondary: Color(0xFFCE3B8E),

      /// fill_active_primary
      secondaryContainer: Color(0xFFCE3B8E),

      /// fill_background_primary
      surface: Color(0xFF0F0F0F),

      /// brightness
      brightness: Brightness.dark,
    );
  }

  static ColorScheme purpleThemeLight() {
    return const ColorScheme(
      /// fill_background_primary
      error: Color(0xFFDA5858),

      /// fill_background_primary
      onError: Color(0xFFFFFFFF),

      /// fill_background_primary
      onPrimary: Color(0xFFFFFFFF),

      /// fill_background_primary
      onSecondary: Color(0xFFFFFFFF),

      /// fill_background_tertiary
      onSurface: Color(0xFF1C1D1D),

      /// fill_active_primary
      primary: Color(0xFF8F2E9E),

      /// fill_active_primary
      primaryContainer: Color(0xFF8F2E9E),

      /// fill_active_primary
      secondary: Color(0xFF8F2E9E),

      /// fill_active_primary
      secondaryContainer: Color(0xFF8F2E9E),

      /// fill_background_primary
      surface: Color(0xFFFFFFFF),

      /// brightness
      brightness: Brightness.light,
    );
  }

  static ColorScheme purpleThemeDark() {
    return const ColorScheme(
      /// fill_background_primary
      error: Color(0xFFEB001F),

      /// fill_background_primary
      onError: Color(0xFF0F0F0F),

      /// fill_background_primary
      onPrimary: Color(0xFF0F0F0F),

      /// fill_background_primary
      onSecondary: Color(0xFF0F0F0F),

      /// fill_background_tertiary
      onSurface: Color(0xFFFFFFFF),

      /// fill_active_primary
      primary: Color(0xFFB641C8),

      /// fill_active_primary
      primaryContainer: Color(0xFFB641C8),

      /// fill_active_primary
      secondary: Color(0xFFB641C8),

      /// fill_active_primary
      secondaryContainer: Color(0xFFB641C8),

      /// fill_background_primary
      surface: Color(0xFF0F0F0F),

      /// brightness
      brightness: Brightness.dark,
    );
  }
}

/// Maps JSN tokens to [ThemeData].
class _ThemeData {
  static ThemeData jsnThemeLight() {
    return ThemeData(
      colorScheme: _ColorScheme.jsnThemeLight(),
      textTheme: _TextTheme.jsnThemeLight(),
    );
  }

  static ThemeData jsnThemeDark() {
    return ThemeData(
      colorScheme: _ColorScheme.jsnThemeDark(),
      textTheme: _TextTheme.jsnThemeDark(),
    );
  }

  static ThemeData greenThemeLight() {
    return ThemeData(
      colorScheme: _ColorScheme.greenThemeLight(),
      textTheme: _TextTheme.greenThemeLight(),
    );
  }

  static ThemeData greenThemeDark() {
    return ThemeData(
      colorScheme: _ColorScheme.greenThemeDark(),
      textTheme: _TextTheme.greenThemeDark(),
    );
  }

  static ThemeData pinkThemeLight() {
    return ThemeData(
      colorScheme: _ColorScheme.pinkThemeLight(),
      textTheme: _TextTheme.pinkThemeLight(),
    );
  }

  static ThemeData pinkThemeDark() {
    return ThemeData(
      colorScheme: _ColorScheme.pinkThemeDark(),
      textTheme: _TextTheme.pinkThemeDark(),
    );
  }

  static ThemeData purpleThemeLight() {
    return ThemeData(
      colorScheme: _ColorScheme.purpleThemeLight(),
      textTheme: _TextTheme.purpleThemeLight(),
    );
  }

  static ThemeData purpleThemeDark() {
    return ThemeData(
      colorScheme: _ColorScheme.purpleThemeDark(),
      textTheme: _TextTheme.purpleThemeDark(),
    );
  }
}

/// Initializes [ThemeData] for [MaterialApp] from JSN design tokens.
///
/// We encourage using JSN components for all needs. However, if there are
/// cases where an JSN component does not exist we ensure the Material
/// components look as similar to JSN as possible.
///
/// This theming is applied to [MaterialApp] out of the box when using
/// [JSNApp].
///
/// Note that there is no way to perfectly map JSN tokens to Material tokens,
/// hence when using components from outside JSN library make sure you
/// customize the theme based on the use-case.
///
/// See also:
///   * [JSNApp] - The equivalent of [MaterialApp] for JSN Design System.
class JSNMaterialTokens {
  const JSNMaterialTokens._({
    required this.theme,
    required this.darkTheme,
  });

  factory JSNMaterialTokens.jsnThemeLight() {
    return JSNMaterialTokens._(
      theme: _ThemeData.jsnThemeLight(),
      darkTheme: _ThemeData.jsnThemeDark(),
    );
  }

  factory JSNMaterialTokens.jsnThemeDark() {
    return JSNMaterialTokens._(
      theme: _ThemeData.jsnThemeLight(),
      darkTheme: _ThemeData.jsnThemeDark(),
    );
  }

  factory JSNMaterialTokens.greenThemeLight() {
    return JSNMaterialTokens._(
      theme: _ThemeData.greenThemeLight(),
      darkTheme: _ThemeData.greenThemeDark(),
    );
  }

  factory JSNMaterialTokens.greenThemeDark() {
    return JSNMaterialTokens._(
      theme: _ThemeData.greenThemeLight(),
      darkTheme: _ThemeData.greenThemeDark(),
    );
  }

  factory JSNMaterialTokens.pinkThemeLight() {
    return JSNMaterialTokens._(
      theme: _ThemeData.pinkThemeLight(),
      darkTheme: _ThemeData.pinkThemeDark(),
    );
  }

  factory JSNMaterialTokens.pinkThemeDark() {
    return JSNMaterialTokens._(
      theme: _ThemeData.pinkThemeLight(),
      darkTheme: _ThemeData.pinkThemeDark(),
    );
  }

  factory JSNMaterialTokens.purpleThemeLight() {
    return JSNMaterialTokens._(
      theme: _ThemeData.purpleThemeLight(),
      darkTheme: _ThemeData.purpleThemeDark(),
    );
  }

  factory JSNMaterialTokens.purpleThemeDark() {
    return JSNMaterialTokens._(
      theme: _ThemeData.purpleThemeLight(),
      darkTheme: _ThemeData.purpleThemeDark(),
    );
  }

  final ThemeData theme;
  final ThemeData darkTheme;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JSNMaterialTokens &&
          theme == other.theme &&
          darkTheme == other.darkTheme;

  @override
  int get hashCode => theme.hashCode ^ darkTheme.hashCode;
}

/// Holds all typography tokens for an JSN theme. Each factory constructor
/// initializes typography tokens for one of the JSN themes.
///
/// Using typography tokens directly in code is not encouraged. Instead use
/// predefined [TextStyle] from [JSNTheme], which are already configured
/// and much easier to use along wih Text widgets.
///
/// Consumers can get access to the typography tokens for the currently active
/// theme, example:
///
/// ```dart
/// JSNTypographyTokens tokens = JSNTheme.of(context).textTheme.tokens;
/// ```
///
/// See also:
///   * [JSNTextTheme] - Defines all text styles for JSN.
@immutable
class JSNTypographyTokens {
  const JSNTypographyTokens._({
    required this.bodyModerateActiveColor,
    required this.bodyModerateErrorColor,
    required this.bodyModerateInactiveColor,
    required this.bodyModerateInvertedColor,
    required this.bodyModerateStaticBlackColor,
    required this.bodyModerateStaticWhiteColor,
    required this.bodyModerateWarningColor,
    required this.bodyModerateDefaultColor,
    required this.bodyModerateFontFamily,
    required this.bodyModerateFontSize,
    required this.bodyModerateFontWeight,
    required this.bodyModerateLineHeight,
    required this.bodySmallActiveColor,
    required this.bodySmallErrorColor,
    required this.bodySmallInactiveColor,
    required this.bodySmallInvertedColor,
    required this.bodySmallStaticBlackColor,
    required this.bodySmallStaticWhiteColor,
    required this.bodySmallWarningColor,
    required this.bodySmallDefaultColor,
    required this.bodySmallFontFamily,
    required this.bodySmallFontSize,
    required this.bodySmallFontWeight,
    required this.bodySmallLineHeight,
    required this.captionModerateBookActiveColor,
    required this.captionModerateBookErrorColor,
    required this.captionModerateBookInactiveColor,
    required this.captionModerateBookInvertedColor,
    required this.captionModerateBookStaticBlackColor,
    required this.captionModerateBookStaticWhiteColor,
    required this.captionModerateBookWarningColor,
    required this.captionModerateBookDefaultColor,
    required this.captionModerateBookFontFamily,
    required this.captionModerateBookFontSize,
    required this.captionModerateBookFontWeight,
    required this.captionModerateBookLineHeight,
    required this.captionModerateDemiActiveColor,
    required this.captionModerateDemiErrorColor,
    required this.captionModerateDemiInactiveColor,
    required this.captionModerateDemiInvertedColor,
    required this.captionModerateDemiStaticBlackColor,
    required this.captionModerateDemiStaticWhiteColor,
    required this.captionModerateDemiWarningColor,
    required this.captionModerateDemiDefaultColor,
    required this.captionModerateDemiFontFamily,
    required this.captionModerateDemiFontSize,
    required this.captionModerateDemiFontWeight,
    required this.captionModerateDemiLineHeight,
    required this.captionSmallBookActiveColor,
    required this.captionSmallBookErrorColor,
    required this.captionSmallBookInactiveColor,
    required this.captionSmallBookInvertedColor,
    required this.captionSmallBookStaticBlackColor,
    required this.captionSmallBookStaticWhiteColor,
    required this.captionSmallBookWarningColor,
    required this.captionSmallBookDefaultColor,
    required this.captionSmallBookFontFamily,
    required this.captionSmallBookFontSize,
    required this.captionSmallBookFontWeight,
    required this.captionSmallBookLineHeight,
    required this.captionSmallDemiActiveColor,
    required this.captionSmallDemiErrorColor,
    required this.captionSmallDemiInactiveColor,
    required this.captionSmallDemiInvertedColor,
    required this.captionSmallDemiStaticBlackColor,
    required this.captionSmallDemiStaticWhiteColor,
    required this.captionSmallDemiWarningColor,
    required this.captionSmallDemiDefaultColor,
    required this.captionSmallDemiFontFamily,
    required this.captionSmallDemiFontSize,
    required this.captionSmallDemiFontWeight,
    required this.captionSmallDemiLineHeight,
    required this.titleExtraLargeActiveColor,
    required this.titleExtraLargeErrorColor,
    required this.titleExtraLargeInactiveColor,
    required this.titleExtraLargeInvertedColor,
    required this.titleExtraLargeStaticBlackColor,
    required this.titleExtraLargeStaticWhiteColor,
    required this.titleExtraLargeWarningColor,
    required this.titleExtraLargeDefaultColor,
    required this.titleExtraLargeFontFamily,
    required this.titleExtraLargeFontSize,
    required this.titleExtraLargeFontWeight,
    required this.titleExtraLargeLineHeight,
    required this.titleHeroActiveColor,
    required this.titleHeroErrorColor,
    required this.titleHeroInactiveColor,
    required this.titleHeroInvertedColor,
    required this.titleHeroStaticBlackColor,
    required this.titleHeroStaticWhiteColor,
    required this.titleHeroWarningColor,
    required this.titleHeroDefaultColor,
    required this.titleHeroFontFamily,
    required this.titleHeroFontSize,
    required this.titleHeroFontWeight,
    required this.titleHeroLineHeight,
    required this.titleLargeActiveColor,
    required this.titleLargeErrorColor,
    required this.titleLargeInactiveColor,
    required this.titleLargeInvertedColor,
    required this.titleLargeStaticBlackColor,
    required this.titleLargeStaticWhiteColor,
    required this.titleLargeWarningColor,
    required this.titleLargeDefaultColor,
    required this.titleLargeFontFamily,
    required this.titleLargeFontSize,
    required this.titleLargeFontWeight,
    required this.titleLargeLineHeight,
    required this.titleModerateBoldActiveColor,
    required this.titleModerateBoldErrorColor,
    required this.titleModerateBoldInactiveColor,
    required this.titleModerateBoldInvertedColor,
    required this.titleModerateBoldStaticBlackColor,
    required this.titleModerateBoldStaticWhiteColor,
    required this.titleModerateBoldWarningColor,
    required this.titleModerateBoldDefaultColor,
    required this.titleModerateBoldFontFamily,
    required this.titleModerateBoldFontSize,
    required this.titleModerateBoldFontWeight,
    required this.titleModerateBoldLineHeight,
    required this.titleModerateDemiActiveColor,
    required this.titleModerateDemiErrorColor,
    required this.titleModerateDemiInactiveColor,
    required this.titleModerateDemiInvertedColor,
    required this.titleModerateDemiStaticBlackColor,
    required this.titleModerateDemiStaticWhiteColor,
    required this.titleModerateDemiWarningColor,
    required this.titleModerateDemiDefaultColor,
    required this.titleModerateDemiFontFamily,
    required this.titleModerateDemiFontSize,
    required this.titleModerateDemiFontWeight,
    required this.titleModerateDemiLineHeight,
    required this.titleSmallBoldActiveColor,
    required this.titleSmallBoldErrorColor,
    required this.titleSmallBoldInactiveColor,
    required this.titleSmallBoldInvertedColor,
    required this.titleSmallBoldStaticBlackColor,
    required this.titleSmallBoldStaticWhiteColor,
    required this.titleSmallBoldWarningColor,
    required this.titleSmallBoldDefaultColor,
    required this.titleSmallBoldFontFamily,
    required this.titleSmallBoldFontSize,
    required this.titleSmallBoldFontWeight,
    required this.titleSmallBoldLineHeight,
    required this.titleSmallDemiActiveColor,
    required this.titleSmallDemiErrorColor,
    required this.titleSmallDemiInactiveColor,
    required this.titleSmallDemiInvertedColor,
    required this.titleSmallDemiStaticBlackColor,
    required this.titleSmallDemiStaticWhiteColor,
    required this.titleSmallDemiWarningColor,
    required this.titleSmallDemiDefaultColor,
    required this.titleSmallDemiFontFamily,
    required this.titleSmallDemiFontSize,
    required this.titleSmallDemiFontWeight,
    required this.titleSmallDemiLineHeight,
    required this.titleTinyBoldActiveColor,
    required this.titleTinyBoldErrorColor,
    required this.titleTinyBoldInactiveColor,
    required this.titleTinyBoldInvertedColor,
    required this.titleTinyBoldStaticBlackColor,
    required this.titleTinyBoldStaticWhiteColor,
    required this.titleTinyBoldWarningColor,
    required this.titleTinyBoldDefaultColor,
    required this.titleTinyBoldFontFamily,
    required this.titleTinyBoldFontSize,
    required this.titleTinyBoldFontWeight,
    required this.titleTinyBoldLineHeight,
    required this.titleTinyDemiActiveColor,
    required this.titleTinyDemiErrorColor,
    required this.titleTinyDemiInactiveColor,
    required this.titleTinyDemiInvertedColor,
    required this.titleTinyDemiStaticBlackColor,
    required this.titleTinyDemiStaticWhiteColor,
    required this.titleTinyDemiWarningColor,
    required this.titleTinyDemiDefaultColor,
    required this.titleTinyDemiFontFamily,
    required this.titleTinyDemiFontSize,
    required this.titleTinyDemiFontWeight,
    required this.titleTinyDemiLineHeight,
  });

  factory JSNTypographyTokens.jsnThemeDark() {
    return const JSNTypographyTokens._(
      bodyModerateActiveColor: Color(0xFF00CCFB),
      bodyModerateErrorColor: Color(0xFFFF323D),
      bodyModerateInactiveColor: Color(0xFF727A80),
      bodyModerateInvertedColor: Color(0xFF101214),
      bodyModerateStaticBlackColor: Color(0xFF101214),
      bodyModerateStaticWhiteColor: Color(0xFFFCFCFD),
      bodyModerateWarningColor: Color(0xFFFFA927),
      bodyModerateDefaultColor: Color(0xFFB2B5B9),
      bodyModerateFontFamily: "Rupa Sans",
      bodyModerateFontSize: 16,
      bodyModerateFontWeight: FontWeight.w400,
      bodyModerateLineHeight: 20,
      bodySmallActiveColor: Color(0xFF00CCFB),
      bodySmallErrorColor: Color(0xFFFF323D),
      bodySmallInactiveColor: Color(0xFF727A80),
      bodySmallInvertedColor: Color(0xFF101214),
      bodySmallStaticBlackColor: Color(0xFF101214),
      bodySmallStaticWhiteColor: Color(0xFFFCFCFD),
      bodySmallWarningColor: Color(0xFFFFA927),
      bodySmallDefaultColor: Color(0xFFB2B5B9),
      bodySmallFontFamily: "Rupa Sans",
      bodySmallFontSize: 14,
      bodySmallFontWeight: FontWeight.w400,
      bodySmallLineHeight: 20,
      captionModerateBookActiveColor: Color(0xFF00CCFB),
      captionModerateBookErrorColor: Color(0xFFFF323D),
      captionModerateBookInactiveColor: Color(0xFF727A80),
      captionModerateBookInvertedColor: Color(0xFF101214),
      captionModerateBookStaticBlackColor: Color(0xFF101214),
      captionModerateBookStaticWhiteColor: Color(0xFFFCFCFD),
      captionModerateBookWarningColor: Color(0xFFFFA927),
      captionModerateBookDefaultColor: Color(0xFFB2B5B9),
      captionModerateBookFontFamily: "Rupa Sans",
      captionModerateBookFontSize: 13,
      captionModerateBookFontWeight: FontWeight.w400,
      captionModerateBookLineHeight: 16,
      captionModerateDemiActiveColor: Color(0xFF00CCFB),
      captionModerateDemiErrorColor: Color(0xFFFF323D),
      captionModerateDemiInactiveColor: Color(0xFF727A80),
      captionModerateDemiInvertedColor: Color(0xFF101214),
      captionModerateDemiStaticBlackColor: Color(0xFF101214),
      captionModerateDemiStaticWhiteColor: Color(0xFFFCFCFD),
      captionModerateDemiWarningColor: Color(0xFFFFA927),
      captionModerateDemiDefaultColor: Color(0xFFB2B5B9),
      captionModerateDemiFontFamily: "Rupa Sans",
      captionModerateDemiFontSize: 13,
      captionModerateDemiFontWeight: FontWeight.w600,
      captionModerateDemiLineHeight: 16,
      captionSmallBookActiveColor: Color(0xFF00CCFB),
      captionSmallBookErrorColor: Color(0xFFFF323D),
      captionSmallBookInactiveColor: Color(0xFF727A80),
      captionSmallBookInvertedColor: Color(0xFF101214),
      captionSmallBookStaticBlackColor: Color(0xFF101214),
      captionSmallBookStaticWhiteColor: Color(0xFFFCFCFD),
      captionSmallBookWarningColor: Color(0xFFFFA927),
      captionSmallBookDefaultColor: Color(0xFFB2B5B9),
      captionSmallBookFontFamily: "Rupa Sans",
      captionSmallBookFontSize: 12,
      captionSmallBookFontWeight: FontWeight.w400,
      captionSmallBookLineHeight: 16,
      captionSmallDemiActiveColor: Color(0xFF00CCFB),
      captionSmallDemiErrorColor: Color(0xFFFF323D),
      captionSmallDemiInactiveColor: Color(0xFF727A80),
      captionSmallDemiInvertedColor: Color(0xFF101214),
      captionSmallDemiStaticBlackColor: Color(0xFF101214),
      captionSmallDemiStaticWhiteColor: Color(0xFFFCFCFD),
      captionSmallDemiWarningColor: Color(0xFFFFA927),
      captionSmallDemiDefaultColor: Color(0xFFB2B5B9),
      captionSmallDemiFontFamily: "Rupa Sans",
      captionSmallDemiFontSize: 12,
      captionSmallDemiFontWeight: FontWeight.w600,
      captionSmallDemiLineHeight: 16,
      titleExtraLargeActiveColor: Color(0xFF00CCFB),
      titleExtraLargeErrorColor: Color(0xFFFF323D),
      titleExtraLargeInactiveColor: Color(0xFF727A80),
      titleExtraLargeInvertedColor: Color(0xFF101214),
      titleExtraLargeStaticBlackColor: Color(0xFF101214),
      titleExtraLargeStaticWhiteColor: Color(0xFFFCFCFD),
      titleExtraLargeWarningColor: Color(0xFFFFA927),
      titleExtraLargeDefaultColor: Color(0xFFE3E5E8),
      titleExtraLargeFontFamily: "Rupa Serif",
      titleExtraLargeFontSize: 24,
      titleExtraLargeFontWeight: FontWeight.w600,
      titleExtraLargeLineHeight: 36,
      titleHeroActiveColor: Color(0xFF00CCFB),
      titleHeroErrorColor: Color(0xFFFF323D),
      titleHeroInactiveColor: Color(0xFF727A80),
      titleHeroInvertedColor: Color(0xFF101214),
      titleHeroStaticBlackColor: Color(0xFF101214),
      titleHeroStaticWhiteColor: Color(0xFFFCFCFD),
      titleHeroWarningColor: Color(0xFFFFA927),
      titleHeroDefaultColor: Color(0xFFE3E5E8),
      titleHeroFontFamily: "Rupa Serif",
      titleHeroFontSize: 28,
      titleHeroFontWeight: FontWeight.w600,
      titleHeroLineHeight: 44,
      titleLargeActiveColor: Color(0xFF00CCFB),
      titleLargeErrorColor: Color(0xFFFF323D),
      titleLargeInactiveColor: Color(0xFF727A80),
      titleLargeInvertedColor: Color(0xFF101214),
      titleLargeStaticBlackColor: Color(0xFF101214),
      titleLargeStaticWhiteColor: Color(0xFFFCFCFD),
      titleLargeWarningColor: Color(0xFFFFA927),
      titleLargeDefaultColor: Color(0xFFE3E5E8),
      titleLargeFontFamily: "Rupa Serif",
      titleLargeFontSize: 21,
      titleLargeFontWeight: FontWeight.w600,
      titleLargeLineHeight: 28,
      titleModerateBoldActiveColor: Color(0xFF00CCFB),
      titleModerateBoldErrorColor: Color(0xFFFF323D),
      titleModerateBoldInactiveColor: Color(0xFF727A80),
      titleModerateBoldInvertedColor: Color(0xFF101214),
      titleModerateBoldStaticBlackColor: Color(0xFF101214),
      titleModerateBoldStaticWhiteColor: Color(0xFFFCFCFD),
      titleModerateBoldWarningColor: Color(0xFFFFA927),
      titleModerateBoldDefaultColor: Color(0xFFE3E5E8),
      titleModerateBoldFontFamily: "Rupa Sans",
      titleModerateBoldFontSize: 18,
      titleModerateBoldFontWeight: FontWeight.w700,
      titleModerateBoldLineHeight: 24,
      titleModerateDemiActiveColor: Color(0xFF00CCFB),
      titleModerateDemiErrorColor: Color(0xFFFF323D),
      titleModerateDemiInactiveColor: Color(0xFF727A80),
      titleModerateDemiInvertedColor: Color(0xFF101214),
      titleModerateDemiStaticBlackColor: Color(0xFF101214),
      titleModerateDemiStaticWhiteColor: Color(0xFFFCFCFD),
      titleModerateDemiWarningColor: Color(0xFFFFA927),
      titleModerateDemiDefaultColor: Color(0xFFE3E5E8),
      titleModerateDemiFontFamily: "Rupa Sans",
      titleModerateDemiFontSize: 18,
      titleModerateDemiFontWeight: FontWeight.w600,
      titleModerateDemiLineHeight: 24,
      titleSmallBoldActiveColor: Color(0xFF00CCFB),
      titleSmallBoldErrorColor: Color(0xFFFF323D),
      titleSmallBoldInactiveColor: Color(0xFF727A80),
      titleSmallBoldInvertedColor: Color(0xFF101214),
      titleSmallBoldStaticBlackColor: Color(0xFF101214),
      titleSmallBoldStaticWhiteColor: Color(0xFFFCFCFD),
      titleSmallBoldWarningColor: Color(0xFFFFA927),
      titleSmallBoldDefaultColor: Color(0xFFE3E5E8),
      titleSmallBoldFontFamily: "Rupa Sans",
      titleSmallBoldFontSize: 16,
      titleSmallBoldFontWeight: FontWeight.w700,
      titleSmallBoldLineHeight: 20,
      titleSmallDemiActiveColor: Color(0xFF00CCFB),
      titleSmallDemiErrorColor: Color(0xFFFF323D),
      titleSmallDemiInactiveColor: Color(0xFF727A80),
      titleSmallDemiInvertedColor: Color(0xFF101214),
      titleSmallDemiStaticBlackColor: Color(0xFF101214),
      titleSmallDemiStaticWhiteColor: Color(0xFFFCFCFD),
      titleSmallDemiWarningColor: Color(0xFFFFA927),
      titleSmallDemiDefaultColor: Color(0xFFE3E5E8),
      titleSmallDemiFontFamily: "Rupa Sans",
      titleSmallDemiFontSize: 16,
      titleSmallDemiFontWeight: FontWeight.w600,
      titleSmallDemiLineHeight: 20,
      titleTinyBoldActiveColor: Color(0xFF00CCFB),
      titleTinyBoldErrorColor: Color(0xFFFF323D),
      titleTinyBoldInactiveColor: Color(0xFF727A80),
      titleTinyBoldInvertedColor: Color(0xFF101214),
      titleTinyBoldStaticBlackColor: Color(0xFF101214),
      titleTinyBoldStaticWhiteColor: Color(0xFFFCFCFD),
      titleTinyBoldWarningColor: Color(0xFFFFA927),
      titleTinyBoldDefaultColor: Color(0xFFB2B5B9),
      titleTinyBoldFontFamily: "Rupa Sans",
      titleTinyBoldFontSize: 14,
      titleTinyBoldFontWeight: FontWeight.w700,
      titleTinyBoldLineHeight: 20,
      titleTinyDemiActiveColor: Color(0xFF00CCFB),
      titleTinyDemiErrorColor: Color(0xFFFF323D),
      titleTinyDemiInactiveColor: Color(0xFF727A80),
      titleTinyDemiInvertedColor: Color(0xFF101214),
      titleTinyDemiStaticBlackColor: Color(0xFF101214),
      titleTinyDemiStaticWhiteColor: Color(0xFFFCFCFD),
      titleTinyDemiWarningColor: Color(0xFFFFA927),
      titleTinyDemiDefaultColor: Color(0xFFE3E5E8),
      titleTinyDemiFontFamily: "Rupa Sans",
      titleTinyDemiFontSize: 14,
      titleTinyDemiFontWeight: FontWeight.w600,
      titleTinyDemiLineHeight: 20,
    );
  }

  factory JSNTypographyTokens.jsnThemeLight() {
    return const JSNTypographyTokens._(
      bodyModerateActiveColor: Color(0xFF00CCFB),
      bodyModerateErrorColor: Color(0xFFDA5858),
      bodyModerateInactiveColor: Color(0xFF949EA8),
      bodyModerateInvertedColor: Color(0xFFFCFCFD),
      bodyModerateStaticBlackColor: Color(0xFF1E2125),
      bodyModerateStaticWhiteColor: Color(0xFFFCFCFD),
      bodyModerateWarningColor: Color(0xFFBD5204),
      bodyModerateDefaultColor: Color(0xFF616E7A),
      bodyModerateFontFamily: "Rupa Sans",
      bodyModerateFontSize: 16,
      bodyModerateFontWeight: FontWeight.w400,
      bodyModerateLineHeight: 20,
      bodySmallActiveColor: Color(0xFF00CCFB),
      bodySmallErrorColor: Color(0xFFDA5858),
      bodySmallInactiveColor: Color(0xFF949EA8),
      bodySmallInvertedColor: Color(0xFFFCFCFD),
      bodySmallStaticBlackColor: Color(0xFF1E2125),
      bodySmallStaticWhiteColor: Color(0xFFFCFCFD),
      bodySmallWarningColor: Color(0xFFBD5204),
      bodySmallDefaultColor: Color(0xFF616E7A),
      bodySmallFontFamily: "Rupa Sans",
      bodySmallFontSize: 14,
      bodySmallFontWeight: FontWeight.w400,
      bodySmallLineHeight: 20,
      captionModerateBookActiveColor: Color(0xFF00CCFB),
      captionModerateBookErrorColor: Color(0xFFDA5858),
      captionModerateBookInactiveColor: Color(0xFF949EA8),
      captionModerateBookInvertedColor: Color(0xFFFCFCFD),
      captionModerateBookStaticBlackColor: Color(0xFF1E2125),
      captionModerateBookStaticWhiteColor: Color(0xFFFCFCFD),
      captionModerateBookWarningColor: Color(0xFFBD5204),
      captionModerateBookDefaultColor: Color(0xFF616E7A),
      captionModerateBookFontFamily: "Rupa Sans",
      captionModerateBookFontSize: 13,
      captionModerateBookFontWeight: FontWeight.w400,
      captionModerateBookLineHeight: 16,
      captionModerateDemiActiveColor: Color(0xFF00CCFB),
      captionModerateDemiErrorColor: Color(0xFFDA5858),
      captionModerateDemiInactiveColor: Color(0xFF949EA8),
      captionModerateDemiInvertedColor: Color(0xFFFCFCFD),
      captionModerateDemiStaticBlackColor: Color(0xFF1E2125),
      captionModerateDemiStaticWhiteColor: Color(0xFFFCFCFD),
      captionModerateDemiWarningColor: Color(0xFFBD5204),
      captionModerateDemiDefaultColor: Color(0xFF616E7A),
      captionModerateDemiFontFamily: "Rupa Sans",
      captionModerateDemiFontSize: 13,
      captionModerateDemiFontWeight: FontWeight.w600,
      captionModerateDemiLineHeight: 16,
      captionSmallBookActiveColor: Color(0xFF00CCFB),
      captionSmallBookErrorColor: Color(0xFFDA5858),
      captionSmallBookInactiveColor: Color(0xFF949EA8),
      captionSmallBookInvertedColor: Color(0xFFFCFCFD),
      captionSmallBookStaticBlackColor: Color(0xFF1E2125),
      captionSmallBookStaticWhiteColor: Color(0xFFFCFCFD),
      captionSmallBookWarningColor: Color(0xFFBD5204),
      captionSmallBookDefaultColor: Color(0xFF616E7A),
      captionSmallBookFontFamily: "Rupa Sans",
      captionSmallBookFontSize: 12,
      captionSmallBookFontWeight: FontWeight.w400,
      captionSmallBookLineHeight: 16,
      captionSmallDemiActiveColor: Color(0xFF00CCFB),
      captionSmallDemiErrorColor: Color(0xFFDA5858),
      captionSmallDemiInactiveColor: Color(0xFF949EA8),
      captionSmallDemiInvertedColor: Color(0xFFFCFCFD),
      captionSmallDemiStaticBlackColor: Color(0xFF1E2125),
      captionSmallDemiStaticWhiteColor: Color(0xFFFCFCFD),
      captionSmallDemiWarningColor: Color(0xFFBD5204),
      captionSmallDemiDefaultColor: Color(0xFF616E7A),
      captionSmallDemiFontFamily: "Rupa Sans",
      captionSmallDemiFontSize: 12,
      captionSmallDemiFontWeight: FontWeight.w600,
      captionSmallDemiLineHeight: 16,
      titleExtraLargeActiveColor: Color(0xFF00CCFB),
      titleExtraLargeErrorColor: Color(0xFFDA5858),
      titleExtraLargeInactiveColor: Color(0xFF949EA8),
      titleExtraLargeInvertedColor: Color(0xFFFCFCFD),
      titleExtraLargeStaticBlackColor: Color(0xFF1E2125),
      titleExtraLargeStaticWhiteColor: Color(0xFFFCFCFD),
      titleExtraLargeWarningColor: Color(0xFFBD5204),
      titleExtraLargeDefaultColor: Color(0xFF1E2225),
      titleExtraLargeFontFamily: "Rupa Serif",
      titleExtraLargeFontSize: 24,
      titleExtraLargeFontWeight: FontWeight.w600,
      titleExtraLargeLineHeight: 36,
      titleHeroActiveColor: Color(0xFF00CCFB),
      titleHeroErrorColor: Color(0xFFDA5858),
      titleHeroInactiveColor: Color(0xFF949EA8),
      titleHeroInvertedColor: Color(0xFFFCFCFD),
      titleHeroStaticBlackColor: Color(0xFF1E2125),
      titleHeroStaticWhiteColor: Color(0xFFFCFCFD),
      titleHeroWarningColor: Color(0xFFBD5204),
      titleHeroDefaultColor: Color(0xFF1E2225),
      titleHeroFontFamily: "Rupa Serif",
      titleHeroFontSize: 28,
      titleHeroFontWeight: FontWeight.w600,
      titleHeroLineHeight: 44,
      titleLargeActiveColor: Color(0xFF00CCFB),
      titleLargeErrorColor: Color(0xFFDA5858),
      titleLargeInactiveColor: Color(0xFF949EA8),
      titleLargeInvertedColor: Color(0xFFFCFCFD),
      titleLargeStaticBlackColor: Color(0xFF1E2125),
      titleLargeStaticWhiteColor: Color(0xFFFCFCFD),
      titleLargeWarningColor: Color(0xFFBD5204),
      titleLargeDefaultColor: Color(0xFF1E2225),
      titleLargeFontFamily: "Rupa Serif",
      titleLargeFontSize: 21,
      titleLargeFontWeight: FontWeight.w600,
      titleLargeLineHeight: 28,
      titleModerateBoldActiveColor: Color(0xFF00CCFB),
      titleModerateBoldErrorColor: Color(0xFFDA5858),
      titleModerateBoldInactiveColor: Color(0xFF949EA8),
      titleModerateBoldInvertedColor: Color(0xFFFCFCFD),
      titleModerateBoldStaticBlackColor: Color(0xFF1E2125),
      titleModerateBoldStaticWhiteColor: Color(0xFFFCFCFD),
      titleModerateBoldWarningColor: Color(0xFFBD5204),
      titleModerateBoldDefaultColor: Color(0xFF1E2225),
      titleModerateBoldFontFamily: "Rupa Sans",
      titleModerateBoldFontSize: 18,
      titleModerateBoldFontWeight: FontWeight.w700,
      titleModerateBoldLineHeight: 24,
      titleModerateDemiActiveColor: Color(0xFF00CCFB),
      titleModerateDemiErrorColor: Color(0xFFDA5858),
      titleModerateDemiInactiveColor: Color(0xFF949EA8),
      titleModerateDemiInvertedColor: Color(0xFFFCFCFD),
      titleModerateDemiStaticBlackColor: Color(0xFF1E2125),
      titleModerateDemiStaticWhiteColor: Color(0xFFFCFCFD),
      titleModerateDemiWarningColor: Color(0xFFBD5204),
      titleModerateDemiDefaultColor: Color(0xFF1E2225),
      titleModerateDemiFontFamily: "Rupa Sans",
      titleModerateDemiFontSize: 18,
      titleModerateDemiFontWeight: FontWeight.w600,
      titleModerateDemiLineHeight: 24,
      titleSmallBoldActiveColor: Color(0xFF00CCFB),
      titleSmallBoldErrorColor: Color(0xFFDA5858),
      titleSmallBoldInactiveColor: Color(0xFF949EA8),
      titleSmallBoldInvertedColor: Color(0xFFFCFCFD),
      titleSmallBoldStaticBlackColor: Color(0xFF1E2125),
      titleSmallBoldStaticWhiteColor: Color(0xFFFCFCFD),
      titleSmallBoldWarningColor: Color(0xFFBD5204),
      titleSmallBoldDefaultColor: Color(0xFF1E2225),
      titleSmallBoldFontFamily: "Rupa Sans",
      titleSmallBoldFontSize: 16,
      titleSmallBoldFontWeight: FontWeight.w700,
      titleSmallBoldLineHeight: 20,
      titleSmallDemiActiveColor: Color(0xFF00CCFB),
      titleSmallDemiErrorColor: Color(0xFFDA5858),
      titleSmallDemiInactiveColor: Color(0xFF949EA8),
      titleSmallDemiInvertedColor: Color(0xFFFCFCFD),
      titleSmallDemiStaticBlackColor: Color(0xFF1E2125),
      titleSmallDemiStaticWhiteColor: Color(0xFFFCFCFD),
      titleSmallDemiWarningColor: Color(0xFFBD5204),
      titleSmallDemiDefaultColor: Color(0xFF1E2225),
      titleSmallDemiFontFamily: "Rupa Sans",
      titleSmallDemiFontSize: 16,
      titleSmallDemiFontWeight: FontWeight.w600,
      titleSmallDemiLineHeight: 20,
      titleTinyBoldActiveColor: Color(0xFF00CCFB),
      titleTinyBoldErrorColor: Color(0xFFDA5858),
      titleTinyBoldInactiveColor: Color(0xFF949EA8),
      titleTinyBoldInvertedColor: Color(0xFF76819B),
      titleTinyBoldStaticBlackColor: Color(0xFF1E2125),
      titleTinyBoldStaticWhiteColor: Color(0xFFFCFCFD),
      titleTinyBoldWarningColor: Color(0xFFBD5204),
      titleTinyBoldDefaultColor: Color(0xFF202C42),
      titleTinyBoldFontFamily: "Rupa Sans",
      titleTinyBoldFontSize: 14,
      titleTinyBoldFontWeight: FontWeight.w700,
      titleTinyBoldLineHeight: 20,
      titleTinyDemiActiveColor: Color(0xFF00CCFB),
      titleTinyDemiErrorColor: Color(0xFFDA5858),
      titleTinyDemiInactiveColor: Color(0xFF949EA8),
      titleTinyDemiInvertedColor: Color(0xFFFCFCFD),
      titleTinyDemiStaticBlackColor: Color(0xFF1E2125),
      titleTinyDemiStaticWhiteColor: Color(0xFFFCFCFD),
      titleTinyDemiWarningColor: Color(0xFFBD5204),
      titleTinyDemiDefaultColor: Color(0xFF1E2225),
      titleTinyDemiFontFamily: "Rupa Sans",
      titleTinyDemiFontSize: 14,
      titleTinyDemiFontWeight: FontWeight.w600,
      titleTinyDemiLineHeight: 20,
    );
  }

  factory JSNTypographyTokens.greenThemeDark() {
    return const JSNTypographyTokens._(
      bodyModerateActiveColor: Color(0xFF00990F),
      bodyModerateErrorColor: Color(0xFFFF2E4A),
      bodyModerateInactiveColor: Color(0xFF757575),
      bodyModerateInvertedColor: Color(0xFF0F0F0F),
      bodyModerateStaticBlackColor: Color(0xFF0F0F0F),
      bodyModerateStaticWhiteColor: Color(0xFFFFFFFF),
      bodyModerateWarningColor: Color(0xFFFFAB2E),
      bodyModerateDefaultColor: Color(0xFFBCBDBD),
      bodyModerateFontFamily: "Maison Neue APP",
      bodyModerateFontSize: 16,
      bodyModerateFontWeight: FontWeight.w400,
      bodyModerateLineHeight: 20,
      bodySmallActiveColor: Color(0xFF00990F),
      bodySmallErrorColor: Color(0xFFFF2E4A),
      bodySmallInactiveColor: Color(0xFF757575),
      bodySmallInvertedColor: Color(0xFF0F0F0F),
      bodySmallStaticBlackColor: Color(0xFF0F0F0F),
      bodySmallStaticWhiteColor: Color(0xFFFFFFFF),
      bodySmallWarningColor: Color(0xFFFFAB2E),
      bodySmallDefaultColor: Color(0xFFBCBDBD),
      bodySmallFontFamily: "Maison Neue APP",
      bodySmallFontSize: 14,
      bodySmallFontWeight: FontWeight.w400,
      bodySmallLineHeight: 20,
      captionModerateBookActiveColor: Color(0xFF00990F),
      captionModerateBookErrorColor: Color(0xFFFF2E4A),
      captionModerateBookInactiveColor: Color(0xFF757575),
      captionModerateBookInvertedColor: Color(0xFF0F0F0F),
      captionModerateBookStaticBlackColor: Color(0xFF0F0F0F),
      captionModerateBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateBookWarningColor: Color(0xFFFFAB2E),
      captionModerateBookDefaultColor: Color(0xFFBCBDBD),
      captionModerateBookFontFamily: "Maison Neue APP",
      captionModerateBookFontSize: 13,
      captionModerateBookFontWeight: FontWeight.w400,
      captionModerateBookLineHeight: 16,
      captionModerateDemiActiveColor: Color(0xFF00990F),
      captionModerateDemiErrorColor: Color(0xFFFF2E4A),
      captionModerateDemiInactiveColor: Color(0xFF757575),
      captionModerateDemiInvertedColor: Color(0xFF0F0F0F),
      captionModerateDemiStaticBlackColor: Color(0xFF0F0F0F),
      captionModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateDemiWarningColor: Color(0xFFFFAB2E),
      captionModerateDemiDefaultColor: Color(0xFFBCBDBD),
      captionModerateDemiFontFamily: "Maison Neue APP",
      captionModerateDemiFontSize: 13,
      captionModerateDemiFontWeight: FontWeight.w600,
      captionModerateDemiLineHeight: 16,
      captionSmallBookActiveColor: Color(0xFF00990F),
      captionSmallBookErrorColor: Color(0xFFFF2E4A),
      captionSmallBookInactiveColor: Color(0xFF757575),
      captionSmallBookInvertedColor: Color(0xFF0F0F0F),
      captionSmallBookStaticBlackColor: Color(0xFF0F0F0F),
      captionSmallBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallBookWarningColor: Color(0xFFFFAB2E),
      captionSmallBookDefaultColor: Color(0xFFBCBDBD),
      captionSmallBookFontFamily: "Maison Neue APP",
      captionSmallBookFontSize: 12,
      captionSmallBookFontWeight: FontWeight.w400,
      captionSmallBookLineHeight: 16,
      captionSmallDemiActiveColor: Color(0xFF00990F),
      captionSmallDemiErrorColor: Color(0xFFFF2E4A),
      captionSmallDemiInactiveColor: Color(0xFF757575),
      captionSmallDemiInvertedColor: Color(0xFF0F0F0F),
      captionSmallDemiStaticBlackColor: Color(0xFF0F0F0F),
      captionSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallDemiWarningColor: Color(0xFFFFAB2E),
      captionSmallDemiDefaultColor: Color(0xFFBCBDBD),
      captionSmallDemiFontFamily: "Maison Neue APP",
      captionSmallDemiFontSize: 12,
      captionSmallDemiFontWeight: FontWeight.w600,
      captionSmallDemiLineHeight: 16,
      titleExtraLargeActiveColor: Color(0xFF00990F),
      titleExtraLargeErrorColor: Color(0xFFFF2E4A),
      titleExtraLargeInactiveColor: Color(0xFF757575),
      titleExtraLargeInvertedColor: Color(0xFF0F0F0F),
      titleExtraLargeStaticBlackColor: Color(0xFF0F0F0F),
      titleExtraLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleExtraLargeWarningColor: Color(0xFFFFAB2E),
      titleExtraLargeDefaultColor: Color(0xFFFFFFFF),
      titleExtraLargeFontFamily: "Maison Neue APP",
      titleExtraLargeFontSize: 24,
      titleExtraLargeFontWeight: FontWeight.w700,
      titleExtraLargeLineHeight: 36,
      titleHeroActiveColor: Color(0xFF00990F),
      titleHeroErrorColor: Color(0xFFFF2E4A),
      titleHeroInactiveColor: Color(0xFF757575),
      titleHeroInvertedColor: Color(0xFF0F0F0F),
      titleHeroStaticBlackColor: Color(0xFF0F0F0F),
      titleHeroStaticWhiteColor: Color(0xFFFFFFFF),
      titleHeroWarningColor: Color(0xFFFFAB2E),
      titleHeroDefaultColor: Color(0xFFFFFFFF),
      titleHeroFontFamily: "Maison Neue APP",
      titleHeroFontSize: 28,
      titleHeroFontWeight: FontWeight.w700,
      titleHeroLineHeight: 44,
      titleLargeActiveColor: Color(0xFF00990F),
      titleLargeErrorColor: Color(0xFFFF2E4A),
      titleLargeInactiveColor: Color(0xFF757575),
      titleLargeInvertedColor: Color(0xFF0F0F0F),
      titleLargeStaticBlackColor: Color(0xFF0F0F0F),
      titleLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleLargeWarningColor: Color(0xFFFFAB2E),
      titleLargeDefaultColor: Color(0xFFFFFFFF),
      titleLargeFontFamily: "Maison Neue APP",
      titleLargeFontSize: 21,
      titleLargeFontWeight: FontWeight.w700,
      titleLargeLineHeight: 28,
      titleModerateBoldActiveColor: Color(0xFF00990F),
      titleModerateBoldErrorColor: Color(0xFFFF2E4A),
      titleModerateBoldInactiveColor: Color(0xFF757575),
      titleModerateBoldInvertedColor: Color(0xFF0F0F0F),
      titleModerateBoldStaticBlackColor: Color(0xFF0F0F0F),
      titleModerateBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateBoldWarningColor: Color(0xFFFFAB2E),
      titleModerateBoldDefaultColor: Color(0xFFFFFFFF),
      titleModerateBoldFontFamily: "Maison Neue APP",
      titleModerateBoldFontSize: 18,
      titleModerateBoldFontWeight: FontWeight.w700,
      titleModerateBoldLineHeight: 24,
      titleModerateDemiActiveColor: Color(0xFF00990F),
      titleModerateDemiErrorColor: Color(0xFFFF2E4A),
      titleModerateDemiInactiveColor: Color(0xFF757575),
      titleModerateDemiInvertedColor: Color(0xFF0F0F0F),
      titleModerateDemiStaticBlackColor: Color(0xFF0F0F0F),
      titleModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateDemiWarningColor: Color(0xFFFFAB2E),
      titleModerateDemiDefaultColor: Color(0xFFFFFFFF),
      titleModerateDemiFontFamily: "Maison Neue APP",
      titleModerateDemiFontSize: 18,
      titleModerateDemiFontWeight: FontWeight.w600,
      titleModerateDemiLineHeight: 24,
      titleSmallBoldActiveColor: Color(0xFF00990F),
      titleSmallBoldErrorColor: Color(0xFFFF2E4A),
      titleSmallBoldInactiveColor: Color(0xFF757575),
      titleSmallBoldInvertedColor: Color(0xFF0F0F0F),
      titleSmallBoldStaticBlackColor: Color(0xFF0F0F0F),
      titleSmallBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallBoldWarningColor: Color(0xFFFFAB2E),
      titleSmallBoldDefaultColor: Color(0xFFFFFFFF),
      titleSmallBoldFontFamily: "Maison Neue APP",
      titleSmallBoldFontSize: 16,
      titleSmallBoldFontWeight: FontWeight.w700,
      titleSmallBoldLineHeight: 20,
      titleSmallDemiActiveColor: Color(0xFF00990F),
      titleSmallDemiErrorColor: Color(0xFFFF2E4A),
      titleSmallDemiInactiveColor: Color(0xFF757575),
      titleSmallDemiInvertedColor: Color(0xFF0F0F0F),
      titleSmallDemiStaticBlackColor: Color(0xFF0F0F0F),
      titleSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallDemiWarningColor: Color(0xFFFFAB2E),
      titleSmallDemiDefaultColor: Color(0xFFFFFFFF),
      titleSmallDemiFontFamily: "Maison Neue APP",
      titleSmallDemiFontSize: 16,
      titleSmallDemiFontWeight: FontWeight.w600,
      titleSmallDemiLineHeight: 20,
      titleTinyBoldActiveColor: Color(0xFF00990F),
      titleTinyBoldErrorColor: Color(0xFFFF2E4A),
      titleTinyBoldInactiveColor: Color(0xFF757575),
      titleTinyBoldInvertedColor: Color(0xFF0F0F0F),
      titleTinyBoldStaticBlackColor: Color(0xFF0F0F0F),
      titleTinyBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyBoldWarningColor: Color(0xFFFFAB2E),
      titleTinyBoldDefaultColor: Color(0xFFFFFFFF),
      titleTinyBoldFontFamily: "Maison Neue APP",
      titleTinyBoldFontSize: 14,
      titleTinyBoldFontWeight: FontWeight.w700,
      titleTinyBoldLineHeight: 20,
      titleTinyDemiActiveColor: Color(0xFF00990F),
      titleTinyDemiErrorColor: Color(0xFFFF2E4A),
      titleTinyDemiInactiveColor: Color(0xFF757575),
      titleTinyDemiInvertedColor: Color(0xFF0F0F0F),
      titleTinyDemiStaticBlackColor: Color(0xFF0F0F0F),
      titleTinyDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyDemiWarningColor: Color(0xFFFFAB2E),
      titleTinyDemiDefaultColor: Color(0xFFFFFFFF),
      titleTinyDemiFontFamily: "Maison Neue APP",
      titleTinyDemiFontSize: 14,
      titleTinyDemiFontWeight: FontWeight.w600,
      titleTinyDemiLineHeight: 20,
    );
  }

  factory JSNTypographyTokens.greenThemeLight() {
    return const JSNTypographyTokens._(
      bodyModerateActiveColor: Color(0xFF00700B),
      bodyModerateErrorColor: Color(0xFFC7001B),
      bodyModerateInactiveColor: Color(0xFF757575),
      bodyModerateInvertedColor: Color(0xFFFFFFFF),
      bodyModerateStaticBlackColor: Color(0xFF1C1D1D),
      bodyModerateStaticWhiteColor: Color(0xFFFFFFFF),
      bodyModerateWarningColor: Color(0xFFA54703),
      bodyModerateDefaultColor: Color(0xFF494A4A),
      bodyModerateFontFamily: "Maison Neue APP",
      bodyModerateFontSize: 16,
      bodyModerateFontWeight: FontWeight.w400,
      bodyModerateLineHeight: 20,
      bodySmallActiveColor: Color(0xFF00700B),
      bodySmallErrorColor: Color(0xFFC7001B),
      bodySmallInactiveColor: Color(0xFF757575),
      bodySmallInvertedColor: Color(0xFFFFFFFF),
      bodySmallStaticBlackColor: Color(0xFF1C1D1D),
      bodySmallStaticWhiteColor: Color(0xFFFFFFFF),
      bodySmallWarningColor: Color(0xFFA54703),
      bodySmallDefaultColor: Color(0xFF494A4A),
      bodySmallFontFamily: "Maison Neue APP",
      bodySmallFontSize: 14,
      bodySmallFontWeight: FontWeight.w400,
      bodySmallLineHeight: 20,
      captionModerateBookActiveColor: Color(0xFF00700B),
      captionModerateBookErrorColor: Color(0xFFC7001B),
      captionModerateBookInactiveColor: Color(0xFF757575),
      captionModerateBookInvertedColor: Color(0xFFFFFFFF),
      captionModerateBookStaticBlackColor: Color(0xFF1C1D1D),
      captionModerateBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateBookWarningColor: Color(0xFFA54703),
      captionModerateBookDefaultColor: Color(0xFF494A4A),
      captionModerateBookFontFamily: "Maison Neue APP",
      captionModerateBookFontSize: 13,
      captionModerateBookFontWeight: FontWeight.w400,
      captionModerateBookLineHeight: 16,
      captionModerateDemiActiveColor: Color(0xFF00700B),
      captionModerateDemiErrorColor: Color(0xFFC7001B),
      captionModerateDemiInactiveColor: Color(0xFF757575),
      captionModerateDemiInvertedColor: Color(0xFFFFFFFF),
      captionModerateDemiStaticBlackColor: Color(0xFF1C1D1D),
      captionModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateDemiWarningColor: Color(0xFFA54703),
      captionModerateDemiDefaultColor: Color(0xFF494A4A),
      captionModerateDemiFontFamily: "Maison Neue APP",
      captionModerateDemiFontSize: 13,
      captionModerateDemiFontWeight: FontWeight.w600,
      captionModerateDemiLineHeight: 16,
      captionSmallBookActiveColor: Color(0xFF00700B),
      captionSmallBookErrorColor: Color(0xFFC7001B),
      captionSmallBookInactiveColor: Color(0xFF757575),
      captionSmallBookInvertedColor: Color(0xFFFFFFFF),
      captionSmallBookStaticBlackColor: Color(0xFF1C1D1D),
      captionSmallBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallBookWarningColor: Color(0xFFA54703),
      captionSmallBookDefaultColor: Color(0xFF494A4A),
      captionSmallBookFontFamily: "Maison Neue APP",
      captionSmallBookFontSize: 12,
      captionSmallBookFontWeight: FontWeight.w400,
      captionSmallBookLineHeight: 16,
      captionSmallDemiActiveColor: Color(0xFF00700B),
      captionSmallDemiErrorColor: Color(0xFFC7001B),
      captionSmallDemiInactiveColor: Color(0xFF757575),
      captionSmallDemiInvertedColor: Color(0xFFFFFFFF),
      captionSmallDemiStaticBlackColor: Color(0xFF1C1D1D),
      captionSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallDemiWarningColor: Color(0xFFA54703),
      captionSmallDemiDefaultColor: Color(0xFF494A4A),
      captionSmallDemiFontFamily: "Maison Neue APP",
      captionSmallDemiFontSize: 12,
      captionSmallDemiFontWeight: FontWeight.w600,
      captionSmallDemiLineHeight: 16,
      titleExtraLargeActiveColor: Color(0xFF00700B),
      titleExtraLargeErrorColor: Color(0xFFC7001B),
      titleExtraLargeInactiveColor: Color(0xFF757575),
      titleExtraLargeInvertedColor: Color(0xFFFFFFFF),
      titleExtraLargeStaticBlackColor: Color(0xFF1C1D1D),
      titleExtraLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleExtraLargeWarningColor: Color(0xFFA54703),
      titleExtraLargeDefaultColor: Color(0xFF1C1D1D),
      titleExtraLargeFontFamily: "Maison Neue APP",
      titleExtraLargeFontSize: 24,
      titleExtraLargeFontWeight: FontWeight.w700,
      titleExtraLargeLineHeight: 36,
      titleHeroActiveColor: Color(0xFF00700B),
      titleHeroErrorColor: Color(0xFFC7001B),
      titleHeroInactiveColor: Color(0xFF757575),
      titleHeroInvertedColor: Color(0xFFFFFFFF),
      titleHeroStaticBlackColor: Color(0xFF1C1D1D),
      titleHeroStaticWhiteColor: Color(0xFFFFFFFF),
      titleHeroWarningColor: Color(0xFFA54703),
      titleHeroDefaultColor: Color(0xFF1C1D1D),
      titleHeroFontFamily: "Maison Neue APP",
      titleHeroFontSize: 28,
      titleHeroFontWeight: FontWeight.w700,
      titleHeroLineHeight: 44,
      titleLargeActiveColor: Color(0xFF00700B),
      titleLargeErrorColor: Color(0xFFC7001B),
      titleLargeInactiveColor: Color(0xFF757575),
      titleLargeInvertedColor: Color(0xFFFFFFFF),
      titleLargeStaticBlackColor: Color(0xFF1C1D1D),
      titleLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleLargeWarningColor: Color(0xFFA54703),
      titleLargeDefaultColor: Color(0xFF1C1D1D),
      titleLargeFontFamily: "Maison Neue APP",
      titleLargeFontSize: 21,
      titleLargeFontWeight: FontWeight.w700,
      titleLargeLineHeight: 28,
      titleModerateBoldActiveColor: Color(0xFF00700B),
      titleModerateBoldErrorColor: Color(0xFFC7001B),
      titleModerateBoldInactiveColor: Color(0xFF757575),
      titleModerateBoldInvertedColor: Color(0xFFFFFFFF),
      titleModerateBoldStaticBlackColor: Color(0xFF1C1D1D),
      titleModerateBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateBoldWarningColor: Color(0xFFA54703),
      titleModerateBoldDefaultColor: Color(0xFF1C1D1D),
      titleModerateBoldFontFamily: "Maison Neue APP",
      titleModerateBoldFontSize: 18,
      titleModerateBoldFontWeight: FontWeight.w700,
      titleModerateBoldLineHeight: 24,
      titleModerateDemiActiveColor: Color(0xFF00700B),
      titleModerateDemiErrorColor: Color(0xFFC7001B),
      titleModerateDemiInactiveColor: Color(0xFF757575),
      titleModerateDemiInvertedColor: Color(0xFFFFFFFF),
      titleModerateDemiStaticBlackColor: Color(0xFF1C1D1D),
      titleModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateDemiWarningColor: Color(0xFFA54703),
      titleModerateDemiDefaultColor: Color(0xFF1C1D1D),
      titleModerateDemiFontFamily: "Maison Neue APP",
      titleModerateDemiFontSize: 18,
      titleModerateDemiFontWeight: FontWeight.w600,
      titleModerateDemiLineHeight: 24,
      titleSmallBoldActiveColor: Color(0xFF00700B),
      titleSmallBoldErrorColor: Color(0xFFC7001B),
      titleSmallBoldInactiveColor: Color(0xFF757575),
      titleSmallBoldInvertedColor: Color(0xFFFFFFFF),
      titleSmallBoldStaticBlackColor: Color(0xFF1C1D1D),
      titleSmallBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallBoldWarningColor: Color(0xFFA54703),
      titleSmallBoldDefaultColor: Color(0xFF1C1D1D),
      titleSmallBoldFontFamily: "Maison Neue APP",
      titleSmallBoldFontSize: 16,
      titleSmallBoldFontWeight: FontWeight.w700,
      titleSmallBoldLineHeight: 20,
      titleSmallDemiActiveColor: Color(0xFF00700B),
      titleSmallDemiErrorColor: Color(0xFFC7001B),
      titleSmallDemiInactiveColor: Color(0xFF757575),
      titleSmallDemiInvertedColor: Color(0xFFFFFFFF),
      titleSmallDemiStaticBlackColor: Color(0xFF1C1D1D),
      titleSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallDemiWarningColor: Color(0xFFA54703),
      titleSmallDemiDefaultColor: Color(0xFF1C1D1D),
      titleSmallDemiFontFamily: "Maison Neue APP",
      titleSmallDemiFontSize: 16,
      titleSmallDemiFontWeight: FontWeight.w600,
      titleSmallDemiLineHeight: 20,
      titleTinyBoldActiveColor: Color(0xFF00700B),
      titleTinyBoldErrorColor: Color(0xFFC7001B),
      titleTinyBoldInactiveColor: Color(0xFF757575),
      titleTinyBoldInvertedColor: Color(0xFFFFFFFF),
      titleTinyBoldStaticBlackColor: Color(0xFF1C1D1D),
      titleTinyBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyBoldWarningColor: Color(0xFFA54703),
      titleTinyBoldDefaultColor: Color(0xFF1C1D1D),
      titleTinyBoldFontFamily: "Maison Neue APP",
      titleTinyBoldFontSize: 14,
      titleTinyBoldFontWeight: FontWeight.w700,
      titleTinyBoldLineHeight: 20,
      titleTinyDemiActiveColor: Color(0xFF00700B),
      titleTinyDemiErrorColor: Color(0xFFC7001B),
      titleTinyDemiInactiveColor: Color(0xFF757575),
      titleTinyDemiInvertedColor: Color(0xFFFFFFFF),
      titleTinyDemiStaticBlackColor: Color(0xFF1C1D1D),
      titleTinyDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyDemiWarningColor: Color(0xFFA54703),
      titleTinyDemiDefaultColor: Color(0xFF1C1D1D),
      titleTinyDemiFontFamily: "Maison Neue APP",
      titleTinyDemiFontSize: 14,
      titleTinyDemiFontWeight: FontWeight.w600,
      titleTinyDemiLineHeight: 20,
    );
  }

  factory JSNTypographyTokens.pinkThemeDark() {
    return const JSNTypographyTokens._(
      bodyModerateActiveColor: Color(0xFFD4549C),
      bodyModerateErrorColor: Color(0xFFFF2E4A),
      bodyModerateInactiveColor: Color(0xFF757575),
      bodyModerateInvertedColor: Color(0xFF0F0F0F),
      bodyModerateStaticBlackColor: Color(0xFF0F0F0F),
      bodyModerateStaticWhiteColor: Color(0xFFFFFFFF),
      bodyModerateWarningColor: Color(0xFFFFAB2E),
      bodyModerateDefaultColor: Color(0xFFBCBDBD),
      bodyModerateFontFamily: "Maison Neue APP",
      bodyModerateFontSize: 16,
      bodyModerateFontWeight: FontWeight.w400,
      bodyModerateLineHeight: 20,
      bodySmallActiveColor: Color(0xFFD4549C),
      bodySmallErrorColor: Color(0xFFFF2E4A),
      bodySmallInactiveColor: Color(0xFF757575),
      bodySmallInvertedColor: Color(0xFF0F0F0F),
      bodySmallStaticBlackColor: Color(0xFF0F0F0F),
      bodySmallStaticWhiteColor: Color(0xFFFFFFFF),
      bodySmallWarningColor: Color(0xFFFFAB2E),
      bodySmallDefaultColor: Color(0xFFBCBDBD),
      bodySmallFontFamily: "Maison Neue APP",
      bodySmallFontSize: 14,
      bodySmallFontWeight: FontWeight.w400,
      bodySmallLineHeight: 20,
      captionModerateBookActiveColor: Color(0xFFD4549C),
      captionModerateBookErrorColor: Color(0xFFFF2E4A),
      captionModerateBookInactiveColor: Color(0xFF757575),
      captionModerateBookInvertedColor: Color(0xFF0F0F0F),
      captionModerateBookStaticBlackColor: Color(0xFF0F0F0F),
      captionModerateBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateBookWarningColor: Color(0xFFFFAB2E),
      captionModerateBookDefaultColor: Color(0xFFBCBDBD),
      captionModerateBookFontFamily: "Maison Neue APP",
      captionModerateBookFontSize: 13,
      captionModerateBookFontWeight: FontWeight.w400,
      captionModerateBookLineHeight: 16,
      captionModerateDemiActiveColor: Color(0xFFD4549C),
      captionModerateDemiErrorColor: Color(0xFFFF2E4A),
      captionModerateDemiInactiveColor: Color(0xFF757575),
      captionModerateDemiInvertedColor: Color(0xFF0F0F0F),
      captionModerateDemiStaticBlackColor: Color(0xFF0F0F0F),
      captionModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateDemiWarningColor: Color(0xFFFFAB2E),
      captionModerateDemiDefaultColor: Color(0xFFBCBDBD),
      captionModerateDemiFontFamily: "Maison Neue APP",
      captionModerateDemiFontSize: 13,
      captionModerateDemiFontWeight: FontWeight.w600,
      captionModerateDemiLineHeight: 16,
      captionSmallBookActiveColor: Color(0xFFD4549C),
      captionSmallBookErrorColor: Color(0xFFFF2E4A),
      captionSmallBookInactiveColor: Color(0xFF757575),
      captionSmallBookInvertedColor: Color(0xFF0F0F0F),
      captionSmallBookStaticBlackColor: Color(0xFF0F0F0F),
      captionSmallBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallBookWarningColor: Color(0xFFFFAB2E),
      captionSmallBookDefaultColor: Color(0xFFBCBDBD),
      captionSmallBookFontFamily: "Maison Neue APP",
      captionSmallBookFontSize: 12,
      captionSmallBookFontWeight: FontWeight.w400,
      captionSmallBookLineHeight: 16,
      captionSmallDemiActiveColor: Color(0xFFD4549C),
      captionSmallDemiErrorColor: Color(0xFFFF2E4A),
      captionSmallDemiInactiveColor: Color(0xFF757575),
      captionSmallDemiInvertedColor: Color(0xFF0F0F0F),
      captionSmallDemiStaticBlackColor: Color(0xFF0F0F0F),
      captionSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallDemiWarningColor: Color(0xFFFFAB2E),
      captionSmallDemiDefaultColor: Color(0xFFBCBDBD),
      captionSmallDemiFontFamily: "Maison Neue APP",
      captionSmallDemiFontSize: 12,
      captionSmallDemiFontWeight: FontWeight.w600,
      captionSmallDemiLineHeight: 16,
      titleExtraLargeActiveColor: Color(0xFFD4549C),
      titleExtraLargeErrorColor: Color(0xFFFF2E4A),
      titleExtraLargeInactiveColor: Color(0xFF757575),
      titleExtraLargeInvertedColor: Color(0xFF0F0F0F),
      titleExtraLargeStaticBlackColor: Color(0xFF0F0F0F),
      titleExtraLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleExtraLargeWarningColor: Color(0xFFFFAB2E),
      titleExtraLargeDefaultColor: Color(0xFFFFFFFF),
      titleExtraLargeFontFamily: "Maison Neue APP",
      titleExtraLargeFontSize: 24,
      titleExtraLargeFontWeight: FontWeight.w700,
      titleExtraLargeLineHeight: 36,
      titleHeroActiveColor: Color(0xFFD4549C),
      titleHeroErrorColor: Color(0xFFFF2E4A),
      titleHeroInactiveColor: Color(0xFF757575),
      titleHeroInvertedColor: Color(0xFF0F0F0F),
      titleHeroStaticBlackColor: Color(0xFF0F0F0F),
      titleHeroStaticWhiteColor: Color(0xFFFFFFFF),
      titleHeroWarningColor: Color(0xFFFFAB2E),
      titleHeroDefaultColor: Color(0xFFFFFFFF),
      titleHeroFontFamily: "Maison Neue APP",
      titleHeroFontSize: 28,
      titleHeroFontWeight: FontWeight.w700,
      titleHeroLineHeight: 44,
      titleLargeActiveColor: Color(0xFFD4549C),
      titleLargeErrorColor: Color(0xFFFF2E4A),
      titleLargeInactiveColor: Color(0xFF757575),
      titleLargeInvertedColor: Color(0xFF0F0F0F),
      titleLargeStaticBlackColor: Color(0xFF0F0F0F),
      titleLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleLargeWarningColor: Color(0xFFFFAB2E),
      titleLargeDefaultColor: Color(0xFFFFFFFF),
      titleLargeFontFamily: "Maison Neue APP",
      titleLargeFontSize: 21,
      titleLargeFontWeight: FontWeight.w700,
      titleLargeLineHeight: 28,
      titleModerateBoldActiveColor: Color(0xFFD4549C),
      titleModerateBoldErrorColor: Color(0xFFFF2E4A),
      titleModerateBoldInactiveColor: Color(0xFF757575),
      titleModerateBoldInvertedColor: Color(0xFF0F0F0F),
      titleModerateBoldStaticBlackColor: Color(0xFF0F0F0F),
      titleModerateBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateBoldWarningColor: Color(0xFFFFAB2E),
      titleModerateBoldDefaultColor: Color(0xFFFFFFFF),
      titleModerateBoldFontFamily: "Maison Neue APP",
      titleModerateBoldFontSize: 18,
      titleModerateBoldFontWeight: FontWeight.w700,
      titleModerateBoldLineHeight: 24,
      titleModerateDemiActiveColor: Color(0xFFD4549C),
      titleModerateDemiErrorColor: Color(0xFFFF2E4A),
      titleModerateDemiInactiveColor: Color(0xFF757575),
      titleModerateDemiInvertedColor: Color(0xFF0F0F0F),
      titleModerateDemiStaticBlackColor: Color(0xFF0F0F0F),
      titleModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateDemiWarningColor: Color(0xFFFFAB2E),
      titleModerateDemiDefaultColor: Color(0xFFFFFFFF),
      titleModerateDemiFontFamily: "Maison Neue APP",
      titleModerateDemiFontSize: 18,
      titleModerateDemiFontWeight: FontWeight.w600,
      titleModerateDemiLineHeight: 24,
      titleSmallBoldActiveColor: Color(0xFFD4549C),
      titleSmallBoldErrorColor: Color(0xFFFF2E4A),
      titleSmallBoldInactiveColor: Color(0xFF757575),
      titleSmallBoldInvertedColor: Color(0xFF0F0F0F),
      titleSmallBoldStaticBlackColor: Color(0xFF0F0F0F),
      titleSmallBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallBoldWarningColor: Color(0xFFFFAB2E),
      titleSmallBoldDefaultColor: Color(0xFFFFFFFF),
      titleSmallBoldFontFamily: "Maison Neue APP",
      titleSmallBoldFontSize: 16,
      titleSmallBoldFontWeight: FontWeight.w700,
      titleSmallBoldLineHeight: 20,
      titleSmallDemiActiveColor: Color(0xFFD4549C),
      titleSmallDemiErrorColor: Color(0xFFFF2E4A),
      titleSmallDemiInactiveColor: Color(0xFF757575),
      titleSmallDemiInvertedColor: Color(0xFF0F0F0F),
      titleSmallDemiStaticBlackColor: Color(0xFF0F0F0F),
      titleSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallDemiWarningColor: Color(0xFFFFAB2E),
      titleSmallDemiDefaultColor: Color(0xFFFFFFFF),
      titleSmallDemiFontFamily: "Maison Neue APP",
      titleSmallDemiFontSize: 16,
      titleSmallDemiFontWeight: FontWeight.w600,
      titleSmallDemiLineHeight: 20,
      titleTinyBoldActiveColor: Color(0xFFD4549C),
      titleTinyBoldErrorColor: Color(0xFFFF2E4A),
      titleTinyBoldInactiveColor: Color(0xFF757575),
      titleTinyBoldInvertedColor: Color(0xFF0F0F0F),
      titleTinyBoldStaticBlackColor: Color(0xFF0F0F0F),
      titleTinyBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyBoldWarningColor: Color(0xFFFFAB2E),
      titleTinyBoldDefaultColor: Color(0xFFFFFFFF),
      titleTinyBoldFontFamily: "Maison Neue APP",
      titleTinyBoldFontSize: 14,
      titleTinyBoldFontWeight: FontWeight.w700,
      titleTinyBoldLineHeight: 20,
      titleTinyDemiActiveColor: Color(0xFFD4549C),
      titleTinyDemiErrorColor: Color(0xFFFF2E4A),
      titleTinyDemiInactiveColor: Color(0xFF757575),
      titleTinyDemiInvertedColor: Color(0xFF0F0F0F),
      titleTinyDemiStaticBlackColor: Color(0xFF0F0F0F),
      titleTinyDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyDemiWarningColor: Color(0xFFFFAB2E),
      titleTinyDemiDefaultColor: Color(0xFFFFFFFF),
      titleTinyDemiFontFamily: "Maison Neue APP",
      titleTinyDemiFontSize: 14,
      titleTinyDemiFontWeight: FontWeight.w600,
      titleTinyDemiLineHeight: 20,
    );
  }

  factory JSNTypographyTokens.pinkThemeLight() {
    return const JSNTypographyTokens._(
      bodyModerateActiveColor: Color(0xFFAF2C76),
      bodyModerateErrorColor: Color(0xFFC7001B),
      bodyModerateInactiveColor: Color(0xFF757575),
      bodyModerateInvertedColor: Color(0xFFFFFFFF),
      bodyModerateStaticBlackColor: Color(0xFF1C1D1D),
      bodyModerateStaticWhiteColor: Color(0xFFFFFFFF),
      bodyModerateWarningColor: Color(0xFFA54703),
      bodyModerateDefaultColor: Color(0xFF494A4A),
      bodyModerateFontFamily: "Maison Neue APP",
      bodyModerateFontSize: 16,
      bodyModerateFontWeight: FontWeight.w400,
      bodyModerateLineHeight: 20,
      bodySmallActiveColor: Color(0xFFAF2C76),
      bodySmallErrorColor: Color(0xFFC7001B),
      bodySmallInactiveColor: Color(0xFF757575),
      bodySmallInvertedColor: Color(0xFFFFFFFF),
      bodySmallStaticBlackColor: Color(0xFF1C1D1D),
      bodySmallStaticWhiteColor: Color(0xFFFFFFFF),
      bodySmallWarningColor: Color(0xFFA54703),
      bodySmallDefaultColor: Color(0xFF494A4A),
      bodySmallFontFamily: "Maison Neue APP",
      bodySmallFontSize: 14,
      bodySmallFontWeight: FontWeight.w400,
      bodySmallLineHeight: 20,
      captionModerateBookActiveColor: Color(0xFFAF2C76),
      captionModerateBookErrorColor: Color(0xFFC7001B),
      captionModerateBookInactiveColor: Color(0xFF757575),
      captionModerateBookInvertedColor: Color(0xFFFFFFFF),
      captionModerateBookStaticBlackColor: Color(0xFF1C1D1D),
      captionModerateBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateBookWarningColor: Color(0xFFA54703),
      captionModerateBookDefaultColor: Color(0xFF494A4A),
      captionModerateBookFontFamily: "Maison Neue APP",
      captionModerateBookFontSize: 13,
      captionModerateBookFontWeight: FontWeight.w400,
      captionModerateBookLineHeight: 16,
      captionModerateDemiActiveColor: Color(0xFFAF2C76),
      captionModerateDemiErrorColor: Color(0xFFC7001B),
      captionModerateDemiInactiveColor: Color(0xFF757575),
      captionModerateDemiInvertedColor: Color(0xFFFFFFFF),
      captionModerateDemiStaticBlackColor: Color(0xFF1C1D1D),
      captionModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateDemiWarningColor: Color(0xFFA54703),
      captionModerateDemiDefaultColor: Color(0xFF494A4A),
      captionModerateDemiFontFamily: "Maison Neue APP",
      captionModerateDemiFontSize: 13,
      captionModerateDemiFontWeight: FontWeight.w600,
      captionModerateDemiLineHeight: 16,
      captionSmallBookActiveColor: Color(0xFFAF2C76),
      captionSmallBookErrorColor: Color(0xFFC7001B),
      captionSmallBookInactiveColor: Color(0xFF757575),
      captionSmallBookInvertedColor: Color(0xFFFFFFFF),
      captionSmallBookStaticBlackColor: Color(0xFF1C1D1D),
      captionSmallBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallBookWarningColor: Color(0xFFA54703),
      captionSmallBookDefaultColor: Color(0xFF494A4A),
      captionSmallBookFontFamily: "Maison Neue APP",
      captionSmallBookFontSize: 12,
      captionSmallBookFontWeight: FontWeight.w400,
      captionSmallBookLineHeight: 16,
      captionSmallDemiActiveColor: Color(0xFFAF2C76),
      captionSmallDemiErrorColor: Color(0xFFC7001B),
      captionSmallDemiInactiveColor: Color(0xFF757575),
      captionSmallDemiInvertedColor: Color(0xFFFFFFFF),
      captionSmallDemiStaticBlackColor: Color(0xFF1C1D1D),
      captionSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallDemiWarningColor: Color(0xFFA54703),
      captionSmallDemiDefaultColor: Color(0xFF494A4A),
      captionSmallDemiFontFamily: "Maison Neue APP",
      captionSmallDemiFontSize: 12,
      captionSmallDemiFontWeight: FontWeight.w600,
      captionSmallDemiLineHeight: 16,
      titleExtraLargeActiveColor: Color(0xFFAF2C76),
      titleExtraLargeErrorColor: Color(0xFFC7001B),
      titleExtraLargeInactiveColor: Color(0xFF757575),
      titleExtraLargeInvertedColor: Color(0xFFFFFFFF),
      titleExtraLargeStaticBlackColor: Color(0xFF1C1D1D),
      titleExtraLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleExtraLargeWarningColor: Color(0xFFA54703),
      titleExtraLargeDefaultColor: Color(0xFF1C1D1D),
      titleExtraLargeFontFamily: "Maison Neue APP",
      titleExtraLargeFontSize: 24,
      titleExtraLargeFontWeight: FontWeight.w700,
      titleExtraLargeLineHeight: 36,
      titleHeroActiveColor: Color(0xFFAF2C76),
      titleHeroErrorColor: Color(0xFFC7001B),
      titleHeroInactiveColor: Color(0xFF757575),
      titleHeroInvertedColor: Color(0xFFFFFFFF),
      titleHeroStaticBlackColor: Color(0xFF1C1D1D),
      titleHeroStaticWhiteColor: Color(0xFFFFFFFF),
      titleHeroWarningColor: Color(0xFFA54703),
      titleHeroDefaultColor: Color(0xFF1C1D1D),
      titleHeroFontFamily: "Maison Neue APP",
      titleHeroFontSize: 28,
      titleHeroFontWeight: FontWeight.w700,
      titleHeroLineHeight: 44,
      titleLargeActiveColor: Color(0xFFAF2C76),
      titleLargeErrorColor: Color(0xFFC7001B),
      titleLargeInactiveColor: Color(0xFF757575),
      titleLargeInvertedColor: Color(0xFFFFFFFF),
      titleLargeStaticBlackColor: Color(0xFF1C1D1D),
      titleLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleLargeWarningColor: Color(0xFFA54703),
      titleLargeDefaultColor: Color(0xFF1C1D1D),
      titleLargeFontFamily: "Maison Neue APP",
      titleLargeFontSize: 21,
      titleLargeFontWeight: FontWeight.w700,
      titleLargeLineHeight: 28,
      titleModerateBoldActiveColor: Color(0xFFAF2C76),
      titleModerateBoldErrorColor: Color(0xFFC7001B),
      titleModerateBoldInactiveColor: Color(0xFF757575),
      titleModerateBoldInvertedColor: Color(0xFFFFFFFF),
      titleModerateBoldStaticBlackColor: Color(0xFF1C1D1D),
      titleModerateBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateBoldWarningColor: Color(0xFFA54703),
      titleModerateBoldDefaultColor: Color(0xFF1C1D1D),
      titleModerateBoldFontFamily: "Maison Neue APP",
      titleModerateBoldFontSize: 18,
      titleModerateBoldFontWeight: FontWeight.w700,
      titleModerateBoldLineHeight: 24,
      titleModerateDemiActiveColor: Color(0xFFAF2C76),
      titleModerateDemiErrorColor: Color(0xFFC7001B),
      titleModerateDemiInactiveColor: Color(0xFF757575),
      titleModerateDemiInvertedColor: Color(0xFFFFFFFF),
      titleModerateDemiStaticBlackColor: Color(0xFF1C1D1D),
      titleModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateDemiWarningColor: Color(0xFFA54703),
      titleModerateDemiDefaultColor: Color(0xFF1C1D1D),
      titleModerateDemiFontFamily: "Maison Neue APP",
      titleModerateDemiFontSize: 18,
      titleModerateDemiFontWeight: FontWeight.w600,
      titleModerateDemiLineHeight: 24,
      titleSmallBoldActiveColor: Color(0xFFAF2C76),
      titleSmallBoldErrorColor: Color(0xFFC7001B),
      titleSmallBoldInactiveColor: Color(0xFF757575),
      titleSmallBoldInvertedColor: Color(0xFFFFFFFF),
      titleSmallBoldStaticBlackColor: Color(0xFF1C1D1D),
      titleSmallBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallBoldWarningColor: Color(0xFFA54703),
      titleSmallBoldDefaultColor: Color(0xFF1C1D1D),
      titleSmallBoldFontFamily: "Maison Neue APP",
      titleSmallBoldFontSize: 16,
      titleSmallBoldFontWeight: FontWeight.w700,
      titleSmallBoldLineHeight: 20,
      titleSmallDemiActiveColor: Color(0xFFAF2C76),
      titleSmallDemiErrorColor: Color(0xFFC7001B),
      titleSmallDemiInactiveColor: Color(0xFF757575),
      titleSmallDemiInvertedColor: Color(0xFFFFFFFF),
      titleSmallDemiStaticBlackColor: Color(0xFF1C1D1D),
      titleSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallDemiWarningColor: Color(0xFFA54703),
      titleSmallDemiDefaultColor: Color(0xFF1C1D1D),
      titleSmallDemiFontFamily: "Maison Neue APP",
      titleSmallDemiFontSize: 16,
      titleSmallDemiFontWeight: FontWeight.w600,
      titleSmallDemiLineHeight: 20,
      titleTinyBoldActiveColor: Color(0xFFAF2C76),
      titleTinyBoldErrorColor: Color(0xFFC7001B),
      titleTinyBoldInactiveColor: Color(0xFF757575),
      titleTinyBoldInvertedColor: Color(0xFFFFFFFF),
      titleTinyBoldStaticBlackColor: Color(0xFF1C1D1D),
      titleTinyBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyBoldWarningColor: Color(0xFFA54703),
      titleTinyBoldDefaultColor: Color(0xFF1C1D1D),
      titleTinyBoldFontFamily: "Maison Neue APP",
      titleTinyBoldFontSize: 14,
      titleTinyBoldFontWeight: FontWeight.w700,
      titleTinyBoldLineHeight: 20,
      titleTinyDemiActiveColor: Color(0xFFAF2C76),
      titleTinyDemiErrorColor: Color(0xFFC7001B),
      titleTinyDemiInactiveColor: Color(0xFF757575),
      titleTinyDemiInvertedColor: Color(0xFFFFFFFF),
      titleTinyDemiStaticBlackColor: Color(0xFF1C1D1D),
      titleTinyDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyDemiWarningColor: Color(0xFFA54703),
      titleTinyDemiDefaultColor: Color(0xFF1C1D1D),
      titleTinyDemiFontFamily: "Maison Neue APP",
      titleTinyDemiFontSize: 14,
      titleTinyDemiFontWeight: FontWeight.w600,
      titleTinyDemiLineHeight: 20,
    );
  }

  factory JSNTypographyTokens.purpleThemeDark() {
    return const JSNTypographyTokens._(
      bodyModerateActiveColor: Color(0xFFBF59CF),
      bodyModerateErrorColor: Color(0xFFFF2E4A),
      bodyModerateInactiveColor: Color(0xFF757575),
      bodyModerateInvertedColor: Color(0xFF0F0F0F),
      bodyModerateStaticBlackColor: Color(0xFF0F0F0F),
      bodyModerateStaticWhiteColor: Color(0xFFFFFFFF),
      bodyModerateWarningColor: Color(0xFFFFAB2E),
      bodyModerateDefaultColor: Color(0xFFBCBDBD),
      bodyModerateFontFamily: "Maison Neue APP",
      bodyModerateFontSize: 16,
      bodyModerateFontWeight: FontWeight.w400,
      bodyModerateLineHeight: 20,
      bodySmallActiveColor: Color(0xFFBF59CF),
      bodySmallErrorColor: Color(0xFFFF2E4A),
      bodySmallInactiveColor: Color(0xFF757575),
      bodySmallInvertedColor: Color(0xFF0F0F0F),
      bodySmallStaticBlackColor: Color(0xFF0F0F0F),
      bodySmallStaticWhiteColor: Color(0xFFFFFFFF),
      bodySmallWarningColor: Color(0xFFFFAB2E),
      bodySmallDefaultColor: Color(0xFFBCBDBD),
      bodySmallFontFamily: "Maison Neue APP",
      bodySmallFontSize: 14,
      bodySmallFontWeight: FontWeight.w400,
      bodySmallLineHeight: 20,
      captionModerateBookActiveColor: Color(0xFFBF59CF),
      captionModerateBookErrorColor: Color(0xFFFF2E4A),
      captionModerateBookInactiveColor: Color(0xFF757575),
      captionModerateBookInvertedColor: Color(0xFF0F0F0F),
      captionModerateBookStaticBlackColor: Color(0xFF0F0F0F),
      captionModerateBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateBookWarningColor: Color(0xFFFFAB2E),
      captionModerateBookDefaultColor: Color(0xFFBCBDBD),
      captionModerateBookFontFamily: "Maison Neue APP",
      captionModerateBookFontSize: 13,
      captionModerateBookFontWeight: FontWeight.w400,
      captionModerateBookLineHeight: 16,
      captionModerateDemiActiveColor: Color(0xFFBF59CF),
      captionModerateDemiErrorColor: Color(0xFFFF2E4A),
      captionModerateDemiInactiveColor: Color(0xFF757575),
      captionModerateDemiInvertedColor: Color(0xFF0F0F0F),
      captionModerateDemiStaticBlackColor: Color(0xFF0F0F0F),
      captionModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateDemiWarningColor: Color(0xFFFFAB2E),
      captionModerateDemiDefaultColor: Color(0xFFBCBDBD),
      captionModerateDemiFontFamily: "Maison Neue APP",
      captionModerateDemiFontSize: 13,
      captionModerateDemiFontWeight: FontWeight.w600,
      captionModerateDemiLineHeight: 16,
      captionSmallBookActiveColor: Color(0xFFBF59CF),
      captionSmallBookErrorColor: Color(0xFFFF2E4A),
      captionSmallBookInactiveColor: Color(0xFF757575),
      captionSmallBookInvertedColor: Color(0xFF0F0F0F),
      captionSmallBookStaticBlackColor: Color(0xFF0F0F0F),
      captionSmallBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallBookWarningColor: Color(0xFFFFAB2E),
      captionSmallBookDefaultColor: Color(0xFFBCBDBD),
      captionSmallBookFontFamily: "Maison Neue APP",
      captionSmallBookFontSize: 12,
      captionSmallBookFontWeight: FontWeight.w400,
      captionSmallBookLineHeight: 16,
      captionSmallDemiActiveColor: Color(0xFFBF59CF),
      captionSmallDemiErrorColor: Color(0xFFFF2E4A),
      captionSmallDemiInactiveColor: Color(0xFF757575),
      captionSmallDemiInvertedColor: Color(0xFF0F0F0F),
      captionSmallDemiStaticBlackColor: Color(0xFF0F0F0F),
      captionSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallDemiWarningColor: Color(0xFFFFAB2E),
      captionSmallDemiDefaultColor: Color(0xFFBCBDBD),
      captionSmallDemiFontFamily: "Maison Neue APP",
      captionSmallDemiFontSize: 12,
      captionSmallDemiFontWeight: FontWeight.w600,
      captionSmallDemiLineHeight: 16,
      titleExtraLargeActiveColor: Color(0xFFBF59CF),
      titleExtraLargeErrorColor: Color(0xFFFF2E4A),
      titleExtraLargeInactiveColor: Color(0xFF757575),
      titleExtraLargeInvertedColor: Color(0xFF0F0F0F),
      titleExtraLargeStaticBlackColor: Color(0xFF0F0F0F),
      titleExtraLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleExtraLargeWarningColor: Color(0xFFFFAB2E),
      titleExtraLargeDefaultColor: Color(0xFFFFFFFF),
      titleExtraLargeFontFamily: "Maison Neue APP",
      titleExtraLargeFontSize: 24,
      titleExtraLargeFontWeight: FontWeight.w700,
      titleExtraLargeLineHeight: 36,
      titleHeroActiveColor: Color(0xFFBF59CF),
      titleHeroErrorColor: Color(0xFFFF2E4A),
      titleHeroInactiveColor: Color(0xFF757575),
      titleHeroInvertedColor: Color(0xFF0F0F0F),
      titleHeroStaticBlackColor: Color(0xFF0F0F0F),
      titleHeroStaticWhiteColor: Color(0xFFFFFFFF),
      titleHeroWarningColor: Color(0xFFFFAB2E),
      titleHeroDefaultColor: Color(0xFFFFFFFF),
      titleHeroFontFamily: "Maison Neue APP",
      titleHeroFontSize: 28,
      titleHeroFontWeight: FontWeight.w700,
      titleHeroLineHeight: 44,
      titleLargeActiveColor: Color(0xFFBF59CF),
      titleLargeErrorColor: Color(0xFFFF2E4A),
      titleLargeInactiveColor: Color(0xFF757575),
      titleLargeInvertedColor: Color(0xFF0F0F0F),
      titleLargeStaticBlackColor: Color(0xFF0F0F0F),
      titleLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleLargeWarningColor: Color(0xFFFFAB2E),
      titleLargeDefaultColor: Color(0xFFFFFFFF),
      titleLargeFontFamily: "Maison Neue APP",
      titleLargeFontSize: 21,
      titleLargeFontWeight: FontWeight.w700,
      titleLargeLineHeight: 28,
      titleModerateBoldActiveColor: Color(0xFFBF59CF),
      titleModerateBoldErrorColor: Color(0xFFFF2E4A),
      titleModerateBoldInactiveColor: Color(0xFF757575),
      titleModerateBoldInvertedColor: Color(0xFF0F0F0F),
      titleModerateBoldStaticBlackColor: Color(0xFF0F0F0F),
      titleModerateBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateBoldWarningColor: Color(0xFFFFAB2E),
      titleModerateBoldDefaultColor: Color(0xFFFFFFFF),
      titleModerateBoldFontFamily: "Maison Neue APP",
      titleModerateBoldFontSize: 18,
      titleModerateBoldFontWeight: FontWeight.w700,
      titleModerateBoldLineHeight: 24,
      titleModerateDemiActiveColor: Color(0xFFBF59CF),
      titleModerateDemiErrorColor: Color(0xFFFF2E4A),
      titleModerateDemiInactiveColor: Color(0xFF757575),
      titleModerateDemiInvertedColor: Color(0xFF0F0F0F),
      titleModerateDemiStaticBlackColor: Color(0xFF0F0F0F),
      titleModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateDemiWarningColor: Color(0xFFFFAB2E),
      titleModerateDemiDefaultColor: Color(0xFFFFFFFF),
      titleModerateDemiFontFamily: "Maison Neue APP",
      titleModerateDemiFontSize: 18,
      titleModerateDemiFontWeight: FontWeight.w600,
      titleModerateDemiLineHeight: 24,
      titleSmallBoldActiveColor: Color(0xFFBF59CF),
      titleSmallBoldErrorColor: Color(0xFFFF2E4A),
      titleSmallBoldInactiveColor: Color(0xFF757575),
      titleSmallBoldInvertedColor: Color(0xFF0F0F0F),
      titleSmallBoldStaticBlackColor: Color(0xFF0F0F0F),
      titleSmallBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallBoldWarningColor: Color(0xFFFFAB2E),
      titleSmallBoldDefaultColor: Color(0xFFFFFFFF),
      titleSmallBoldFontFamily: "Maison Neue APP",
      titleSmallBoldFontSize: 16,
      titleSmallBoldFontWeight: FontWeight.w700,
      titleSmallBoldLineHeight: 20,
      titleSmallDemiActiveColor: Color(0xFFBF59CF),
      titleSmallDemiErrorColor: Color(0xFFFF2E4A),
      titleSmallDemiInactiveColor: Color(0xFF757575),
      titleSmallDemiInvertedColor: Color(0xFF0F0F0F),
      titleSmallDemiStaticBlackColor: Color(0xFF0F0F0F),
      titleSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallDemiWarningColor: Color(0xFFFFAB2E),
      titleSmallDemiDefaultColor: Color(0xFFFFFFFF),
      titleSmallDemiFontFamily: "Maison Neue APP",
      titleSmallDemiFontSize: 16,
      titleSmallDemiFontWeight: FontWeight.w600,
      titleSmallDemiLineHeight: 20,
      titleTinyBoldActiveColor: Color(0xFFBF59CF),
      titleTinyBoldErrorColor: Color(0xFFFF2E4A),
      titleTinyBoldInactiveColor: Color(0xFF757575),
      titleTinyBoldInvertedColor: Color(0xFF0F0F0F),
      titleTinyBoldStaticBlackColor: Color(0xFF0F0F0F),
      titleTinyBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyBoldWarningColor: Color(0xFFFFAB2E),
      titleTinyBoldDefaultColor: Color(0xFFFFFFFF),
      titleTinyBoldFontFamily: "Maison Neue APP",
      titleTinyBoldFontSize: 14,
      titleTinyBoldFontWeight: FontWeight.w700,
      titleTinyBoldLineHeight: 20,
      titleTinyDemiActiveColor: Color(0xFFBF59CF),
      titleTinyDemiErrorColor: Color(0xFFFF2E4A),
      titleTinyDemiInactiveColor: Color(0xFF757575),
      titleTinyDemiInvertedColor: Color(0xFF0F0F0F),
      titleTinyDemiStaticBlackColor: Color(0xFF0F0F0F),
      titleTinyDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyDemiWarningColor: Color(0xFFFFAB2E),
      titleTinyDemiDefaultColor: Color(0xFFFFFFFF),
      titleTinyDemiFontFamily: "Maison Neue APP",
      titleTinyDemiFontSize: 14,
      titleTinyDemiFontWeight: FontWeight.w600,
      titleTinyDemiLineHeight: 20,
    );
  }

  factory JSNTypographyTokens.purpleThemeLight() {
    return const JSNTypographyTokens._(
      bodyModerateActiveColor: Color(0xFF8F2E9E),
      bodyModerateErrorColor: Color(0xFFC7001B),
      bodyModerateInactiveColor: Color(0xFF757575),
      bodyModerateInvertedColor: Color(0xFFFFFFFF),
      bodyModerateStaticBlackColor: Color(0xFF1C1D1D),
      bodyModerateStaticWhiteColor: Color(0xFFFFFFFF),
      bodyModerateWarningColor: Color(0xFFA54703),
      bodyModerateDefaultColor: Color(0xFF494A4A),
      bodyModerateFontFamily: "Maison Neue APP",
      bodyModerateFontSize: 16,
      bodyModerateFontWeight: FontWeight.w400,
      bodyModerateLineHeight: 20,
      bodySmallActiveColor: Color(0xFF8F2E9E),
      bodySmallErrorColor: Color(0xFFC7001B),
      bodySmallInactiveColor: Color(0xFF757575),
      bodySmallInvertedColor: Color(0xFFFFFFFF),
      bodySmallStaticBlackColor: Color(0xFF1C1D1D),
      bodySmallStaticWhiteColor: Color(0xFFFFFFFF),
      bodySmallWarningColor: Color(0xFFA54703),
      bodySmallDefaultColor: Color(0xFF494A4A),
      bodySmallFontFamily: "Maison Neue APP",
      bodySmallFontSize: 14,
      bodySmallFontWeight: FontWeight.w400,
      bodySmallLineHeight: 20,
      captionModerateBookActiveColor: Color(0xFF8F2E9E),
      captionModerateBookErrorColor: Color(0xFFC7001B),
      captionModerateBookInactiveColor: Color(0xFF757575),
      captionModerateBookInvertedColor: Color(0xFFFFFFFF),
      captionModerateBookStaticBlackColor: Color(0xFF1C1D1D),
      captionModerateBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateBookWarningColor: Color(0xFFA54703),
      captionModerateBookDefaultColor: Color(0xFF494A4A),
      captionModerateBookFontFamily: "Maison Neue APP",
      captionModerateBookFontSize: 13,
      captionModerateBookFontWeight: FontWeight.w400,
      captionModerateBookLineHeight: 16,
      captionModerateDemiActiveColor: Color(0xFF8F2E9E),
      captionModerateDemiErrorColor: Color(0xFFC7001B),
      captionModerateDemiInactiveColor: Color(0xFF757575),
      captionModerateDemiInvertedColor: Color(0xFFFFFFFF),
      captionModerateDemiStaticBlackColor: Color(0xFF1C1D1D),
      captionModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionModerateDemiWarningColor: Color(0xFFA54703),
      captionModerateDemiDefaultColor: Color(0xFF494A4A),
      captionModerateDemiFontFamily: "Maison Neue APP",
      captionModerateDemiFontSize: 13,
      captionModerateDemiFontWeight: FontWeight.w600,
      captionModerateDemiLineHeight: 16,
      captionSmallBookActiveColor: Color(0xFF8F2E9E),
      captionSmallBookErrorColor: Color(0xFFC7001B),
      captionSmallBookInactiveColor: Color(0xFF757575),
      captionSmallBookInvertedColor: Color(0xFFFFFFFF),
      captionSmallBookStaticBlackColor: Color(0xFF1C1D1D),
      captionSmallBookStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallBookWarningColor: Color(0xFFA54703),
      captionSmallBookDefaultColor: Color(0xFF494A4A),
      captionSmallBookFontFamily: "Maison Neue APP",
      captionSmallBookFontSize: 12,
      captionSmallBookFontWeight: FontWeight.w400,
      captionSmallBookLineHeight: 16,
      captionSmallDemiActiveColor: Color(0xFF8F2E9E),
      captionSmallDemiErrorColor: Color(0xFFC7001B),
      captionSmallDemiInactiveColor: Color(0xFF757575),
      captionSmallDemiInvertedColor: Color(0xFFFFFFFF),
      captionSmallDemiStaticBlackColor: Color(0xFF1C1D1D),
      captionSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      captionSmallDemiWarningColor: Color(0xFFA54703),
      captionSmallDemiDefaultColor: Color(0xFF494A4A),
      captionSmallDemiFontFamily: "Maison Neue APP",
      captionSmallDemiFontSize: 12,
      captionSmallDemiFontWeight: FontWeight.w600,
      captionSmallDemiLineHeight: 16,
      titleExtraLargeActiveColor: Color(0xFF8F2E9E),
      titleExtraLargeErrorColor: Color(0xFFC7001B),
      titleExtraLargeInactiveColor: Color(0xFF757575),
      titleExtraLargeInvertedColor: Color(0xFFFFFFFF),
      titleExtraLargeStaticBlackColor: Color(0xFF1C1D1D),
      titleExtraLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleExtraLargeWarningColor: Color(0xFFA54703),
      titleExtraLargeDefaultColor: Color(0xFF1C1D1D),
      titleExtraLargeFontFamily: "Maison Neue APP",
      titleExtraLargeFontSize: 24,
      titleExtraLargeFontWeight: FontWeight.w700,
      titleExtraLargeLineHeight: 36,
      titleHeroActiveColor: Color(0xFF8F2E9E),
      titleHeroErrorColor: Color(0xFFC7001B),
      titleHeroInactiveColor: Color(0xFF757575),
      titleHeroInvertedColor: Color(0xFFFFFFFF),
      titleHeroStaticBlackColor: Color(0xFF1C1D1D),
      titleHeroStaticWhiteColor: Color(0xFFFFFFFF),
      titleHeroWarningColor: Color(0xFFA54703),
      titleHeroDefaultColor: Color(0xFF1C1D1D),
      titleHeroFontFamily: "Maison Neue APP",
      titleHeroFontSize: 28,
      titleHeroFontWeight: FontWeight.w700,
      titleHeroLineHeight: 44,
      titleLargeActiveColor: Color(0xFF8F2E9E),
      titleLargeErrorColor: Color(0xFFC7001B),
      titleLargeInactiveColor: Color(0xFF757575),
      titleLargeInvertedColor: Color(0xFFFFFFFF),
      titleLargeStaticBlackColor: Color(0xFF1C1D1D),
      titleLargeStaticWhiteColor: Color(0xFFFFFFFF),
      titleLargeWarningColor: Color(0xFFA54703),
      titleLargeDefaultColor: Color(0xFF1C1D1D),
      titleLargeFontFamily: "Maison Neue APP",
      titleLargeFontSize: 21,
      titleLargeFontWeight: FontWeight.w700,
      titleLargeLineHeight: 28,
      titleModerateBoldActiveColor: Color(0xFF8F2E9E),
      titleModerateBoldErrorColor: Color(0xFFC7001B),
      titleModerateBoldInactiveColor: Color(0xFF757575),
      titleModerateBoldInvertedColor: Color(0xFFFFFFFF),
      titleModerateBoldStaticBlackColor: Color(0xFF1C1D1D),
      titleModerateBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateBoldWarningColor: Color(0xFFA54703),
      titleModerateBoldDefaultColor: Color(0xFF1C1D1D),
      titleModerateBoldFontFamily: "Maison Neue APP",
      titleModerateBoldFontSize: 18,
      titleModerateBoldFontWeight: FontWeight.w700,
      titleModerateBoldLineHeight: 24,
      titleModerateDemiActiveColor: Color(0xFF8F2E9E),
      titleModerateDemiErrorColor: Color(0xFFC7001B),
      titleModerateDemiInactiveColor: Color(0xFF757575),
      titleModerateDemiInvertedColor: Color(0xFFFFFFFF),
      titleModerateDemiStaticBlackColor: Color(0xFF1C1D1D),
      titleModerateDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleModerateDemiWarningColor: Color(0xFFA54703),
      titleModerateDemiDefaultColor: Color(0xFF1C1D1D),
      titleModerateDemiFontFamily: "Maison Neue APP",
      titleModerateDemiFontSize: 18,
      titleModerateDemiFontWeight: FontWeight.w600,
      titleModerateDemiLineHeight: 24,
      titleSmallBoldActiveColor: Color(0xFF8F2E9E),
      titleSmallBoldErrorColor: Color(0xFFC7001B),
      titleSmallBoldInactiveColor: Color(0xFF757575),
      titleSmallBoldInvertedColor: Color(0xFFFFFFFF),
      titleSmallBoldStaticBlackColor: Color(0xFF1C1D1D),
      titleSmallBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallBoldWarningColor: Color(0xFFA54703),
      titleSmallBoldDefaultColor: Color(0xFF1C1D1D),
      titleSmallBoldFontFamily: "Maison Neue APP",
      titleSmallBoldFontSize: 16,
      titleSmallBoldFontWeight: FontWeight.w700,
      titleSmallBoldLineHeight: 20,
      titleSmallDemiActiveColor: Color(0xFF8F2E9E),
      titleSmallDemiErrorColor: Color(0xFFC7001B),
      titleSmallDemiInactiveColor: Color(0xFF757575),
      titleSmallDemiInvertedColor: Color(0xFFFFFFFF),
      titleSmallDemiStaticBlackColor: Color(0xFF1C1D1D),
      titleSmallDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleSmallDemiWarningColor: Color(0xFFA54703),
      titleSmallDemiDefaultColor: Color(0xFF1C1D1D),
      titleSmallDemiFontFamily: "Maison Neue APP",
      titleSmallDemiFontSize: 16,
      titleSmallDemiFontWeight: FontWeight.w600,
      titleSmallDemiLineHeight: 20,
      titleTinyBoldActiveColor: Color(0xFF8F2E9E),
      titleTinyBoldErrorColor: Color(0xFFC7001B),
      titleTinyBoldInactiveColor: Color(0xFF757575),
      titleTinyBoldInvertedColor: Color(0xFFFFFFFF),
      titleTinyBoldStaticBlackColor: Color(0xFF1C1D1D),
      titleTinyBoldStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyBoldWarningColor: Color(0xFFA54703),
      titleTinyBoldDefaultColor: Color(0xFF1C1D1D),
      titleTinyBoldFontFamily: "Maison Neue APP",
      titleTinyBoldFontSize: 14,
      titleTinyBoldFontWeight: FontWeight.w700,
      titleTinyBoldLineHeight: 20,
      titleTinyDemiActiveColor: Color(0xFF8F2E9E),
      titleTinyDemiErrorColor: Color(0xFFC7001B),
      titleTinyDemiInactiveColor: Color(0xFF757575),
      titleTinyDemiInvertedColor: Color(0xFFFFFFFF),
      titleTinyDemiStaticBlackColor: Color(0xFF1C1D1D),
      titleTinyDemiStaticWhiteColor: Color(0xFFFFFFFF),
      titleTinyDemiWarningColor: Color(0xFFA54703),
      titleTinyDemiDefaultColor: Color(0xFF1C1D1D),
      titleTinyDemiFontFamily: "Maison Neue APP",
      titleTinyDemiFontSize: 14,
      titleTinyDemiFontWeight: FontWeight.w600,
      titleTinyDemiLineHeight: 20,
    );
  }

  final Color bodyModerateActiveColor;
  final Color bodyModerateErrorColor;
  final Color bodyModerateInactiveColor;
  final Color bodyModerateInvertedColor;
  final Color bodyModerateStaticBlackColor;
  final Color bodyModerateStaticWhiteColor;
  final Color bodyModerateWarningColor;
  final Color bodyModerateDefaultColor;
  final String bodyModerateFontFamily;
  final double bodyModerateFontSize;
  final FontWeight bodyModerateFontWeight;
  final double bodyModerateLineHeight;
  final Color bodySmallActiveColor;
  final Color bodySmallErrorColor;
  final Color bodySmallInactiveColor;
  final Color bodySmallInvertedColor;
  final Color bodySmallStaticBlackColor;
  final Color bodySmallStaticWhiteColor;
  final Color bodySmallWarningColor;
  final Color bodySmallDefaultColor;
  final String bodySmallFontFamily;
  final double bodySmallFontSize;
  final FontWeight bodySmallFontWeight;
  final double bodySmallLineHeight;
  final Color captionModerateBookActiveColor;
  final Color captionModerateBookErrorColor;
  final Color captionModerateBookInactiveColor;
  final Color captionModerateBookInvertedColor;
  final Color captionModerateBookStaticBlackColor;
  final Color captionModerateBookStaticWhiteColor;
  final Color captionModerateBookWarningColor;
  final Color captionModerateBookDefaultColor;
  final String captionModerateBookFontFamily;
  final double captionModerateBookFontSize;
  final FontWeight captionModerateBookFontWeight;
  final double captionModerateBookLineHeight;
  final Color captionModerateDemiActiveColor;
  final Color captionModerateDemiErrorColor;
  final Color captionModerateDemiInactiveColor;
  final Color captionModerateDemiInvertedColor;
  final Color captionModerateDemiStaticBlackColor;
  final Color captionModerateDemiStaticWhiteColor;
  final Color captionModerateDemiWarningColor;
  final Color captionModerateDemiDefaultColor;
  final String captionModerateDemiFontFamily;
  final double captionModerateDemiFontSize;
  final FontWeight captionModerateDemiFontWeight;
  final double captionModerateDemiLineHeight;
  final Color captionSmallBookActiveColor;
  final Color captionSmallBookErrorColor;
  final Color captionSmallBookInactiveColor;
  final Color captionSmallBookInvertedColor;
  final Color captionSmallBookStaticBlackColor;
  final Color captionSmallBookStaticWhiteColor;
  final Color captionSmallBookWarningColor;
  final Color captionSmallBookDefaultColor;
  final String captionSmallBookFontFamily;
  final double captionSmallBookFontSize;
  final FontWeight captionSmallBookFontWeight;
  final double captionSmallBookLineHeight;
  final Color captionSmallDemiActiveColor;
  final Color captionSmallDemiErrorColor;
  final Color captionSmallDemiInactiveColor;
  final Color captionSmallDemiInvertedColor;
  final Color captionSmallDemiStaticBlackColor;
  final Color captionSmallDemiStaticWhiteColor;
  final Color captionSmallDemiWarningColor;
  final Color captionSmallDemiDefaultColor;
  final String captionSmallDemiFontFamily;
  final double captionSmallDemiFontSize;
  final FontWeight captionSmallDemiFontWeight;
  final double captionSmallDemiLineHeight;
  final Color titleExtraLargeActiveColor;
  final Color titleExtraLargeErrorColor;
  final Color titleExtraLargeInactiveColor;
  final Color titleExtraLargeInvertedColor;
  final Color titleExtraLargeStaticBlackColor;
  final Color titleExtraLargeStaticWhiteColor;
  final Color titleExtraLargeWarningColor;
  final Color titleExtraLargeDefaultColor;
  final String titleExtraLargeFontFamily;
  final double titleExtraLargeFontSize;
  final FontWeight titleExtraLargeFontWeight;
  final double titleExtraLargeLineHeight;
  final Color titleHeroActiveColor;
  final Color titleHeroErrorColor;
  final Color titleHeroInactiveColor;
  final Color titleHeroInvertedColor;
  final Color titleHeroStaticBlackColor;
  final Color titleHeroStaticWhiteColor;
  final Color titleHeroWarningColor;
  final Color titleHeroDefaultColor;
  final String titleHeroFontFamily;
  final double titleHeroFontSize;
  final FontWeight titleHeroFontWeight;
  final double titleHeroLineHeight;
  final Color titleLargeActiveColor;
  final Color titleLargeErrorColor;
  final Color titleLargeInactiveColor;
  final Color titleLargeInvertedColor;
  final Color titleLargeStaticBlackColor;
  final Color titleLargeStaticWhiteColor;
  final Color titleLargeWarningColor;
  final Color titleLargeDefaultColor;
  final String titleLargeFontFamily;
  final double titleLargeFontSize;
  final FontWeight titleLargeFontWeight;
  final double titleLargeLineHeight;
  final Color titleModerateBoldActiveColor;
  final Color titleModerateBoldErrorColor;
  final Color titleModerateBoldInactiveColor;
  final Color titleModerateBoldInvertedColor;
  final Color titleModerateBoldStaticBlackColor;
  final Color titleModerateBoldStaticWhiteColor;
  final Color titleModerateBoldWarningColor;
  final Color titleModerateBoldDefaultColor;
  final String titleModerateBoldFontFamily;
  final double titleModerateBoldFontSize;
  final FontWeight titleModerateBoldFontWeight;
  final double titleModerateBoldLineHeight;
  final Color titleModerateDemiActiveColor;
  final Color titleModerateDemiErrorColor;
  final Color titleModerateDemiInactiveColor;
  final Color titleModerateDemiInvertedColor;
  final Color titleModerateDemiStaticBlackColor;
  final Color titleModerateDemiStaticWhiteColor;
  final Color titleModerateDemiWarningColor;
  final Color titleModerateDemiDefaultColor;
  final String titleModerateDemiFontFamily;
  final double titleModerateDemiFontSize;
  final FontWeight titleModerateDemiFontWeight;
  final double titleModerateDemiLineHeight;
  final Color titleSmallBoldActiveColor;
  final Color titleSmallBoldErrorColor;
  final Color titleSmallBoldInactiveColor;
  final Color titleSmallBoldInvertedColor;
  final Color titleSmallBoldStaticBlackColor;
  final Color titleSmallBoldStaticWhiteColor;
  final Color titleSmallBoldWarningColor;
  final Color titleSmallBoldDefaultColor;
  final String titleSmallBoldFontFamily;
  final double titleSmallBoldFontSize;
  final FontWeight titleSmallBoldFontWeight;
  final double titleSmallBoldLineHeight;
  final Color titleSmallDemiActiveColor;
  final Color titleSmallDemiErrorColor;
  final Color titleSmallDemiInactiveColor;
  final Color titleSmallDemiInvertedColor;
  final Color titleSmallDemiStaticBlackColor;
  final Color titleSmallDemiStaticWhiteColor;
  final Color titleSmallDemiWarningColor;
  final Color titleSmallDemiDefaultColor;
  final String titleSmallDemiFontFamily;
  final double titleSmallDemiFontSize;
  final FontWeight titleSmallDemiFontWeight;
  final double titleSmallDemiLineHeight;
  final Color titleTinyBoldActiveColor;
  final Color titleTinyBoldErrorColor;
  final Color titleTinyBoldInactiveColor;
  final Color titleTinyBoldInvertedColor;
  final Color titleTinyBoldStaticBlackColor;
  final Color titleTinyBoldStaticWhiteColor;
  final Color titleTinyBoldWarningColor;
  final Color titleTinyBoldDefaultColor;
  final String titleTinyBoldFontFamily;
  final double titleTinyBoldFontSize;
  final FontWeight titleTinyBoldFontWeight;
  final double titleTinyBoldLineHeight;
  final Color titleTinyDemiActiveColor;
  final Color titleTinyDemiErrorColor;
  final Color titleTinyDemiInactiveColor;
  final Color titleTinyDemiInvertedColor;
  final Color titleTinyDemiStaticBlackColor;
  final Color titleTinyDemiStaticWhiteColor;
  final Color titleTinyDemiWarningColor;
  final Color titleTinyDemiDefaultColor;
  final String titleTinyDemiFontFamily;
  final double titleTinyDemiFontSize;
  final FontWeight titleTinyDemiFontWeight;
  final double titleTinyDemiLineHeight;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JSNTypographyTokens &&
          bodyModerateActiveColor == other.bodyModerateActiveColor &&
          bodyModerateErrorColor == other.bodyModerateErrorColor &&
          bodyModerateInactiveColor == other.bodyModerateInactiveColor &&
          bodyModerateInvertedColor == other.bodyModerateInvertedColor &&
          bodyModerateStaticBlackColor == other.bodyModerateStaticBlackColor &&
          bodyModerateStaticWhiteColor == other.bodyModerateStaticWhiteColor &&
          bodyModerateWarningColor == other.bodyModerateWarningColor &&
          bodyModerateDefaultColor == other.bodyModerateDefaultColor &&
          bodyModerateFontFamily == other.bodyModerateFontFamily &&
          bodyModerateFontSize == other.bodyModerateFontSize &&
          bodyModerateFontWeight == other.bodyModerateFontWeight &&
          bodyModerateLineHeight == other.bodyModerateLineHeight &&
          bodySmallActiveColor == other.bodySmallActiveColor &&
          bodySmallErrorColor == other.bodySmallErrorColor &&
          bodySmallInactiveColor == other.bodySmallInactiveColor &&
          bodySmallInvertedColor == other.bodySmallInvertedColor &&
          bodySmallStaticBlackColor == other.bodySmallStaticBlackColor &&
          bodySmallStaticWhiteColor == other.bodySmallStaticWhiteColor &&
          bodySmallWarningColor == other.bodySmallWarningColor &&
          bodySmallDefaultColor == other.bodySmallDefaultColor &&
          bodySmallFontFamily == other.bodySmallFontFamily &&
          bodySmallFontSize == other.bodySmallFontSize &&
          bodySmallFontWeight == other.bodySmallFontWeight &&
          bodySmallLineHeight == other.bodySmallLineHeight &&
          captionModerateBookActiveColor ==
              other.captionModerateBookActiveColor &&
          captionModerateBookErrorColor ==
              other.captionModerateBookErrorColor &&
          captionModerateBookInactiveColor ==
              other.captionModerateBookInactiveColor &&
          captionModerateBookInvertedColor ==
              other.captionModerateBookInvertedColor &&
          captionModerateBookStaticBlackColor ==
              other.captionModerateBookStaticBlackColor &&
          captionModerateBookStaticWhiteColor ==
              other.captionModerateBookStaticWhiteColor &&
          captionModerateBookWarningColor ==
              other.captionModerateBookWarningColor &&
          captionModerateBookDefaultColor ==
              other.captionModerateBookDefaultColor &&
          captionModerateBookFontFamily ==
              other.captionModerateBookFontFamily &&
          captionModerateBookFontSize == other.captionModerateBookFontSize &&
          captionModerateBookFontWeight ==
              other.captionModerateBookFontWeight &&
          captionModerateBookLineHeight ==
              other.captionModerateBookLineHeight &&
          captionModerateDemiActiveColor ==
              other.captionModerateDemiActiveColor &&
          captionModerateDemiErrorColor ==
              other.captionModerateDemiErrorColor &&
          captionModerateDemiInactiveColor ==
              other.captionModerateDemiInactiveColor &&
          captionModerateDemiInvertedColor ==
              other.captionModerateDemiInvertedColor &&
          captionModerateDemiStaticBlackColor ==
              other.captionModerateDemiStaticBlackColor &&
          captionModerateDemiStaticWhiteColor ==
              other.captionModerateDemiStaticWhiteColor &&
          captionModerateDemiWarningColor ==
              other.captionModerateDemiWarningColor &&
          captionModerateDemiDefaultColor ==
              other.captionModerateDemiDefaultColor &&
          captionModerateDemiFontFamily ==
              other.captionModerateDemiFontFamily &&
          captionModerateDemiFontSize == other.captionModerateDemiFontSize &&
          captionModerateDemiFontWeight ==
              other.captionModerateDemiFontWeight &&
          captionModerateDemiLineHeight ==
              other.captionModerateDemiLineHeight &&
          captionSmallBookActiveColor == other.captionSmallBookActiveColor &&
          captionSmallBookErrorColor == other.captionSmallBookErrorColor &&
          captionSmallBookInactiveColor ==
              other.captionSmallBookInactiveColor &&
          captionSmallBookInvertedColor ==
              other.captionSmallBookInvertedColor &&
          captionSmallBookStaticBlackColor ==
              other.captionSmallBookStaticBlackColor &&
          captionSmallBookStaticWhiteColor ==
              other.captionSmallBookStaticWhiteColor &&
          captionSmallBookWarningColor == other.captionSmallBookWarningColor &&
          captionSmallBookDefaultColor == other.captionSmallBookDefaultColor &&
          captionSmallBookFontFamily == other.captionSmallBookFontFamily &&
          captionSmallBookFontSize == other.captionSmallBookFontSize &&
          captionSmallBookFontWeight == other.captionSmallBookFontWeight &&
          captionSmallBookLineHeight == other.captionSmallBookLineHeight &&
          captionSmallDemiActiveColor == other.captionSmallDemiActiveColor &&
          captionSmallDemiErrorColor == other.captionSmallDemiErrorColor &&
          captionSmallDemiInactiveColor ==
              other.captionSmallDemiInactiveColor &&
          captionSmallDemiInvertedColor ==
              other.captionSmallDemiInvertedColor &&
          captionSmallDemiStaticBlackColor ==
              other.captionSmallDemiStaticBlackColor &&
          captionSmallDemiStaticWhiteColor ==
              other.captionSmallDemiStaticWhiteColor &&
          captionSmallDemiWarningColor == other.captionSmallDemiWarningColor &&
          captionSmallDemiDefaultColor == other.captionSmallDemiDefaultColor &&
          captionSmallDemiFontFamily == other.captionSmallDemiFontFamily &&
          captionSmallDemiFontSize == other.captionSmallDemiFontSize &&
          captionSmallDemiFontWeight == other.captionSmallDemiFontWeight &&
          captionSmallDemiLineHeight == other.captionSmallDemiLineHeight &&
          titleExtraLargeActiveColor == other.titleExtraLargeActiveColor &&
          titleExtraLargeErrorColor == other.titleExtraLargeErrorColor &&
          titleExtraLargeInactiveColor == other.titleExtraLargeInactiveColor &&
          titleExtraLargeInvertedColor == other.titleExtraLargeInvertedColor &&
          titleExtraLargeStaticBlackColor ==
              other.titleExtraLargeStaticBlackColor &&
          titleExtraLargeStaticWhiteColor ==
              other.titleExtraLargeStaticWhiteColor &&
          titleExtraLargeWarningColor == other.titleExtraLargeWarningColor &&
          titleExtraLargeDefaultColor == other.titleExtraLargeDefaultColor &&
          titleExtraLargeFontFamily == other.titleExtraLargeFontFamily &&
          titleExtraLargeFontSize == other.titleExtraLargeFontSize &&
          titleExtraLargeFontWeight == other.titleExtraLargeFontWeight &&
          titleExtraLargeLineHeight == other.titleExtraLargeLineHeight &&
          titleHeroActiveColor == other.titleHeroActiveColor &&
          titleHeroErrorColor == other.titleHeroErrorColor &&
          titleHeroInactiveColor == other.titleHeroInactiveColor &&
          titleHeroInvertedColor == other.titleHeroInvertedColor &&
          titleHeroStaticBlackColor == other.titleHeroStaticBlackColor &&
          titleHeroStaticWhiteColor == other.titleHeroStaticWhiteColor &&
          titleHeroWarningColor == other.titleHeroWarningColor &&
          titleHeroDefaultColor == other.titleHeroDefaultColor &&
          titleHeroFontFamily == other.titleHeroFontFamily &&
          titleHeroFontSize == other.titleHeroFontSize &&
          titleHeroFontWeight == other.titleHeroFontWeight &&
          titleHeroLineHeight == other.titleHeroLineHeight &&
          titleLargeActiveColor == other.titleLargeActiveColor &&
          titleLargeErrorColor == other.titleLargeErrorColor &&
          titleLargeInactiveColor == other.titleLargeInactiveColor &&
          titleLargeInvertedColor == other.titleLargeInvertedColor &&
          titleLargeStaticBlackColor == other.titleLargeStaticBlackColor &&
          titleLargeStaticWhiteColor == other.titleLargeStaticWhiteColor &&
          titleLargeWarningColor == other.titleLargeWarningColor &&
          titleLargeDefaultColor == other.titleLargeDefaultColor &&
          titleLargeFontFamily == other.titleLargeFontFamily &&
          titleLargeFontSize == other.titleLargeFontSize &&
          titleLargeFontWeight == other.titleLargeFontWeight &&
          titleLargeLineHeight == other.titleLargeLineHeight &&
          titleModerateBoldActiveColor == other.titleModerateBoldActiveColor &&
          titleModerateBoldErrorColor == other.titleModerateBoldErrorColor &&
          titleModerateBoldInactiveColor ==
              other.titleModerateBoldInactiveColor &&
          titleModerateBoldInvertedColor ==
              other.titleModerateBoldInvertedColor &&
          titleModerateBoldStaticBlackColor ==
              other.titleModerateBoldStaticBlackColor &&
          titleModerateBoldStaticWhiteColor ==
              other.titleModerateBoldStaticWhiteColor &&
          titleModerateBoldWarningColor ==
              other.titleModerateBoldWarningColor &&
          titleModerateBoldDefaultColor ==
              other.titleModerateBoldDefaultColor &&
          titleModerateBoldFontFamily == other.titleModerateBoldFontFamily &&
          titleModerateBoldFontSize == other.titleModerateBoldFontSize &&
          titleModerateBoldFontWeight == other.titleModerateBoldFontWeight &&
          titleModerateBoldLineHeight == other.titleModerateBoldLineHeight &&
          titleModerateDemiActiveColor == other.titleModerateDemiActiveColor &&
          titleModerateDemiErrorColor == other.titleModerateDemiErrorColor &&
          titleModerateDemiInactiveColor ==
              other.titleModerateDemiInactiveColor &&
          titleModerateDemiInvertedColor ==
              other.titleModerateDemiInvertedColor &&
          titleModerateDemiStaticBlackColor ==
              other.titleModerateDemiStaticBlackColor &&
          titleModerateDemiStaticWhiteColor ==
              other.titleModerateDemiStaticWhiteColor &&
          titleModerateDemiWarningColor ==
              other.titleModerateDemiWarningColor &&
          titleModerateDemiDefaultColor ==
              other.titleModerateDemiDefaultColor &&
          titleModerateDemiFontFamily == other.titleModerateDemiFontFamily &&
          titleModerateDemiFontSize == other.titleModerateDemiFontSize &&
          titleModerateDemiFontWeight == other.titleModerateDemiFontWeight &&
          titleModerateDemiLineHeight == other.titleModerateDemiLineHeight &&
          titleSmallBoldActiveColor == other.titleSmallBoldActiveColor &&
          titleSmallBoldErrorColor == other.titleSmallBoldErrorColor &&
          titleSmallBoldInactiveColor == other.titleSmallBoldInactiveColor &&
          titleSmallBoldInvertedColor == other.titleSmallBoldInvertedColor &&
          titleSmallBoldStaticBlackColor ==
              other.titleSmallBoldStaticBlackColor &&
          titleSmallBoldStaticWhiteColor ==
              other.titleSmallBoldStaticWhiteColor &&
          titleSmallBoldWarningColor == other.titleSmallBoldWarningColor &&
          titleSmallBoldDefaultColor == other.titleSmallBoldDefaultColor &&
          titleSmallBoldFontFamily == other.titleSmallBoldFontFamily &&
          titleSmallBoldFontSize == other.titleSmallBoldFontSize &&
          titleSmallBoldFontWeight == other.titleSmallBoldFontWeight &&
          titleSmallBoldLineHeight == other.titleSmallBoldLineHeight &&
          titleSmallDemiActiveColor == other.titleSmallDemiActiveColor &&
          titleSmallDemiErrorColor == other.titleSmallDemiErrorColor &&
          titleSmallDemiInactiveColor == other.titleSmallDemiInactiveColor &&
          titleSmallDemiInvertedColor == other.titleSmallDemiInvertedColor &&
          titleSmallDemiStaticBlackColor ==
              other.titleSmallDemiStaticBlackColor &&
          titleSmallDemiStaticWhiteColor ==
              other.titleSmallDemiStaticWhiteColor &&
          titleSmallDemiWarningColor == other.titleSmallDemiWarningColor &&
          titleSmallDemiDefaultColor == other.titleSmallDemiDefaultColor &&
          titleSmallDemiFontFamily == other.titleSmallDemiFontFamily &&
          titleSmallDemiFontSize == other.titleSmallDemiFontSize &&
          titleSmallDemiFontWeight == other.titleSmallDemiFontWeight &&
          titleSmallDemiLineHeight == other.titleSmallDemiLineHeight &&
          titleTinyBoldActiveColor == other.titleTinyBoldActiveColor &&
          titleTinyBoldErrorColor == other.titleTinyBoldErrorColor &&
          titleTinyBoldInactiveColor == other.titleTinyBoldInactiveColor &&
          titleTinyBoldInvertedColor == other.titleTinyBoldInvertedColor &&
          titleTinyBoldStaticBlackColor ==
              other.titleTinyBoldStaticBlackColor &&
          titleTinyBoldStaticWhiteColor ==
              other.titleTinyBoldStaticWhiteColor &&
          titleTinyBoldWarningColor == other.titleTinyBoldWarningColor &&
          titleTinyBoldDefaultColor == other.titleTinyBoldDefaultColor &&
          titleTinyBoldFontFamily == other.titleTinyBoldFontFamily &&
          titleTinyBoldFontSize == other.titleTinyBoldFontSize &&
          titleTinyBoldFontWeight == other.titleTinyBoldFontWeight &&
          titleTinyBoldLineHeight == other.titleTinyBoldLineHeight &&
          titleTinyDemiActiveColor == other.titleTinyDemiActiveColor &&
          titleTinyDemiErrorColor == other.titleTinyDemiErrorColor &&
          titleTinyDemiInactiveColor == other.titleTinyDemiInactiveColor &&
          titleTinyDemiInvertedColor == other.titleTinyDemiInvertedColor &&
          titleTinyDemiStaticBlackColor ==
              other.titleTinyDemiStaticBlackColor &&
          titleTinyDemiStaticWhiteColor ==
              other.titleTinyDemiStaticWhiteColor &&
          titleTinyDemiWarningColor == other.titleTinyDemiWarningColor &&
          titleTinyDemiDefaultColor == other.titleTinyDemiDefaultColor &&
          titleTinyDemiFontFamily == other.titleTinyDemiFontFamily &&
          titleTinyDemiFontSize == other.titleTinyDemiFontSize &&
          titleTinyDemiFontWeight == other.titleTinyDemiFontWeight &&
          titleTinyDemiLineHeight == other.titleTinyDemiLineHeight;

  @override
  int get hashCode =>
      bodyModerateActiveColor.hashCode ^
      bodyModerateErrorColor.hashCode ^
      bodyModerateInactiveColor.hashCode ^
      bodyModerateInvertedColor.hashCode ^
      bodyModerateStaticBlackColor.hashCode ^
      bodyModerateStaticWhiteColor.hashCode ^
      bodyModerateWarningColor.hashCode ^
      bodyModerateDefaultColor.hashCode ^
      bodyModerateFontFamily.hashCode ^
      bodyModerateFontSize.hashCode ^
      bodyModerateFontWeight.hashCode ^
      bodyModerateLineHeight.hashCode ^
      bodySmallActiveColor.hashCode ^
      bodySmallErrorColor.hashCode ^
      bodySmallInactiveColor.hashCode ^
      bodySmallInvertedColor.hashCode ^
      bodySmallStaticBlackColor.hashCode ^
      bodySmallStaticWhiteColor.hashCode ^
      bodySmallWarningColor.hashCode ^
      bodySmallDefaultColor.hashCode ^
      bodySmallFontFamily.hashCode ^
      bodySmallFontSize.hashCode ^
      bodySmallFontWeight.hashCode ^
      bodySmallLineHeight.hashCode ^
      captionModerateBookActiveColor.hashCode ^
      captionModerateBookErrorColor.hashCode ^
      captionModerateBookInactiveColor.hashCode ^
      captionModerateBookInvertedColor.hashCode ^
      captionModerateBookStaticBlackColor.hashCode ^
      captionModerateBookStaticWhiteColor.hashCode ^
      captionModerateBookWarningColor.hashCode ^
      captionModerateBookDefaultColor.hashCode ^
      captionModerateBookFontFamily.hashCode ^
      captionModerateBookFontSize.hashCode ^
      captionModerateBookFontWeight.hashCode ^
      captionModerateBookLineHeight.hashCode ^
      captionModerateDemiActiveColor.hashCode ^
      captionModerateDemiErrorColor.hashCode ^
      captionModerateDemiInactiveColor.hashCode ^
      captionModerateDemiInvertedColor.hashCode ^
      captionModerateDemiStaticBlackColor.hashCode ^
      captionModerateDemiStaticWhiteColor.hashCode ^
      captionModerateDemiWarningColor.hashCode ^
      captionModerateDemiDefaultColor.hashCode ^
      captionModerateDemiFontFamily.hashCode ^
      captionModerateDemiFontSize.hashCode ^
      captionModerateDemiFontWeight.hashCode ^
      captionModerateDemiLineHeight.hashCode ^
      captionSmallBookActiveColor.hashCode ^
      captionSmallBookErrorColor.hashCode ^
      captionSmallBookInactiveColor.hashCode ^
      captionSmallBookInvertedColor.hashCode ^
      captionSmallBookStaticBlackColor.hashCode ^
      captionSmallBookStaticWhiteColor.hashCode ^
      captionSmallBookWarningColor.hashCode ^
      captionSmallBookDefaultColor.hashCode ^
      captionSmallBookFontFamily.hashCode ^
      captionSmallBookFontSize.hashCode ^
      captionSmallBookFontWeight.hashCode ^
      captionSmallBookLineHeight.hashCode ^
      captionSmallDemiActiveColor.hashCode ^
      captionSmallDemiErrorColor.hashCode ^
      captionSmallDemiInactiveColor.hashCode ^
      captionSmallDemiInvertedColor.hashCode ^
      captionSmallDemiStaticBlackColor.hashCode ^
      captionSmallDemiStaticWhiteColor.hashCode ^
      captionSmallDemiWarningColor.hashCode ^
      captionSmallDemiDefaultColor.hashCode ^
      captionSmallDemiFontFamily.hashCode ^
      captionSmallDemiFontSize.hashCode ^
      captionSmallDemiFontWeight.hashCode ^
      captionSmallDemiLineHeight.hashCode ^
      titleExtraLargeActiveColor.hashCode ^
      titleExtraLargeErrorColor.hashCode ^
      titleExtraLargeInactiveColor.hashCode ^
      titleExtraLargeInvertedColor.hashCode ^
      titleExtraLargeStaticBlackColor.hashCode ^
      titleExtraLargeStaticWhiteColor.hashCode ^
      titleExtraLargeWarningColor.hashCode ^
      titleExtraLargeDefaultColor.hashCode ^
      titleExtraLargeFontFamily.hashCode ^
      titleExtraLargeFontSize.hashCode ^
      titleExtraLargeFontWeight.hashCode ^
      titleExtraLargeLineHeight.hashCode ^
      titleHeroActiveColor.hashCode ^
      titleHeroErrorColor.hashCode ^
      titleHeroInactiveColor.hashCode ^
      titleHeroInvertedColor.hashCode ^
      titleHeroStaticBlackColor.hashCode ^
      titleHeroStaticWhiteColor.hashCode ^
      titleHeroWarningColor.hashCode ^
      titleHeroDefaultColor.hashCode ^
      titleHeroFontFamily.hashCode ^
      titleHeroFontSize.hashCode ^
      titleHeroFontWeight.hashCode ^
      titleHeroLineHeight.hashCode ^
      titleLargeActiveColor.hashCode ^
      titleLargeErrorColor.hashCode ^
      titleLargeInactiveColor.hashCode ^
      titleLargeInvertedColor.hashCode ^
      titleLargeStaticBlackColor.hashCode ^
      titleLargeStaticWhiteColor.hashCode ^
      titleLargeWarningColor.hashCode ^
      titleLargeDefaultColor.hashCode ^
      titleLargeFontFamily.hashCode ^
      titleLargeFontSize.hashCode ^
      titleLargeFontWeight.hashCode ^
      titleLargeLineHeight.hashCode ^
      titleModerateBoldActiveColor.hashCode ^
      titleModerateBoldErrorColor.hashCode ^
      titleModerateBoldInactiveColor.hashCode ^
      titleModerateBoldInvertedColor.hashCode ^
      titleModerateBoldStaticBlackColor.hashCode ^
      titleModerateBoldStaticWhiteColor.hashCode ^
      titleModerateBoldWarningColor.hashCode ^
      titleModerateBoldDefaultColor.hashCode ^
      titleModerateBoldFontFamily.hashCode ^
      titleModerateBoldFontSize.hashCode ^
      titleModerateBoldFontWeight.hashCode ^
      titleModerateBoldLineHeight.hashCode ^
      titleModerateDemiActiveColor.hashCode ^
      titleModerateDemiErrorColor.hashCode ^
      titleModerateDemiInactiveColor.hashCode ^
      titleModerateDemiInvertedColor.hashCode ^
      titleModerateDemiStaticBlackColor.hashCode ^
      titleModerateDemiStaticWhiteColor.hashCode ^
      titleModerateDemiWarningColor.hashCode ^
      titleModerateDemiDefaultColor.hashCode ^
      titleModerateDemiFontFamily.hashCode ^
      titleModerateDemiFontSize.hashCode ^
      titleModerateDemiFontWeight.hashCode ^
      titleModerateDemiLineHeight.hashCode ^
      titleSmallBoldActiveColor.hashCode ^
      titleSmallBoldErrorColor.hashCode ^
      titleSmallBoldInactiveColor.hashCode ^
      titleSmallBoldInvertedColor.hashCode ^
      titleSmallBoldStaticBlackColor.hashCode ^
      titleSmallBoldStaticWhiteColor.hashCode ^
      titleSmallBoldWarningColor.hashCode ^
      titleSmallBoldDefaultColor.hashCode ^
      titleSmallBoldFontFamily.hashCode ^
      titleSmallBoldFontSize.hashCode ^
      titleSmallBoldFontWeight.hashCode ^
      titleSmallBoldLineHeight.hashCode ^
      titleSmallDemiActiveColor.hashCode ^
      titleSmallDemiErrorColor.hashCode ^
      titleSmallDemiInactiveColor.hashCode ^
      titleSmallDemiInvertedColor.hashCode ^
      titleSmallDemiStaticBlackColor.hashCode ^
      titleSmallDemiStaticWhiteColor.hashCode ^
      titleSmallDemiWarningColor.hashCode ^
      titleSmallDemiDefaultColor.hashCode ^
      titleSmallDemiFontFamily.hashCode ^
      titleSmallDemiFontSize.hashCode ^
      titleSmallDemiFontWeight.hashCode ^
      titleSmallDemiLineHeight.hashCode ^
      titleTinyBoldActiveColor.hashCode ^
      titleTinyBoldErrorColor.hashCode ^
      titleTinyBoldInactiveColor.hashCode ^
      titleTinyBoldInvertedColor.hashCode ^
      titleTinyBoldStaticBlackColor.hashCode ^
      titleTinyBoldStaticWhiteColor.hashCode ^
      titleTinyBoldWarningColor.hashCode ^
      titleTinyBoldDefaultColor.hashCode ^
      titleTinyBoldFontFamily.hashCode ^
      titleTinyBoldFontSize.hashCode ^
      titleTinyBoldFontWeight.hashCode ^
      titleTinyBoldLineHeight.hashCode ^
      titleTinyDemiActiveColor.hashCode ^
      titleTinyDemiErrorColor.hashCode ^
      titleTinyDemiInactiveColor.hashCode ^
      titleTinyDemiInvertedColor.hashCode ^
      titleTinyDemiStaticBlackColor.hashCode ^
      titleTinyDemiStaticWhiteColor.hashCode ^
      titleTinyDemiWarningColor.hashCode ^
      titleTinyDemiDefaultColor.hashCode ^
      titleTinyDemiFontFamily.hashCode ^
      titleTinyDemiFontSize.hashCode ^
      titleTinyDemiFontWeight.hashCode ^
      titleTinyDemiLineHeight.hashCode;
}

/// Implements the JSN design language for Text theming in a similar way
/// as [TextTheme] does for [MaterialApp].
///
/// # About JSN text theming
///   * JSN uses the following font families:
///       * Gojek themes - Maison Neue
///       * jsn themes - jsnSerif and Red Hat Display
///   * The types of font glyphs - maison_neue_book, maison_neue_demi &
///   maison_neue_bold are selected based on [FontWeight]. More details in
///   [Flutter documentation](https://flutter.dev/docs/cookbook/design/fonts#pubspecyaml-option-definitions)
///   * The recommended way to theme text is by using a [TextStyle] defined
///   in this class.
///   Examples on the usage can be found below.
///
/// # Usage
///
/// To theme a Text widget:
/// ```dart
/// Text(
///   "Hello",
///   style: JSNTheme.of(context).textTheme.titleExtraLargeActive,
/// );
/// ```
///
/// JSN text theming can be used in a similar way with other widgets,
/// like RichText widget:
///
/// ```dart
/// RichText(
///   text: TextSpan(
///   text: 'Hello ',
///   style: JSNTheme.of(context).textTheme.bodyModerateDefault,
///   children: <TextSpan>[
///     TextSpan(
///         text: 'active',
///         style: JSNTheme.of(context).textTheme.bodyModerateActive,
///     ),
///     const TextSpan(text: ' world!'),
///   ],
/// )
/// ```
///
/// To get access to raw [JSNTypographyTokens] for the current theme:
///
/// ```dart
/// final tokens = JSNTheme.of(context).textTheme.tokens.titleHeroFontName;
/// ```
@immutable
class JSNTextTheme {
  final JSNTypographyTokens tokens;

  const JSNTextTheme._({
    required this.tokens,
  });

  factory JSNTextTheme.jsnThemeDark() {
    return JSNTextTheme._(
      tokens: JSNTypographyTokens.jsnThemeDark(),
    );
  }

  factory JSNTextTheme.jsnThemeLight() {
    return JSNTextTheme._(
      tokens: JSNTypographyTokens.jsnThemeLight(),
    );
  }

  factory JSNTextTheme.greenThemeDark() {
    return JSNTextTheme._(
      tokens: JSNTypographyTokens.greenThemeDark(),
    );
  }

  factory JSNTextTheme.greenThemeLight() {
    return JSNTextTheme._(
      tokens: JSNTypographyTokens.greenThemeLight(),
    );
  }

  factory JSNTextTheme.pinkThemeDark() {
    return JSNTextTheme._(
      tokens: JSNTypographyTokens.pinkThemeDark(),
    );
  }

  factory JSNTextTheme.pinkThemeLight() {
    return JSNTextTheme._(
      tokens: JSNTypographyTokens.pinkThemeLight(),
    );
  }

  factory JSNTextTheme.purpleThemeDark() {
    return JSNTextTheme._(
      tokens: JSNTypographyTokens.purpleThemeDark(),
    );
  }

  factory JSNTextTheme.purpleThemeLight() {
    return JSNTextTheme._(
      tokens: JSNTypographyTokens.purpleThemeLight(),
    );
  }

  TextStyle get titleH1 => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodyModerateFontFamily,
        fontWeight: tokens.bodyModerateFontWeight,
        fontSize: tokens.bodyModerateFontSize,
        color: tokens.bodyModerateActiveColor,
        height: tokens.bodyModerateLineHeight / tokens.bodyModerateFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyModerateActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodyModerateFontFamily,
        fontWeight: tokens.bodyModerateFontWeight,
        fontSize: tokens.bodyModerateFontSize,
        color: tokens.bodyModerateActiveColor,
        height: tokens.bodyModerateLineHeight / tokens.bodyModerateFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyModerateError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodyModerateFontFamily,
        fontWeight: tokens.bodyModerateFontWeight,
        fontSize: tokens.bodyModerateFontSize,
        color: tokens.bodyModerateErrorColor,
        height: tokens.bodyModerateLineHeight / tokens.bodyModerateFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyModerateInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodyModerateFontFamily,
        fontWeight: tokens.bodyModerateFontWeight,
        fontSize: tokens.bodyModerateFontSize,
        color: tokens.bodyModerateInactiveColor,
        height: tokens.bodyModerateLineHeight / tokens.bodyModerateFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyModerateInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodyModerateFontFamily,
        fontWeight: tokens.bodyModerateFontWeight,
        fontSize: tokens.bodyModerateFontSize,
        color: tokens.bodyModerateInvertedColor,
        height: tokens.bodyModerateLineHeight / tokens.bodyModerateFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyModerateStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodyModerateFontFamily,
        fontWeight: tokens.bodyModerateFontWeight,
        fontSize: tokens.bodyModerateFontSize,
        color: tokens.bodyModerateStaticBlackColor,
        height: tokens.bodyModerateLineHeight / tokens.bodyModerateFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyModerateStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodyModerateFontFamily,
        fontWeight: tokens.bodyModerateFontWeight,
        fontSize: tokens.bodyModerateFontSize,
        color: tokens.bodyModerateStaticWhiteColor,
        height: tokens.bodyModerateLineHeight / tokens.bodyModerateFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyModerateWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodyModerateFontFamily,
        fontWeight: tokens.bodyModerateFontWeight,
        fontSize: tokens.bodyModerateFontSize,
        color: tokens.bodyModerateWarningColor,
        height: tokens.bodyModerateLineHeight / tokens.bodyModerateFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodyModerateDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodyModerateFontFamily,
        fontWeight: tokens.bodyModerateFontWeight,
        fontSize: tokens.bodyModerateFontSize,
        color: tokens.bodyModerateDefaultColor,
        height: tokens.bodyModerateLineHeight / tokens.bodyModerateFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodySmallActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodySmallFontFamily,
        fontWeight: tokens.bodySmallFontWeight,
        fontSize: tokens.bodySmallFontSize,
        color: tokens.bodySmallActiveColor,
        height: tokens.bodySmallLineHeight / tokens.bodySmallFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodySmallError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodySmallFontFamily,
        fontWeight: tokens.bodySmallFontWeight,
        fontSize: tokens.bodySmallFontSize,
        color: tokens.bodySmallErrorColor,
        height: tokens.bodySmallLineHeight / tokens.bodySmallFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodySmallInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodySmallFontFamily,
        fontWeight: tokens.bodySmallFontWeight,
        fontSize: tokens.bodySmallFontSize,
        color: tokens.bodySmallInactiveColor,
        height: tokens.bodySmallLineHeight / tokens.bodySmallFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodySmallInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodySmallFontFamily,
        fontWeight: tokens.bodySmallFontWeight,
        fontSize: tokens.bodySmallFontSize,
        color: tokens.bodySmallInvertedColor,
        height: tokens.bodySmallLineHeight / tokens.bodySmallFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodySmallStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodySmallFontFamily,
        fontWeight: tokens.bodySmallFontWeight,
        fontSize: tokens.bodySmallFontSize,
        color: tokens.bodySmallStaticBlackColor,
        height: tokens.bodySmallLineHeight / tokens.bodySmallFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodySmallStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodySmallFontFamily,
        fontWeight: tokens.bodySmallFontWeight,
        fontSize: tokens.bodySmallFontSize,
        color: tokens.bodySmallStaticWhiteColor,
        height: tokens.bodySmallLineHeight / tokens.bodySmallFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodySmallWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodySmallFontFamily,
        fontWeight: tokens.bodySmallFontWeight,
        fontSize: tokens.bodySmallFontSize,
        color: tokens.bodySmallWarningColor,
        height: tokens.bodySmallLineHeight / tokens.bodySmallFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bodySmallDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.bodySmallFontFamily,
        fontWeight: tokens.bodySmallFontWeight,
        fontSize: tokens.bodySmallFontSize,
        color: tokens.bodySmallDefaultColor,
        height: tokens.bodySmallLineHeight / tokens.bodySmallFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateBookActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateBookFontFamily,
        fontWeight: tokens.captionModerateBookFontWeight,
        fontSize: tokens.captionModerateBookFontSize,
        color: tokens.captionModerateBookActiveColor,
        height: tokens.captionModerateBookLineHeight /
            tokens.captionModerateBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateBookError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateBookFontFamily,
        fontWeight: tokens.captionModerateBookFontWeight,
        fontSize: tokens.captionModerateBookFontSize,
        color: tokens.captionModerateBookErrorColor,
        height: tokens.captionModerateBookLineHeight /
            tokens.captionModerateBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateBookInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateBookFontFamily,
        fontWeight: tokens.captionModerateBookFontWeight,
        fontSize: tokens.captionModerateBookFontSize,
        color: tokens.captionModerateBookInactiveColor,
        height: tokens.captionModerateBookLineHeight /
            tokens.captionModerateBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateBookInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateBookFontFamily,
        fontWeight: tokens.captionModerateBookFontWeight,
        fontSize: tokens.captionModerateBookFontSize,
        color: tokens.captionModerateBookInvertedColor,
        height: tokens.captionModerateBookLineHeight /
            tokens.captionModerateBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateBookStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateBookFontFamily,
        fontWeight: tokens.captionModerateBookFontWeight,
        fontSize: tokens.captionModerateBookFontSize,
        color: tokens.captionModerateBookStaticBlackColor,
        height: tokens.captionModerateBookLineHeight /
            tokens.captionModerateBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateBookStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateBookFontFamily,
        fontWeight: tokens.captionModerateBookFontWeight,
        fontSize: tokens.captionModerateBookFontSize,
        color: tokens.captionModerateBookStaticWhiteColor,
        height: tokens.captionModerateBookLineHeight /
            tokens.captionModerateBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateBookWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateBookFontFamily,
        fontWeight: tokens.captionModerateBookFontWeight,
        fontSize: tokens.captionModerateBookFontSize,
        color: tokens.captionModerateBookWarningColor,
        height: tokens.captionModerateBookLineHeight /
            tokens.captionModerateBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateBookDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateBookFontFamily,
        fontWeight: tokens.captionModerateBookFontWeight,
        fontSize: tokens.captionModerateBookFontSize,
        color: tokens.captionModerateBookDefaultColor,
        height: tokens.captionModerateBookLineHeight /
            tokens.captionModerateBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateDemiActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateDemiFontFamily,
        fontWeight: tokens.captionModerateDemiFontWeight,
        fontSize: tokens.captionModerateDemiFontSize,
        color: tokens.captionModerateDemiActiveColor,
        height: tokens.captionModerateDemiLineHeight /
            tokens.captionModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateDemiError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateDemiFontFamily,
        fontWeight: tokens.captionModerateDemiFontWeight,
        fontSize: tokens.captionModerateDemiFontSize,
        color: tokens.captionModerateDemiErrorColor,
        height: tokens.captionModerateDemiLineHeight /
            tokens.captionModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateDemiInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateDemiFontFamily,
        fontWeight: tokens.captionModerateDemiFontWeight,
        fontSize: tokens.captionModerateDemiFontSize,
        color: tokens.captionModerateDemiInactiveColor,
        height: tokens.captionModerateDemiLineHeight /
            tokens.captionModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateDemiInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateDemiFontFamily,
        fontWeight: tokens.captionModerateDemiFontWeight,
        fontSize: tokens.captionModerateDemiFontSize,
        color: tokens.captionModerateDemiInvertedColor,
        height: tokens.captionModerateDemiLineHeight /
            tokens.captionModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateDemiStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateDemiFontFamily,
        fontWeight: tokens.captionModerateDemiFontWeight,
        fontSize: tokens.captionModerateDemiFontSize,
        color: tokens.captionModerateDemiStaticBlackColor,
        height: tokens.captionModerateDemiLineHeight /
            tokens.captionModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateDemiStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateDemiFontFamily,
        fontWeight: tokens.captionModerateDemiFontWeight,
        fontSize: tokens.captionModerateDemiFontSize,
        color: tokens.captionModerateDemiStaticWhiteColor,
        height: tokens.captionModerateDemiLineHeight /
            tokens.captionModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateDemiWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateDemiFontFamily,
        fontWeight: tokens.captionModerateDemiFontWeight,
        fontSize: tokens.captionModerateDemiFontSize,
        color: tokens.captionModerateDemiWarningColor,
        height: tokens.captionModerateDemiLineHeight /
            tokens.captionModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionModerateDemiDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionModerateDemiFontFamily,
        fontWeight: tokens.captionModerateDemiFontWeight,
        fontSize: tokens.captionModerateDemiFontSize,
        color: tokens.captionModerateDemiDefaultColor,
        height: tokens.captionModerateDemiLineHeight /
            tokens.captionModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallBookActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallBookFontFamily,
        fontWeight: tokens.captionSmallBookFontWeight,
        fontSize: tokens.captionSmallBookFontSize,
        color: tokens.captionSmallBookActiveColor,
        height:
            tokens.captionSmallBookLineHeight / tokens.captionSmallBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallBookError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallBookFontFamily,
        fontWeight: tokens.captionSmallBookFontWeight,
        fontSize: tokens.captionSmallBookFontSize,
        color: tokens.captionSmallBookErrorColor,
        height:
            tokens.captionSmallBookLineHeight / tokens.captionSmallBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallBookInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallBookFontFamily,
        fontWeight: tokens.captionSmallBookFontWeight,
        fontSize: tokens.captionSmallBookFontSize,
        color: tokens.captionSmallBookInactiveColor,
        height:
            tokens.captionSmallBookLineHeight / tokens.captionSmallBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallBookInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallBookFontFamily,
        fontWeight: tokens.captionSmallBookFontWeight,
        fontSize: tokens.captionSmallBookFontSize,
        color: tokens.captionSmallBookInvertedColor,
        height:
            tokens.captionSmallBookLineHeight / tokens.captionSmallBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallBookStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallBookFontFamily,
        fontWeight: tokens.captionSmallBookFontWeight,
        fontSize: tokens.captionSmallBookFontSize,
        color: tokens.captionSmallBookStaticBlackColor,
        height:
            tokens.captionSmallBookLineHeight / tokens.captionSmallBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallBookStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallBookFontFamily,
        fontWeight: tokens.captionSmallBookFontWeight,
        fontSize: tokens.captionSmallBookFontSize,
        color: tokens.captionSmallBookStaticWhiteColor,
        height:
            tokens.captionSmallBookLineHeight / tokens.captionSmallBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallBookWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallBookFontFamily,
        fontWeight: tokens.captionSmallBookFontWeight,
        fontSize: tokens.captionSmallBookFontSize,
        color: tokens.captionSmallBookWarningColor,
        height:
            tokens.captionSmallBookLineHeight / tokens.captionSmallBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallBookDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallBookFontFamily,
        fontWeight: tokens.captionSmallBookFontWeight,
        fontSize: tokens.captionSmallBookFontSize,
        color: tokens.captionSmallBookDefaultColor,
        height:
            tokens.captionSmallBookLineHeight / tokens.captionSmallBookFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallDemiActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallDemiFontFamily,
        fontWeight: tokens.captionSmallDemiFontWeight,
        fontSize: tokens.captionSmallDemiFontSize,
        color: tokens.captionSmallDemiActiveColor,
        height:
            tokens.captionSmallDemiLineHeight / tokens.captionSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallDemiError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallDemiFontFamily,
        fontWeight: tokens.captionSmallDemiFontWeight,
        fontSize: tokens.captionSmallDemiFontSize,
        color: tokens.captionSmallDemiErrorColor,
        height:
            tokens.captionSmallDemiLineHeight / tokens.captionSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallDemiInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallDemiFontFamily,
        fontWeight: tokens.captionSmallDemiFontWeight,
        fontSize: tokens.captionSmallDemiFontSize,
        color: tokens.captionSmallDemiInactiveColor,
        height:
            tokens.captionSmallDemiLineHeight / tokens.captionSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallDemiInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallDemiFontFamily,
        fontWeight: tokens.captionSmallDemiFontWeight,
        fontSize: tokens.captionSmallDemiFontSize,
        color: tokens.captionSmallDemiInvertedColor,
        height:
            tokens.captionSmallDemiLineHeight / tokens.captionSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallDemiStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallDemiFontFamily,
        fontWeight: tokens.captionSmallDemiFontWeight,
        fontSize: tokens.captionSmallDemiFontSize,
        color: tokens.captionSmallDemiStaticBlackColor,
        height:
            tokens.captionSmallDemiLineHeight / tokens.captionSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallDemiStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallDemiFontFamily,
        fontWeight: tokens.captionSmallDemiFontWeight,
        fontSize: tokens.captionSmallDemiFontSize,
        color: tokens.captionSmallDemiStaticWhiteColor,
        height:
            tokens.captionSmallDemiLineHeight / tokens.captionSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallDemiWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallDemiFontFamily,
        fontWeight: tokens.captionSmallDemiFontWeight,
        fontSize: tokens.captionSmallDemiFontSize,
        color: tokens.captionSmallDemiWarningColor,
        height:
            tokens.captionSmallDemiLineHeight / tokens.captionSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get captionSmallDemiDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.captionSmallDemiFontFamily,
        fontWeight: tokens.captionSmallDemiFontWeight,
        fontSize: tokens.captionSmallDemiFontSize,
        color: tokens.captionSmallDemiDefaultColor,
        height:
            tokens.captionSmallDemiLineHeight / tokens.captionSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleExtraLargeActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleExtraLargeFontFamily,
        fontWeight: tokens.titleExtraLargeFontWeight,
        fontSize: tokens.titleExtraLargeFontSize,
        color: tokens.titleExtraLargeActiveColor,
        height:
            tokens.titleExtraLargeLineHeight / tokens.titleExtraLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleExtraLargeError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleExtraLargeFontFamily,
        fontWeight: tokens.titleExtraLargeFontWeight,
        fontSize: tokens.titleExtraLargeFontSize,
        color: tokens.titleExtraLargeErrorColor,
        height:
            tokens.titleExtraLargeLineHeight / tokens.titleExtraLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleExtraLargeInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleExtraLargeFontFamily,
        fontWeight: tokens.titleExtraLargeFontWeight,
        fontSize: tokens.titleExtraLargeFontSize,
        color: tokens.titleExtraLargeInactiveColor,
        height:
            tokens.titleExtraLargeLineHeight / tokens.titleExtraLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleExtraLargeInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleExtraLargeFontFamily,
        fontWeight: tokens.titleExtraLargeFontWeight,
        fontSize: tokens.titleExtraLargeFontSize,
        color: tokens.titleExtraLargeInvertedColor,
        height:
            tokens.titleExtraLargeLineHeight / tokens.titleExtraLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleExtraLargeStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleExtraLargeFontFamily,
        fontWeight: tokens.titleExtraLargeFontWeight,
        fontSize: tokens.titleExtraLargeFontSize,
        color: tokens.titleExtraLargeStaticBlackColor,
        height:
            tokens.titleExtraLargeLineHeight / tokens.titleExtraLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleExtraLargeStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleExtraLargeFontFamily,
        fontWeight: tokens.titleExtraLargeFontWeight,
        fontSize: tokens.titleExtraLargeFontSize,
        color: tokens.titleExtraLargeStaticWhiteColor,
        height:
            tokens.titleExtraLargeLineHeight / tokens.titleExtraLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleExtraLargeWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleExtraLargeFontFamily,
        fontWeight: tokens.titleExtraLargeFontWeight,
        fontSize: tokens.titleExtraLargeFontSize,
        color: tokens.titleExtraLargeWarningColor,
        height:
            tokens.titleExtraLargeLineHeight / tokens.titleExtraLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleExtraLargeDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleExtraLargeFontFamily,
        fontWeight: tokens.titleExtraLargeFontWeight,
        fontSize: tokens.titleExtraLargeFontSize,
        color: tokens.titleExtraLargeDefaultColor,
        height:
            tokens.titleExtraLargeLineHeight / tokens.titleExtraLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleHeroActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleHeroFontFamily,
        fontWeight: tokens.titleHeroFontWeight,
        fontSize: tokens.titleHeroFontSize,
        color: tokens.titleHeroActiveColor,
        height: tokens.titleHeroLineHeight / tokens.titleHeroFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleHeroError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleHeroFontFamily,
        fontWeight: tokens.titleHeroFontWeight,
        fontSize: tokens.titleHeroFontSize,
        color: tokens.titleHeroErrorColor,
        height: tokens.titleHeroLineHeight / tokens.titleHeroFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleHeroInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleHeroFontFamily,
        fontWeight: tokens.titleHeroFontWeight,
        fontSize: tokens.titleHeroFontSize,
        color: tokens.titleHeroInactiveColor,
        height: tokens.titleHeroLineHeight / tokens.titleHeroFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleHeroInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleHeroFontFamily,
        fontWeight: tokens.titleHeroFontWeight,
        fontSize: tokens.titleHeroFontSize,
        color: tokens.titleHeroInvertedColor,
        height: tokens.titleHeroLineHeight / tokens.titleHeroFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleHeroStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleHeroFontFamily,
        fontWeight: tokens.titleHeroFontWeight,
        fontSize: tokens.titleHeroFontSize,
        color: tokens.titleHeroStaticBlackColor,
        height: tokens.titleHeroLineHeight / tokens.titleHeroFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleHeroStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleHeroFontFamily,
        fontWeight: tokens.titleHeroFontWeight,
        fontSize: tokens.titleHeroFontSize,
        color: tokens.titleHeroStaticWhiteColor,
        height: tokens.titleHeroLineHeight / tokens.titleHeroFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleHeroWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleHeroFontFamily,
        fontWeight: tokens.titleHeroFontWeight,
        fontSize: tokens.titleHeroFontSize,
        color: tokens.titleHeroWarningColor,
        height: tokens.titleHeroLineHeight / tokens.titleHeroFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleHeroDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleHeroFontFamily,
        fontWeight: tokens.titleHeroFontWeight,
        fontSize: tokens.titleHeroFontSize,
        color: tokens.titleHeroDefaultColor,
        height: tokens.titleHeroLineHeight / tokens.titleHeroFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleLargeActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleLargeFontFamily,
        fontWeight: tokens.titleLargeFontWeight,
        fontSize: tokens.titleLargeFontSize,
        color: tokens.titleLargeActiveColor,
        height: tokens.titleLargeLineHeight / tokens.titleLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleLargeError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleLargeFontFamily,
        fontWeight: tokens.titleLargeFontWeight,
        fontSize: tokens.titleLargeFontSize,
        color: tokens.titleLargeErrorColor,
        height: tokens.titleLargeLineHeight / tokens.titleLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleLargeInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleLargeFontFamily,
        fontWeight: tokens.titleLargeFontWeight,
        fontSize: tokens.titleLargeFontSize,
        color: tokens.titleLargeInactiveColor,
        height: tokens.titleLargeLineHeight / tokens.titleLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleLargeInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleLargeFontFamily,
        fontWeight: tokens.titleLargeFontWeight,
        fontSize: tokens.titleLargeFontSize,
        color: tokens.titleLargeInvertedColor,
        height: tokens.titleLargeLineHeight / tokens.titleLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleLargeStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleLargeFontFamily,
        fontWeight: tokens.titleLargeFontWeight,
        fontSize: tokens.titleLargeFontSize,
        color: tokens.titleLargeStaticBlackColor,
        height: tokens.titleLargeLineHeight / tokens.titleLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleLargeStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleLargeFontFamily,
        fontWeight: tokens.titleLargeFontWeight,
        fontSize: tokens.titleLargeFontSize,
        color: tokens.titleLargeStaticWhiteColor,
        height: tokens.titleLargeLineHeight / tokens.titleLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleLargeWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleLargeFontFamily,
        fontWeight: tokens.titleLargeFontWeight,
        fontSize: tokens.titleLargeFontSize,
        color: tokens.titleLargeWarningColor,
        height: tokens.titleLargeLineHeight / tokens.titleLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleLargeDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleLargeFontFamily,
        fontWeight: tokens.titleLargeFontWeight,
        fontSize: tokens.titleLargeFontSize,
        color: tokens.titleLargeDefaultColor,
        height: tokens.titleLargeLineHeight / tokens.titleLargeFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateBoldActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateBoldFontFamily,
        fontWeight: tokens.titleModerateBoldFontWeight,
        fontSize: tokens.titleModerateBoldFontSize,
        color: tokens.titleModerateBoldActiveColor,
        height: tokens.titleModerateBoldLineHeight /
            tokens.titleModerateBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateBoldError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateBoldFontFamily,
        fontWeight: tokens.titleModerateBoldFontWeight,
        fontSize: tokens.titleModerateBoldFontSize,
        color: tokens.titleModerateBoldErrorColor,
        height: tokens.titleModerateBoldLineHeight /
            tokens.titleModerateBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateBoldInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateBoldFontFamily,
        fontWeight: tokens.titleModerateBoldFontWeight,
        fontSize: tokens.titleModerateBoldFontSize,
        color: tokens.titleModerateBoldInactiveColor,
        height: tokens.titleModerateBoldLineHeight /
            tokens.titleModerateBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateBoldInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateBoldFontFamily,
        fontWeight: tokens.titleModerateBoldFontWeight,
        fontSize: tokens.titleModerateBoldFontSize,
        color: tokens.titleModerateBoldInvertedColor,
        height: tokens.titleModerateBoldLineHeight /
            tokens.titleModerateBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateBoldStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateBoldFontFamily,
        fontWeight: tokens.titleModerateBoldFontWeight,
        fontSize: tokens.titleModerateBoldFontSize,
        color: tokens.titleModerateBoldStaticBlackColor,
        height: tokens.titleModerateBoldLineHeight /
            tokens.titleModerateBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateBoldStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateBoldFontFamily,
        fontWeight: tokens.titleModerateBoldFontWeight,
        fontSize: tokens.titleModerateBoldFontSize,
        color: tokens.titleModerateBoldStaticWhiteColor,
        height: tokens.titleModerateBoldLineHeight /
            tokens.titleModerateBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateBoldWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateBoldFontFamily,
        fontWeight: tokens.titleModerateBoldFontWeight,
        fontSize: tokens.titleModerateBoldFontSize,
        color: tokens.titleModerateBoldWarningColor,
        height: tokens.titleModerateBoldLineHeight /
            tokens.titleModerateBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateBoldDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateBoldFontFamily,
        fontWeight: tokens.titleModerateBoldFontWeight,
        fontSize: tokens.titleModerateBoldFontSize,
        color: tokens.titleModerateBoldDefaultColor,
        height: tokens.titleModerateBoldLineHeight /
            tokens.titleModerateBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateDemiActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateDemiFontFamily,
        fontWeight: tokens.titleModerateDemiFontWeight,
        fontSize: tokens.titleModerateDemiFontSize,
        color: tokens.titleModerateDemiActiveColor,
        height: tokens.titleModerateDemiLineHeight /
            tokens.titleModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateDemiError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateDemiFontFamily,
        fontWeight: tokens.titleModerateDemiFontWeight,
        fontSize: tokens.titleModerateDemiFontSize,
        color: tokens.titleModerateDemiErrorColor,
        height: tokens.titleModerateDemiLineHeight /
            tokens.titleModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateDemiInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateDemiFontFamily,
        fontWeight: tokens.titleModerateDemiFontWeight,
        fontSize: tokens.titleModerateDemiFontSize,
        color: tokens.titleModerateDemiInactiveColor,
        height: tokens.titleModerateDemiLineHeight /
            tokens.titleModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateDemiInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateDemiFontFamily,
        fontWeight: tokens.titleModerateDemiFontWeight,
        fontSize: tokens.titleModerateDemiFontSize,
        color: tokens.titleModerateDemiInvertedColor,
        height: tokens.titleModerateDemiLineHeight /
            tokens.titleModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateDemiStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateDemiFontFamily,
        fontWeight: tokens.titleModerateDemiFontWeight,
        fontSize: tokens.titleModerateDemiFontSize,
        color: tokens.titleModerateDemiStaticBlackColor,
        height: tokens.titleModerateDemiLineHeight /
            tokens.titleModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateDemiStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateDemiFontFamily,
        fontWeight: tokens.titleModerateDemiFontWeight,
        fontSize: tokens.titleModerateDemiFontSize,
        color: tokens.titleModerateDemiStaticWhiteColor,
        height: tokens.titleModerateDemiLineHeight /
            tokens.titleModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateDemiWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateDemiFontFamily,
        fontWeight: tokens.titleModerateDemiFontWeight,
        fontSize: tokens.titleModerateDemiFontSize,
        color: tokens.titleModerateDemiWarningColor,
        height: tokens.titleModerateDemiLineHeight /
            tokens.titleModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleModerateDemiDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleModerateDemiFontFamily,
        fontWeight: tokens.titleModerateDemiFontWeight,
        fontSize: tokens.titleModerateDemiFontSize,
        color: tokens.titleModerateDemiDefaultColor,
        height: tokens.titleModerateDemiLineHeight /
            tokens.titleModerateDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallBoldActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallBoldFontFamily,
        fontWeight: tokens.titleSmallBoldFontWeight,
        fontSize: tokens.titleSmallBoldFontSize,
        color: tokens.titleSmallBoldActiveColor,
        height: tokens.titleSmallBoldLineHeight / tokens.titleSmallBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallBoldError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallBoldFontFamily,
        fontWeight: tokens.titleSmallBoldFontWeight,
        fontSize: tokens.titleSmallBoldFontSize,
        color: tokens.titleSmallBoldErrorColor,
        height: tokens.titleSmallBoldLineHeight / tokens.titleSmallBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallBoldInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallBoldFontFamily,
        fontWeight: tokens.titleSmallBoldFontWeight,
        fontSize: tokens.titleSmallBoldFontSize,
        color: tokens.titleSmallBoldInactiveColor,
        height: tokens.titleSmallBoldLineHeight / tokens.titleSmallBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallBoldInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallBoldFontFamily,
        fontWeight: tokens.titleSmallBoldFontWeight,
        fontSize: tokens.titleSmallBoldFontSize,
        color: tokens.titleSmallBoldInvertedColor,
        height: tokens.titleSmallBoldLineHeight / tokens.titleSmallBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallBoldStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallBoldFontFamily,
        fontWeight: tokens.titleSmallBoldFontWeight,
        fontSize: tokens.titleSmallBoldFontSize,
        color: tokens.titleSmallBoldStaticBlackColor,
        height: tokens.titleSmallBoldLineHeight / tokens.titleSmallBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallBoldStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallBoldFontFamily,
        fontWeight: tokens.titleSmallBoldFontWeight,
        fontSize: tokens.titleSmallBoldFontSize,
        color: tokens.titleSmallBoldStaticWhiteColor,
        height: tokens.titleSmallBoldLineHeight / tokens.titleSmallBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallBoldWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallBoldFontFamily,
        fontWeight: tokens.titleSmallBoldFontWeight,
        fontSize: tokens.titleSmallBoldFontSize,
        color: tokens.titleSmallBoldWarningColor,
        height: tokens.titleSmallBoldLineHeight / tokens.titleSmallBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallBoldDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallBoldFontFamily,
        fontWeight: tokens.titleSmallBoldFontWeight,
        fontSize: tokens.titleSmallBoldFontSize,
        color: tokens.titleSmallBoldDefaultColor,
        height: tokens.titleSmallBoldLineHeight / tokens.titleSmallBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallDemiActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallDemiFontFamily,
        fontWeight: tokens.titleSmallDemiFontWeight,
        fontSize: tokens.titleSmallDemiFontSize,
        color: tokens.titleSmallDemiActiveColor,
        height: tokens.titleSmallDemiLineHeight / tokens.titleSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallDemiError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallDemiFontFamily,
        fontWeight: tokens.titleSmallDemiFontWeight,
        fontSize: tokens.titleSmallDemiFontSize,
        color: tokens.titleSmallDemiErrorColor,
        height: tokens.titleSmallDemiLineHeight / tokens.titleSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallDemiInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallDemiFontFamily,
        fontWeight: tokens.titleSmallDemiFontWeight,
        fontSize: tokens.titleSmallDemiFontSize,
        color: tokens.titleSmallDemiInactiveColor,
        height: tokens.titleSmallDemiLineHeight / tokens.titleSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallDemiInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallDemiFontFamily,
        fontWeight: tokens.titleSmallDemiFontWeight,
        fontSize: tokens.titleSmallDemiFontSize,
        color: tokens.titleSmallDemiInvertedColor,
        height: tokens.titleSmallDemiLineHeight / tokens.titleSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallDemiStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallDemiFontFamily,
        fontWeight: tokens.titleSmallDemiFontWeight,
        fontSize: tokens.titleSmallDemiFontSize,
        color: tokens.titleSmallDemiStaticBlackColor,
        height: tokens.titleSmallDemiLineHeight / tokens.titleSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallDemiStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallDemiFontFamily,
        fontWeight: tokens.titleSmallDemiFontWeight,
        fontSize: tokens.titleSmallDemiFontSize,
        color: tokens.titleSmallDemiStaticWhiteColor,
        height: tokens.titleSmallDemiLineHeight / tokens.titleSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallDemiWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallDemiFontFamily,
        fontWeight: tokens.titleSmallDemiFontWeight,
        fontSize: tokens.titleSmallDemiFontSize,
        color: tokens.titleSmallDemiWarningColor,
        height: tokens.titleSmallDemiLineHeight / tokens.titleSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleSmallDemiDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleSmallDemiFontFamily,
        fontWeight: tokens.titleSmallDemiFontWeight,
        fontSize: tokens.titleSmallDemiFontSize,
        color: tokens.titleSmallDemiDefaultColor,
        height: tokens.titleSmallDemiLineHeight / tokens.titleSmallDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyBoldActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldActiveColor,
        height: tokens.titleTinyBoldLineHeight / tokens.titleTinyBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyBoldError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldErrorColor,
        height: tokens.titleTinyBoldLineHeight / tokens.titleTinyBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyBoldInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldInactiveColor,
        height: tokens.titleTinyBoldLineHeight / tokens.titleTinyBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyBoldInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldInvertedColor,
        height: tokens.titleTinyBoldLineHeight / tokens.titleTinyBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyBoldStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldStaticBlackColor,
        height: tokens.titleTinyBoldLineHeight / tokens.titleTinyBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyBoldStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldStaticWhiteColor,
        height: tokens.titleTinyBoldLineHeight / tokens.titleTinyBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyBoldWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldWarningColor,
        height: tokens.titleTinyBoldLineHeight / tokens.titleTinyBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyBoldDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldDefaultColor,
        height: tokens.titleTinyBoldLineHeight / tokens.titleTinyBoldFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyDemiActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyDemiFontFamily,
        fontWeight: tokens.titleTinyDemiFontWeight,
        fontSize: tokens.titleTinyDemiFontSize,
        color: tokens.titleTinyDemiActiveColor,
        height: tokens.titleTinyDemiLineHeight / tokens.titleTinyDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyDemiError => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyDemiFontFamily,
        fontWeight: tokens.titleTinyDemiFontWeight,
        fontSize: tokens.titleTinyDemiFontSize,
        color: tokens.titleTinyDemiErrorColor,
        height: tokens.titleTinyDemiLineHeight / tokens.titleTinyDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyDemiInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyDemiFontFamily,
        fontWeight: tokens.titleTinyDemiFontWeight,
        fontSize: tokens.titleTinyDemiFontSize,
        color: tokens.titleTinyDemiInactiveColor,
        height: tokens.titleTinyDemiLineHeight / tokens.titleTinyDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyDemiInverted => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyDemiFontFamily,
        fontWeight: tokens.titleTinyDemiFontWeight,
        fontSize: tokens.titleTinyDemiFontSize,
        color: tokens.titleTinyDemiInvertedColor,
        height: tokens.titleTinyDemiLineHeight / tokens.titleTinyDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyDemiStaticBlack => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyDemiFontFamily,
        fontWeight: tokens.titleTinyDemiFontWeight,
        fontSize: tokens.titleTinyDemiFontSize,
        color: tokens.titleTinyDemiStaticBlackColor,
        height: tokens.titleTinyDemiLineHeight / tokens.titleTinyDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyDemiStaticWhite => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyDemiFontFamily,
        fontWeight: tokens.titleTinyDemiFontWeight,
        fontSize: tokens.titleTinyDemiFontSize,
        color: tokens.titleTinyDemiStaticWhiteColor,
        height: tokens.titleTinyDemiLineHeight / tokens.titleTinyDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyDemiWarning => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyDemiFontFamily,
        fontWeight: tokens.titleTinyDemiFontWeight,
        fontSize: tokens.titleTinyDemiFontSize,
        color: tokens.titleTinyDemiWarningColor,
        height: tokens.titleTinyDemiLineHeight / tokens.titleTinyDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get titleTinyDemiDefault => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyDemiFontFamily,
        fontWeight: tokens.titleTinyDemiFontWeight,
        fontSize: tokens.titleTinyDemiFontSize,
        color: tokens.titleTinyDemiDefaultColor,
        height: tokens.titleTinyDemiLineHeight / tokens.titleTinyDemiFontSize,
        leadingDistribution: TextLeadingDistribution.even,
      );

  // TextStyle(
  //         color: states.contains(MaterialState.selected)
  //             ? context.jsnColorTokens.typographyDefaultBody
  //             : context.jsnColorTokens.typographyInactive,
  //         fontWeight: FontWeight.w600,
  //         letterSpacing: 0.5,
  //         height: 16 / 12,
  //       );

  TextStyle get bottomNavBarActive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldDefaultColor,
        height: 16 / 12,
        leadingDistribution: TextLeadingDistribution.even,
      );

  TextStyle get bottomNavBarInactive => TextStyle(
        package: 'jsn_ui',
        fontFamily: tokens.titleTinyBoldFontFamily,
        fontWeight: tokens.titleTinyBoldFontWeight,
        fontSize: tokens.titleTinyBoldFontSize,
        color: tokens.titleTinyBoldInactiveColor,
        height: 16 / 12,
        leadingDistribution: TextLeadingDistribution.even,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is JSNTextTheme && tokens == other.tokens;

  @override
  int get hashCode => tokens.hashCode;
}

class _TextTheme {
  static TextTheme jsnThemeDark() {
    return const TextTheme(
      headlineMedium: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color(0xFFE3E5E8),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Color(0xFFB2B5B9),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFE3E5E8),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFB2B5B9),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Rupa Serif',
        fontWeight: FontWeight.w600,
        fontSize: 28,
        color: Color(0xFFE3E5E8),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Rupa Serif',
        fontWeight: FontWeight.w600,
        fontSize: 21,
        color: Color(0xFFE3E5E8),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFE3E5E8),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xFFB2B5B9),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xFFE3E5E8),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFFB2B5B9),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Rupa Serif',
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: Color(0xFFE3E5E8),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFB2B5B9),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFB2B5B9),
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  static TextTheme jsnThemeLight() {
    return const TextTheme(
      displayMedium: TextStyle(
        fontFamily: 'Rupa Serif',
        fontWeight: FontWeight.w600,
        fontSize: 24,
        color: Color(0xFF1E2225),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color(0xFF1E2225),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xFF616E7A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Color(0xFF616E7A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFF616E7A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF616E7A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Rupa Serif',
        fontWeight: FontWeight.w600,
        fontSize: 28,
        color: Color(0xFF1E2225),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xFF1E2225),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF1E2225),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF1E2225),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Rupa Serif',
        fontWeight: FontWeight.w600,
        fontSize: 21,
        color: Color(0xFF1E2225),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF616E7A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Rupa Sans',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF616E7A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  static TextTheme greenThemeDark() {
    return const TextTheme(
      headlineMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 21,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  static TextTheme greenThemeLight() {
    return const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 21,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  static TextTheme pinkThemeDark() {
    return const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 21,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  static TextTheme pinkThemeLight() {
    return const TextTheme(
      headlineSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 21,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  static TextTheme purpleThemeDark() {
    return const TextTheme(
      bodyMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 21,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Color(0xFFBCBDBD),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Color(0xFFFFFFFF),
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }

  static TextTheme purpleThemeLight() {
    return const TextTheme(
      displayMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displaySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 21,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      headlineSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodySmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 16,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      labelSmall: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      bodyMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      displayLarge: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w700,
        fontSize: 28,
        color: Color(0xFF1C1D1D),
        leadingDistribution: TextLeadingDistribution.even,
      ),
      titleMedium: TextStyle(
        fontFamily: 'Maison Neue APP',
        fontWeight: FontWeight.w600,
        fontSize: 13,
        color: Color(0xFF494A4A),
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
  }
}

/// Holds all shadow tokens for an JSN theme. Shadow tokens are same for all
/// themes.
///
/// Consumers can get access to a [JSNShadow] for the currently active
/// theme by using [JSNTheme], example:
///
/// ```dart
/// JSNShadow jsnShadow = JSNTheme.of(context).shadow.high;
/// ```
///
/// Consumers never need to initialize these tokens as it's automatically
/// done when using [JSNTheme] widget.
@immutable
class JSNShadowTokens {
  const JSNShadowTokens._({
    required this.shadowBevelBottomHigh,
    required this.shadowBevelBottomLow,
    required this.shadowBevelTopHigh,
    required this.shadowBevelTopLow,
    required this.shadowHigh,
    required this.shadowInnerHigh,
    required this.shadowInnerLow,
    required this.shadowLow,
  });

  factory JSNShadowTokens.greenThemeLight() {
    return const JSNShadowTokens._(
      shadowBevelBottomHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelBottomLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelTopHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelTopLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowHigh: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 10,
        color: Color(0x26000000),
      ),
      shadowInnerHigh: JSNShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Color(0x0A000000),
      ),
      shadowInnerLow: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: Color(0x0A000000),
      ),
      shadowLow: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 4,
        color: Color(0x26000000),
      ),
    );
  }

  factory JSNShadowTokens.greenThemeDark() {
    return const JSNShadowTokens._(
      shadowBevelBottomHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelBottomLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelTopHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelTopLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowHigh: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 10,
        color: Color(0x26000000),
      ),
      shadowInnerHigh: JSNShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Color(0x3D000000),
      ),
      shadowInnerLow: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: Color(0x3D000000),
      ),
      shadowLow: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 4,
        color: Color(0x26000000),
      ),
    );
  }

  factory JSNShadowTokens.pinkThemeLight() {
    return const JSNShadowTokens._(
      shadowBevelBottomHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelBottomLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelTopHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelTopLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowHigh: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 10,
        color: Color(0x26000000),
      ),
      shadowInnerHigh: JSNShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Color(0x0A000000),
      ),
      shadowInnerLow: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: Color(0x0A000000),
      ),
      shadowLow: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 4,
        color: Color(0x26000000),
      ),
    );
  }

  factory JSNShadowTokens.pinkThemeDark() {
    return const JSNShadowTokens._(
      shadowBevelBottomHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelBottomLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelTopHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelTopLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowHigh: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 10,
        color: Color(0x26000000),
      ),
      shadowInnerHigh: JSNShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Color(0x3D000000),
      ),
      shadowInnerLow: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: Color(0x3D000000),
      ),
      shadowLow: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 4,
        color: Color(0x26000000),
      ),
    );
  }

  factory JSNShadowTokens.jsnThemeLight() {
    return const JSNShadowTokens._(
      shadowBevelBottomHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelBottomLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelTopHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelTopLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowHigh: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 10,
        color: Color(0x26000000),
      ),
      shadowInnerHigh: JSNShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Color(0x0A000000),
      ),
      shadowInnerLow: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: Color(0x0A000000),
      ),
      shadowLow: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 4,
        color: Color(0x26000000),
      ),
    );
  }

  factory JSNShadowTokens.jsnThemeDark() {
    return const JSNShadowTokens._(
      shadowBevelBottomHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelBottomLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelTopHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelTopLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowHigh: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 10,
        color: Color(0x26000000),
      ),
      shadowInnerHigh: JSNShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Color(0x3D000000),
      ),
      shadowInnerLow: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: Color(0x3D000000),
      ),
      shadowLow: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 4,
        color: Color(0x26000000),
      ),
    );
  }

  factory JSNShadowTokens.purpleThemeLight() {
    return const JSNShadowTokens._(
      shadowBevelBottomHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelBottomLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelTopHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowBevelTopLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0xB3FFFFFF),
      ),
      shadowHigh: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 10,
        color: Color(0x26000000),
      ),
      shadowInnerHigh: JSNShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Color(0x0A000000),
      ),
      shadowInnerLow: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: Color(0x0A000000),
      ),
      shadowLow: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 4,
        color: Color(0x26000000),
      ),
    );
  }

  factory JSNShadowTokens.purpleThemeDark() {
    return const JSNShadowTokens._(
      shadowBevelBottomHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelBottomLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelTopHigh: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowBevelTopLow: JSNShadow(
        offset: Offset(0, 1),
        blurRadius: 1,
        color: Color(0x0AFFFFFF),
      ),
      shadowHigh: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 10,
        color: Color(0x26000000),
      ),
      shadowInnerHigh: JSNShadow(
        offset: Offset(0, 4),
        blurRadius: 4,
        color: Color(0x3D000000),
      ),
      shadowInnerLow: JSNShadow(
        offset: Offset(0, 2),
        blurRadius: 4,
        color: Color(0x3D000000),
      ),
      shadowLow: JSNShadow(
        offset: Offset(0, 0),
        blurRadius: 4,
        color: Color(0x26000000),
      ),
    );
  }

  final JSNShadow shadowBevelBottomHigh;
  final JSNShadow shadowBevelBottomLow;
  final JSNShadow shadowBevelTopHigh;
  final JSNShadow shadowBevelTopLow;
  final JSNShadow shadowHigh;
  final JSNShadow shadowInnerHigh;
  final JSNShadow shadowInnerLow;
  final JSNShadow shadowLow;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JSNShadowTokens &&
          shadowBevelBottomHigh == other.shadowBevelBottomHigh &&
          shadowBevelBottomLow == other.shadowBevelBottomLow &&
          shadowBevelTopHigh == other.shadowBevelTopHigh &&
          shadowBevelTopLow == other.shadowBevelTopLow &&
          shadowHigh == other.shadowHigh &&
          shadowInnerHigh == other.shadowInnerHigh &&
          shadowInnerLow == other.shadowInnerLow &&
          shadowLow == other.shadowLow;

  @override
  int get hashCode =>
      shadowBevelBottomHigh.hashCode ^
      shadowBevelBottomLow.hashCode ^
      shadowBevelTopHigh.hashCode ^
      shadowBevelTopLow.hashCode ^
      shadowHigh.hashCode ^
      shadowInnerHigh.hashCode ^
      shadowInnerLow.hashCode ^
      shadowLow.hashCode;
}

/// Holds all light effect tokens for an JSN theme.
///
/// Consumers can get access to a [LightEffect] for the currently active
/// theme by using [JSNTheme], example:
///
/// ```dart
/// LightEffect lightEffect =
///   JSNTheme.of(context).lightEffect.lightEffectDimLowIntensity;
/// ```
///
/// Light effects are generally applied as a gradient to a Container using a
/// [Container.foregroundDecoration] or [Container.decoration], example:
///
/// ```dart
/// Container(
///   color: const Color(0xFFD9D9D9),
///   child: Center(
///     child: Container(
///       foregroundDecoration: BoxDecoration(
///         borderRadius: BorderRadius.circular(18),
///         gradient: JSNTheme.lightEffect.lightEffectBrightLowIntensity.toLinearGradient(),
///         child: JSNPrimaryButton.positive(
///           const Text("Pay"),
///           onTap: () {},
///           size: JSNButtonSize.tiny,
///       ),
///     ),
///   ),
/// );
/// ```
///
/// ## Note on shape of the light effect
/// Foreground decoration is rectangular by default.
/// Therefore, if the child of a container with light effect is not a
/// rectangle (has border radius or is a circle), clients will need to match
/// the shape in the foreground decoration manually as done in the
/// example above.

/// **See Also**
/// * [LightEffect]
@immutable
class JSNLightEffectTokens {
  const JSNLightEffectTokens._({
    required this.lightEffectBrightHighIntensity,
    required this.lightEffectBrightLowIntensity,
    required this.lightEffectDimHighIntensity,
    required this.lightEffectDimLowIntensity,
  });

  factory JSNLightEffectTokens.greenThemeLight() {
    return const JSNLightEffectTokens._(
      lightEffectBrightHighIntensity: LightEffect(
        startColor: Color(0xB3FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectBrightLowIntensity: LightEffect(
        startColor: Color(0x66FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimHighIntensity: LightEffect(
        startColor: Color(0x12000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimLowIntensity: LightEffect(
        startColor: Color(0x0A000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
    );
  }

  factory JSNLightEffectTokens.greenThemeDark() {
    return const JSNLightEffectTokens._(
      lightEffectBrightHighIntensity: LightEffect(
        startColor: Color(0x0AFFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectBrightLowIntensity: LightEffect(
        startColor: Color(0x66FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimHighIntensity: LightEffect(
        startColor: Color(0x33000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimLowIntensity: LightEffect(
        startColor: Color(0x29000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
    );
  }

  factory JSNLightEffectTokens.pinkThemeLight() {
    return const JSNLightEffectTokens._(
      lightEffectBrightHighIntensity: LightEffect(
        startColor: Color(0xB3FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectBrightLowIntensity: LightEffect(
        startColor: Color(0x66FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimHighIntensity: LightEffect(
        startColor: Color(0x12000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimLowIntensity: LightEffect(
        startColor: Color(0x0A000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
    );
  }

  factory JSNLightEffectTokens.pinkThemeDark() {
    return const JSNLightEffectTokens._(
      lightEffectBrightHighIntensity: LightEffect(
        startColor: Color(0x0AFFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectBrightLowIntensity: LightEffect(
        startColor: Color(0x66FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimHighIntensity: LightEffect(
        startColor: Color(0x33000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimLowIntensity: LightEffect(
        startColor: Color(0x29000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
    );
  }

  factory JSNLightEffectTokens.jsnThemeLight() {
    return const JSNLightEffectTokens._(
      lightEffectBrightHighIntensity: LightEffect(
        startColor: Color(0xB3FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectBrightLowIntensity: LightEffect(
        startColor: Color(0x66FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimHighIntensity: LightEffect(
        startColor: Color(0x12000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimLowIntensity: LightEffect(
        startColor: Color(0x0A000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
    );
  }

  factory JSNLightEffectTokens.jsnThemeDark() {
    return const JSNLightEffectTokens._(
      lightEffectBrightHighIntensity: LightEffect(
        startColor: Color(0x0AFFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectBrightLowIntensity: LightEffect(
        startColor: Color(0x66FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimHighIntensity: LightEffect(
        startColor: Color(0x33000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimLowIntensity: LightEffect(
        startColor: Color(0x29000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
    );
  }

  factory JSNLightEffectTokens.purpleThemeLight() {
    return const JSNLightEffectTokens._(
      lightEffectBrightHighIntensity: LightEffect(
        startColor: Color(0xB3FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectBrightLowIntensity: LightEffect(
        startColor: Color(0x66FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimHighIntensity: LightEffect(
        startColor: Color(0x12000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimLowIntensity: LightEffect(
        startColor: Color(0x0A000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
    );
  }

  factory JSNLightEffectTokens.purpleThemeDark() {
    return const JSNLightEffectTokens._(
      lightEffectBrightHighIntensity: LightEffect(
        startColor: Color(0x0AFFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectBrightLowIntensity: LightEffect(
        startColor: Color(0x66FFFFFF),
        endColor: Color(0x00FFFFFF),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimHighIntensity: LightEffect(
        startColor: Color(0x33000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
      lightEffectDimLowIntensity: LightEffect(
        startColor: Color(0x29000000),
        endColor: Color(0x00000000),
        startPosition: 0,
        endPosition: 1,
      ),
    );
  }

  final LightEffect lightEffectBrightHighIntensity;
  final LightEffect lightEffectBrightLowIntensity;
  final LightEffect lightEffectDimHighIntensity;
  final LightEffect lightEffectDimLowIntensity;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JSNLightEffectTokens &&
          lightEffectBrightHighIntensity ==
              other.lightEffectBrightHighIntensity &&
          lightEffectBrightLowIntensity ==
              other.lightEffectBrightLowIntensity &&
          lightEffectDimHighIntensity == other.lightEffectDimHighIntensity &&
          lightEffectDimLowIntensity == other.lightEffectDimLowIntensity;

  @override
  int get hashCode =>
      lightEffectBrightHighIntensity.hashCode ^
      lightEffectBrightLowIntensity.hashCode ^
      lightEffectDimHighIntensity.hashCode ^
      lightEffectDimLowIntensity.hashCode;
}

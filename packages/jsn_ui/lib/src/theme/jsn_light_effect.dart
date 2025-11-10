import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Light effects are gradients which can be applied as an overlay to any other
/// container to give them an effect as if a light source existed.
///
/// As of now these are always [LinearGradient]. To convert a light effect to a
/// gradient use [LightEffect.toLinearGradient].
///
/// # Usage
/// ```dart
/// final LightEffect lightEffect =
///   JSNTheme.of(context).lightEffect.lightEffectBrightLowIntensity;
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
///         gradient: jsnTheme.lightEffect.lightEffectBrightLowIntensity.toLinearGradient(),
///
///       ),
///     ),
///   ),
/// );
/// ```
///
/// ## Note on shape of the light effect
/// Foreground decoration is rectangular by default.
/// Therefore, if the child of a container with light effect is not a
/// rectangle (has border radius or is a circle), clients will need to match the
/// shape in the foreground decoration manually as done in the example above.
///
/// **See also**
/// * [JSNLightEffectTokens] - holds all light effect tokens for JSN.
@immutable
class LightEffect with Diagnosticable {
  /// Creates an instance of [LightEffect].
  const LightEffect({
    required this.startColor,
    required this.endColor,
    required this.startPosition,
    required this.endPosition,
  });

  /// Start color for the gradient.
  final Color startColor;

  /// End color for the gradient.
  final Color endColor;

  /// Start position.
  final double startPosition;

  /// End position.
  final double endPosition;

  /// Converts a light effect to a [LinearGradient].
  LinearGradient toLinearGradient() {
    return LinearGradient(
      colors: [startColor, endColor],
      stops: [startPosition, endPosition],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LightEffect &&
          runtimeType == other.runtimeType &&
          startColor == other.startColor &&
          endColor == other.endColor &&
          startPosition == other.startPosition &&
          endPosition == other.endPosition;

  @override
  int get hashCode =>
      startColor.hashCode ^
      endColor.hashCode ^
      startPosition.hashCode ^
      endPosition.hashCode;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DoubleProperty('endPosition', endPosition));
    properties.add(ColorProperty('startColor', startColor));
    properties.add(DoubleProperty('startPosition', startPosition));
    properties.add(ColorProperty('endColor', endColor));
  }
}

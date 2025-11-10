import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:jsn_ui/jsn_ui.dart';

/// Holds all properties for a shadow. Used by [JSNShadowTokens].
///
/// Similar to [BoxShadow], without spread radius. This class allows us to
/// have flexibility to add properties without having breaking changes in
/// future.
///
/// To convert an [JSNShadow] to a [BoxShadow], use [JSNShadow.toBoxShadow].
///
/// **See also**
/// * [BoxDecoration] — a decoration which supports inner shadows.
/// * [JSNShadowTokens] — holds all shadow tokens available in JSN.
@immutable
class JSNShadow extends Shadow {
  /// Creates an instance of [JSNShadow].
  const JSNShadow({
    required Offset offset,
    required double blurRadius,
    required Color color,
  }) : super(offset: offset, color: color, blurRadius: blurRadius);

  /// Converts a [JSNShadow] to a [BoxShadow].
  ///
  /// Blur Style defaults to [BlurStyle.outer] to match the expectation from
  /// design.
  BoxShadow toBoxShadow({double spreadRadius = 0}) {
    return BoxShadow(
      blurStyle: BlurStyle.outer,
      blurRadius: blurRadius,
      color: color,
      offset: offset,
      spreadRadius: spreadRadius,
    );
  }

  /// Returns a new JSN shadow scaled by given [factor].
  @override
  JSNShadow scale(double factor) {
    return JSNShadow(
      color: color,
      offset: offset * factor,
      blurRadius: blurRadius * factor,
    );
  }

  /// Linearly interpolate between two JSN shadows.
  static JSNShadow? lerp(JSNShadow? a, JSNShadow? b, double t) {
    if (a == null && b == null) {
      return null;
    }
    if (a == null) {
      return b!.scale(t);
    }
    if (b == null) {
      return a.scale(1.0 - t);
    }
    return JSNShadow(
      color: Color.lerp(a.color, b.color, t)!,
      offset: Offset.lerp(a.offset, b.offset, t)!,
      blurRadius: lerpDouble(a.blurRadius, b.blurRadius, t)!,
    );
  }
}

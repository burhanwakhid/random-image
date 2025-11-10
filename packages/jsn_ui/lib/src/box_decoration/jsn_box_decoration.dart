import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jsn_ui/jsn_ui.dart';

/// A custom decoration, similar to [BoxDecoration] which supports
/// inner shadows, top bevel & bottom bevel. This can be used as a replacement
/// of [BoxDecoration], although it's more useful when applying inner shadows
/// and top bevels.
///
/// # Usage
/// Similar to [BoxDecoration], [JsnBoxDecoration] can be used with a
/// [Container] or [DecoratedBox] widget.
///
/// # Inner Shadow
/// Inner shadows are used to show depth. When applied to a container, it makes
/// it appear at a deeper level from the surface.
///
/// Note that [color] is mandatory to show an inner shadow.
///
/// ```dart
/// Container(
///   decoration: JsnBoxDecoration(
///     color: const Color(0xFFF5F6F7),
///     shape: BoxShape.circle,
///     innerShadow: AlohaTheme.of(context).shadow.shadowInnerLow,
///   ),
/// );
/// ```
///
/// # Bevel
///
/// ## Top bevel
/// Top bevel is used to expose light in the top edge of a container. Top bevel
/// is implemented as an inner shadow.
///
/// Note that [color] is mandatory to show a top bevel.
///
/// ```dart
/// Container(
///   decoration: JsnBoxDecoration(
///     color: const Color(0xFFF9FAFB),
///     borderRadius: BorderRadius.circular(20),
///     innerShadow:  AlohaTheme.of(context).shadow.shadowTopBevelLow,
///   ),
/// );
/// ```
///
/// ## Bottom bevel
/// Bottom bevel is used to expose light in the lower edge for a container.
/// Bottom bevel is a implemented using a box shadow.
///
/// ```dart
/// Container(
///   decoration: JsnBoxDecoration(
///     color: const Color(0xFFF9FAFB),
///     borderRadius: BorderRadius.circular(20),
///     boxShadow:  [AlohaTheme.of(context).shadow.shadowBottomBevelLow],
///   ),
/// );
/// ```
///
/// # Light effects
///
/// Light effects are gradients with an alpha that can be applied on top of any
/// view, like buttons. Simply use a foregroundDecoration with a gradient to get
/// a light effect. Example:
///
/// ```dart
/// Container(
///   color: const Color(0xFFD9D9D9),
///   child: Center(
///     child: Container(
///       foregroundDecoration: JsnBoxDecoration(
///         borderRadius: BorderRadius.circular(18),
///         gradient: alohaTheme.lightEffect.brightLowIntensity,
///         child: AlohaPrimaryButton.positive(
///           const Text("Pay"),
///           onTap: () {},
///           size: AlohaButtonSize.tiny,
///       ),
///     ),
///   ),
/// )
/// ```
///
/// ### Shape of light effects
/// Foreground decoration is rectangular by default.
/// Therefore, if the child of a container with light effect is not a
/// rectangle (has border radius or is a circle), clients will need to match
/// the shape in the foreground decoration manually as done in the example
/// above.
///
/// # How are inner shadows drawn?
/// The painting is done using compositing. Two shapes are composited using
/// [Canvas.saveLayer].
///
/// The outer shape has a color generated using an alpha
/// blend between the background color of the container and shadow color.
/// While the inner shape has a blur applied using a mask filter & uses a
/// blend mode of `srcOut`.
///
/// The approach is similar to the one explained in
/// [this](https://blog.helftone.com/demystifying-inner-shadows-in-quartz/)
/// article.
///
/// # Note for maintainers
///
/// Except for code related to inner shadows, everything
/// has been copied over from [BoxDecoration]. This was necessary because
/// BoxDecorationPainter is private and we also don't want clients to wrap
/// unnecessary containers just to add inner shadow or bevel. This approach
/// provides a simpler API for developers to remember.
///
/// # Demo
/// AlohaShadowsDemo
///
/// **See also**
/// * [JSNShadow] — used to represent a shadow in Aloha.
/// * [AlohaShadowTokens] — holds all shadow tokens available in Aloha.
class JsnBoxDecoration extends Decoration {
  /// Creates an instance of [JsnBoxDecoration].
  const JsnBoxDecoration({
    this.shape = BoxShape.rectangle,
    this.color,
    this.image,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.innerShadow,
    this.gradient,
    this.backgroundBlendMode,
  });

  /// The color to fill in the background of the box.
  ///
  /// The color is filled into the [shape] of the box (e.g., either a rectangle,
  /// potentially with a [borderRadius], or a circle).
  final Color? color;

  /// The shape to fill the background [color] into and to cast as the
  ///
  /// [boxShadow] and/or [innerShadow].
  ///
  /// If this is [BoxShape.circle] then [borderRadius] is ignored.
  final BoxShape shape;

  /// If non-null, the corners of this box are rounded by this [BorderRadius].
  ///
  /// An image to paint above the background [color].
  ///
  /// If [shape] is [BoxShape.circle] then the image is clipped to the circle's
  /// boundary; if [borderRadius] is non-null then the image is clipped to the
  /// given radii.
  final DecorationImage? image;

  /// Applies only to boxes with rectangular shapes; ignored if [shape] is not
  /// [BoxShape.rectangle].
  final BorderRadiusGeometry? borderRadius;

  /// A border to draw above the background [color]. Follows the [shape] and
  /// [borderRadius].
  final BoxBorder? border;

  /// A list of shadows cast by this box behind the box.
  ///
  /// The shadow follows the [shape] of the box.
  final List<BoxShadow>? boxShadow;

  /// Useful to show depth either as an inner shadow or a top bevel.
  final JSNShadow? innerShadow;

  /// A gradient to use when filling the box.
  ///
  /// If this is specified, [color] has no effect.
  ///
  /// The [gradient] is drawn under the [image].
  final Gradient? gradient;

  /// The blend mode applied to the [color] or [gradient] background of the box.
  ///
  /// If no [backgroundBlendMode] is provided then the default painting blend
  /// mode is used.
  ///
  /// If no [color] or [gradient] is provided then the blend mode has no impact.
  final BlendMode? backgroundBlendMode;

  @override
  EdgeInsetsGeometry get padding => border?.dimensions ?? EdgeInsets.zero;

  @override
  bool get isComplex => boxShadow != null || innerShadow != null;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _AlohaDecorationPainter(this, onChanged);
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    switch (shape) {
      case BoxShape.circle:
        final center = rect.center;
        final radius = rect.shortestSide / 2.0;
        final square = Rect.fromCircle(center: center, radius: radius);
        return Path()..addOval(square);
      case BoxShape.rectangle:
        if (borderRadius != null) {
          return Path()
            ..addRRect(borderRadius!.resolve(textDirection).toRRect(rect));
        }
        return Path()..addRect(rect);
    }
  }

  /// Returns a new decoration that is scaled by the given factor.
  JsnBoxDecoration scale(double factor) {
    return JsnBoxDecoration(
      color: Color.lerp(null, color, factor),
      border: BoxBorder.lerp(null, border, factor),
      borderRadius: BorderRadiusGeometry.lerp(null, borderRadius, factor),
      boxShadow: BoxShadow.lerpList(null, boxShadow, factor),
      shape: shape,
      innerShadow: JSNShadow.lerp(null, innerShadow, factor),
      gradient: gradient?.scale(factor),
    );
  }

  @override
  JsnBoxDecoration? lerpFrom(Decoration? a, double t) {
    if (a == null) return scale(t);
    if (a is JsnBoxDecoration) return JsnBoxDecoration.lerp(a, this, t);
    return super.lerpFrom(a, t) as JsnBoxDecoration?;
  }

  @override
  JsnBoxDecoration? lerpTo(Decoration? b, double t) {
    if (b == null) return scale(1.0 - t);
    if (b is JsnBoxDecoration) return JsnBoxDecoration.lerp(this, b, t);
    return super.lerpTo(b, t) as JsnBoxDecoration?;
  }

  /// Linearly interpolate between two box decorations.
  ///
  /// Interpolates each parameter of the box decoration separately.
  static JsnBoxDecoration? lerp(
      JsnBoxDecoration? a, JsnBoxDecoration? b, double t) {
    if (a == null && b == null) {
      return null;
    }
    if (a == null) {
      return b!.scale(t);
    }
    if (b == null) {
      return a.scale(1.0 - t);
    }
    if (t == 0.0) {
      return a;
    }
    if (t == 1.0) {
      return b;
    }
    return JsnBoxDecoration(
      color: Color.lerp(a.color, b.color, t),
      border: BoxBorder.lerp(a.border, b.border, t),
      borderRadius:
          BorderRadiusGeometry.lerp(a.borderRadius, b.borderRadius, t),
      boxShadow: BoxShadow.lerpList(a.boxShadow, b.boxShadow, t),
      shape: t < 0.5 ? a.shape : b.shape,
      innerShadow: JSNShadow.lerp(a.innerShadow, b.innerShadow, t),
      gradient: Gradient.lerp(a.gradient, b.gradient, t),
    );
  }

  @override
  bool hitTest(Size size, Offset position, {TextDirection? textDirection}) {
    assert((Offset.zero & size).contains(position));
    switch (shape) {
      case BoxShape.rectangle:
        if (borderRadius != null) {
          final bounds =
              borderRadius!.resolve(textDirection).toRRect(Offset.zero & size);
          return bounds.contains(position);
        }
        return true;
      case BoxShape.circle:
        // Circles are inscribed into our smallest dimension.
        final center = size.center(Offset.zero);
        final distance = (position - center).distance;
        return distance <= math.min(size.width, size.height) / 2.0;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(ColorProperty('color', color));
    properties.add(EnumProperty<BoxShape>('shape', shape));
    properties.add(DiagnosticsProperty<BorderRadiusGeometry?>(
        'borderRadius', borderRadius));
    properties.add(DiagnosticsProperty<BoxBorder?>('border', border));
    properties.add(IterableProperty<BoxShadow>('boxShadow', boxShadow));
    properties
        .add(DiagnosticsProperty<JSNShadow?>('innerShadow', innerShadow));
    properties.add(DiagnosticsProperty<DecorationImage?>('image', image));
    properties.add(DiagnosticsProperty<Gradient?>('gradient', gradient));
    properties.add(
        EnumProperty<BlendMode?>('backgroundBlendMode', backgroundBlendMode));
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is JsnBoxDecoration &&
          runtimeType == other.runtimeType &&
          color == other.color &&
          shape == other.shape &&
          image == other.image &&
          borderRadius == other.borderRadius &&
          border == other.border &&
          listEquals<BoxShadow>(other.boxShadow, boxShadow) &&
          innerShadow == other.innerShadow &&
          gradient == other.gradient;

  @override
  int get hashCode =>
      color.hashCode ^
      shape.hashCode ^
      image.hashCode ^
      borderRadius.hashCode ^
      border.hashCode ^
      boxShadow.hashCode ^
      innerShadow.hashCode ^
      gradient.hashCode;
}

class _AlohaDecorationPainter extends BoxPainter {
  _AlohaDecorationPainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  final JsnBoxDecoration decoration;

  Paint? _cachedBackgroundPaint;
  Rect? _rectForCachedBackgroundPaint;

  Paint _getBackgroundPaint(Rect rect, TextDirection? textDirection) {
    assert(
        decoration.gradient != null || _rectForCachedBackgroundPaint == null);

    if (_cachedBackgroundPaint == null ||
        (decoration.gradient != null &&
            _rectForCachedBackgroundPaint != rect)) {
      final paint = Paint();
      if (decoration.backgroundBlendMode != null) {
        paint.blendMode = decoration.backgroundBlendMode!;
      }
      if (decoration.color != null) {
        paint.color = decoration.color!;
      }
      if (decoration.gradient != null) {
        paint.shader = decoration.gradient!
            .createShader(rect, textDirection: textDirection);
        _rectForCachedBackgroundPaint = rect;
      }
      _cachedBackgroundPaint = paint;
    }

    return _cachedBackgroundPaint!;
  }

  void _paintBox(
      Canvas canvas, Rect rect, Paint paint, TextDirection? textDirection) {
    switch (decoration.shape) {
      case BoxShape.circle:
        assert(decoration.borderRadius == null);
        final center = rect.center;
        final radius = rect.shortestSide / 2.0;
        canvas.drawCircle(center, radius, paint);
        break;
      case BoxShape.rectangle:
        if (decoration.borderRadius == null) {
          canvas.drawRect(rect, paint);
        } else {
          canvas.drawRRect(
              decoration.borderRadius!.resolve(textDirection).toRRect(rect),
              paint);
        }
        break;
    }
  }

  void _paintShadows(Canvas canvas, Rect rect, TextDirection? textDirection) {
    if (decoration.boxShadow == null) {
      return;
    }
    for (final boxShadow in decoration.boxShadow!) {
      final paint = boxShadow.toPaint();
      final bounds =
          rect.shift(boxShadow.offset).inflate(boxShadow.spreadRadius);
      _paintBox(canvas, bounds, paint, textDirection);
    }
  }

  void _paintBackgroundColor(
      Canvas canvas, Rect rect, TextDirection? textDirection) {
    if (decoration.color != null || decoration.gradient != null) {
      _paintBox(canvas, rect, _getBackgroundPaint(rect, textDirection),
          textDirection);
    }
  }

  DecorationImagePainter? _imagePainter;

  void _paintBackgroundImage(
      Canvas canvas, Rect rect, ImageConfiguration configuration) {
    if (decoration.image == null) return;
    _imagePainter ??= decoration.image!.createPainter(onChanged!);
    Path? clipPath;
    switch (decoration.shape) {
      case BoxShape.circle:
        assert(decoration.borderRadius == null);
        final center = rect.center;
        final radius = rect.shortestSide / 2.0;
        final square = Rect.fromCircle(center: center, radius: radius);
        clipPath = Path()..addOval(square);
        break;
      case BoxShape.rectangle:
        if (decoration.borderRadius != null) {
          clipPath = Path()
            ..addRRect(decoration.borderRadius!
                .resolve(configuration.textDirection)
                .toRRect(rect));
        }
        break;
    }
    _imagePainter!.paint(canvas, rect, clipPath, configuration);
  }

  void _paintInnerShadow(
      Canvas canvas, Offset offset, Size size, TextDirection? textDirection) {
    if (decoration.innerShadow == null) {
      return;
    }
    assert(decoration.color != null,
        "background color is required to set an inner shadow");

    switch (decoration.shape) {
      case BoxShape.rectangle:
        _paintRectInnerShadow(canvas, offset, size, textDirection);
        break;
      case BoxShape.circle:
        _paintCircleInnerShadow(canvas, offset, size, textDirection);
        break;
    }
  }

  void _paintRectInnerShadow(
      Canvas canvas, Offset offset, Size size, TextDirection? textDirection) {
    canvas.save();
    if (decoration.borderRadius != null) {
      canvas.clipRRect(
        decoration.borderRadius!.resolve(textDirection).toRRect(offset & size),
      );
    } else {
      canvas.clipRect(offset & size);
    }

    canvas.saveLayer(offset & size, Paint());

    // Draw outer rect
    final outerRect = offset & size;
    final innerShadow = decoration.innerShadow!;
    final outerRectPaint = Paint()
      ..color = Color.alphaBlend(innerShadow.color, decoration.color!);
    _paintBox(canvas, outerRect, outerRectPaint, textDirection);

    // Draw inner rect
    final effectiveBlur = innerShadow.blurRadius / 2;
    final innerRect = (offset & size).shift(innerShadow.offset);
    final innerRectPaint = Paint()
      ..color = innerShadow.color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, effectiveBlur)
      ..blendMode = BlendMode.srcOut;
    _paintBox(canvas, innerRect, innerRectPaint, textDirection);

    canvas
      ..restore()
      ..restore();
  }

  void _paintCircleInnerShadow(
      Canvas canvas, Offset offset, Size size, TextDirection? textDirection) {
    canvas.save();
    final rect = offset & size;
    final center = rect.center;
    final radius = rect.shortestSide / 2;
    final square = Rect.fromCircle(center: center, radius: radius);
    canvas.clipPath(Path()..addOval(square));

    canvas.saveLayer(offset & size, Paint());

    // Draw outer rect
    final outerRect = offset & size;
    final innerShadow = decoration.innerShadow!;
    final outerRectPaint = Paint()
      ..color = Color.alphaBlend(innerShadow.color, decoration.color!);
    _paintBox(canvas, outerRect, outerRectPaint, textDirection);

    // Draw inner rect
    final effectiveBlur = innerShadow.blurRadius / 2;
    final innerRect = (offset & size).shift(Offset(0, effectiveBlur));
    final innerRectPaint = Paint()
      ..color = innerShadow.color
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, effectiveBlur)
      ..blendMode = BlendMode.srcOut;
    _paintBox(canvas, innerRect, innerRectPaint, textDirection);

    canvas
      ..restore()
      ..restore();
  }

  @override
  void dispose() {
    _imagePainter?.dispose();
    super.dispose();
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final size = configuration.size!;
    final rect = offset & size;
    final textDirection = configuration.textDirection;
    _paintShadows(canvas, rect, textDirection);
    _paintBackgroundColor(canvas, rect, textDirection);
    _paintBackgroundImage(canvas, rect, configuration);
    decoration.border?.paint(
      canvas,
      rect,
      shape: decoration.shape,
      borderRadius: decoration.borderRadius?.resolve(textDirection),
      textDirection: configuration.textDirection,
    );
    _paintInnerShadow(canvas, offset, size, textDirection);
  }
}

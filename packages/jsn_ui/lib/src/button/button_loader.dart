import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages

import 'jsn_button.dart';

/// Implements the motion spec for loader of all buttons.
///
/// This widget ensures that the loader is part of the widget tree only when
/// it is visible.
@internal
class ButtonLoader extends StatefulWidget {
  /// Creates an instance of [ButtonLoader].
  const ButtonLoader({
    Key? key,
    required this.color,
    required this.animations,
  }) : super(key: key);

  /// Animations configured by [JSNButton].
  final JSNButtonAnimations animations;

  /// The color of the loader.
  final Color color;

  @override
  State<ButtonLoader> createState() => _ButtonLoaderState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<JSNButtonAnimations>('animations', animations));
    properties.add(ColorProperty('color', color));
  }
}

class _ButtonLoaderState extends State<ButtonLoader> {
  late bool showLoader;
  static const loaderSize = 16.0;

  @override
  void initState() {
    super.initState();
    showLoader = !widget.animations.loaderOpacityAnimation.isCompleted;
    widget.animations.loaderOpacityAnimation
        .addStatusListener(_opacityStatusListener);
  }

  void _opacityStatusListener(status) {
    setState(() {
      showLoader = !widget.animations.loaderOpacityAnimation.isCompleted;
    });
  }

  @override
  void dispose() {
    widget.animations.loaderOpacityAnimation
        .removeStatusListener(_opacityStatusListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.animations.loaderSlideAnimation,
      child: FadeTransition(
        opacity: widget.animations.loaderOpacityAnimation,
        child: SizedBox.square(
          dimension: loaderSize,
          child: Builder(builder: (context) {
            if (showLoader) {
              return CircularProgressIndicator(
                strokeWidth: 2.0,
                valueColor: AlwaysStoppedAnimation<Color>(widget.color),
              );
            } else {
              return const SizedBox.shrink();
            }
          }),
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<JSNButtonAnimations>(
        'animations', widget.animations));
    properties.add(DiagnosticsProperty<bool>('showLoader', showLoader));
  }
}

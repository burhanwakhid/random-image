import 'package:flutter/material.dart';

class JSNMotionCurves {
  /// Linear animation basically means animating from 0% to 100% without any
  /// changes in speed (i.e, no easing). We usually use linear animations for
  /// properties that do not have any movement involved.
  static const linear = Cubic(0.00, 0.00, 1, 1);

  /// As the word Flair (Not Flare) suggests this curve has a style of itself
  /// and this curve is tweaked with respect to our characterized branding,
  /// this curve has that smoothness in entering and landing both.
  static const flairIn = Cubic(0.34, 0.00, 0.20, 0.99);

  /// This curve as the name says is used for elements moving out of the screen.
  /// This curve is used for components that are set to exit the screen of the user.
  static const moveOut = Cubic(0.20, 1, 0.30, 1);

  /// This curve is derived from the standard Ease-In curve.
  /// This cure is mainly used for components that are set to enter the screen.
  static const moveIn = Cubic(0.30, 0.28, 0.60, 1);
}

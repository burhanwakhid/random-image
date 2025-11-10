// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:jsn_ui/jsn_ui.dart';
import 'package:jsn_ui/src/motions/jsn_motion.dart';

/// Signature for a builder that allows configuring a widget with
/// [JSNButtonAnimations].
@internal
typedef JSNButtonWidgetBuilder = Widget Function(
  JSNButtonAnimations animations,
);

/// Implements a gesture detector, common motion specs and accessibility for
/// all buttons in JSN design system.
///
/// # Accessibility
/// By default, uses the semantics for widgets passed using the [builder]. To
/// customize semantics use [semanticsLabel], [semanticsLoadingLabel]
/// & [semanticsHint]. Note that if any of the semantics variables are set,
/// default semantics for child widgets will not work.
///
/// # See also
/// * [JSNCircularButton]
/// * [JSNPrimaryButton]
/// * [JSNSecondaryButton]
/// * [JSNTertiaryButton]
@internal
class JSNButton extends StatefulWidget {
  /// Uses a [GestureDetector] to create an instance of [JSNButton].
  const JSNButton({
    Key? key,
    required JSNButtonState state,
    required this.onTap,
    required this.builder,
    this.semanticsLabel,
    this.activeBackgroundColor,
    this.inactiveBackgroundColor,
    this.activeContentColor,
    this.inactiveContentColor,
    this.defaultLightEffect,
    this.pressedLightEffect,
    this.pressedColor,
    this.borderRadius,
    this.semanticsLoadingLabel = "Loading",
    this.semanticsHint,
  })  : _showLoader = state == JSNButtonState.loading,
        _showContent = state != JSNButtonState.loading,
        _inactive = state == JSNButtonState.inactive,
        _active = state == JSNButtonState.active,
        super(key: key);

  /// A widget builder that gets called everytime this widget is built.
  ///
  /// It provides a set of preconfigured animations using
  /// [JSNButtonAnimations] which can be used for configuring animations for
  /// the button elements.
  final JSNButtonWidgetBuilder builder;

  /// A callback invoked when a button is tapped.
  ///
  /// The callback is invoked only if button is in [JSNButtonState.active]
  /// state.
  final VoidCallback onTap;

  /// Initializes [JSNButtonAnimations.activeInactiveBackgroundAnimation]
  /// tween with the background color to be shown when button state is 'active'.
  final Color? activeBackgroundColor;

  /// Initializes [JSNButtonAnimations.activeInactiveBackgroundAnimation] with
  /// the background color to be shown when button state is 'inactive'.
  final Color? inactiveBackgroundColor;

  /// Initializes [JSNButtonAnimations.activeInactiveContentAnimation] with
  /// the content color to be shown when button state is 'active'.
  final Color? activeContentColor;

  /// Initializes [JSNButtonAnimations.activeInactiveContentAnimation] with
  /// the content color to be shown when button state is 'inactive'.
  final Color? inactiveContentColor;

  /// Border radius applied to the button, if any. Used when light effect is
  /// added.
  final BorderRadius? borderRadius;

  /// An optional light effect applied in all states except pressed. Used to
  /// configure [JSNButtonAnimations.lightEffectDecorationAnimation].
  ///
  /// Is typically null if [pressedColor] is present. As only one of these
  /// effects are applied in pressed state.
  final LightEffect? defaultLightEffect;

  /// An optional light effect applied in pressed state. Used to
  /// configure [JSNButtonAnimations.lightEffectDecorationAnimation].
  ///
  /// Is typically null if [pressedColor] is present. As only one of these
  /// effects are applied in pressed state.
  final LightEffect? pressedLightEffect;

  /// Pressed state foreground color. Used to configure
  /// [JSNButtonAnimations.foregroundDecorationAnimation].
  ///
  /// Is typically null if [defaultLightEffect] & [pressedLightEffect] are
  /// present. As only one of these effects are applied in pressed state.
  final Color? pressedColor;

  /// Sets [SemanticsProperties.label] when the button is in active or inactive
  /// state.
  final String? semanticsLabel;

  /// For Android, sets [SemanticsHintOverrides.onTapHint]. For iOS, sets
  /// [SemanticsProperties.hint].
  final String? semanticsHint;

  /// Sets [SemanticsProperties.label] when the button is in loading state.
  ///
  /// Defaults to hard-coded "Loading" text. To remove label explicitly
  /// set it as null.
  final String? semanticsLoadingLabel;

  final bool _showContent;
  final bool _showLoader;
  final bool _inactive;
  final bool _active;

  @override
  _JSNButtonState createState() => _JSNButtonState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(ColorProperty('activeBackgroundColor', activeBackgroundColor));
    properties
        .add(ColorProperty('inactiveBackgroundColor', inactiveBackgroundColor));
    properties.add(ColorProperty('activeContentColor', activeContentColor));
    properties.add(ColorProperty('inactiveContentColor', inactiveContentColor));
    if (semanticsHint != null) {
      properties.add(StringProperty('semanticsHint', semanticsHint));
    }
    if (semanticsLoadingLabel != null) {
      properties
          .add(StringProperty('semanticsLoadingLabel', semanticsLoadingLabel));
    }
    if (semanticsLabel != null) {
      properties.add(StringProperty('semanticsLabel', semanticsLabel));
    }
    properties.add(
        ObjectFlagProperty<JSNButtonWidgetBuilder>.has('builder', builder));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onTap', onTap));
    properties.add(DiagnosticsProperty<LightEffect?>(
        'defaultLightEffect', defaultLightEffect));
    properties.add(DiagnosticsProperty<LightEffect?>(
        'pressedLightEffect', pressedLightEffect));
    properties
        .add(DiagnosticsProperty<BorderRadius?>('borderRadius', borderRadius));
    properties.add(ColorProperty('pressedColor', pressedColor));
  }
}

class _JSNButtonState extends State<JSNButton> with TickerProviderStateMixin {
  late final AnimationController _tapAnimationController;
  late final AnimationController _activeInactiveAnimationController;
  late final AnimationController _contentVisibilityAnimationController;
  late final AnimationController _loaderVisibilityAnimationController;
  late final AnimationController _loaderSlideAnimationController;
  late final JSNButtonAnimations _animations;
  ColorTween? _activeInactiveBackgroundTween;
  ColorTween? _activeInactiveContentTween;

  DecorationTween get _foregroundDecorationTween {
    if (widget.pressedColor != null) {
      return DecorationTween(
        begin: BoxDecoration(
          borderRadius: widget.borderRadius,
          color: widget.pressedColor!.withAlpha(0),
        ),
        end: BoxDecoration(
          borderRadius: widget.borderRadius,
          color: widget.pressedColor,
        ),
      );
    } else {
      return DecorationTween(
        begin: BoxDecoration(
          borderRadius: widget.borderRadius,
          gradient: widget.defaultLightEffect?.toLinearGradient(),
        ),
        end: BoxDecoration(
          borderRadius: widget.borderRadius,
          gradient: widget.pressedLightEffect?.toLinearGradient(),
        ),
      );
    }
  }

  bool _isButtonHeldDown = false;

  void _handleTapDown(details) {
    if (widget._active) {
      _isButtonHeldDown = true;
      _animateTaps();
    }
  }

  void _handleTapUp(details) {
    if (_isButtonHeldDown) {
      _isButtonHeldDown = false;
      _animateTaps();
    }
  }

  void _handleTapCancel() {
    if (_isButtonHeldDown) {
      _isButtonHeldDown = false;
      _animateTaps(cancelled: true);
    }
  }

  void _handleTap() {
    if (widget._showContent && widget._active) {
      widget.onTap.call();
    }
  }

  /// Plays the button tap motion.
  void _animateTaps({cancelled = false}) {
    // Prevent multiple animations to start when tap down/up/cancel events
    // happen quickly.
    if (_tapAnimationController.isAnimating) {
      return;
    }

    // Plays tap down animation and registers a future to play a rebound (up)
    // animation.
    final wasButtonHeldDown = _isButtonHeldDown;
    void downAnimation() {
      _tapAnimationController
          .animateTo(1, duration: const Duration(milliseconds: 33))
          .then((_) {
        // Trigger a rebound animation
        if (mounted && wasButtonHeldDown != _isButtonHeldDown) {
          _animateTaps(cancelled: cancelled);
        }
      });
    }

    // Resets the button from pressed to normal state and triggers the onTap
    // callback if the gesture wasn't cancelled.
    void upAnimation() {
      _tapAnimationController.animateBack(0,
          duration: const Duration(milliseconds: 183),
          curve: const Interval(100 / 183, 1));
    }

    _isButtonHeldDown ? downAnimation() : upAnimation();
  }

  void _didUpdateWidgetLoaderAnimation(JSNButton oldWidget) {
    if (oldWidget._showLoader != widget._showLoader && widget._showLoader) {
      // Show Loader
      // Makes the loader opaque and sets the offset to zero.
      _loaderVisibilityAnimationController.reverse();
      _loaderSlideAnimationController.reverse();
    }

    if (oldWidget._showLoader != widget._showLoader && !widget._showLoader) {
      // Hide loader
      // Makes the loader transparent and sets the offset for future animations.
      _loaderVisibilityAnimationController
          .forward()
          .then((value) => _loaderSlideAnimationController.value = 1);
    }
  }

  void _didUpdateWidgetContentAnimation(JSNButton oldWidget) {
    if (oldWidget._showLoader != widget._showLoader && widget._showLoader) {
      // Hide content
      _contentVisibilityAnimationController.animateTo(
        1,
        duration: const Duration(milliseconds: 150),
        curve: const Interval(67 / 150, 1, curve: JSNMotionCurves.linear),
      );
    }

    if (oldWidget._showLoader != widget._showLoader && !widget._showLoader) {
      // Show content
      _contentVisibilityAnimationController.animateTo(
        0,
        duration: const Duration(milliseconds: 83),
        curve: JSNMotionCurves.linear,
      );
    }
  }

  void _didUpdateWidgetActiveInactiveAnimation(JSNButton oldWidget) {
    if (oldWidget._inactive != widget._inactive && widget._inactive) {
      // Transition to inactive
      _activeInactiveAnimationController.forward();
    }

    if (oldWidget._inactive != widget._inactive && !widget._inactive) {
      // Transition to active
      _activeInactiveAnimationController.reverse();
    }
  }

  void _updateForegroundDecorationAnimation(JSNButton oldWidget) {
    if (oldWidget.pressedColor != widget.pressedColor ||
        oldWidget.pressedLightEffect != widget.pressedLightEffect ||
        oldWidget.defaultLightEffect != widget.defaultLightEffect) {
      _animations._updateForegroundDecorationAnimation(
          _foregroundDecorationTween.animate(_tapAnimationController));
    }
  }

  void _updateColorTween(JSNButton oldWidget) {
    if (oldWidget.inactiveBackgroundColor != widget.inactiveBackgroundColor ||
        oldWidget.activeBackgroundColor != widget.activeBackgroundColor) {
      _activeInactiveBackgroundTween = ColorTween(
        begin: widget.activeBackgroundColor,
        end: widget.inactiveBackgroundColor,
      );
      _animations._updateActiveInactiveBackgroundAnimation(
          _activeInactiveBackgroundTween!
              .animate(_activeInactiveAnimationController));
    }
    if (oldWidget.inactiveContentColor != widget.inactiveContentColor ||
        oldWidget.activeContentColor != widget.activeContentColor) {
      _activeInactiveContentTween = ColorTween(
        begin: widget.activeContentColor,
        end: widget.inactiveContentColor,
      );
      _animations._updateActiveInactiveContentAnimation(
          _activeInactiveContentTween!
              .animate(_activeInactiveAnimationController));
    }
  }

  @override
  void initState() {
    super.initState();
    _tapAnimationController = AnimationController(
      value: 0,
      vsync: this,
    );

    final contentScaleAnimation = Tween<double>(
      begin: 1, // original size
      end: 0.95, // scaled down
    ).animate(
      CurvedAnimation(
          parent: _tapAnimationController, curve: JSNMotionCurves.linear),
    );

    final backgroundScaleAnimation = Tween<double>(
      begin: 1, // original size
      end: 0.98, // scaled down
    ).animate(
      CurvedAnimation(
          parent: _tapAnimationController, curve: JSNMotionCurves.linear),
    );

    final shadowOpacityAnimation = Tween<double>(
      begin: 0.15, // normal
      end: 0.05, // pressed
    ).animate(
      CurvedAnimation(
          parent: _tapAnimationController, curve: JSNMotionCurves.linear),
    );

    final foregroundDecorationAnimation =
        _foregroundDecorationTween.animate(_tapAnimationController);

    _contentVisibilityAnimationController = AnimationController(
      value: widget._showContent ? 0 : 1,
      vsync: this,
    );

    final contentOpacityAnimation = Tween<double>(
      begin: 1, // opaque
      end: 0, // transparent
    ).animate(_contentVisibilityAnimationController);

    _loaderVisibilityAnimationController = AnimationController(
      value: widget._showLoader ? 0 : 1,
      vsync: this,
      duration: const Duration(milliseconds: 83),
    );

    final loaderOpacityAnimation = Tween<double>(
      begin: 1, // opaque
      end: 0, // transparent
    ).animate(_loaderVisibilityAnimationController);

    _loaderSlideAnimationController = AnimationController(
      value: widget._showLoader ? 0 : 1,
      vsync: this,
      duration: const Duration(milliseconds: 383),
    );

    final loaderSlideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, 0.72),
    ).animate(
      CurvedAnimation(
        parent: _loaderSlideAnimationController,
        curve: const Interval(216 / 383, 1, curve: JSNMotionCurves.moveIn),
      ),
    );

    _activeInactiveAnimationController = AnimationController(
      value: widget._inactive ? 1 : 0,
      vsync: this,
      duration: const Duration(milliseconds: 133),
    );

    _activeInactiveBackgroundTween = ColorTween(
      begin: widget.activeBackgroundColor,
      end: widget.inactiveBackgroundColor,
    );

    final activeInactiveBackgroundAnimation = _activeInactiveBackgroundTween!
        .animate(_activeInactiveAnimationController);

    final activeInactiveContentAnimation = ColorTween(
      begin: widget.activeContentColor,
      end: widget.inactiveContentColor,
    ).animate(_activeInactiveAnimationController);

    _animations = JSNButtonAnimations._(
      loaderSlideAnimation: loaderSlideAnimation,
      loaderOpacityAnimation: loaderOpacityAnimation,
      contentScaleAnimation: contentScaleAnimation,
      activeInactiveBackgroundAnimation: activeInactiveBackgroundAnimation,
      activeInactiveContentAnimation: activeInactiveContentAnimation,
      backgroundScaleAnimation: backgroundScaleAnimation,
      contentOpacityAnimation: contentOpacityAnimation,
      shadowOpacityAnimation: shadowOpacityAnimation,
      foregroundDecorationAnimation: foregroundDecorationAnimation,
    );
  }

  @override
  void didUpdateWidget(JSNButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateColorTween(oldWidget);
    _didUpdateWidgetLoaderAnimation(oldWidget);
    _didUpdateWidgetContentAnimation(oldWidget);
    _didUpdateWidgetActiveInactiveAnimation(oldWidget);
    _updateForegroundDecorationAnimation(oldWidget);
  }

  @override
  void dispose() {
    _tapAnimationController.dispose();
    _activeInactiveAnimationController.dispose();
    _contentVisibilityAnimationController.dispose();
    _loaderSlideAnimationController.dispose();
    _loaderVisibilityAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final child = GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: widget.builder(_animations),
    );

    final hasCustomSemantics = widget.semanticsLabel != null ||
        widget.semanticsHint != null ||
        widget.semanticsLoadingLabel != null;

    if (!hasCustomSemantics) {
      return Semantics(
        button: !widget._showLoader,
        enabled: !widget._inactive,
        child: child,
      );
    } else {
      return Semantics(
        container: true,
        button: !widget._showLoader,
        enabled: !widget._inactive,
        textDirection: TextDirection.ltr,
        label: !widget._showLoader
            ? widget.semanticsLabel
            : widget.semanticsLoadingLabel,
        hint: Theme.of(context).platform == TargetPlatform.iOS
            ? widget.semanticsHint
            : null,
        onTapHint: widget.semanticsHint,
        onTap: !widget._showLoader ? widget.onTap : null,
        child: ExcludeSemantics(child: child),
      );
    }
  }
}

/// A collection of animations configured by [JSNButton].
class JSNButtonAnimations with Diagnosticable {
  /// Animation for button background, used to change 'scale' of a button
  /// when it is tapped.
  final Animation<double> backgroundScaleAnimation;

  /// Animation for button content, used to change 'scale' of a button content
  /// when it is tapped.
  final Animation<double> contentScaleAnimation;

  /// Animation for the button shadow, used to change color of button
  /// content when button state changes between active/inactive.
  Animation<double?> shadowOpacityAnimation;

  /// Animation for the button content, used to show/hide the content when
  /// button state changes between active/loading.
  final Animation<double> contentOpacityAnimation;

  /// Animation for the button loader, used to hide the loader when
  /// button state changes between loading to active.
  final Animation<double> loaderOpacityAnimation;

  /// Animation to show a button loader, used to slide in the loader when
  /// button state changes between active to loading.
  final Animation<Offset> loaderSlideAnimation;

  /// Animation for the button background, used to change color of button
  /// background when button state changes between active/inactive.
  Animation<Color?> activeInactiveBackgroundAnimation;

  /// Animation for the button background, used to change color of button
  /// content when button state changes between active/inactive.
  Animation<Color?> activeInactiveContentAnimation;

  /// Animation for the button foreground, used to show pressed state.
  Animation<Decoration>? foregroundDecorationAnimation;

  JSNButtonAnimations._({
    required this.backgroundScaleAnimation,
    required this.contentScaleAnimation,
    required this.activeInactiveBackgroundAnimation,
    required this.activeInactiveContentAnimation,
    required this.contentOpacityAnimation,
    required this.loaderOpacityAnimation,
    required this.loaderSlideAnimation,
    required this.shadowOpacityAnimation,
    required this.foregroundDecorationAnimation,
  });

  void _updateActiveInactiveBackgroundAnimation(Animation<Color?> animate) {
    activeInactiveBackgroundAnimation = animate;
  }

  void _updateActiveInactiveContentAnimation(Animation<Color?> animate) {
    activeInactiveContentAnimation = animate;
  }

  void _updateForegroundDecorationAnimation(Animation<Decoration> animate) {
    foregroundDecorationAnimation = animate;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<Animation<double>>(
        'backgroundScaleAnimation', backgroundScaleAnimation));
    properties.add(DiagnosticsProperty<Animation<double>>(
        'contentScaleAnimation', contentScaleAnimation));
    properties.add(DiagnosticsProperty<Animation<double?>>(
        'shadowOpacityAnimation', shadowOpacityAnimation));
    properties.add(DiagnosticsProperty<Animation<double>>(
        'contentOpacityAnimation', contentOpacityAnimation));
    properties.add(DiagnosticsProperty<Animation<double>>(
        'loaderOpacityAnimation', loaderOpacityAnimation));
    properties.add(DiagnosticsProperty<Animation<Offset>>(
        'loaderSlideAnimation', loaderSlideAnimation));
    properties.add(DiagnosticsProperty<Animation<Color?>>(
        'activeInactiveBackgroundAnimation',
        activeInactiveBackgroundAnimation));
    properties.add(DiagnosticsProperty<Animation<Color?>>(
        'activeInactiveContentAnimation', activeInactiveContentAnimation));
    properties.add(DiagnosticsProperty<Animation<Decoration>?>(
        'foregroundDecorationAnimation', foregroundDecorationAnimation));
  }
}

/// The possible states of an JSN button.
enum JSNButtonState {
  /// Default state in which users can tap the button.
  active,

  /// Disabled state in which user cannot tap the button.
  inactive,

  /// Shows a loader on the button, users cannot tap the button in this state.
  loading,
}

/// Different styles of sizes for a primary button.
enum JSNButtonSize {
  /// A flat, rectangular, full width button.
  fullWidth,

  /// A rounder corner, full width button with horizontal margin.
  regular,

  /// A rounder corner button whose width is same as size of it's content.
  tiny,

  /// Large button size, used by circular buttons only.
  circularLarge,
}

/// Subtypes supported by JSN buttons.
enum JSNButtonSubtype {
  /// Used for positive actions eg: accept, continue.
  positive,

  /// Used for destructive actions eg: delete, cancel.
  destructive,

  /// Similar to positive subtype, but have more informative to provide more
  /// context to the action eg: order buttons.
  contextual,

  /// A subtype used for 'secondary' buttons, has a static color.
  staticWhite,

  /// Similar to positive subtype, but for circular buttons.
  circularPrimary,

  /// A secondary style for circular buttons.
  circularSecondary,
}

// ignore_for_file: deprecated_member_use

import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jsn_ui/src/extension/jsn_theme_extension.dart';
import 'package:jsn_ui/src/motions/jsn_motion.dart';

import '../dimension/jsn_spacing.dart';
import 'button_loader.dart';
import 'jsn_button.dart';

///
/// # Usage
/// ```dart
/// AlohaPrimaryButton.positive(
///   const Text("Label"),
///   onTap: () => log("tap"),
///   state: JSNButtonState.active,
///   size: JSNButtonSize.regular,
/// )
/// ```
///
/// # Types
/// * Positive — [AlohaPrimaryButton.positive]
/// * Destructive — [AlohaPrimaryButton.destructive]
/// * Contextual — [AlohaPrimaryButton.contextual]
///
/// # Accessibility
/// By default, uses semantics from [text]. For contextual buttons,
/// [contextualButtonInfoText] & [contextualButtonDescriptionText] are also
/// used.
///
/// To customize, use [semanticsLabel], [semanticsLoadingLabel] &
/// [semanticsHint]. Note that if any of the semantics parameter is set,
/// defaults mentioned above will not be used.
///
/// ```dart
/// AlohaPrimaryButton.positive(
///   const Text("Order"),
///   onTap: () => log("tap"),
///   state: JSNButtonState.active,
///   semanticsLabel: "Order now for Rp100000 with a Rp5000 cashback",
///   semanticsLoadingLabel: "Loading",
///   semanticsHint: "Order",
/// ),
/// ```
///
/// Use [semanticsLabel], [semanticsLoadingLabel] and [semanticsHint] to
/// customize.
///
/// # Samples
/// * AlohaPrimaryPositiveButtonDemo
/// * AlohaPrimaryDestructiveButtonDemo
/// * AlohaPrimaryContextualButtonDemo
///
/// # See also
/// * [JSNButton] - Used for all buttons in Aloha design system.
class JSNPrimaryButton extends StatelessWidget {
  const JSNPrimaryButton._(
    this.text, {
    Key? key,
    required this.onTap,
    required this.state,
    required this.size,
    required this.subtype,
    this.contextualButtonDescriptionText,
    this.contextualButtonRotatingDescriptions,
    this.contextualButtonInfoText,
    this.contextualButtonIcon,
    this.rightIcon,
    this.leftIcon,
    this.semanticsLabel,
    this.semanticsLoadingLabel,
    this.semanticsHint,
  }) : super(key: key);

  /// Creates a primary/positive button.
  factory JSNPrimaryButton.positive(
    Widget text, {
    Key? key,
    required VoidCallback onTap,
    JSNButtonSize size = JSNButtonSize.regular,
    JSNButtonState state = JSNButtonState.active,
    Widget? rightIcon,
    Widget? leftIcon,
    String? semanticsLabel,
    String? semanticsLoadingLabel,
    String? semanticsHint,
  }) {
    return JSNPrimaryButton._(
      text,
      key: key,
      onTap: onTap,
      state: state,
      size: size,
      subtype: JSNButtonSubtype.positive,
      rightIcon: rightIcon,
      leftIcon: leftIcon,
      semanticsLabel: semanticsLabel,
      semanticsLoadingLabel: semanticsLoadingLabel,
      semanticsHint: semanticsHint,
    );
  }

  /// Creates a primary/destructive button.
  factory JSNPrimaryButton.destructive(
    Widget text, {
    Key? key,
    required VoidCallback onTap,
    JSNButtonSize size = JSNButtonSize.regular,
    JSNButtonState state = JSNButtonState.active,
    Widget? rightIcon,
    Widget? leftIcon,
    String? semanticsLabel,
    String? semanticsLoadingLabel,
    String? semanticsHint,
  }) {
    return JSNPrimaryButton._(
      text,
      key: key,
      onTap: onTap,
      state: state,
      size: size,
      subtype: JSNButtonSubtype.destructive,
      rightIcon: rightIcon,
      leftIcon: leftIcon,
      semanticsLabel: semanticsLabel,
      semanticsLoadingLabel: semanticsLoadingLabel,
      semanticsHint: semanticsHint,
    );
  }

  /// Creates a primary/contextual button.
  factory JSNPrimaryButton.contextual(
    Widget text, {
    Key? key,
    required VoidCallback onTap,
    required Widget infoText,
    required Widget icon,
    JSNButtonState state = JSNButtonState.active,
    String? descriptionText,
    List<String>? rotatingDescriptions,
    String? semanticsLabel,
    String? semanticsLoadingLabel,
    String? semanticsHint,
  }) {
    return JSNPrimaryButton._(
      text,
      key: key,
      onTap: onTap,
      state: state,
      size: JSNButtonSize.regular,
      subtype: JSNButtonSubtype.contextual,
      contextualButtonDescriptionText: descriptionText,
      contextualButtonRotatingDescriptions: rotatingDescriptions,
      contextualButtonInfoText: infoText,
      contextualButtonIcon: icon,
      semanticsLabel: semanticsLabel,
      semanticsLoadingLabel: semanticsLoadingLabel,
      semanticsHint: semanticsHint,
    );
  }

  /// A callback invoked when a button is tapped.
  ///
  /// The callback is invoked only if button is in [JSNButtonState.active]
  /// state.
  final VoidCallback onTap;

  /// State of an Aloha button.
  final JSNButtonState state;

  /// Size of an Aloha button.
  final JSNButtonSize size;

  /// Subtype of an Aloha button.
  final JSNButtonSubtype subtype;

  /// Text label shown on the Aloha button in [JSNButtonState.active] state.
  ///
  /// This is generally a [Text] widget. A text style based on the theme is
  /// applied by default using [DefaultTextStyle].
  final Widget text;

  /// An optional icon shown to the right of button text.
  ///
  /// This is generally an [AlohaIcon] widget. Icon color is set automatically
  /// based on the button [subtype]. Use [IconName] with size 16.
  ///
  /// See [AlohaIconTheme] for more details on theming icons.
  final Widget? rightIcon;

  /// An optional icon shown to the left of button text.
  ///
  /// This is generally an [AlohaIcon] widget. Icon color is set automatically
  /// based on the button [subtype]. Use [IconName] with size 16.
  ///
  /// See [AlohaIconTheme] for more details on theming icons.
  final Widget? leftIcon;

  /// Used with [AlohaPrimaryButton.contextual] only. Shows a description
  /// below the [text] label of the button.
  ///
  /// To set multiple descriptions which are shown one by one with animation
  /// use [contextualButtonRotatingDescriptions] instead.
  ///
  /// If set along with [contextualButtonRotatingDescriptions], this description
  /// is prepended to the rotating descriptions.
  final String? contextualButtonDescriptionText;

  /// Used with [AlohaPrimaryButton.contextual] only. Used to show multiple
  /// descriptions which switch with an animation.
  final List<String>? contextualButtonRotatingDescriptions;

  /// Used with [AlohaPrimaryButton.contextual] only.
  ///
  /// A text style based on the theme is applied by default
  /// using [DefaultTextStyle].
  final Widget? contextualButtonInfoText;

  /// Used with [AlohaPrimaryButton.contextual] only.
  ///
  /// Cannot be null for contextual buttons.
  final Widget? contextualButtonIcon;

  /// See [JSNButton.semanticsLabel].
  ///
  /// For 'contextual' button defaults to a combination of [text],
  /// [contextualButtonDescriptionText] & [contextualButtonInfoText].
  /// Defaults to [text] for all other button types.
  final String? semanticsLabel;

  /// See [JSNButton.semanticsLoadingLabel].
  final String? semanticsLoadingLabel;

  /// See [JSNButton.semanticsHint].
  final String? semanticsHint;

  @override
  Widget build(BuildContext context) {
    final Color inactiveColor;
    final Color activeColor;
    switch (subtype) {
      case JSNButtonSubtype.positive:
        activeColor = context.jsnColorTokens.fillBackgroundPrimary;
        inactiveColor = context.jsnColorTokens.borderInactive;
        break;
      case JSNButtonSubtype.contextual:
        activeColor = context.jsnColorTokens.fillBackgroundPrimary;
        inactiveColor = context.jsnColorTokens.borderInactive;
        break;
      case JSNButtonSubtype.destructive:
        activeColor = context.jsnColorTokens.fillBackgroundPrimary;
        inactiveColor = context.jsnColorTokens.borderInactive;
        break;
      default:
        throw UnsupportedError("Invalid $subtype for a primary button");
    }

    final double height;
    switch (size) {
      case JSNButtonSize.fullWidth:
      case JSNButtonSize.regular:
        height = 56;
        break;
      case JSNButtonSize.tiny:
        height = 40;
        break;
      default:
        throw UnsupportedError("Invalid $size for a primary button");
    }

    final BorderRadius borderRadius;
    switch (size) {
      case JSNButtonSize.fullWidth:
        borderRadius = BorderRadius.zero;
        break;
      case JSNButtonSize.regular:
      case JSNButtonSize.tiny:
        borderRadius = BorderRadius.circular(height);
        break;
      default:
        throw UnsupportedError("Invalid $size for a primary button");
    }

    return LayoutBuilder(builder: (_, constraints) {
      final double minWidth;
      switch (size) {
        case JSNButtonSize.fullWidth:
          minWidth = MediaQuery.of(context).size.width;
          break;
        case JSNButtonSize.regular:
          minWidth = constraints.minWidth == 0
              ? MediaQuery.of(context).size.width - JSNSpacing.spacing32
              : constraints.minWidth;
          break;
        case JSNButtonSize.tiny:
          minWidth = constraints.minWidth == 0
              ? JSNSpacing.spacing64
              : constraints.minWidth;
          break;
        default:
          throw UnsupportedError("Invalid $size for a primary button");
      }

      final double maxWidth;
      switch (size) {
        case JSNButtonSize.fullWidth:
        case JSNButtonSize.regular:
          maxWidth = minWidth;
          break;
        case JSNButtonSize.tiny:
          maxWidth = constraints.maxWidth;
          break;
        default:
          throw UnsupportedError("Invalid $size for a primary button");
      }

      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: height,
          minHeight: height,
          minWidth: minWidth,
          maxWidth: maxWidth,
        ),
        child: JSNButton(
          onTap: onTap,
          state: state,
          activeBackgroundColor: activeColor,
          inactiveBackgroundColor: inactiveColor,
          borderRadius: borderRadius,
          semanticsLabel: semanticsLabel,
          semanticsLoadingLabel: semanticsLoadingLabel,
          semanticsHint: semanticsHint,
          builder: (JSNButtonAnimations animations) {
            return IntrinsicWidth(
              child: _PrimaryButtonBackground(
                subtype: subtype,
                size: size,
                animations: animations,
                height: height,
                borderRadius: borderRadius,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    _PrimaryButtonForeground(
                      animations: animations,
                      borderRadius: borderRadius,
                    ),
                    ButtonLoader(
                      animations: animations,
                      color: context.jsnColorTokens.iconStaticWhite,
                    ),
                    _PrimaryButtonContentBuilder(
                      text: text,
                      subtype: subtype,
                      size: size,
                      contextualButtonDescriptionText:
                          contextualButtonDescriptionText,
                      contextualButtonInfoText: contextualButtonInfoText,
                      contextualButtonRotatingDescriptions:
                          contextualButtonRotatingDescriptions,
                      contextualButtonIcon: contextualButtonIcon,
                      rightIcon: rightIcon,
                      leftIcon: leftIcon,
                      animations: animations,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<JSNButtonState>('state', state));
    properties.add(EnumProperty<JSNButtonSize>('size', size));
    properties.add(EnumProperty<JSNButtonSubtype>('subtype', subtype));
    if (contextualButtonDescriptionText != null) {
      properties.add(StringProperty(
          'contextualButtonDescriptionText', contextualButtonDescriptionText));
    }
    if (contextualButtonRotatingDescriptions != null) {
      properties.add(IterableProperty<String>(
          'contextualButtonRotatingDescriptions',
          contextualButtonRotatingDescriptions));
    }
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
    properties.add(ObjectFlagProperty<ui.VoidCallback>.has('onTap', onTap));
  }
}

class _PrimaryButtonBackground extends StatelessWidget {
  const _PrimaryButtonBackground({
    Key? key,
    required this.child,
    required this.size,
    required this.animations,
    required this.subtype,
    required this.height,
    required this.borderRadius,
  }) : super(key: key);

  final Widget child;
  final JSNButtonSize size;
  final JSNButtonSubtype subtype;
  final JSNButtonAnimations animations;
  final double height;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    final bool enableBackgroundScaleAnimation;
    switch (size) {
      case JSNButtonSize.fullWidth:
        enableBackgroundScaleAnimation = false;
        break;
      case JSNButtonSize.regular:
      case JSNButtonSize.tiny:
        enableBackgroundScaleAnimation = true;
        break;
      default:
        throw UnsupportedError("Invalid $size for a primary button");
    }

    final buttonBackground = AnimatedBuilder(
      animation: animations.activeInactiveBackgroundAnimation,
      builder: (_, child) {
        return Container(
          height: height,
          decoration: BoxDecoration(
            color: animations.activeInactiveBackgroundAnimation.value,
            borderRadius: borderRadius,
          ),
          child: child,
        );
      },
      child: child,
    );

    if (enableBackgroundScaleAnimation) {
      return ScaleTransition(
        scale: animations.backgroundScaleAnimation,
        child: buttonBackground,
      );
    } else {
      return buttonBackground;
    }
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<JSNButtonSize>('size', size));
    properties.add(EnumProperty<JSNButtonSubtype>('subtype', subtype));
    properties.add(DoubleProperty('height', height));
    properties
        .add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
    properties.add(
        DiagnosticsProperty<JSNButtonAnimations>('animations', animations));
  }
}

class _PrimaryButtonForeground extends StatelessWidget {
  const _PrimaryButtonForeground({
    Key? key,
    required this.borderRadius,
    required this.animations,
  }) : super(key: key);

  final JSNButtonAnimations animations;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      decoration: animations.foregroundDecorationAnimation!,
      child: const SizedBox.expand(),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(DiagnosticsProperty<BorderRadius>('borderRadius', borderRadius));
    properties.add(
        DiagnosticsProperty<JSNButtonAnimations>('animations', animations));
  }
}

/// Applies common animations to all primary buttons and selects the correct
/// primary button content based on [subtype].
class _PrimaryButtonContentBuilder extends StatelessWidget {
  const _PrimaryButtonContentBuilder({
    Key? key,
    required this.subtype,
    required this.text,
    required this.contextualButtonDescriptionText,
    required this.contextualButtonInfoText,
    required this.contextualButtonRotatingDescriptions,
    required this.contextualButtonIcon,
    required this.size,
    required this.rightIcon,
    required this.leftIcon,
    required this.animations,
  }) : super(key: key);

  final JSNButtonAnimations animations;
  final JSNButtonSubtype subtype;
  final Widget text;
  final String? contextualButtonDescriptionText;
  final Widget? contextualButtonInfoText;
  final List<String>? contextualButtonRotatingDescriptions;
  final Widget? contextualButtonIcon;
  final JSNButtonSize size;
  final Widget? rightIcon;
  final Widget? leftIcon;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle;
    switch (size) {
      case JSNButtonSize.fullWidth:
      case JSNButtonSize.regular:
        textStyle = context.jsnTypography.bodyModerateDefault;
        break;
      case JSNButtonSize.tiny:
        textStyle = context.jsnTypography.bodyModerateDefault;
        break;
      default:
        throw UnsupportedError("Invalid $size for a primary button");
    }

    return FadeTransition(
      opacity: animations.contentOpacityAnimation,
      child: Builder(
        builder: (context) {
          if (subtype == JSNButtonSubtype.contextual) {
            return _PrimaryContextualButtonContent(
              title: text,
              descriptionText: contextualButtonDescriptionText,
              infoText: contextualButtonInfoText!,
              rotatingDescriptions: contextualButtonRotatingDescriptions,
              icon: contextualButtonIcon!,
            );
          } else {
            switch (size) {
              case JSNButtonSize.fullWidth:
                return ScaleTransition(
                  scale: animations.contentScaleAnimation,
                  child: _FullWidthButtonContent(
                    textStyle: textStyle,
                    text: text,
                    rightIcon: rightIcon,
                    leftIcon: leftIcon,
                  ),
                );
              case JSNButtonSize.regular:
                return ScaleTransition(
                  scale: animations.contentScaleAnimation,
                  child: _RegularButtonContent(
                    textStyle: textStyle,
                    text: text,
                    rightIcon: rightIcon,
                    leftIcon: leftIcon,
                  ),
                );
              case JSNButtonSize.tiny:
                return ScaleTransition(
                  scale: animations.contentScaleAnimation,
                  child: _TinyButtonContent(
                    text: text,
                    textStyle: textStyle,
                  ),
                );
              default:
                throw UnsupportedError("Invalid $size for a primary button");
            }
          }
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(EnumProperty<JSNButtonSubtype>('subtype', subtype));
    properties.add(StringProperty(
        'contextualButtonDescriptionText', contextualButtonDescriptionText));
    properties.add(IterableProperty<String>(
        'contextualButtonRotatingDescriptions',
        contextualButtonRotatingDescriptions));
    properties.add(EnumProperty<JSNButtonSize>('size', size));
    properties.add(
        DiagnosticsProperty<JSNButtonAnimations>('animations', animations));
  }
}

/// Button content for [JSNButtonSize.tiny].
class _TinyButtonContent extends StatelessWidget {
  const _TinyButtonContent({
    Key? key,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  final Widget text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: JSNSpacing.spacing24,
      ),
      child: DefaultTextStyle(style: textStyle, child: text),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle>('textStyle', textStyle));
  }
}

/// Button content for [JSNButtonSize.regular].
class _RegularButtonContent extends StatelessWidget {
  const _RegularButtonContent({
    Key? key,
    required this.text,
    required this.textStyle,
    this.rightIcon,
    this.leftIcon,
  }) : super(key: key);

  final Widget text;
  final TextStyle textStyle;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 16),
        if (leftIcon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: leftIcon!,
          ),
        DefaultTextStyle(style: textStyle, child: text),
        if (rightIcon != null)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: rightIcon!,
          ),
        const SizedBox(width: 16),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle>('textStyle', textStyle));
  }
}

/// Button content for [JSNButtonSize.fullWidth].
class _FullWidthButtonContent extends StatelessWidget {
  const _FullWidthButtonContent({
    Key? key,
    required this.text,
    required this.textStyle,
    this.rightIcon,
    this.leftIcon,
  }) : super(key: key);

  final Widget text;
  final TextStyle textStyle;
  final Widget? leftIcon;
  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (leftIcon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: leftIcon!,
          ),
        DefaultTextStyle(style: textStyle, child: text),
        if (rightIcon != null)
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: rightIcon!,
          ),
      ],
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TextStyle>('textStyle', textStyle));
  }
}

/// Button content for [JSNButtonSubtype.contextual].
class _PrimaryContextualButtonContent extends StatelessWidget {
  const _PrimaryContextualButtonContent({
    Key? key,
    required this.title,
    required this.infoText,
    required this.icon,
    this.rotatingDescriptions,
    this.descriptionText,
  }) : super(key: key);

  final Widget title;
  final Widget infoText;
  final String? descriptionText;
  final List<String>? rotatingDescriptions;
  final Widget icon;

  bool get _hasDescription =>
      descriptionText != null || rotatingDescriptions != null;

  double get _labelTopPosition {
    if (_hasDescription) {
      return 0; // Translate to top.
    } else {
      return 8; // Center the text vertically on button
    }
  }

  List<String> get _resolvedRotatingDescriptions {
    final List<String> values;
    if (descriptionText == null) {
      values = rotatingDescriptions!;
    } else {
      values = rotatingDescriptions!..add(descriptionText!);
    }
    return values;
  }

  Widget _buildDescription() {
    return Positioned(
      bottom: 1,
      child: Builder(builder: (context) {
        final Widget description;
        if (descriptionText != null || rotatingDescriptions?.length == 1) {
          description = Text(
            descriptionText ?? rotatingDescriptions!.first,
            maxLines: 1,
          );
        } else if (rotatingDescriptions != null) {
          description = _RotatingText(labels: _resolvedRotatingDescriptions);
        } else {
          description = const SizedBox();
        }

        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 83),
          child: description,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: JSNSpacing.spacing20,
        vertical: JSNSpacing.spacing4,
      ),
      child: Stack(
        children: [
          Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 167),
                top: _labelTopPosition,
                curve: JSNMotionCurves.moveIn,
                child: DefaultTextStyle(
                  style: context.jsnTypography.bodySmallDefault,
                  child: title,
                ),
              ),
              _buildDescription(),
            ],
          ),
          const SizedBox(
            width: 8,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                DefaultTextStyle(
                  style: context.jsnTypography.bodyModerateDefault,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  child: infoText,
                ),
                const SizedBox(width: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('descriptionText', descriptionText));
    properties.add(
        IterableProperty<String>('rotatingDescriptions', rotatingDescriptions));
  }
}

class _RotatingText extends StatefulWidget {
  const _RotatingText({Key? key, required this.labels}) : super(key: key);

  final List<String> labels;

  @override
  _RotatingTextState createState() => _RotatingTextState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IterableProperty<String>('labels', labels));
  }
}

class _RotatingTextState extends State<_RotatingText>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  final _curve = const Interval(0, 333 / 1833, curve: JSNMotionCurves.moveIn);
  late String _label1 = widget.labels[0];
  late String _label2 = widget.labels[1];
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1833),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _updateLabels();
          _animationController.forward(from: 0);
        }
      })
      ..forward();
  }

  void _updateLabels() {
    if (_currentIndex + 1 < widget.labels.length) {
      _currentIndex = _currentIndex + 1;
      _label1 = widget.labels[_currentIndex - 1];
      _label2 = widget.labels[_currentIndex];
    } else {
      _currentIndex = 0;
      _label1 = widget.labels[widget.labels.length - 1];
      _label2 = widget.labels[_currentIndex];
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: CustomPaint(
        size: const Size(100, 16),
        painter: _TextRotationPainter(
          label1: _label1,
          label2: _label2,
          textStyle: context.jsnTypography.bodyModerateDefault,
          scrollPosition: _curve.transform(_animationController.value),
        ),
      ),
    );
  }
}

class _TextRotationPainter extends CustomPainter {
  _TextRotationPainter({
    required this.label1,
    required this.label2,
    required this.scrollPosition,
    required this.textStyle,
  });

  final String label1;
  final String label2;
  final TextStyle textStyle;
  final double scrollPosition;
  Paint label1Paint = Paint();
  Paint label2Paint = Paint();

  @override
  void paint(Canvas canvas, Size size) {
    label1Paint = label1Paint..color = textStyle.color!;
    final paragraph1 = _buildParagraph(label1, size, label1Paint);
    final lineHeight = paragraph1.height;
    final label1Position = Offset(
        0, ((size.height - lineHeight) / 2) - (scrollPosition * size.height));
    canvas.drawParagraph(paragraph1, label1Position);

    label2Paint = label2Paint
      ..color = textStyle.color!.withOpacity(scrollPosition);
    final paragraph2 = _buildParagraph(label2, size, label2Paint);
    final label2Position = label1Position.translate(0, size.height);
    canvas.drawParagraph(paragraph2, label2Position);
  }

  ui.Paragraph _buildParagraph(String label, Size size, Paint paint) {
    final paragraphBuilder1 = ui.ParagraphBuilder(
      ui.ParagraphStyle(
          textAlign: TextAlign.left, maxLines: 1, fontSize: textStyle.fontSize),
    )
      ..pushStyle(ui.TextStyle(
        foreground: paint,
        fontSize: textStyle.fontSize,
        fontFamily: textStyle.fontFamily,
        fontWeight: textStyle.fontWeight,
      ))
      ..addText(label);

    final paragraph = paragraphBuilder1.build()
      ..layout(ui.ParagraphConstraints(width: size.width));
    return paragraph;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

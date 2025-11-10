// ignore_for_file: public_member_api_docs, sort_constructors_first, deprecated_member_use
import 'package:aurora_random_image/app/view/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jsn_ui/jsn_ui.dart';
import 'package:random_images/src/screens/random_image/widgets/button.dart';

import '../../../../random_images.dart';
import '../widgets/inline_error_message.dart';
import '../bloc/random_image_bloc.dart';
import 'random_image_stage.dart';

class RandomImageView extends StatefulWidget {
  const RandomImageView({super.key, required this.handler});

  final RandomImageHandler handler;

  static const _backgroundDuration = Duration(milliseconds: 700);

  @override
  State<RandomImageView> createState() => _RandomImageViewState();
}

class _RandomImageViewState extends State<RandomImageView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _gradientController;
  late final Animation<Alignment> _gradientBegin;
  late final Animation<Alignment> _gradientEnd;

  @override
  void initState() {
    super.initState();
    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 18),
    )..repeat(reverse: true);

    _gradientBegin =
        AlignmentTween(
          begin: const Alignment(-1, -1),
          end: const Alignment(0.7, -0.5),
        ).animate(
          CurvedAnimation(
            parent: _gradientController,
            curve: Curves.easeInOutCubicEmphasized,
          ),
        );

    _gradientEnd =
        AlignmentTween(
          begin: const Alignment(1, 1),
          end: const Alignment(-0.4, 0.9),
        ).animate(
          CurvedAnimation(
            parent: _gradientController,
            curve: const Interval(0.2, 1, curve: Curves.easeInOutCubic),
          ),
        );
  }

  @override
  void dispose() {
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Random Image'),
        elevation: 0,
        actions: [
          BlocBuilder<AppBloc, AppState>(
            builder: (context, state) {
              final isLight = state.themeMode == JSNThemeMode.light;
              return IconButton(
                tooltip: isLight
                    ? 'Switch to dark mode'
                    : 'Switch to light mode',
                icon: Icon(
                  isLight
                      ? Icons.dark_mode_outlined
                      : Icons.light_mode_outlined,
                ),
                onPressed: () {
                  context.read<AppBloc>().add(ChangeTheme());
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<RandomImageBloc, RandomImageState>(
        builder: (context, state) {
          final imageUrl = state.imageUrl;
          final isInitialLoading =
              (state is RandomImageInitial || state is RandomImageLoading) &&
              imageUrl == null;
          final isRefreshing = state is RandomImageLoading && imageUrl != null;
          final errorMessage = state.message;

          return AnimatedBuilder(
            animation: _gradientController,
            builder: (context, _) {
              final gradient = _gradientFromPalette(
                theme,
                state.paletteColors,
                _gradientBegin.value,
                _gradientEnd.value,
              );

              return AnimatedContainer(
                duration: RandomImageView._backgroundDuration,
                curve: Curves.easeOutCubic,
                decoration: BoxDecoration(gradient: gradient),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: RandomImageStage(
                            imageUrl: imageUrl,
                            isInitialLoading: isInitialLoading,
                            showOverlayLoader: isRefreshing,
                            inlineError:
                                imageUrl == null ? errorMessage : null,
                          ),
                        ),
                        const SizedBox(height: 24),
                        AnotherButton(
                          isLoading: state is RandomImageLoading,
                          onPressed: state is RandomImageLoading
                              ? null
                              : widget.handler.fetchRandomImage,
                        ),
                        if (state is RandomImageError && errorMessage != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: InlineErrorMessage(message: errorMessage),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  LinearGradient _gradientFromPalette(
    ThemeData theme,
    List<Color> palette,
    Alignment begin,
    Alignment end,
  ) {
    final scheme = theme.colorScheme;
    final baseColors = palette.isNotEmpty
        ? palette
        : <Color>[
            scheme.surfaceContainerHighest,
            scheme.surface,
            scheme.surface,
          ];

    Color tint(Color color, double amount) {
      final mixTarget = theme.brightness == Brightness.dark
          ? Colors.black
          : Colors.white;
      return Color.lerp(color, mixTarget, amount) ?? color;
    }

    final colors = <Color>[
      tint(baseColors.first, 0.08),
      tint(baseColors[baseColors.length ~/ 2], 0.18),
      tint(baseColors.last, 0.28),
    ];

    return LinearGradient(begin: begin, end: end, colors: colors);
  }
}

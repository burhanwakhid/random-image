// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../widgets/image_placeholder.dart';

class AnimatedImageFrame extends StatelessWidget {
  const AnimatedImageFrame({
    super.key,
    required this.imageUrl,
    required this.showOverlayLoader,
  });

  final String imageUrl;
  final bool showOverlayLoader;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final borderRadius = BorderRadius.circular(32);

    const imageSwitchDuration = Duration(milliseconds: 700);

    return Semantics(
      label: 'Randomly fetched image',
      image: true,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: theme.colorScheme.surface.withOpacity(
            theme.brightness == Brightness.dark ? 0.35 : 0.6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(
                theme.brightness == Brightness.dark ? 0.35 : 0.2,
              ),
              blurRadius: 30,
              spreadRadius: 1,
              offset: const Offset(0, 18),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedSwitcher(
                duration: imageSwitchDuration,
                switchInCurve: Curves.easeOutCubic,
                switchOutCurve: Curves.easeInOutQuad,
                transitionBuilder: (child, animation) {
                  final curved = CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutQuint,
                    reverseCurve: Curves.easeInCubic,
                  );

                  return AnimatedBuilder(
                    animation: curved,
                    child: child,
                    builder: (context, child) {
                      final value = curved.value;
                      final scale = lerpDouble(0.88, 1, value) ?? 1;
                      final translateY = lerpDouble(38, 0, value) ?? 0;
                      final tilt = (1 - value) * 0.05;
                      final blur = (1 - value) * 6;

                      return Opacity(
                        opacity: value,
                        child: Transform(
                          alignment: Alignment.center,
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.0015)
                            ..translate(0.0, translateY)
                            ..rotateX(tilt)
                            ..rotateY(-tilt / 2)
                            ..scale(scale),
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(
                              sigmaX: blur,
                              sigmaY: blur,
                            ),
                            child: child,
                          ),
                        ),
                      );
                    },
                  );
                },
                child: CachedNetworkImage(
                  key: ValueKey(imageUrl),
                  imageUrl: imageUrl,
                  fadeInDuration: Duration.zero,
                  fadeOutDuration: Duration.zero,
                  imageBuilder: (context, provider) => Image(
                    image: provider,
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    filterQuality: FilterQuality.high,
                  ),
                  progressIndicatorBuilder: (context, url, progress) {
                    final value =
                        progress.totalSize != null && progress.totalSize! > 0
                        ? progress.downloaded.toDouble() /
                              progress.totalSize!.toDouble()
                        : null;

                    return Stack(
                      fit: StackFit.expand,
                      children: [
                        const ImagePlaceholder(),
                        Center(
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: CircularProgressIndicator.adaptive(
                              value: value,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const ImagePlaceholder(
                      icon: Icons.broken_image_outlined,
                    );
                  },
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: AnimatedOpacity(
                  opacity: showOverlayLoader ? 1 : 0,
                  duration: const Duration(milliseconds: 250),
                  child: Container(
                    color: Colors.black.withOpacity(0.25),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator.adaptive(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

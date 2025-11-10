import 'package:flutter/material.dart';
import 'package:random_images/src/screens/random_image/views/animated_image_frame.dart';

import 'error_placeholder.dart';

class RandomImageStage extends StatelessWidget {
  const RandomImageStage({
    super.key,
    required this.imageUrl,
    required this.isInitialLoading,
    required this.showOverlayLoader,
    required this.inlineError,
  });

  final String? imageUrl;
  final bool isInitialLoading;
  final bool showOverlayLoader;
  final String? inlineError;

  @override
  Widget build(BuildContext context) {
    if (isInitialLoading) {
      return const Center(child: CircularProgressIndicator.adaptive());
    }

    if (inlineError != null) {
      return ErrorPlaceholder(message: inlineError);
    }

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 420),
        child: AspectRatio(
          aspectRatio: 1,
          child: AnimatedImageFrame(
            imageUrl: imageUrl!,
            showOverlayLoader: showOverlayLoader,
          ),
        ),
      ),
    );
  }
}

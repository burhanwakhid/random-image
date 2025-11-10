// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder({super.key, this.icon});

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.surface.withOpacity(0.5),
            theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
          ],
        ),
      ),
      child: icon == null
          ? null
          : Icon(
              icon,
              size: 64,
              color: theme.colorScheme.onSurface.withOpacity(0.8),
            ),
    );
  }
}

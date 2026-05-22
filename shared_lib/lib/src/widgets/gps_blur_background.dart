import 'package:flutter/material.dart';

/// Renders the premium background with subtle, high-performance radial glows.
/// Renders a top-right primary glow and bottom-left secondary/tertiary glow
/// conforming to the brand design guidelines in `docs/DESIGN-GPS-Medical.md`.
class GpsBlurBackground extends StatelessWidget {
  const GpsBlurBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Solid background base
        Positioned.fill(child: Container(color: colorScheme.surface)),
        // Top-right soft primary glow
        Positioned(
          top: -200,
          right: -200,
          width: 500,
          height: 500,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    colorScheme.primary.withOpacity(isDark ? 0.15 : 0.1),
                    colorScheme.primary.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
        ),
        // Bottom-left soft secondary/tertiary glow
        Positioned(
          bottom: -150,
          left: -150,
          width: 400,
          height: 400,
          child: IgnorePointer(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    colorScheme.secondary.withOpacity(isDark ? 0.12 : 0.08),
                    colorScheme.secondary.withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned.fill(child: child),
      ],
    );
  }
}

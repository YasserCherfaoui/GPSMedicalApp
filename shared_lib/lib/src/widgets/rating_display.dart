import 'package:flutter/material.dart';
import '../theme/gps_spacing.dart';

/// Renders a star rating with average score and total review count.
class RatingDisplay extends StatelessWidget {
  const RatingDisplay({required this.rating, required this.count, super.key});

  final double rating;
  final int count;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.star_rounded,
          color: colorScheme.brightness == Brightness.dark
              ? const Color(0xFF7AD7C6)
              : const Color(0xFF005E53),
          size: 18,
        ),
        const SizedBox(width: GpsSpacing.unit),
        Text(
          rating.toStringAsFixed(1),
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(width: GpsSpacing.unit),
        Text(
          '($count)',
          style: theme.textTheme.labelSmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

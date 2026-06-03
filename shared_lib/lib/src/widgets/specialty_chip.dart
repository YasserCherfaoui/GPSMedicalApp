import 'package:flutter/material.dart';
import '../theme/gps_colors.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';

/// Renders a small tag for a medical specialty.
class SpecialtyChip extends StatelessWidget {
  const SpecialtyChip({required this.label, super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GpsSpacing.sm,
        vertical: GpsSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: colorScheme.brightness == Brightness.dark
            ? colorScheme.secondaryContainer.withValues(alpha: 0.35)
            : GpsColors.cardAccentBorder,
        borderRadius: GpsRadii.chip,
      ),
      child: Text(
        label,
        style: theme.textTheme.labelSmall?.copyWith(
          color: colorScheme.brightness == Brightness.dark
              ? const Color(0xFF7AD7C6)
              : GpsColors.primary,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.4,
        ),
      ),
    );
  }
}

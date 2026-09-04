import 'package:flutter/material.dart';

import '../theme/gps_colors.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';

/// Tappable discovery search promo styled with Medora brand tokens.
class DiscoverySearchPromo extends StatelessWidget {
  const DiscoverySearchPromo({
    required this.hint,
    required this.onTap,
    super.key,
  });

  final String hint;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: GpsRadii.card,
        child: Ink(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerLowest,
            borderRadius: GpsRadii.card,
            border: Border.all(
              color: colorScheme.outlineVariant.withValues(alpha: 0.45),
            ),
            boxShadow: [
              BoxShadow(
                color: GpsColors.blue.withValues(alpha: 0.06),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: GpsSpacing.md,
              vertical: GpsSpacing.sm + 2,
            ),
            child: Row(
              children: [
                Icon(Icons.search, color: colorScheme.primary, size: 22),
                const SizedBox(width: GpsSpacing.sm),
                Expanded(
                  child: Text(
                    hint,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                Icon(Icons.tune, color: colorScheme.onSurfaceVariant, size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

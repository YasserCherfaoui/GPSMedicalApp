import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class ModeBadge extends StatelessWidget {
  const ModeBadge({required this.mode, super.key});

  final String mode;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isTelehealth = mode == 'telehealth';
    final label = isTelehealth
        ? l10n.bookingModeTelehealth
        : l10n.bookingModeInPerson;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GpsSpacing.sm,
        vertical: GpsSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: isTelehealth
            ? colorScheme.secondaryContainer
            : colorScheme.primaryContainer.withValues(alpha: 0.3),
        borderRadius: BorderRadius.circular(GpsRadii.full),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: isTelehealth
              ? colorScheme.onSecondaryContainer
              : colorScheme.primary,
        ),
      ),
    );
  }
}

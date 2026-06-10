import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class StatusPill extends StatelessWidget {
  const StatusPill({required this.status, super.key});

  final String status;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final label = switch (status) {
      'pending' => l10n.appointmentStatusPending,
      'confirmed' => l10n.appointmentStatusConfirmed,
      'cancelled' => l10n.appointmentStatusCancelled,
      'completed' => l10n.appointmentStatusCompleted,
      'no_show' => l10n.appointmentStatusNoShow,
      _ => status,
    };
    final colorScheme = Theme.of(context).colorScheme;
    final (bg, fg) = switch (status) {
      'confirmed' => (colorScheme.primaryContainer, colorScheme.primary),
      'pending' => (
        colorScheme.tertiaryContainer,
        colorScheme.onTertiaryContainer,
      ),
      'cancelled' => (colorScheme.errorContainer, colorScheme.error),
      'completed' => (colorScheme.surfaceContainerHigh, colorScheme.onSurface),
      _ => (colorScheme.surfaceContainer, colorScheme.onSurfaceVariant),
    };
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GpsSpacing.sm,
        vertical: GpsSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(GpsRadii.full),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }
}

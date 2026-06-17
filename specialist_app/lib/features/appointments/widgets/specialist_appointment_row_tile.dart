import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../utils/appointment_display.dart';
import '../utils/appointment_enums.dart';

class AppointmentModeBadge extends StatelessWidget {
  const AppointmentModeBadge({required this.mode, super.key});

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

class AppointmentStatusPill extends StatelessWidget {
  const AppointmentStatusPill({required this.status, super.key});

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

class SpecialistAppointmentRowTile extends StatelessWidget {
  const SpecialistAppointmentRowTile({
    required this.appointment,
    required this.onTap,
    super.key,
  });

  final Appointment appointment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).languageCode;
    final start = appointment.startAt?.toLocal();
    final dateStr = start != null
        ? DateFormat.yMMMd(locale).add_Hm().format(start)
        : '';
    final patientLabel = specialistPatientDisplayLabel(l10n, appointment);
    final reason = reasonSnippet(appointment.reason);
    final fee = appointment.feeDzd;

    return Card(
      margin: const EdgeInsets.only(bottom: GpsSpacing.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(GpsRadii.md),
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 28,
                child: Text(
                  patientLabel.isNotEmpty
                      ? patientLabel[0].toUpperCase()
                      : '?',
                ),
              ),
              const SizedBox(width: GpsSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patientLabel,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (reason.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        reason,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                    const SizedBox(height: GpsSpacing.xs),
                    Text(dateStr, style: theme.textTheme.bodyMedium),
                    const SizedBox(height: GpsSpacing.xs),
                    Wrap(
                      spacing: GpsSpacing.xs,
                      runSpacing: GpsSpacing.xs,
                      children: [
                        if (appointment.mode != null)
                          AppointmentModeBadge(
                            mode: appointmentModeWire(appointment.mode),
                          ),
                        if (appointment.status != null)
                          AppointmentStatusPill(
                            status: appointmentStatusWire(appointment.status),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
              if (fee != null)
                Text(
                  '$fee DZD',
                  style: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

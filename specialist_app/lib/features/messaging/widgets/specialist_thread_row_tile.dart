import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../appointments/utils/appointment_display.dart';

String patientThreadDisplayLabel(AppLocalizations l10n, Thread thread) {
  final patientId = thread.patientId;
  if (patientId == null || patientId.length < 4) {
    return l10n.specialistAppointmentPatientLabel;
  }
  return l10n.specialistAppointmentPatientRef(
    patientId.substring(patientId.length - 4).toUpperCase(),
  );
}

class SpecialistThreadRowTile extends StatelessWidget {
  const SpecialistThreadRowTile({
    required this.item,
    required this.onTap,
    super.key,
  });

  final MessagingThreadItem item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final languageCode = Localizations.localeOf(context).languageCode;
    final thread = item.thread;
    final unread = thread.unreadCount ?? 0;
    final preview = messagePreviewLabel(item.lastMessagePreview, l10n);
    final timestamp = formatThreadTimestamp(thread.lastMessageAt, languageCode);
    final patientLabel = patientThreadDisplayLabel(l10n, thread);

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
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (preview.isNotEmpty) ...[
                      const SizedBox(height: GpsSpacing.xs),
                      Text(
                        preview,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: GpsSpacing.sm),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  if (timestamp.isNotEmpty)
                    Text(
                      timestamp,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  if (unread > 0) ...[
                    const SizedBox(height: GpsSpacing.xs),
                    Badge(
                      label: Text('$unread'),
                      backgroundColor: colorScheme.primary,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/messaging_repository.dart';
import '../utils/messaging_display.dart';

class ThreadRowTile extends StatelessWidget {
  const ThreadRowTile({
    required this.item,
    required this.doctor,
    required this.onTap,
    super.key,
  });

  final MessagingThreadItem item;
  final Doctor doctor;
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
              GpsDoctorPhoto(
                size: 56,
                imageUrl: doctor.photoUrl,
                shape: GpsDoctorPhotoShape.circle,
              ),
              const SizedBox(width: GpsSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctorDisplayName(doctor),
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

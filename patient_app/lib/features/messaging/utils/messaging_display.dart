import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../discovery/utils/relative_time.dart';
import '../models/thread_display_message.dart';

String doctorDisplayName(Doctor doctor) {
  final title = doctor.title?.trim();
  final name = doctor.fullName?.trim() ?? '';
  if (title != null && title.isNotEmpty) {
    return '$title $name'.trim();
  }
  return name.isEmpty ? '—' : name;
}

String formatThreadTimestamp(DateTime? timestamp, String languageCode) {
  if (timestamp == null) return '';
  return formatReviewRelativeTime(timestamp.toLocal(), languageCode);
}

String messagePreviewLabel(String? preview, AppLocalizations l10n) {
  if (preview == null || preview.isEmpty) return '';
  if (preview == 'attachment') return l10n.messagingAttachmentPreview;
  return preview;
}

String messageDeliveryLabel(
  MessageDeliveryState state,
  AppLocalizations l10n,
) {
  return switch (state) {
    MessageDeliveryState.pending => l10n.messagingMessagePending,
    MessageDeliveryState.sent => l10n.messagingMessageSent,
    MessageDeliveryState.read => l10n.messagingMessageRead,
  };
}

IconData messageDeliveryIcon(MessageDeliveryState state) {
  return switch (state) {
    MessageDeliveryState.pending => Icons.schedule,
    MessageDeliveryState.sent => Icons.check,
    MessageDeliveryState.read => Icons.done_all,
  };
}

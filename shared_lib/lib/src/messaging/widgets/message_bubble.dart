import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.message,
    required this.isMine,
    required this.currentUserId,
    super.key,
  });

  final ThreadDisplayMessage message;
  final bool isMine;
  final String currentUserId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final alignEnd = isMine ? !isRtl : isRtl;
    final bubbleColor = isMine
        ? colorScheme.primaryContainer
        : colorScheme.surfaceContainerHighest;
    final textColor = isMine
        ? colorScheme.onPrimaryContainer
        : colorScheme.onSurface;
    final delivery = message.deliveryStateForSender(currentUserId);
    final attachments = message.attachments?.toList() ?? [];

    return Align(
      alignment: alignEnd ? Alignment.centerRight : Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.sizeOf(context).width * 0.78,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: GpsSpacing.xs),
          padding: const EdgeInsets.symmetric(
            horizontal: GpsSpacing.md,
            vertical: GpsSpacing.sm,
          ),
          decoration: BoxDecoration(
            color: bubbleColor,
            borderRadius: BorderRadius.circular(GpsRadii.md),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (message.body.isNotEmpty)
                Text(
                  message.body,
                  style: theme.textTheme.bodyMedium?.copyWith(color: textColor),
                ),
              for (final attachment in attachments) ...[
                if (message.body.isNotEmpty)
                  const SizedBox(height: GpsSpacing.xs),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.attach_file,
                      size: 16,
                      color: textColor.withValues(alpha: 0.8),
                    ),
                    const SizedBox(width: GpsSpacing.xs),
                    Flexible(
                      child: Text(
                        attachment.fileName ?? l10n.messagingAttachmentPreview,
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: textColor.withValues(alpha: 0.9),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
              if (isMine) ...[
                const SizedBox(height: GpsSpacing.xs),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      message.sendFailed
                          ? Icons.error_outline
                          : messageDeliveryIcon(delivery),
                      size: 14,
                      color: message.sendFailed
                          ? colorScheme.error
                          : textColor.withValues(alpha: 0.7),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      message.sendFailed
                          ? l10n.messagingSendError
                          : messageDeliveryLabel(delivery, l10n),
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: message.sendFailed
                            ? colorScheme.error
                            : textColor.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

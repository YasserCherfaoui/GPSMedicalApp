import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class MessageComposer extends StatelessWidget {
  const MessageComposer({
    required this.controller,
    required this.selectedAttachmentIds,
    required this.onAttach,
    required this.onSend,
    required this.onRemoveAttachment,
    this.enabled = true,
    super.key,
  });

  static const maxBodyLength = 4000;

  final TextEditingController controller;
  final List<String> selectedAttachmentIds;
  final VoidCallback onAttach;
  final VoidCallback onSend;
  final ValueChanged<String> onRemoveAttachment;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Material(
      elevation: 8,
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(
            GpsSpacing.md,
            GpsSpacing.sm,
            GpsSpacing.md,
            GpsSpacing.md,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (selectedAttachmentIds.isNotEmpty)
                Wrap(
                  spacing: GpsSpacing.xs,
                  runSpacing: GpsSpacing.xs,
                  children: [
                    for (final id in selectedAttachmentIds)
                      InputChip(
                        label: Text(
                          id.length > 8 ? '${id.substring(0, 8)}…' : id,
                          style: theme.textTheme.labelSmall,
                        ),
                        onDeleted: enabled
                            ? () => onRemoveAttachment(id)
                            : null,
                      ),
                  ],
                ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: enabled ? onAttach : null,
                    icon: const Icon(Icons.attach_file_outlined),
                    tooltip: l10n.messagingAttach,
                  ),
                  Expanded(
                    child: TextField(
                      controller: controller,
                      enabled: enabled,
                      maxLength: maxBodyLength,
                      minLines: 1,
                      maxLines: 5,
                      textInputAction: TextInputAction.newline,
                      decoration: InputDecoration(
                        hintText: l10n.messagingComposerHint,
                        counterText: '',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: GpsSpacing.sm),
                  IconButton.filled(
                    onPressed: enabled ? onSend : null,
                    icon: const Icon(Icons.send),
                    tooltip: l10n.messagingSend,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

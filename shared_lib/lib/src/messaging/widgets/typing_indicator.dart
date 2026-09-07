import 'package:flutter/material.dart';

import '../../l10n/generated/app_localizations.dart';
import '../../theme/gps_spacing.dart';

/// Compact “is typing…” line above the message composer.
class TypingIndicator extends StatelessWidget {
  const TypingIndicator({
    required this.visible,
    this.label,
    super.key,
  });

  final bool visible;
  final String? label;

  @override
  Widget build(BuildContext context) {
    if (!visible) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        GpsSpacing.md,
        GpsSpacing.xs,
        GpsSpacing.md,
        GpsSpacing.xs,
      ),
      child: Text(
        label ?? l10n.messagingTyping,
        style: theme.textTheme.bodySmall?.copyWith(
          color: theme.colorScheme.onSurfaceVariant,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}

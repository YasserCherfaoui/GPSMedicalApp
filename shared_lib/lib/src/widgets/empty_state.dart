import 'package:flutter/material.dart';

import '../theme/gps_spacing.dart';
import 'primary_button.dart';

/// Placeholder when a list or screen has no data.
class EmptyState extends StatelessWidget {
  const EmptyState({
    required this.title,
    super.key,
    this.message,
    this.icon = Icons.inbox_outlined,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? message;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(GpsSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 48, color: scheme.primary),
          const SizedBox(height: GpsSpacing.md),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          if (message != null) ...[
            const SizedBox(height: GpsSpacing.sm),
            Text(
              message!,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: scheme.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
          if (actionLabel != null && onAction != null) ...[
            const SizedBox(height: GpsSpacing.lg),
            PrimaryButton(
              label: actionLabel!,
              onPressed: onAction,
              expand: false,
            ),
          ],
        ],
      ),
    );
  }
}

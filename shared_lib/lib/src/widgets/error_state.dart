import 'package:flutter/material.dart';

import '../theme/gps_spacing.dart';
import 'secondary_button.dart';

/// Error feedback with optional retry action.
class ErrorState extends StatelessWidget {
  const ErrorState({
    required this.title,
    super.key,
    this.message,
    this.retryLabel = 'Réessayer',
    this.onRetry,
  });

  final String title;
  final String? message;
  final String retryLabel;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(GpsSpacing.lg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: scheme.error),
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
          if (onRetry != null) ...[
            const SizedBox(height: GpsSpacing.lg),
            SecondaryButton(
              label: retryLabel,
              onPressed: onRetry,
              expand: false,
            ),
          ],
        ],
      ),
    );
  }
}

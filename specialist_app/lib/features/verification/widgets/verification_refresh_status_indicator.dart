import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../specialist_verification_state.dart';

class VerificationRefreshStatusIndicator extends StatelessWidget {
  const VerificationRefreshStatusIndicator({
    required this.status,
    required this.loadingLabel,
    required this.completedLabel,
    required this.failedLabel,
    super.key,
  });

  final VerificationRefreshStatus status;
  final String loadingLabel;
  final String completedLabel;
  final String failedLabel;

  @override
  Widget build(BuildContext context) {
    if (status == VerificationRefreshStatus.idle) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final (label, foreground, background, icon) = switch (status) {
      VerificationRefreshStatus.loading => (
        loadingLabel,
        colorScheme.primary,
        colorScheme.primaryContainer.withValues(alpha: 0.35),
        null,
      ),
      VerificationRefreshStatus.completed => (
        completedLabel,
        colorScheme.primary,
        colorScheme.primaryContainer.withValues(alpha: 0.35),
        Icons.check_circle_outline,
      ),
      VerificationRefreshStatus.failed => (
        failedLabel,
        colorScheme.error,
        colorScheme.errorContainer.withValues(alpha: 0.35),
        Icons.error_outline,
      ),
      VerificationRefreshStatus.idle => throw StateError('unreachable'),
    };

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GpsSpacing.md,
        vertical: GpsSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(GpsRadii.md),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (status == VerificationRefreshStatus.loading)
            SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: foreground,
              ),
            )
          else
            Icon(icon, size: 18, color: foreground),
          const SizedBox(width: GpsSpacing.sm),
          Flexible(
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: foreground,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

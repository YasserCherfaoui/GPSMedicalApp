import 'package:flutter/material.dart';

import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';

/// Specialist verification status presentation — icon, title, body, optional admin comment.
///
/// Used on the verification-pending screen and anywhere a dossier status must be
/// surfaced without navigation chrome.
class VerificationStatusBanner extends StatelessWidget {
  const VerificationStatusBanner({
    required this.title,
    required this.body,
    required this.icon,
    this.comment,
    this.isLoading = false,
    super.key,
  });

  final String title;
  final String body;
  final IconData icon;
  final String? comment;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (isLoading) const LinearProgressIndicator(minHeight: 2),
        Icon(icon, size: 72, color: theme.colorScheme.primary),
        const SizedBox(height: GpsSpacing.lg),
        Text(
          title,
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: GpsSpacing.md),
        Text(
          body,
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        if (comment != null && comment!.trim().isNotEmpty) ...[
          const SizedBox(height: GpsSpacing.lg),
          Container(
            padding: const EdgeInsets.all(GpsSpacing.md),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerLow,
              borderRadius: BorderRadius.circular(GpsRadii.md),
              border: Border.all(
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.4),
              ),
            ),
            child: Text(
              comment!,
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ],
    );
  }
}

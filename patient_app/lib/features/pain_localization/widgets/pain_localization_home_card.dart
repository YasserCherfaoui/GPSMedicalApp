import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// K-6 home-tab card. Parent shows it only when the flag is on.
class PainLocalizationHomeCard extends StatelessWidget {
  const PainLocalizationHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return GpsCard(
      onTap: () => context.push(GpsRoutes.painLocalization),
      child: Row(
        children: [
          Icon(
            Icons.accessibility_new,
            color: theme.colorScheme.primary,
            size: 32,
          ),
          const SizedBox(width: GpsSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.painLocalizationTitle,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: GpsSpacing.xs),
                Text(
                  l10n.painLocalizationCardSubtitle,
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: theme.colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }
}

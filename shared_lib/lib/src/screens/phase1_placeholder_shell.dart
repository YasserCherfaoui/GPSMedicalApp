import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/gps_spacing.dart';
import '../widgets/gps_card.dart';
import '../widgets/primary_button.dart';
import '../widgets/secondary_button.dart';

/// Dev placeholder layout with title and navigation actions.
class Phase1PlaceholderShell extends StatelessWidget {
  const Phase1PlaceholderShell({
    required this.title,
    required this.subtitle,
    super.key,
    this.primaryLabel,
    this.onPrimary,
    this.secondaryLabel,
    this.onSecondary,
    this.extra,
  });

  final String title;
  final String subtitle;
  final String? primaryLabel;
  final VoidCallback? onPrimary;
  final String? secondaryLabel;
  final VoidCallback? onSecondary;
  final Widget? extra;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: context.canPop()
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => context.pop(),
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GpsCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: GpsSpacing.sm),
                  Text(subtitle, style: Theme.of(context).textTheme.bodyMedium),
                  if (extra != null) ...[
                    const SizedBox(height: GpsSpacing.md),
                    extra!,
                  ],
                ],
              ),
            ),
            const Spacer(),
            if (primaryLabel != null && onPrimary != null)
              PrimaryButton(label: primaryLabel!, onPressed: onPrimary),
            if (secondaryLabel != null && onSecondary != null) ...[
              const SizedBox(height: GpsSpacing.sm),
              SecondaryButton(label: secondaryLabel!, onPressed: onSecondary),
            ],
          ],
        ),
      ),
    );
  }
}

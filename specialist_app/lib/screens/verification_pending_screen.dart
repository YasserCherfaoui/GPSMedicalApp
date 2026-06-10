import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class VerificationPendingScreen extends StatelessWidget {
  const VerificationPendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.specialistVerificationPendingTitle)),
      body: Padding(
        padding: const EdgeInsets.all(GpsSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Icon(
              Icons.hourglass_top_rounded,
              size: 72,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(height: GpsSpacing.lg),
            Text(
              l10n.specialistVerificationPendingTitle,
              style: theme.textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GpsSpacing.md),
            Text(
              l10n.specialistVerificationPendingBody,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

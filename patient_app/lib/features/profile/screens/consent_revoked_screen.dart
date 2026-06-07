import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class ConsentRevokedScreen extends StatelessWidget {
  const ConsentRevokedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Icon(
                Icons.gpp_maybe_outlined,
                size: 64,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: GpsSpacing.lg),
              Text(
                l10n.consentRevokedLandingTitle,
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GpsSpacing.md),
              Text(
                l10n.consentRevokedLandingMessage,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryButton(
                label: l10n.consentRevokedLandingAction,
                onPressed: () => context.go(GpsRoutes.authWelcome),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

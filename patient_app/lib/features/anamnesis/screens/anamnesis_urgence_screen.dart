import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/anamnesis_models.dart';

/// Full-screen urgence interrupt (W25) — advisor copy + emergency numbers.
class AnamnesisUrgenceScreen extends StatelessWidget {
  const AnamnesisUrgenceScreen({
    required this.redFlag,
    required this.onDismiss,
    super.key,
  });

  final AnamnesisRedFlag redFlag;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.errorContainer,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.anamnesisUrgenceTitle,
                style: theme.textTheme.headlineMedium?.copyWith(
                  color: theme.colorScheme.onErrorContainer,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GpsSpacing.sm),
              if (redFlag.severityFr.isNotEmpty)
                Text(
                  redFlag.severityFr,
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onErrorContainer,
                  ),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: GpsSpacing.lg),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    redFlag.instructionFr.isNotEmpty
                        ? redFlag.instructionFr
                        : l10n.anamnesisUrgenceFallback,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ),
              if (redFlag.emergencyNumbers.isNotEmpty) ...[
                Text(
                  l10n.anamnesisUrgenceNumbersLabel,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: theme.colorScheme.onErrorContainer,
                  ),
                ),
                const SizedBox(height: GpsSpacing.sm),
                Wrap(
                  spacing: GpsSpacing.sm,
                  runSpacing: GpsSpacing.sm,
                  children: [
                    for (final n in redFlag.emergencyNumbers)
                      FilledButton.tonal(
                        onPressed: () => _dial(n),
                        child: Text(n),
                      ),
                  ],
                ),
                const SizedBox(height: GpsSpacing.lg),
              ],
              FilledButton(
                onPressed: onDismiss,
                child: Text(l10n.anamnesisUrgenceAck),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _dial(String number) async {
    final digits = number.replaceAll(RegExp(r'[^0-9+]'), '');
    if (digits.isEmpty) return;
    final uri = Uri(scheme: 'tel', path: digits);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

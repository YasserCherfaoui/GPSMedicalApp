import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/anamnesis_models.dart';

class AnamnesisProgressBar extends StatelessWidget {
  const AnamnesisProgressBar({required this.progress, super.key});

  final AnamnesisProgress progress;

  @override
  Widget build(BuildContext context) {
    final total = progress.estimatedTotal;
    final value = total == null || total <= 0
        ? null
        : (progress.answeredCount / total).clamp(0.0, 1.0);
    final l10n = AppLocalizations.of(context)!;
    final label = total == null
        ? l10n.anamnesisProgressOpen(progress.answeredCount)
        : l10n.anamnesisProgressCount(progress.answeredCount, total);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelLarge),
        const SizedBox(height: GpsSpacing.xs),
        LinearProgressIndicator(value: value),
      ],
    );
  }
}

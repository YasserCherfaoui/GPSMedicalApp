import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/anamnesis_models.dart';

class AnamnesisScoreBanner extends StatelessWidget {
  const AnamnesisScoreBanner({
    required this.score,
    required this.scoreLabel,
    super.key,
  });

  final AnamnesisSessionScore score;
  final String scoreLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GpsCard(
      showAccentBorder: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  scoreLabel,
                  style: theme.textTheme.labelLarge,
                ),
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(end: score.finalScore),
                duration: const Duration(milliseconds: 450),
                curve: Curves.easeOutCubic,
                builder: (context, value, _) {
                  return Text(
                    '${value.round()} %',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.primary,
                    ),
                  );
                },
              ),
            ],
          ),
          if (score.rationaleFr.isNotEmpty) ...[
            const SizedBox(height: GpsSpacing.xs),
            Text(
              score.rationaleFr,
              style: theme.textTheme.bodySmall,
            ),
          ],
          const SizedBox(height: GpsSpacing.xs),
          Text(
            score.legalBannerFr,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w600,
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

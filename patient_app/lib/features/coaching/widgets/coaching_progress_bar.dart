import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class CoachingProgressBar extends StatelessWidget {
  const CoachingProgressBar({
    required this.percent,
    required this.label,
    super.key,
  });

  final int percent;
  final String label;

  @override
  Widget build(BuildContext context) {
    final clamped = percent.clamp(0, 100);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              '$clamped %',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(height: GpsSpacing.sm),
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: LinearProgressIndicator(
            value: clamped / 100,
            minHeight: 12,
            backgroundColor:
                Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
        ),
      ],
    );
  }
}

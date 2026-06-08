import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class StarRatingInput extends StatelessWidget {
  const StarRatingInput({
    required this.value,
    required this.onChanged,
    required this.label,
    super.key,
  });

  final int? value;
  final ValueChanged<int> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final selected = value ?? 0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.titleSmall),
        const SizedBox(height: GpsSpacing.sm),
        Row(
          children: List.generate(5, (index) {
            final star = index + 1;
            final filled = star <= selected;
            return IconButton(
              tooltip: l10n.reviewStarsLabel(star),
              onPressed: () => onChanged(star),
              icon: Icon(
                filled ? Icons.star_rounded : Icons.star_outline_rounded,
                color: filled
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurfaceVariant,
                size: 36,
              ),
            );
          }),
        ),
        if (selected > 0)
          Text(
            l10n.reviewStarsLabel(selected),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
      ],
    );
  }
}

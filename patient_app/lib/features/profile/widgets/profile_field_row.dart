import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class ProfileFieldRow extends StatelessWidget {
  const ProfileFieldRow({required this.label, required this.value, super.key});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final display = value.trim().isEmpty ? '—' : value;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: GpsSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.xs),
          Text(display, style: theme.textTheme.bodyLarge),
        ],
      ),
    );
  }
}

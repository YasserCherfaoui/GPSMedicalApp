import 'package:flutter/material.dart';

import '../theme/gps_spacing.dart';

/// Chip/tag for specialties or status (light blue fill, teal label).
class GpsBadge extends StatelessWidget {
  const GpsBadge({required this.label, super.key, this.icon});

  final String label;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: icon == null
          ? null
          : Icon(icon, size: 16, color: Theme.of(context).colorScheme.primary),
      label: Text(label),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.xs),
    );
  }
}

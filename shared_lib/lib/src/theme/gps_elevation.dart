import 'package:flutter/material.dart';

import 'gps_colors.dart';

/// Ambient elevation levels from `docs/DESIGN-GPS-Medical.md`.
abstract final class GpsElevation {
  static List<BoxShadow> level1({Color? tint}) => [
    BoxShadow(
      color: (tint ?? GpsColors.primaryContainer).withValues(alpha: 0.04),
      blurRadius: 30,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> level2({Color? tint}) => [
    BoxShadow(
      color: (tint ?? GpsColors.primaryContainer).withValues(alpha: 0.08),
      blurRadius: 40,
      offset: const Offset(0, 12),
    ),
  ];
}

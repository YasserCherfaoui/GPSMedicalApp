import 'package:flutter/material.dart';

import '../theme/gps_colors.dart';
import '../theme/gps_elevation.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';

/// Elevated surface with optional soft-blue top accent for medical profiles.
class GpsCard extends StatelessWidget {
  const GpsCard({
    required this.child,
    super.key,
    this.padding,
    this.showAccentBorder = false,
    this.onTap,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showAccentBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    final content = Container(
      width: double.infinity,
      padding: padding ?? const EdgeInsets.all(GpsSpacing.md),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLowest,
        borderRadius: GpsRadii.card,
        boxShadow: GpsElevation.level1(),
        border: showAccentBorder
            ? const Border(
                top: BorderSide(color: GpsColors.cardAccentBorder, width: 2),
              )
            : null,
      ),
      child: child,
    );

    if (onTap == null) {
      return content;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(onTap: onTap, borderRadius: GpsRadii.card, child: content),
    );
  }
}

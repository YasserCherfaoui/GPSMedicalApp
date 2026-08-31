import 'package:flutter/material.dart';

import '../theme/gps_brand.dart';

enum GpsLogoVariant { iconGradient, iconPrimary, wordmark }

/// Branded mark from `branding/Logo` (no network dependency).
class GpsLogo extends StatelessWidget {
  const GpsLogo({
    super.key,
    this.size = 80,
    this.variant = GpsLogoVariant.iconGradient,
    this.semanticLabel = GpsBrand.name,
  });

  final double size;
  final GpsLogoVariant variant;
  final String? semanticLabel;

  String get _assetPath => switch (variant) {
    GpsLogoVariant.iconGradient => GpsBrand.iconGradientAsset,
    GpsLogoVariant.iconPrimary => GpsBrand.iconPrimaryAsset,
    GpsLogoVariant.wordmark => GpsBrand.wordmarkGradientAsset,
  };

  @override
  Widget build(BuildContext context) {
    final width = variant == GpsLogoVariant.wordmark ? size * 2.6 : size;
    final height = size;

    return Semantics(
      label: semanticLabel,
      image: true,
      child: Image.asset(
        _assetPath,
        width: width,
        height: height,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          final colorScheme = Theme.of(context).colorScheme;
          return Icon(
            Icons.route_outlined,
            size: size,
            color: colorScheme.primary,
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'gps_colors.dart';

/// Typography from `branding/Typography` — Clash Display + Founders Grotesk.
abstract final class GpsTypography {
  static const String displayFamily = 'ClashDisplay';
  static const String bodyFamily = 'FoundersGrotesk';

  static TextTheme textTheme({required bool isDark}) {
    final onSurface = isDark ? GpsColors.darkOnSurface : GpsColors.onSurface;
    final onSurfaceVariant = isDark
        ? GpsColors.darkOnSurfaceVariant
        : GpsColors.onSurfaceVariant;

    return TextTheme(
      displayLarge: TextStyle(
        fontFamily: displayFamily,
        fontSize: 40,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.8,
        color: onSurface,
      ),
      displayMedium: TextStyle(
        fontFamily: displayFamily,
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: -0.32,
        color: onSurface,
      ),
      headlineMedium: TextStyle(
        fontFamily: displayFamily,
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: onSurface,
      ),
      titleLarge: TextStyle(
        fontFamily: displayFamily,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.35,
        color: onSurface,
      ),
      bodyLarge: TextStyle(
        fontFamily: bodyFamily,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: onSurface,
      ),
      bodyMedium: TextStyle(
        fontFamily: bodyFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: onSurface,
      ),
      labelLarge: TextStyle(
        fontFamily: bodyFamily,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.2,
        color: onSurface,
      ),
      labelSmall: TextStyle(
        fontFamily: bodyFamily,
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1,
        letterSpacing: 0.6,
        color: onSurfaceVariant,
      ),
    );
  }
}

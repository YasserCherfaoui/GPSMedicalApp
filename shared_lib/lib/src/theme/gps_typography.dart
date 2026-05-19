import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'gps_colors.dart';

/// Typography scale from `docs/DESIGN-GPS-Medical.md`.
abstract final class GpsTypography {
  static TextTheme textTheme({required bool isDark}) {
    final onSurface = isDark ? GpsColors.darkOnSurface : GpsColors.onSurface;
    final onSurfaceVariant = isDark
        ? GpsColors.darkOnSurfaceVariant
        : GpsColors.onSurfaceVariant;

    final manrope = GoogleFonts.manropeTextTheme();
    final inter = GoogleFonts.interTextTheme();

    return TextTheme(
      displayLarge: manrope.displayLarge?.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        height: 1.2,
        letterSpacing: -0.8,
        color: onSurface,
      ),
      displayMedium: manrope.displayMedium?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 1.3,
        letterSpacing: -0.32,
        color: onSurface,
      ),
      headlineMedium: manrope.headlineMedium?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.4,
        color: onSurface,
      ),
      bodyLarge: inter.bodyLarge?.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 1.6,
        color: onSurface,
      ),
      bodyMedium: inter.bodyMedium?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        color: onSurface,
      ),
      labelSmall: inter.labelSmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1,
        letterSpacing: 0.6,
        color: onSurfaceVariant,
      ),
    );
  }
}

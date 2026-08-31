import 'package:flutter/material.dart';

/// Brand colors from `branding/Color palette` (Medora 2026).
abstract final class GpsColors {
  // Primary blue palette
  static const Color blueDarkest = Color(0xFF002432);
  static const Color blueDark = Color(0xFF154C6A);
  static const Color blue = Color(0xFF327BA7);
  static const Color blueLight = Color(0xFF7BA4BD);

  // Secondary green palette
  static const Color greenDarkest = Color(0xFF0D3F42);
  static const Color greenDark = Color(0xFF368766);
  static const Color green = Color(0xFF5BB39B);
  static const Color greenLight = Color(0xFFAEDACF);

  // Semantic mappings (Material 3)
  static const Color primary = blueDark;
  static const Color primaryContainer = blue;
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onPrimaryContainer = Color(0xFFFFFFFF);

  static const Color secondary = greenDark;
  static const Color secondaryContainer = greenLight;
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color onSecondaryContainer = greenDarkest;

  static const Color tertiary = blueLight;
  static const Color tertiaryContainer = green;
  static const Color onTertiary = blueDarkest;
  static const Color onTertiaryContainer = Color(0xFFFFFFFF);

  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDim = Color(0xFFF5F8FA);
  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF5F8FA);
  static const Color surfaceContainer = Color(0xFFEBF2F6);
  static const Color onSurface = blueDarkest;
  static const Color onSurfaceVariant = Color(0xFF3E5563);
  static const Color outline = Color(0xFF6E8A9A);
  static const Color outlineVariant = Color(0xFFBDC9D3);

  static const Color inputFill = Color(0xFFF5F8FA);
  static const Color cardAccentBorder = greenLight;

  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  static const Color darkSurface = blueDarkest;
  static const Color darkSurfaceContainer = Color(0xFF0F2D3D);
  static const Color darkOnSurface = Color(0xFFEEF4F7);
  static const Color darkOnSurfaceVariant = Color(0xFFBDC9D3);
}

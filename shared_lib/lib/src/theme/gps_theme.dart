import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gps_colors.dart';
import 'gps_radii.dart';
import 'gps_spacing.dart';
import 'gps_typography.dart';

/// Centralized [ThemeData] for GPS Médical mobile apps.
abstract final class GpsTheme {
  static ThemeData light() => _buildTheme(brightness: Brightness.light);

  static ThemeData dark() => _buildTheme(brightness: Brightness.dark);

  static ThemeData _buildTheme({required Brightness brightness}) {
    final isDark = brightness == Brightness.dark;
    final colorScheme = isDark ? _darkColorScheme : _lightColorScheme;
    final textTheme = GpsTypography.textTheme(isDark: isDark);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      textTheme: textTheme,
      scaffoldBackgroundColor: colorScheme.surface,
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: colorScheme.surface.withValues(alpha: 0.8),
        foregroundColor: colorScheme.onSurface,
        systemOverlayStyle: isDark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        titleTextStyle: textTheme.headlineMedium,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surfaceContainerLowest,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(borderRadius: GpsRadii.card),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? colorScheme.surfaceContainer : GpsColors.inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: GpsSpacing.md,
          vertical: GpsSpacing.sm + 2,
        ),
        border: OutlineInputBorder(
          borderRadius: GpsRadii.input,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: GpsRadii.input,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: GpsRadii.input,
          borderSide: BorderSide(color: colorScheme.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: GpsRadii.input,
          borderSide: BorderSide(color: colorScheme.error, width: 2),
        ),
        hintStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurfaceVariant,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(GpsSpacing.minTouchTarget),
          padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.lg),
          shape: RoundedRectangleBorder(borderRadius: GpsRadii.button),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(GpsSpacing.minTouchTarget),
          padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.lg),
          shape: RoundedRectangleBorder(borderRadius: GpsRadii.button),
          side: BorderSide(color: colorScheme.outline),
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: isDark
            ? colorScheme.secondaryContainer.withValues(alpha: 0.35)
            : GpsColors.cardAccentBorder,
        labelStyle: textTheme.labelSmall?.copyWith(
          color: colorScheme.primary,
          letterSpacing: 0.4,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: GpsSpacing.sm,
          vertical: GpsSpacing.xs,
        ),
        shape: RoundedRectangleBorder(borderRadius: GpsRadii.chip),
      ),
      dividerTheme: DividerThemeData(
        color: colorScheme.outlineVariant,
        thickness: 1,
      ),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: GpsColors.primary,
    onPrimary: GpsColors.onPrimary,
    primaryContainer: GpsColors.primaryContainer,
    onPrimaryContainer: GpsColors.onPrimaryContainer,
    secondary: Color(0xFF526069),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD3E2ED),
    onSecondaryContainer: Color(0xFF56656E),
    tertiary: GpsColors.tertiary,
    onTertiary: GpsColors.onTertiary,
    tertiaryContainer: GpsColors.tertiaryContainer,
    onTertiaryContainer: GpsColors.onTertiaryContainer,
    error: GpsColors.error,
    onError: GpsColors.onError,
    errorContainer: GpsColors.errorContainer,
    onErrorContainer: GpsColors.onErrorContainer,
    surface: GpsColors.surface,
    onSurface: GpsColors.onSurface,
    onSurfaceVariant: GpsColors.onSurfaceVariant,
    outline: GpsColors.outline,
    outlineVariant: GpsColors.outlineVariant,
    surfaceContainerHighest: Color(0xFFDFE3E1),
    surfaceContainerHigh: Color(0xFFE5E9E7),
    surfaceContainer: GpsColors.surfaceContainer,
    surfaceContainerLow: Color(0xFFF0F4F2),
    surfaceContainerLowest: GpsColors.surfaceContainerLowest,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF7AD7C6),
    onPrimary: Color(0xFF00201B),
    primaryContainer: Color(0xFF005047),
    onPrimaryContainer: Color(0xFF97F3E2),
    secondary: Color(0xFFBAC9D3),
    onSecondary: Color(0xFF0F1D25),
    secondaryContainer: Color(0xFF3B4951),
    onSecondaryContainer: Color(0xFFD6E5EF),
    tertiary: Color(0xFFFFB59F),
    onTertiary: Color(0xFF3A0A00),
    tertiaryContainer: Color(0xFF75331F),
    onTertiaryContainer: Color(0xFFFFDBD1),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: GpsColors.darkSurface,
    onSurface: GpsColors.darkOnSurface,
    onSurfaceVariant: GpsColors.darkOnSurfaceVariant,
    outline: Color(0xFF889490),
    outlineVariant: Color(0xFF3E4946),
    surfaceContainerHighest: Color(0xFF2D3130),
    surfaceContainerHigh: Color(0xFF252A28),
    surfaceContainer: GpsColors.darkSurfaceContainer,
    surfaceContainerLow: Color(0xFF161B19),
    surfaceContainerLowest: Color(0xFF0A0F0D),
  );
}

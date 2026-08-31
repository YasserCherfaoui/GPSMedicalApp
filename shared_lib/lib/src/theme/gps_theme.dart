import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'gps_colors.dart';
import 'gps_radii.dart';
import 'gps_spacing.dart';
import 'gps_typography.dart';

/// Centralized [ThemeData] for Medora mobile apps.
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
        backgroundColor: colorScheme.surface.withValues(alpha: 0.92),
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
      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: colorScheme.secondaryContainer.withValues(alpha: 0.6),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return textTheme.labelSmall?.copyWith(
            color: selected ? colorScheme.primary : colorScheme.onSurfaceVariant,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
          );
        }),
      ),
    );
  }

  static const ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: GpsColors.primary,
    onPrimary: GpsColors.onPrimary,
    primaryContainer: GpsColors.primaryContainer,
    onPrimaryContainer: GpsColors.onPrimaryContainer,
    secondary: GpsColors.secondary,
    onSecondary: GpsColors.onSecondary,
    secondaryContainer: GpsColors.secondaryContainer,
    onSecondaryContainer: GpsColors.onSecondaryContainer,
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
    surfaceContainerHighest: Color(0xFFDFE8EE),
    surfaceContainerHigh: Color(0xFFE5EDF2),
    surfaceContainer: GpsColors.surfaceContainer,
    surfaceContainerLow: GpsColors.surfaceContainerLow,
    surfaceContainerLowest: GpsColors.surfaceContainerLowest,
  );

  static const ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: GpsColors.blueLight,
    onPrimary: GpsColors.blueDarkest,
    primaryContainer: GpsColors.blueDark,
    onPrimaryContainer: Color(0xFFE8F2F8),
    secondary: GpsColors.green,
    onSecondary: GpsColors.greenDarkest,
    secondaryContainer: GpsColors.greenDark,
    onSecondaryContainer: GpsColors.greenLight,
    tertiary: GpsColors.blue,
    onTertiary: Color(0xFFE8F2F8),
    tertiaryContainer: GpsColors.greenDarkest,
    onTertiaryContainer: GpsColors.greenLight,
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: GpsColors.darkSurface,
    onSurface: GpsColors.darkOnSurface,
    onSurfaceVariant: GpsColors.darkOnSurfaceVariant,
    outline: Color(0xFF8898A5),
    outlineVariant: Color(0xFF3E5563),
    surfaceContainerHighest: Color(0xFF1A3A4D),
    surfaceContainerHigh: Color(0xFF153345),
    surfaceContainer: GpsColors.darkSurfaceContainer,
    surfaceContainerLow: Color(0xFF0A1F2A),
    surfaceContainerLowest: Color(0xFF001820),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_locale.dart';
import '../l10n/auth_strings.dart';
import '../l10n/locale.provider.dart' hide AppLocale;
import '../routing/gps_routes.dart';
import '../theme/gps_brand.dart';
import '../theme/gps_spacing.dart';
import '../widgets/gps_blur_background.dart';
import '../widgets/primary_button.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key, this.settingsMode = false});

  /// When true, used from Profile: back button, scrollable list, Done pops.
  /// When false (default), first-launch flow continues to onboarding.
  final bool settingsMode;

  String _getLanguageDisplayLabel(AppLocale locale) {
    switch (locale) {
      case AppLocale.arabic:
        return 'العربية — Arabic';
      case AppLocale.french:
        return 'Français — French';
      case AppLocale.tamazight:
        return 'ⵜⴰⵎⴰⵣⵉⵖⵜ — Tamazight';
      case AppLocale.english:
        return 'English';
      case AppLocale.spanish:
        return 'Español — Spanish';
      case AppLocale.italian:
        return 'Italiano — Italian';
      case AppLocale.german:
        return 'Deutsch — German';
      case AppLocale.dutch:
        return 'Nederlands — Dutch';
      case AppLocale.russian:
        return 'Русский — Russian';
      case AppLocale.portuguese:
        return 'Português — Portuguese';
    }
  }

  Widget _getLanguageIcon(AppLocale locale, Color color) {
    switch (locale) {
      case AppLocale.arabic:
        return Text('🇩🇿', style: TextStyle(fontSize: 20, color: color));
      case AppLocale.french:
        return Text('🇫🇷', style: TextStyle(fontSize: 20, color: color));
      case AppLocale.tamazight:
        return Icon(Icons.auto_awesome, color: color, size: 24);
      case AppLocale.english:
        return Text('🇬🇧', style: TextStyle(fontSize: 20, color: color));
      case AppLocale.spanish:
        return Text('🇪🇸', style: TextStyle(fontSize: 20, color: color));
      case AppLocale.italian:
        return Text('🇮🇹', style: TextStyle(fontSize: 20, color: color));
      case AppLocale.german:
        return Text('🇩🇪', style: TextStyle(fontSize: 20, color: color));
      case AppLocale.dutch:
        return Text('🇳🇱', style: TextStyle(fontSize: 20, color: color));
      case AppLocale.russian:
        return Text('🇷🇺', style: TextStyle(fontSize: 20, color: color));
      case AppLocale.portuguese:
        return Text('🇵🇹', style: TextStyle(fontSize: 20, color: color));
    }
  }

  Future<void> _onSelect(
    BuildContext context,
    WidgetRef ref,
    AppLocale locale,
  ) async {
    await ref.read(appLocaleProvider.notifier).setLocale(locale);
    if (settingsMode && context.mounted) {
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AuthStrings.of(context);
    final selected = ref.watch(appLocaleProvider);

    return GpsBlurBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: settingsMode ? Text(strings.chooseLanguage) : null,
          automaticallyImplyLeading: settingsMode,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!settingsMode) ...[
                  Center(
                    child: Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: Theme.of(
                          context,
                        ).colorScheme.primary.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.language,
                        size: 32,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  Text(
                    'Choisissez votre langue\nاختر لغتك',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: GpsSpacing.xs),
                  Text(
                    GpsBrand.nameWithCountry,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: GpsSpacing.xxl),
                ],
                Expanded(
                  child: ListView(
                    children: [
                      for (final locale in AppLocale.values)
                        Padding(
                          padding: const EdgeInsets.only(bottom: GpsSpacing.md),
                          child: _LanguageCard(
                            label: _getLanguageDisplayLabel(locale),
                            leading: _getLanguageIcon(
                              locale,
                              Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                            selected: selected == locale,
                            onTap: () => _onSelect(context, ref, locale),
                          ),
                        ),
                    ],
                  ),
                ),
                if (!settingsMode)
                  Padding(
                    padding: const EdgeInsets.only(bottom: GpsSpacing.md),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        PrimaryButton(
                          label: strings.continueLabel,
                          onPressed: () =>
                              context.go(GpsRoutes.onboardingStep(1)),
                        ),
                        const SizedBox(height: GpsSpacing.lg),
                        Text(
                          'SanteDZ • Medora',
                          style: Theme.of(context).textTheme.labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.outline,
                                letterSpacing: 1.5,
                              ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  const _LanguageCard({
    required this.label,
    required this.leading,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final Widget leading;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: selected ? colorScheme.primary : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: selected
                ? colorScheme.primary.withOpacity(0.08)
                : Colors.black.withOpacity(0.02),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(GpsSpacing.md + 4),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(child: leading),
                ),
                const SizedBox(width: GpsSpacing.md),
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: selected
                      ? colorScheme.primary
                      : colorScheme.outlineVariant,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

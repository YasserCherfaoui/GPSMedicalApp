import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../l10n/app_locale.dart';
import '../l10n/auth_strings.dart';
import '../l10n/locale.provider.dart' hide AppLocale;
import '../routing/gps_routes.dart';
import '../theme/gps_spacing.dart';
import '../widgets/gps_blur_background.dart';
import '../widgets/gps_cached_network_image.dart';
import '../widgets/primary_button.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  String _getLanguageDisplayLabel(AppLocale locale) {
    switch (locale) {
      case AppLocale.arabic:
        return 'العربية — Arabe';
      case AppLocale.french:
        return 'Français';
      case AppLocale.tamazight:
        return 'ⵜⴰⵎⴰⵣⵉⵖⵜ — Tamazight';
    }
  }

  Widget _getLanguageIcon(AppLocale locale, Color color) {
    switch (locale) {
      case AppLocale.arabic:
        return ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: GpsCachedNetworkImage(
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuAGsLuKS4Wny8uKdaDarc_tPrzoJcMzwaiUKqvuBGR40wtvUkm7EQvN8-tH3ZUEUQO06CHtcrewlzMzoP4HSeP4UlwlzSTGR-ZQc32SbEVksRKCSDUJy-ORoEDmMB6qC_1MN2OPypFTPdRiot_AUPmFl3I9muVuc2ztaNkXMsn8ay8rWQZeXYRCGXpSwkHEMJ_wEAWGl-YPWXwQSMZG3sIJ2SHfMnCJyPTn2OE6rTR8Kl00aiY6priEfTTZJS07RXVUSoe9zKeJ1z8',
            width: 32,
            height: 22,
            fit: BoxFit.cover,
            memCacheWidth: 64,
            memCacheHeight: 44,
            error: const Text('🇩🇿', style: TextStyle(fontSize: 20)),
          ),
        );
      case AppLocale.french:
        return Icon(Icons.translate, color: color, size: 24);
      case AppLocale.tamazight:
        return Icon(Icons.auto_awesome, color: color, size: 24);
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
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Globe Header Icon
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
                // Multilingual Title
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
                  'GPS Médical Algérie',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: GpsSpacing.xxl),
                // Language List
                Expanded(
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
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
                            onTap: () => ref
                                .read(appLocaleProvider.notifier)
                                .setLocale(locale),
                          ),
                        ),
                    ],
                  ),
                ),
                // Bottom Button and Footer text
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
                        'SanteDZ • GPS Médical',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
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
                // Leading Icon Container
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
                // Text Label
                Expanded(
                  child: Text(
                    label,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
                // Trailing Chevron
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

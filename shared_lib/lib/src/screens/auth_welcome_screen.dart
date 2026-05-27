import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../l10n/auth_strings.dart';
import '../routing/gps_routes.dart';
import '../theme/gps_spacing.dart';
import '../widgets/gps_blur_background.dart';
import '../widgets/primary_button.dart';

class AuthWelcomeScreen extends StatelessWidget {
  const AuthWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return GpsBlurBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: GpsSpacing.xl),
                // Brand Logo Header
                Center(
                  child: Image.network(
                    'https://lh3.googleusercontent.com/aida/ADBb0ujRFC5v-qRH6PU68IC_R7TjFH-yZO98-Z1UrfHZBiKplICw0me1ADujiZMpkSMQsmZhDzV_PzNS95xADxelwgVy334vTBOxXVKfKdOIv8dwqPf3IMZxr2ueX_sAtM3k28hb7K-MilIDqZFA44ve3eBWbnKzWK-axvcx6oDeV5eD5msc_Ho2FDOPNiTsYrPkNMM_GEE-d_R02K6tCOzWpTa1Z50VLwXV_ERlKJu77-52cNWZTDqkrriftpc',
                    width: 80,
                    height: 80,
                    fit: BoxFit.contain,
                    errorBuilder: (_, __, ___) => Icon(
                      Icons.health_and_safety_outlined,
                      size: 80,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: GpsSpacing.md),
                // Headline & Subtitle
                Text(
                  strings.welcomeTitle,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: GpsSpacing.xs),
                Text(
                  'Votre parcours santé commence ici',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                // Center Floating Composition Space
                const Expanded(child: _HeroComposition()),
                // Actions & stacked buttons
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    PrimaryButton(
                      label: strings.createAccount,
                      onPressed: () => context.push(GpsRoutes.registerNin),
                    ),
                    const SizedBox(height: GpsSpacing.sm),
                    OutlinedButton(
                      onPressed: () => context.push(GpsRoutes.login),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        side: BorderSide(color: colorScheme.primary),
                      ),
                      child: Text(
                        "J'ai déjà un compte",
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const SizedBox(height: GpsSpacing.lg),
                    // Footer Link Help
                    Center(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.help_outline, size: 16),
                        label: Text(
                          "Besoin d'aide ?",
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: colorScheme.outline),
                        ),
                      ),
                    ),
                    const SizedBox(height: GpsSpacing.md),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _HeroComposition extends StatelessWidget {
  const _HeroComposition();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: SizedBox(
        height: 300,
        width: 320,
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            // Floating Decorative Icons backdrops
            Positioned(
              top: 30,
              right: 10,
              child: Icon(
                Icons.health_and_safety_outlined,
                size: 40,
                color: colorScheme.primary.withOpacity(0.08),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 10,
              child: Icon(
                Icons.favorite_outline,
                size: 32,
                color: colorScheme.tertiary.withOpacity(0.08),
              ),
            ),

            // Widget 1: Medical GPS Widget
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                width: 130,
                padding: const EdgeInsets.all(GpsSpacing.sm),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLowest.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: colorScheme.outlineVariant.withOpacity(0.4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: colorScheme.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            'MEDICAL GPS',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: colorScheme.outline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: GpsSpacing.xs),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: 0.66,
                        minHeight: 4,
                        backgroundColor: colorScheme.surfaceContainerHighest,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.primary,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Proximité optimisée',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Widget 2: Health Records Widget
            Positioned(
              bottom: 10,
              right: 0,
              child: Container(
                width: 150,
                padding: const EdgeInsets.all(GpsSpacing.sm),
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLowest.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: colorScheme.outlineVariant.withOpacity(0.4),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.06),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: colorScheme.primaryContainer.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.folder_shared,
                        color: colorScheme.primary,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: GpsSpacing.sm),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'DOSSIERS',
                            style: Theme.of(context).textTheme.labelSmall
                                ?.copyWith(
                                  color: colorScheme.outline,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                ),
                          ),
                          Text(
                            'Santé Numérique',
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: colorScheme.onSurface,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Widget 3: Smart Analysis Widget (Center, scale 1.1)
            Positioned(
              child: Transform.scale(
                scale: 1.1,
                child: Container(
                  width: 160,
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerLowest.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: colorScheme.outlineVariant.withOpacity(0.5),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.08),
                        blurRadius: 25,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.show_chart,
                          color: colorScheme.onPrimary,
                          size: 24,
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      Text(
                        'Analyse Smart',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      Text(
                        'Diagnostics en temps réel',
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

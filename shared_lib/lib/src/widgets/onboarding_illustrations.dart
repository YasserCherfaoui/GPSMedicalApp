import 'package:flutter/material.dart';

import '../l10n/auth_strings.dart';
import '../theme/gps_colors.dart';
import '../theme/gps_elevation.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';
import 'gps_logo.dart';

/// Branded hero for onboarding step 1 — no external imagery.
class OnboardingSmartGuideIllustration extends StatelessWidget {
  const OnboardingSmartGuideIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(GpsRadii.xxl),
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                GpsColors.blue,
                GpsColors.blueDark,
                GpsColors.blueDarkest,
              ],
            ),
            boxShadow: GpsElevation.level1(tint: GpsColors.blue),
          ),
          child: Stack(
            children: [
              Positioned(
                top: -30,
                right: -20,
                child: Icon(
                  Icons.route_outlined,
                  size: 140,
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(GpsSpacing.lg),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const GpsLogo(size: 52),
                          const SizedBox(height: GpsSpacing.md),
                          Text(
                            strings.onboardingHeroGuidanceTitle,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: GpsSpacing.xs),
                          Text(
                            strings.onboardingHeroGuidanceSubtitle,
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(
                                  color: Colors.white.withValues(alpha: 0.85),
                                ),
                          ),
                        ],
                      ),
                    ),
                    _MiniDoctorCard(colorScheme: colorScheme),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -16,
          right: 16,
          child: _StatusBadge(colorScheme: colorScheme),
        ),
      ],
    );
  }
}

class _MiniDoctorCard extends StatelessWidget {
  const _MiniDoctorCard({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return Container(
      width: 118,
      padding: const EdgeInsets.all(GpsSpacing.sm),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(GpsRadii.lg),
        boxShadow: GpsElevation.level2(tint: GpsColors.blueDarkest),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: GpsColors.greenLight.withValues(alpha: 0.55),
              borderRadius: BorderRadius.circular(GpsRadii.md),
            ),
            child: Icon(Icons.person, color: colorScheme.primary, size: 24),
          ),
          const SizedBox(height: GpsSpacing.sm),
          Text(
            strings.onboardingHeroSampleDoctorName,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme.onSurface,
            ),
          ),
          Text(
            strings.onboardingHeroSampleDoctorSpecialty,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.xs),
          Row(
            children: [
              const Icon(Icons.star_rounded, size: 14, color: GpsColors.green),
              const SizedBox(width: 2),
              Text(
                strings.onboardingHeroSampleDoctorRating,
                style: Theme.of(
                  context,
                ).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GpsSpacing.md,
        vertical: GpsSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(GpsRadii.lg),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.5),
        ),
        boxShadow: GpsElevation.level1(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: GpsColors.greenLight.withValues(alpha: 0.65),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.psychology, size: 16, color: colorScheme.primary),
          ),
          const SizedBox(width: GpsSpacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                strings.onboardingHeroAiStatusLabel,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              Text(
                strings.onboardingHeroAiStatusValue,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Branded care-path visual for onboarding step 2.
class OnboardingCarePathIllustration extends StatelessWidget {
  const OnboardingCarePathIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AuthStrings.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(GpsRadii.xl),
        border: Border.all(
          color: colorScheme.outlineVariant.withValues(alpha: 0.35),
        ),
        boxShadow: GpsElevation.level1(tint: GpsColors.blue),
      ),
      child: Padding(
        padding: const EdgeInsets.all(GpsSpacing.md),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    strings.onboardingHeroPathTitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: GpsSpacing.xs),
                  Text(
                    strings.onboardingHeroPathSteps,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            ),
            _PathSteps(colorScheme: colorScheme),
          ],
        ),
      ),
    );
  }
}

class _PathSteps extends StatelessWidget {
  const _PathSteps({required this.colorScheme});

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final steps = [
      Icons.touch_app_outlined,
      Icons.psychology_outlined,
      Icons.medical_services_outlined,
    ];

    return Row(
      children: [
        for (var i = 0; i < steps.length; i++) ...[
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: i == 1
                  ? GpsColors.greenLight.withValues(alpha: 0.65)
                  : colorScheme.primaryContainer.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(GpsRadii.md),
            ),
            child: Icon(
              steps[i],
              size: 18,
              color: i == 1 ? GpsColors.greenDark : colorScheme.primary,
            ),
          ),
          if (i < steps.length - 1)
            Container(
              width: 18,
              height: 2,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              color: colorScheme.primary.withValues(alpha: 0.25),
            ),
        ],
      ],
    );
  }
}

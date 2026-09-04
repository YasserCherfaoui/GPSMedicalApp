import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../bootstrap/app_launch_preferences.provider.dart';
import '../l10n/auth_strings.dart';
import '../routing/gps_routes.dart';
import '../theme/gps_brand.dart';
import '../theme/gps_spacing.dart';
import '../widgets/gps_blur_background.dart';
import '../widgets/onboarding_illustrations.dart';
import '../widgets/primary_button.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({required this.step, super.key});

  final int step;

  Future<void> _completeOnboarding(WidgetRef ref) {
    return ref.read(appLaunchPreferencesProvider).setOnboardingCompleted(true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final strings = AuthStrings.of(context);
    final clamped = step.clamp(1, 3);
    final colorScheme = Theme.of(context).colorScheme;

    return GpsBlurBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          title: Text(
            GpsBrand.name,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            if (clamped < 3)
              TextButton(
                onPressed: () async {
                  await _completeOnboarding(ref);
                  if (context.mounted) {
                    context.go(GpsRoutes.authWelcome);
                  }
                },
                child: Text(strings.skip),
              ),
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top progress indicator indicator dots
              Padding(
                padding: const EdgeInsets.symmetric(vertical: GpsSpacing.md),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(3, (index) {
                    final active = (index + 1) == clamped;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 8,
                      width: active ? 24 : 8,
                      decoration: BoxDecoration(
                        color: active
                            ? colorScheme.primary
                            : colorScheme.outlineVariant,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: GpsSpacing.md,
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: GpsSpacing.md),
                      if (clamped == 1)
                        _buildStep1(context, strings)
                      else if (clamped == 2)
                        _buildStep2(context, strings)
                      else
                        _buildStep3(context, strings),
                      const SizedBox(height: GpsSpacing.xl),
                    ],
                  ),
                ),
              ),
              // Bottom action buttons bar
              Padding(
                padding: const EdgeInsets.all(GpsSpacing.md),
                child: Row(
                  children: [
                    if (clamped > 1)
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () =>
                              context.go(GpsRoutes.onboardingStep(clamped - 1)),
                          child: Text(strings.back),
                        ),
                      )
                    else
                      const Spacer(),
                    const SizedBox(width: GpsSpacing.md),
                    Expanded(
                      flex: 2,
                      child: PrimaryButton(
                        label: clamped < 3 ? strings.next : strings.start,
                        onPressed: () async {
                          if (clamped < 3) {
                            context.go(GpsRoutes.onboardingStep(clamped + 1));
                          } else {
                            await _completeOnboarding(ref);
                            if (context.mounted) {
                              context.go(GpsRoutes.authWelcome);
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // STEP 1: Welcome & Bento Intro
  Widget _buildStep1(BuildContext context, AuthStrings strings) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Illustration card with doctor & floating Status IA badge
        const OnboardingSmartGuideIllustration(),
        const SizedBox(height: GpsSpacing.xl),
        // Title & Description
        Text(
          strings.onboardingSmartTitle(GpsBrand.name),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: GpsSpacing.sm),
        Text(
          strings.onboardingSmartBody(GpsBrand.name),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: GpsSpacing.xl),
        // Bento compact feature grids
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildBentoCard(
                context,
                icon: Icons.explore_outlined,
                title: strings.onboardingFeatureGuidanceTitle,
                desc: strings.onboardingFeatureGuidanceBody,
                iconColor: colorScheme.primary,
                bgColor: colorScheme.primaryContainer.withOpacity(0.1),
              ),
            ),
            const SizedBox(width: GpsSpacing.md),
            Expanded(
              child: _buildBentoCard(
                context,
                icon: Icons.show_chart,
                title: strings.onboardingFeatureMonitoringTitle,
                desc: strings.onboardingFeatureMonitoringBody,
                iconColor: colorScheme.tertiary,
                bgColor: colorScheme.tertiaryContainer.withOpacity(0.1),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBentoCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String desc,
    required Color iconColor,
    required Color bgColor,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(GpsSpacing.md),
      height: 150,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.015),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(height: GpsSpacing.sm),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: GpsSpacing.xs),
          Expanded(
            child: Text(
              desc,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.3,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // STEP 2: How it works & Timeline
  Widget _buildStep2(BuildContext context, AuthStrings strings) {
    final colorScheme = Theme.of(context).colorScheme;

    final steps = [
      _TimelineItem(
        icon: Icons.accessibility_new,
        title: strings.onboardingStepPainTitle,
        desc: strings.onboardingStepPainBody,
      ),
      _TimelineItem(
        icon: Icons.assignment_outlined,
        title: strings.onboardingStepScreeningTitle,
        desc: strings.onboardingStepScreeningBody,
      ),
      _TimelineItem(
        icon: Icons.health_and_safety_outlined,
        title: strings.onboardingStepPrepareTitle,
        desc: strings.onboardingStepPrepareBody,
      ),
      _TimelineItem(
        icon: Icons.medical_services_outlined,
        title: strings.onboardingStepExpertTitle,
        desc: strings.onboardingStepExpertBody,
      ),
    ];

    return Column(
      children: [
        Text(
          strings.onboardingTitle(2),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: GpsSpacing.xl),
        // Custom vertical timeline
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: steps.length,
          itemBuilder: (context, index) {
            final isLast = index == steps.length - 1;
            final item = steps[index];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerLowest,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: colorScheme.primary.withOpacity(0.15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        item.icon,
                        color: colorScheme.primary,
                        size: 24,
                      ),
                    ),
                    if (!isLast)
                      Container(
                        width: 2,
                        height: 48,
                        color: colorScheme.primary.withOpacity(0.2),
                      ),
                  ],
                ),
                const SizedBox(width: GpsSpacing.md),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                        ),
                        const SizedBox(height: GpsSpacing.xs),
                        Text(
                          item.desc,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                        const SizedBox(height: GpsSpacing.lg),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
        const SizedBox(height: GpsSpacing.md),
        // Mini visual context image
        const OnboardingCarePathIllustration(),
      ],
    );
  }

  // STEP 3: Security & Trust
  Widget _buildStep3(BuildContext context, AuthStrings strings) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        // Concentric dashed circles illustration with floating badges
        SizedBox(
          height: 280,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Concentric dashed lines
              Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.outlineVariant.withOpacity(0.2),
                    style: BorderStyle
                        .solid, // Note: Flutter doesn't natively draw dashed borders directly via Border.all easily, solid with low opacity looks great and clean.
                  ),
                ),
              ),
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.outlineVariant.withOpacity(0.3),
                  ),
                ),
              ),
              // Central Shield Icon Card
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(
                    color: colorScheme.outlineVariant.withOpacity(0.5),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.shield, size: 56, color: colorScheme.primary),
                      Positioned(
                        right: 14,
                        bottom: 14,
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: colorScheme.surfaceContainerLowest,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Floating Badge 1: Local Hosting Algeria
              Positioned(
                top: 10,
                left: 10,
                child: _buildFloatingBadge(
                  context,
                  icon: Icons.public,
                  title: strings.onboardingBadgeHosting,
                  subtitle: strings.countryAlgeria,
                ),
              ),
              // Floating Badge 2: Encryption
              Positioned(
                top: 40,
                right: 0,
                child: _buildFloatingBadge(
                  context,
                  icon: Icons.lock_outline,
                  title: strings.onboardingBadgeEncryption,
                  subtitle: strings.securedLabel,
                ),
              ),
              // Floating Badge 3: Doctors Verified
              Positioned(
                bottom: 20,
                right: 20,
                child: _buildFloatingBadge(
                  context,
                  icon: Icons.verified_user,
                  title: strings.onboardingBadgeDoctors,
                  subtitle: strings.onboardingBadgeDoctorsSubtitle,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: GpsSpacing.xl),
        // Title
        Text(
          strings.onboardingTitle(3),
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: GpsSpacing.xl),
        // Checkmarks list
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
          child: Column(
            children: [
              _buildCheckRow(context, strings.onboardingTrustHosting),
              const SizedBox(height: GpsSpacing.md),
              _buildCheckRow(context, strings.onboardingTrustEncryption),
              const SizedBox(height: GpsSpacing.md),
              _buildCheckRow(context, strings.onboardingTrustDoctors),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFloatingBadge(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: GpsSpacing.md,
        vertical: GpsSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerLowest.withOpacity(0.95),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: colorScheme.outlineVariant.withOpacity(0.4)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: colorScheme.primary),
          ),
          const SizedBox(width: GpsSpacing.sm),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCheckRow(BuildContext context, String text) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, size: 14, color: colorScheme.primary),
        ),
        const SizedBox(width: GpsSpacing.md),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      ],
    );
  }
}

class _TimelineItem {
  _TimelineItem({required this.icon, required this.title, required this.desc});

  final IconData icon;
  final String title;
  final String desc;
}

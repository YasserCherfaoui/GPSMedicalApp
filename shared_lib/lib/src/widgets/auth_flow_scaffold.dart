import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../theme/gps_spacing.dart';
import 'gps_blur_background.dart';

/// Shared layout for registration and auth steps.
class AuthFlowScaffold extends StatelessWidget {
  const AuthFlowScaffold({
    required this.title,
    required this.body,
    super.key,
    this.step,
    this.totalSteps = 5,
    this.subtitle,
    this.bottom,
    this.showBack = true,
    this.floatingActionButton,
  });

  final String title;
  final String? subtitle;
  final Widget body;
  final Widget? bottom;
  final int? step;
  final int totalSteps;
  final bool showBack;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    return GpsBlurBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          leading: showBack && Navigator.canPop(context)
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.maybePop(context),
                )
              : null,
          title: Text(title),
          actions: [
            if (step != null)
              Padding(
                padding: const EdgeInsets.only(right: GpsSpacing.md),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GpsSpacing.sm,
                      vertical: GpsSpacing.xs,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryContainer,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '$step/$totalSteps',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                ),
              ),
          ],
          bottom: step != null
              ? PreferredSize(
                  preferredSize: const Size.fromHeight(4),
                  child: LinearProgressIndicator(
                    value: step! / totalSteps,
                    minHeight: 4,
                    backgroundColor: Theme.of(context)
                        .colorScheme
                        .surfaceContainerHighest,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              : null,
        ),
        body: SafeArea(
          child: Center(
            child: MaxWidthBox(
              maxWidth: 560,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (subtitle != null) ...[
                      const SizedBox(height: GpsSpacing.md),
                      Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                      ),
                      const SizedBox(height: GpsSpacing.lg),
                    ],
                    Expanded(child: SingleChildScrollView(child: body)),
                    if (bottom != null) ...[
                      const SizedBox(height: GpsSpacing.md),
                      bottom!,
                    ],
                    SizedBox(height: MediaQuery.paddingOf(context).bottom),
                  ],
                ),
              ),
            ),
          ),
        ),
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}

/// Page indicator dots for onboarding.
class OnboardingDots extends StatelessWidget {
  const OnboardingDots({required this.current, required this.total, super.key});

  final int current;
  final int total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(total, (index) {
        final active = index + 1 == current;
        return Container(
          width: active ? 24 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: active
                ? Theme.of(context).colorScheme.tertiary
                : Theme.of(context).colorScheme.outlineVariant,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}

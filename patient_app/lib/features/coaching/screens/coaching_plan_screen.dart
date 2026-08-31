import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../payments/repositories/freemium_payments_repository.dart';
import '../../payments/widgets/freemium_upgrade_sheet.dart';
import '../providers/coaching_providers.dart';
import '../repositories/coaching_repository.dart';
import '../widgets/coaching_progress_bar.dart';
import '../widgets/hydration_tracker.dart';
import '../widgets/sleep_log_widget.dart';

class CoachingPlansScreen extends ConsumerWidget {
  const CoachingPlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final plansAsync = ref.watch(coachingPlanListProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.coachingListTitle)),
      body: plansAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.coachingLoadError)),
        data: (plans) {
          if (plans.isEmpty) {
            return Center(child: Text(l10n.coachingListEmpty));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(GpsSpacing.lg),
            itemCount: plans.length,
            separatorBuilder: (_, __) => const SizedBox(height: GpsSpacing.sm),
            itemBuilder: (context, index) {
              final plan = plans[index];
              return ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.outlineVariant,
                  ),
                ),
                title: Text(l10n.coachingListItemTitle(plan.sessionId)),
                subtitle: Text(
                  l10n.coachingListItemSubtitle(
                    plan.hydrationGoalMl,
                    plan.createdAt,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(GpsRoutes.coachingPlanDetail(plan.id)),
              );
            },
          );
        },
      ),
    );
  }
}

class CoachingPlanScreen extends ConsumerWidget {
  const CoachingPlanScreen({required this.planId, super.key});

  final String planId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final planAsync = ref.watch(coachingPlanProvider(planId));
    final progressAsync = ref.watch(coachingProgressProvider(planId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.coachingPlanTitle)),
      body: planAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(child: Text(l10n.coachingLoadError)),
        data: (plan) {
          return ListView(
            padding: const EdgeInsets.all(GpsSpacing.lg),
            children: [
              progressAsync.when(
                loading: () => const LinearProgressIndicator(),
                error: (_, __) => Text(l10n.coachingProgressError),
                data: (progress) => CoachingProgressBar(
                  percent: progress.percent,
                  label: l10n.coachingProgressLabel,
                ),
              ),
              const SizedBox(height: GpsSpacing.xl),
              HydrationTracker(
                planId: planId,
                goalMl: plan.hydrationGoalMl,
              ),
              const SizedBox(height: GpsSpacing.xl),
              SleepLogWidget(planId: planId),
              const SizedBox(height: GpsSpacing.xl),
              for (final section in plan.sections) ...[
                Text(
                  _sectionTitle(l10n, section.type, section.titleFr),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: GpsSpacing.sm),
                Text(section.bodyFr),
                if (section.exercises.isNotEmpty) ...[
                  const SizedBox(height: GpsSpacing.md),
                  for (final exercise in section.exercises) ...[
                    Text(
                      exercise.nameFr,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: GpsSpacing.xs),
                    for (var i = 0; i < exercise.stepsFr.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: GpsSpacing.xs),
                        child: Text('${i + 1}. ${exercise.stepsFr[i]}'),
                      ),
                    const SizedBox(height: GpsSpacing.md),
                  ],
                ],
                const SizedBox(height: GpsSpacing.lg),
              ],
              Text(
                plan.disclaimerFr,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
            ],
          );
        },
      ),
    );
  }

  String _sectionTitle(AppLocalizations l10n, String type, String fallback) {
    return switch (type) {
      'nutrition' => l10n.coachingSectionNutrition,
      'mobility' => l10n.coachingSectionMobility,
      'posture' => l10n.coachingSectionPosture,
      _ => fallback,
    };
  }
}

class CoachingSessionLoaderScreen extends ConsumerStatefulWidget {
  const CoachingSessionLoaderScreen({required this.sessionId, super.key});

  final String sessionId;

  @override
  ConsumerState<CoachingSessionLoaderScreen> createState() =>
      _CoachingSessionLoaderScreenState();
}

class _CoachingSessionLoaderScreenState
    extends ConsumerState<CoachingSessionLoaderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadPlan());
  }

  Future<void> _loadPlan() async {
    final l10n = AppLocalizations.of(context)!;
    final repo = ref.read(coachingRepositoryProvider);
    try {
      final existing = await repo.listPlans(sessionId: widget.sessionId);
      if (!mounted) return;
      if (existing.isNotEmpty) {
        context.go(GpsRoutes.coachingPlanDetail(existing.first.id));
        return;
      }
      final plan = await repo.generatePlan(widget.sessionId);
      if (!mounted) return;
      context.go(GpsRoutes.coachingPlanDetail(plan.id));
    } on CoachingApiException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 403) {
        final l10n = AppLocalizations.of(context)!;
        final ok = await showFreemiumUpgradeSheet(
          context: context,
          ref: ref,
          sessionId: widget.sessionId,
          purpose: 'coaching_premium',
          amountDzd: FreemiumPaymentsRepository.coachingPremiumAmountDzd,
          title: l10n.freemiumCoachingTitle,
          body: l10n.freemiumCoachingBody,
        );
        if (ok && mounted) {
          await _loadPlan();
        } else if (mounted) {
          context.pop();
        }
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
      context.pop();
    } catch (_) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.coachingLoadError)),
        );
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.coachingPlanTitle)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: GpsSpacing.md),
            Text(l10n.coachingGenerating),
          ],
        ),
      ),
    );
  }
}

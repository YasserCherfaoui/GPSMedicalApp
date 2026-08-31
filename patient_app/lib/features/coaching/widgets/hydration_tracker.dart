import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/coaching_models.dart';
import '../providers/coaching_providers.dart';
import '../repositories/coaching_repository.dart';

class HydrationTracker extends ConsumerStatefulWidget {
  const HydrationTracker({
    required this.planId,
    required this.goalMl,
    super.key,
  });

  final String planId;
  final int goalMl;

  @override
  ConsumerState<HydrationTracker> createState() => _HydrationTrackerState();
}

class _HydrationTrackerState extends ConsumerState<HydrationTracker> {
  bool _logging = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final hydrationAsync = ref.watch(coachingHydrationDayProvider(widget.planId));

    return hydrationAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => Text(l10n.coachingHydrationError),
      data: (day) => _buildContent(context, day),
    );
  }

  Widget _buildContent(BuildContext context, CoachingHydrationDay day) {
    final l10n = AppLocalizations.of(context)!;
    final progress = day.goalMl > 0 ? day.totalMl / day.goalMl : 0.0;
    final clamped = progress.clamp(0.0, 1.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.coachingHydrationTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: GpsSpacing.md),
        Center(
          child: SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircularProgressIndicator(
                  value: clamped,
                  strokeWidth: 10,
                  backgroundColor:
                      Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${day.totalMl}',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      l10n.coachingHydrationMlGoal(day.goalMl),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: GpsSpacing.md),
        Wrap(
          spacing: GpsSpacing.sm,
          runSpacing: GpsSpacing.sm,
          children: [
            for (final amount in [250, 500, 750])
              OutlinedButton(
                onPressed: _logging ? null : () => _log(amount),
                child: Text(l10n.coachingHydrationAdd(amount)),
              ),
          ],
        ),
      ],
    );
  }

  Future<void> _log(int amountMl) async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _logging = true);
    try {
      final repo = ref.read(coachingRepositoryProvider);
      await repo.logHydration(widget.planId, amountMl: amountMl);
      ref.invalidate(coachingHydrationDayProvider(widget.planId));
      ref.invalidate(coachingProgressProvider(widget.planId));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.coachingHydrationLogged)),
        );
      }
    } on CoachingApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } finally {
      if (mounted) setState(() => _logging = false);
    }
  }
}

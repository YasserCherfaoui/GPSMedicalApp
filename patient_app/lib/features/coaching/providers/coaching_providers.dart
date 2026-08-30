import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/coaching_models.dart';
import '../repositories/coaching_repository.dart';

final coachingRepositoryProvider = Provider<CoachingRepository>((ref) {
  final client = ref.watch(gpsMedicalClientProvider);
  return CoachingRepository(client.v1.dio);
});

final coachingPlanListProvider =
    AsyncNotifierProvider<CoachingPlanListNotifier, List<CoachingPlanSummary>>(
  CoachingPlanListNotifier.new,
);

class CoachingPlanListNotifier
    extends AsyncNotifier<List<CoachingPlanSummary>> {
  @override
  Future<List<CoachingPlanSummary>> build() async {
    final repo = ref.read(coachingRepositoryProvider);
    return repo.listPlans();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(coachingRepositoryProvider);
      return repo.listPlans();
    });
  }
}

final coachingPlanProvider =
    FutureProvider.family<CoachingPlan, String>((ref, planId) async {
  final repo = ref.read(coachingRepositoryProvider);
  return repo.getPlan(planId);
});

final coachingProgressProvider =
    FutureProvider.family<CoachingProgress, String>((ref, planId) async {
  final repo = ref.read(coachingRepositoryProvider);
  return repo.getProgress(planId);
});

final coachingHydrationDayProvider =
    FutureProvider.family<CoachingHydrationDay, String>((ref, planId) async {
  final repo = ref.read(coachingRepositoryProvider);
  return repo.getHydrationDay(planId);
});

final coachingSleepListProvider =
    FutureProvider.family<List<CoachingSleepEntry>, String>((ref, planId) async {
  final repo = ref.read(coachingRepositoryProvider);
  return repo.listSleep(planId);
});

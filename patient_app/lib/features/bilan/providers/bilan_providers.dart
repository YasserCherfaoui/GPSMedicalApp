import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/bilan_models.dart';
import '../repositories/bilan_repository.dart';

final bilanRepositoryProvider = Provider<BilanRepository>((ref) {
  final client = ref.watch(gpsMedicalClientProvider);
  return BilanRepository(client.v1.dio);
});

final bilanListProvider =
    AsyncNotifierProvider<BilanListNotifier, List<BilanSummary>>(
  BilanListNotifier.new,
);

class BilanListNotifier extends AsyncNotifier<List<BilanSummary>> {
  @override
  Future<List<BilanSummary>> build() async {
    final repo = ref.read(bilanRepositoryProvider);
    return repo.listBilans();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(bilanRepositoryProvider);
      return repo.listBilans();
    });
  }
}

final bilanDetailProvider =
    FutureProvider.family<BilanDetail, String>((ref, bilanId) async {
  final repo = ref.read(bilanRepositoryProvider);
  return repo.getBilan(bilanId);
});

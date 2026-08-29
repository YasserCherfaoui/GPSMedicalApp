import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/incoming_bilan_models.dart';
import '../repositories/incoming_bilan_repository.dart';

final incomingBilanRepositoryProvider = Provider<IncomingBilanRepository>((
  ref,
) {
  final client = ref.watch(gpsMedicalClientProvider);
  return IncomingBilanRepository(client.v1.dio);
});

final incomingBilansProvider =
    AsyncNotifierProvider<IncomingBilansNotifier, List<IncomingBilanTransmission>>(
  IncomingBilansNotifier.new,
);

class IncomingBilansNotifier
    extends AsyncNotifier<List<IncomingBilanTransmission>> {
  @override
  Future<List<IncomingBilanTransmission>> build() async {
    final repo = ref.read(incomingBilanRepositoryProvider);
    return repo.list();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(incomingBilanRepositoryProvider);
      return repo.list();
    });
  }
}

final incomingBilanDetailProvider =
    FutureProvider.family<IncomingBilanDetail, String>((ref, id) async {
  final repo = ref.read(incomingBilanRepositoryProvider);
  return repo.getDetail(id);
});

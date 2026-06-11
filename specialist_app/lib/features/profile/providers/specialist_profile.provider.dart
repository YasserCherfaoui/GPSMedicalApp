import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/specialist_profile_repository.dart';
import '../utils/profile_api_error.dart';

final specialistProfileRepositoryProvider =
    Provider<SpecialistProfileRepository>((ref) {
      return SpecialistProfileRepository(ref.watch(gpsMedicalClientProvider));
    });

final specialistProfileProvider =
    AsyncNotifierProvider<SpecialistProfileNotifier, DoctorPrivate>(
      SpecialistProfileNotifier.new,
    );

class SpecialistProfileNotifier extends AsyncNotifier<DoctorPrivate> {
  @override
  Future<DoctorPrivate> build() {
    return ref.watch(specialistProfileRepositoryProvider).getProfile();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(specialistProfileRepositoryProvider).getProfile(),
    );
  }

  Future<DoctorPrivate> patchRaw(Map<String, dynamic> body) async {
    final previous = state.valueOrNull;
    final repo = ref.read(specialistProfileRepositoryProvider);

    if (previous != null) {
      state = AsyncValue.data(repo.mergeOptimistic(previous, body));
    }

    try {
      final updated = await repo.patchProfileRaw(body);
      state = AsyncValue.data(updated);
      return updated;
    } on ProfileValidationException {
      if (previous != null) {
        state = AsyncValue.data(previous);
      }
      rethrow;
    } catch (e) {
      if (previous != null) {
        state = AsyncValue.data(previous);
      }
      rethrow;
    }
  }
}

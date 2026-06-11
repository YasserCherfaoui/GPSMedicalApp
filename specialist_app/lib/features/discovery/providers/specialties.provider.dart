import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'discovery_repositories.provider.dart';

final specialtiesProvider =
    AsyncNotifierProvider<SpecialtiesNotifier, List<Specialty>>(
      SpecialtiesNotifier.new,
    );

class SpecialtiesNotifier extends AsyncNotifier<List<Specialty>> {
  @override
  Future<List<Specialty>> build() {
    return ref.watch(specialtiesRepositoryProvider).fetchAll();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repo = ref.read(specialtiesRepositoryProvider);
    repo.clearCache();
    state = await AsyncValue.guard(repo.fetchAll);
  }
}

import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'discovery_repositories.provider.dart';

part 'specialties.provider.g.dart';

@Riverpod(keepAlive: true)
class Specialties extends _$Specialties {
  @override
  Future<List<Specialty>> build() async {
    return ref.watch(specialtiesRepositoryProvider).fetchAll();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    final repo = ref.read(specialtiesRepositoryProvider);
    repo.clearCache();
    state = await AsyncValue.guard(repo.fetchAll);
  }
}

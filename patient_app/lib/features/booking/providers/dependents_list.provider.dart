import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'booking_repositories.provider.dart';

part 'dependents_list.provider.g.dart';

@riverpod
class DependentsList extends _$DependentsList {
  @override
  Future<List<Dependent>> build() async {
    return ref.watch(dependentsRepositoryProvider).listDependents();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(dependentsRepositoryProvider).listDependents(),
    );
  }

  Future<Dependent> create(DependentCreate create) async {
    final created = await ref
        .read(dependentsRepositoryProvider)
        .createDependent(create);
    await refresh();
    return created;
  }

  Future<Dependent> updateDependent({
    required String dependentId,
    required DependentCreate payload,
  }) async {
    final updated = await ref
        .read(dependentsRepositoryProvider)
        .updateDependent(dependentId: dependentId, update: payload);
    await refresh();
    return updated;
  }

  Future<void> delete(String dependentId) async {
    await ref.read(dependentsRepositoryProvider).deleteDependent(dependentId);
    await refresh();
  }
}

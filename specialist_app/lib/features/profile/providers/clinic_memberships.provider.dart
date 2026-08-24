import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/clinic_memberships_repository.dart';

final clinicMembershipsRepositoryProvider =
    Provider<ClinicMembershipsRepository>((ref) {
      return ClinicMembershipsRepository(ref.watch(gpsMedicalClientProvider));
    });

final clinicMembershipsProvider =
    AsyncNotifierProvider<ClinicMembershipsNotifier, List<ClinicMembership>>(
      ClinicMembershipsNotifier.new,
    );

class ClinicMembershipsNotifier extends AsyncNotifier<List<ClinicMembership>> {
  @override
  Future<List<ClinicMembership>> build() {
    return ref.watch(clinicMembershipsRepositoryProvider).list();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(clinicMembershipsRepositoryProvider).list(),
    );
  }

  Future<void> _replace(ClinicMembership updated) async {
    final current = state.valueOrNull;
    if (current == null) {
      await refresh();
      return;
    }
    state = AsyncData([
      for (final membership in current)
        if (membership.id == updated.id) updated else membership,
    ]);
  }

  Future<void> accept(String membershipId) async {
    final updated = await ref
        .read(clinicMembershipsRepositoryProvider)
        .accept(membershipId);
    await _replace(updated);
  }

  Future<void> refuse(String membershipId) async {
    final updated = await ref
        .read(clinicMembershipsRepositoryProvider)
        .refuse(membershipId);
    await _replace(updated);
  }

  Future<void> requestDetach(String membershipId) async {
    final updated = await ref
        .read(clinicMembershipsRepositoryProvider)
        .requestDetach(membershipId);
    await _replace(updated);
  }

  Future<void> setVisibleOnProfile({
    required String membershipId,
    required bool visible,
  }) async {
    final updated = await ref
        .read(clinicMembershipsRepositoryProvider)
        .setVisibleOnProfile(membershipId: membershipId, visible: visible);
    await _replace(updated);
  }
}

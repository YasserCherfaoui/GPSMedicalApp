import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'profile_repositories.provider.dart';

part 'consents_list.provider.g.dart';

@riverpod
class ConsentsList extends _$ConsentsList {
  @override
  Future<List<ConsentGrant>> build() async {
    return ref.watch(consentRepositoryProvider).listConsents();
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => ref.read(consentRepositoryProvider).listConsents(),
    );
  }

  Future<void> revoke(RevokeConsentRequestConsentTypeEnum type) async {
    await ref.read(consentRepositoryProvider).revokeConsent(type);
    await refresh();
  }
}

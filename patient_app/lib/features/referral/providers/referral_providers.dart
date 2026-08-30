import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../models/referral_models.dart';
import '../repositories/referral_repository.dart';

final referralRepositoryProvider = Provider<ReferralRepository>((ref) {
  final client = ref.watch(gpsMedicalClientProvider);
  return ReferralRepository(client.v1.dio);
});

typedef ReferralSessionArgs = ({String sessionId, String? bilanId});

final referralMatchesProvider = AsyncNotifierProvider.family<
    ReferralMatchesNotifier, List<ReferralMatch>, ReferralSessionArgs>(
  ReferralMatchesNotifier.new,
);

class ReferralMatchesNotifier
    extends FamilyAsyncNotifier<List<ReferralMatch>, ReferralSessionArgs> {
  @override
  Future<List<ReferralMatch>> build(ReferralSessionArgs arg) async {
    final repo = ref.read(referralRepositoryProvider);
    await repo.generateMatches(arg.sessionId);
    return repo.listMatches(arg.sessionId);
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(referralRepositoryProvider);
      return repo.listMatches(arg.sessionId);
    });
  }
}

final referralMatchDetailProvider =
    FutureProvider.family<ReferralMatch, String>((ref, matchId) async {
  final repo = ref.read(referralRepositoryProvider);
  return repo.getMatch(matchId);
});

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../routing/specialist_verification_status.dart';
import 'specialist_verification_gate.dart';
import 'specialist_verification_repository.dart';

final specialistVerificationRepositoryProvider =
    Provider<SpecialistVerificationRepository>((ref) {
      return SpecialistVerificationRepository(ref.watch(gpsMedicalClientProvider));
    });

final specialistVerificationGateProvider = Provider<SpecialistVerificationGate>((
  ref,
) {
  final gate = SpecialistVerificationGate(
    ref.watch(specialistVerificationRepositoryProvider),
  );
  ref.onDispose(gate.dispose);

  ref.listen<AuthSessionNotifier>(authSessionProvider, (previous, next) {
    if (next.isAuthenticated) {
      unawaited(gate.refresh());
    } else {
      gate.reset();
    }
  }, fireImmediately: true);

  return gate;
});

/// Convenience read for redirect logic and screens.
final specialistVerificationStatusProvider = Provider<SpecialistVerificationStatus>(
  (ref) => ref.watch(specialistVerificationGateProvider).status,
);

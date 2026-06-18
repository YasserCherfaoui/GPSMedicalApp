import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../routing/specialist_verification_status.dart';
import 'specialist_verification_gate.dart';
import 'specialist_verification_repository.dart';
import 'specialist_verification_state.dart';

final specialistVerificationRepositoryProvider =
    Provider<SpecialistVerificationRepository>((ref) {
      return SpecialistVerificationRepository(ref.watch(gpsMedicalClientProvider));
    });

/// Verification gate — [ChangeNotifierProvider] so screens rebuild and
/// [GoRouter.refreshListenable] receives status updates.
final specialistVerificationGateProvider =
    ChangeNotifierProvider<SpecialistVerificationGate>((ref) {
      final gate = SpecialistVerificationGate(
        ref.watch(specialistVerificationRepositoryProvider),
      );

      ref.listen<AuthSessionNotifier>(authSessionProvider, (previous, next) {
        if (next.isAuthenticated) {
          unawaited(gate.refresh());
        } else {
          gate.reset();
        }
      }, fireImmediately: true);

      return gate;
    });

/// Reactive verification state for screens and redirect helpers.
final specialistVerificationStateProvider =
    Provider<SpecialistVerificationState>((ref) {
      final gate = ref.watch(specialistVerificationGateProvider);
      return gate.state;
    });

/// Convenience read for redirect logic.
final specialistVerificationStatusProvider =
    Provider<SpecialistVerificationStatus>(
      (ref) => ref.watch(specialistVerificationStateProvider).status,
    );

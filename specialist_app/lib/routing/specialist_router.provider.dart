import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../features/verification/specialist_verification.provider.dart';
import 'specialist_router.dart';

final specialistRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authSessionProvider);
  final appInfo = ref.watch(appInfoProvider);
  final launchPreferences = ref.watch(appLaunchPreferencesProvider);
  final verificationGate = ref.watch(specialistVerificationGateProvider);

  return createSpecialistRouter(
    authListenable: auth,
    verificationListenable: verificationGate,
    appInfo: appInfo,
    launchPreferences: launchPreferences,
    verificationStatus: verificationGate.status,
  );
});

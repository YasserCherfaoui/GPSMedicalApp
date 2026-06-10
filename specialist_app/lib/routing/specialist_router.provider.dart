import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'specialist_router.dart';
import 'specialist_verification.provider.dart';

final specialistRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authSessionProvider);
  final appInfo = ref.watch(appInfoProvider);
  final launchPreferences = ref.watch(appLaunchPreferencesProvider);
  final verification = ref.watch(specialistVerificationStatusProvider);

  return createSpecialistRouter(
    authListenable: auth,
    appInfo: appInfo,
    launchPreferences: launchPreferences,
    verificationStatus: verification,
  );
});

import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../features/verification/specialist_verification.provider.dart';
import 'specialist_router.dart';

final specialistRouterProvider = Provider<GoRouter>((ref) {
  // [GoRouter.refreshListenable] re-runs redirects; do not recreate the router
  // when auth or verification changes or navigation will reset to splash.
  final auth = ref.read(authSessionProvider);
  final appInfo = ref.watch(appInfoProvider);
  final launchPreferences = ref.read(appLaunchPreferencesProvider);
  final verificationGate = ref.read(specialistVerificationGateProvider);

  final router = createSpecialistRouter(
    authListenable: auth,
    verificationListenable: verificationGate,
    appInfo: appInfo,
    launchPreferences: launchPreferences,
    verificationStatusOf: () => verificationGate.status,
  );

  // The gate may finish its first fetch before GoRouter attaches listeners.
  scheduleMicrotask(verificationGate.publish);

  return router;
});

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/auth_session.provider.dart';
import '../bootstrap/app_launch_preferences.provider.dart';
import '../models/app_info.provider.dart';
import 'gps_router.dart';

part 'gps_router.provider.g.dart';

/// Application [GoRouter] with auth-aware redirects.
@Riverpod(keepAlive: true)
GoRouter gpsRouter(Ref ref) {
  // [GoRouter.refreshListenable] re-runs redirects; do not recreate the router
  // when auth changes or navigation will reset to a blank screen.
  final auth = ref.read(authSessionProvider);
  final appInfo = ref.watch(appInfoProvider);
  final launchPreferences = ref.read(appLaunchPreferencesProvider);

  return createGpsRouter(
    authListenable: auth,
    appInfo: appInfo,
    launchPreferences: launchPreferences,
  );
}

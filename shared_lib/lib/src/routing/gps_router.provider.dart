import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../auth/auth_session.provider.dart';
import '../models/app_info.provider.dart';
import 'gps_router.dart';

/// Application [GoRouter] with auth-aware redirects.
final gpsRouterProvider = Provider<GoRouter>((ref) {
  final auth = ref.watch(authSessionProvider);
  final appInfo = ref.watch(appInfoProvider);

  return createGpsRouter(authListenable: auth, appInfo: appInfo);
});

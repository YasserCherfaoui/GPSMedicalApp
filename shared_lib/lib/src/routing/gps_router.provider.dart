import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../auth/auth_session.provider.dart';
import '../models/app_info.provider.dart';
import 'gps_router.dart';

part 'gps_router.provider.g.dart';

/// Application [GoRouter] with auth-aware redirects.
@Riverpod(keepAlive: true)
GoRouter gpsRouter(Ref ref) {
  final auth = ref.watch(authSessionProvider);
  final appInfo = ref.watch(appInfoProvider);

  return createGpsRouter(authListenable: auth, appInfo: appInfo);
}

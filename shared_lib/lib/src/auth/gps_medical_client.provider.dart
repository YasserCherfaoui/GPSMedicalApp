import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../client/gps_medical_client.dart';
import '../client/http_debug_log_interceptor.dart';
import 'auth_session.provider.dart';

part 'gps_medical_client.provider.g.dart';

/// Shared API client wired to the session [TokenStore] and expiry handler.
///
/// Do not [Ref.watch] [authSessionProvider]. Token refresh notifies that
/// ChangeNotifier; rebuilding this client would create a second Dio stack and
/// a second refresh interceptor. Refresh JWTs are single-use, so a parallel
/// refresh returns 401 and signs the user out.
@Riverpod(keepAlive: true)
GpsMedicalClient gpsMedicalClient(Ref ref) {
  final tokenStore = ref.watch(tokenStoreProvider);
  final sessionNotifier = ref.read(authSessionProvider);

  const apiRootUrlFromEnv = String.fromEnvironment('API_ROOT_URL');
  final apiRootUrl = apiRootUrlFromEnv.isNotEmpty ? apiRootUrlFromEnv : null;

  if (gpsHttpDebugLogsEnabled()) {
    debugPrint(
      apiRootUrlFromEnv.isEmpty
          ? '[GPS HTTP] API_ROOT_URL dart-define is unset; client will use the localhost default'
          : '[GPS HTTP] API_ROOT_URL dart-define=$apiRootUrlFromEnv',
    );
  }

  return GpsMedicalClient(
    tokenStore: tokenStore,
    onSessionExpired: sessionNotifier.handleSessionExpired,
    onTokensRefreshed: sessionNotifier.applyRefreshedTokens,
    apiRootUrl: apiRootUrl,
  );
}

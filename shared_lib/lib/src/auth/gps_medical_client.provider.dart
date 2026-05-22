import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../client/gps_medical_client.dart';
import 'auth_session.provider.dart';

/// Shared API client wired to the session [TokenStore] and expiry handler.
final gpsMedicalClientProvider = Provider<GpsMedicalClient>((ref) {
  final tokenStore = ref.watch(tokenStoreProvider);
  final sessionNotifier = ref.watch(authSessionProvider);

  const apiRootUrlFromEnv = String.fromEnvironment('API_ROOT_URL');
  final apiRootUrl = apiRootUrlFromEnv.isNotEmpty ? apiRootUrlFromEnv : null;

  return GpsMedicalClient(
    tokenStore: tokenStore,
    onSessionExpired: sessionNotifier.handleSessionExpired,
    apiRootUrl: apiRootUrl,
  );
});

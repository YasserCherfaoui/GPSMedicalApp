import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api_auth_repository.dart';
import 'auth_repository.dart';
import 'gps_medical_client.provider.dart';

/// When true, [MockAuthRepository] is used (UI/tests without a backend).
///
/// Override in tests or pass `--dart-define=USE_MOCK_AUTH=true` for mock mode.
final useMockAuthProvider = Provider<bool>(
  (ref) => const bool.fromEnvironment('USE_MOCK_AUTH', defaultValue: false),
);

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  if (ref.watch(useMockAuthProvider)) {
    return MockAuthRepository();
  }
  return ApiAuthRepository(ref.watch(gpsMedicalClientProvider).phase1);
});

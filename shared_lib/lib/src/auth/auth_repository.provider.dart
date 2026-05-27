import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'api_auth_repository.dart';
import 'auth_repository.dart';
import 'gps_medical_client.provider.dart';

part 'auth_repository.provider.g.dart';

/// When true, [MockAuthRepository] is used (UI/tests without a backend).
///
/// Override in tests or pass `--dart-define=USE_MOCK_AUTH=true` for mock mode.
@Riverpod(keepAlive: true)
bool useMockAuth(Ref ref) {
  return const bool.fromEnvironment('USE_MOCK_AUTH', defaultValue: false);
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  if (ref.watch(useMockAuthProvider)) {
    return MockAuthRepository();
  }
  return ApiAuthRepository(ref.watch(gpsMedicalClientProvider).phase1);
}

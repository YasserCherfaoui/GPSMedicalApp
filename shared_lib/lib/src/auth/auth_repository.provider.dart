import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth_repository.dart';

/// When false, [ApiAuthRepository] is used (staging — task 1.16 Week 5).
final useMockAuthProvider = Provider<bool>((ref) => true);

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final useMock = ref.watch(useMockAuthProvider);
  if (useMock) {
    return MockAuthRepository();
  }
  // Week 5: return ApiAuthRepository(ref.watch(gpsMedicalClientProvider).phase1, ...)
  return MockAuthRepository();
});

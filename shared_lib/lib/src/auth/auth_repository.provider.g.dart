// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$useMockAuthHash() => r'6023f89d3a801fa0b965f9f290b2358db676da6e';

/// When true, [MockAuthRepository] is used (UI/tests without a backend).
///
/// Override in tests or pass `--dart-define=USE_MOCK_AUTH=true` for mock mode.
///
/// Copied from [useMockAuth].
@ProviderFor(useMockAuth)
final useMockAuthProvider = Provider<bool>.internal(
  useMockAuth,
  name: r'useMockAuthProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$useMockAuthHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UseMockAuthRef = ProviderRef<bool>;
String _$authRepositoryHash() => r'dc21a0b357c388a8884d18fc00c78a36e0033421';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = Provider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthRepositoryRef = ProviderRef<AuthRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

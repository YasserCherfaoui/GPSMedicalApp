// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$useMockAuthHash() => r'597a6cf473e4354bd5befaad51bc01d334de5f40';

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
String _$authRepositoryHash() => r'640f53e49d64c51da74e805d0f085311925a26e4';

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

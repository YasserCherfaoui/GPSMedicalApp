// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_session.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$tokenStoreHash() => r'99148dcfbf6ee767a66c62fb83f38f23a1b9cd6b';

/// See also [tokenStore].
@ProviderFor(tokenStore)
final tokenStoreProvider = Provider<TokenStore>.internal(
  tokenStore,
  name: r'tokenStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$tokenStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TokenStoreRef = ProviderRef<TokenStore>;
String _$authSessionStateHash() => r'0b502e43231e4c733a8667091c49f6819850dbd7';

/// Read-only view of the current session.
///
/// Copied from [authSessionState].
@ProviderFor(authSessionState)
final authSessionStateProvider = Provider<AuthSession>.internal(
  authSessionState,
  name: r'authSessionStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authSessionStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthSessionStateRef = ProviderRef<AuthSession>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

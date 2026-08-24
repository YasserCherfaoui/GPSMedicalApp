// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gps_medical_client.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gpsMedicalClientHash() => r'92f95d675cc196755ab242664a32d984f129a01d';

/// Shared API client wired to the session [TokenStore] and expiry handler.
///
/// Do not [Ref.watch] [authSessionProvider]. Token refresh notifies that
/// ChangeNotifier; rebuilding this client would create a second Dio stack and
/// a second refresh interceptor. Refresh JWTs are single-use, so a parallel
/// refresh returns 401 and signs the user out.
///
/// Copied from [gpsMedicalClient].
@ProviderFor(gpsMedicalClient)
final gpsMedicalClientProvider = Provider<GpsMedicalClient>.internal(
  gpsMedicalClient,
  name: r'gpsMedicalClientProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gpsMedicalClientHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GpsMedicalClientRef = ProviderRef<GpsMedicalClient>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

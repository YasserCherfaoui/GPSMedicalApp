// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_filter.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wilayasFetchHash() => r'b52ee088b52c9bb27f4312e1c0c574129e2b1316';

/// See also [WilayasFetch].
@ProviderFor(WilayasFetch)
final wilayasFetchProvider =
    AsyncNotifierProvider<WilayasFetch, List<Wilaya>>.internal(
      WilayasFetch.new,
      name: r'wilayasFetchProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$wilayasFetchHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WilayasFetch = AsyncNotifier<List<Wilaya>>;
String _$communesFetchHash() => r'4b04aade5db5d9871b3ce1865d197344f174ea6e';

/// See also [CommunesFetch].
@ProviderFor(CommunesFetch)
final communesFetchProvider =
    AsyncNotifierProvider<CommunesFetch, Map<String, List<Commune>>>.internal(
      CommunesFetch.new,
      name: r'communesFetchProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$communesFetchHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$CommunesFetch = AsyncNotifier<Map<String, List<Commune>>>;
String _$locationFilterHash() => r'ce556592458b4933692291152c98e44eb24bd83d';

/// See also [LocationFilter].
@ProviderFor(LocationFilter)
final locationFilterProvider =
    AutoDisposeNotifierProvider<LocationFilter, LocationFilterState>.internal(
      LocationFilter.new,
      name: r'locationFilterProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$locationFilterHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$LocationFilter = AutoDisposeNotifier<LocationFilterState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

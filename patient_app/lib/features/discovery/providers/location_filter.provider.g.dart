// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_filter.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$wilayasFetchHash() => r'8ac6c9a9b5a4ea7faecffc027a7b79da0fb0b775';

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
String _$communesFetchHash() => r'aefec997466e5d5061ebfd1f722d483d732bb7ce';

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
String _$locationFilterHash() => r'86086078555137e35e7f515fd990393291912a90';

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

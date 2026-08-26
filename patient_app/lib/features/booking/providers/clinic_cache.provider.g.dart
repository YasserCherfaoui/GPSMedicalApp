// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_cache.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cachedClinicHash() => r'a4ee53b9c55846c74c84e2ce3bee3fa39ed15234';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Session-scoped clinic lookup (mirrors [cachedDoctor] for clinic bookings).
///
/// Copied from [cachedClinic].
@ProviderFor(cachedClinic)
const cachedClinicProvider = CachedClinicFamily();

/// Session-scoped clinic lookup (mirrors [cachedDoctor] for clinic bookings).
///
/// Copied from [cachedClinic].
class CachedClinicFamily extends Family<AsyncValue<Clinic>> {
  /// Session-scoped clinic lookup (mirrors [cachedDoctor] for clinic bookings).
  ///
  /// Copied from [cachedClinic].
  const CachedClinicFamily();

  /// Session-scoped clinic lookup (mirrors [cachedDoctor] for clinic bookings).
  ///
  /// Copied from [cachedClinic].
  CachedClinicProvider call(String clinicId) {
    return CachedClinicProvider(clinicId);
  }

  @override
  CachedClinicProvider getProviderOverride(
    covariant CachedClinicProvider provider,
  ) {
    return call(provider.clinicId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cachedClinicProvider';
}

/// Session-scoped clinic lookup (mirrors [cachedDoctor] for clinic bookings).
///
/// Copied from [cachedClinic].
class CachedClinicProvider extends FutureProvider<Clinic> {
  /// Session-scoped clinic lookup (mirrors [cachedDoctor] for clinic bookings).
  ///
  /// Copied from [cachedClinic].
  CachedClinicProvider(String clinicId)
    : this._internal(
        (ref) => cachedClinic(ref as CachedClinicRef, clinicId),
        from: cachedClinicProvider,
        name: r'cachedClinicProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$cachedClinicHash,
        dependencies: CachedClinicFamily._dependencies,
        allTransitiveDependencies:
            CachedClinicFamily._allTransitiveDependencies,
        clinicId: clinicId,
      );

  CachedClinicProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.clinicId,
  }) : super.internal();

  final String clinicId;

  @override
  Override overrideWith(
    FutureOr<Clinic> Function(CachedClinicRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CachedClinicProvider._internal(
        (ref) => create(ref as CachedClinicRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        clinicId: clinicId,
      ),
    );
  }

  @override
  FutureProviderElement<Clinic> createElement() {
    return _CachedClinicProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CachedClinicProvider && other.clinicId == clinicId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, clinicId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CachedClinicRef on FutureProviderRef<Clinic> {
  /// The parameter `clinicId` of this provider.
  String get clinicId;
}

class _CachedClinicProviderElement extends FutureProviderElement<Clinic>
    with CachedClinicRef {
  _CachedClinicProviderElement(super.provider);

  @override
  String get clinicId => (origin as CachedClinicProvider).clinicId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

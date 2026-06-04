// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_cache.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cachedDoctorHash() => r'5a75ad02cb385e20614d3d5d6b5d4a48cc88ca38';

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

/// See also [cachedDoctor].
@ProviderFor(cachedDoctor)
const cachedDoctorProvider = CachedDoctorFamily();

/// See also [cachedDoctor].
class CachedDoctorFamily extends Family<AsyncValue<Doctor>> {
  /// See also [cachedDoctor].
  const CachedDoctorFamily();

  /// See also [cachedDoctor].
  CachedDoctorProvider call(String doctorId) {
    return CachedDoctorProvider(doctorId);
  }

  @override
  CachedDoctorProvider getProviderOverride(
    covariant CachedDoctorProvider provider,
  ) {
    return call(provider.doctorId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cachedDoctorProvider';
}

/// See also [cachedDoctor].
class CachedDoctorProvider extends AutoDisposeFutureProvider<Doctor> {
  /// See also [cachedDoctor].
  CachedDoctorProvider(String doctorId)
    : this._internal(
        (ref) => cachedDoctor(ref as CachedDoctorRef, doctorId),
        from: cachedDoctorProvider,
        name: r'cachedDoctorProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$cachedDoctorHash,
        dependencies: CachedDoctorFamily._dependencies,
        allTransitiveDependencies:
            CachedDoctorFamily._allTransitiveDependencies,
        doctorId: doctorId,
      );

  CachedDoctorProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.doctorId,
  }) : super.internal();

  final String doctorId;

  @override
  Override overrideWith(
    FutureOr<Doctor> Function(CachedDoctorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: CachedDoctorProvider._internal(
        (ref) => create(ref as CachedDoctorRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        doctorId: doctorId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Doctor> createElement() {
    return _CachedDoctorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is CachedDoctorProvider && other.doctorId == doctorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, doctorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin CachedDoctorRef on AutoDisposeFutureProviderRef<Doctor> {
  /// The parameter `doctorId` of this provider.
  String get doctorId;
}

class _CachedDoctorProviderElement
    extends AutoDisposeFutureProviderElement<Doctor>
    with CachedDoctorRef {
  _CachedDoctorProviderElement(super.provider);

  @override
  String get doctorId => (origin as CachedDoctorProvider).doctorId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

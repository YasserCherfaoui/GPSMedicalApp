// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_detail.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$doctorDetailHash() => r'73456a9fecac5c7e4c668e0995213e8bf9f988e5';

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

abstract class _$DoctorDetail
    extends BuildlessAutoDisposeAsyncNotifier<DoctorDetailState> {
  late final String doctorId;

  FutureOr<DoctorDetailState> build(String doctorId);
}

/// See also [DoctorDetail].
@ProviderFor(DoctorDetail)
const doctorDetailProvider = DoctorDetailFamily();

/// See also [DoctorDetail].
class DoctorDetailFamily extends Family<AsyncValue<DoctorDetailState>> {
  /// See also [DoctorDetail].
  const DoctorDetailFamily();

  /// See also [DoctorDetail].
  DoctorDetailProvider call(String doctorId) {
    return DoctorDetailProvider(doctorId);
  }

  @override
  DoctorDetailProvider getProviderOverride(
    covariant DoctorDetailProvider provider,
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
  String? get name => r'doctorDetailProvider';
}

/// See also [DoctorDetail].
class DoctorDetailProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<DoctorDetail, DoctorDetailState> {
  /// See also [DoctorDetail].
  DoctorDetailProvider(String doctorId)
    : this._internal(
        () => DoctorDetail()..doctorId = doctorId,
        from: doctorDetailProvider,
        name: r'doctorDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$doctorDetailHash,
        dependencies: DoctorDetailFamily._dependencies,
        allTransitiveDependencies:
            DoctorDetailFamily._allTransitiveDependencies,
        doctorId: doctorId,
      );

  DoctorDetailProvider._internal(
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
  FutureOr<DoctorDetailState> runNotifierBuild(
    covariant DoctorDetail notifier,
  ) {
    return notifier.build(doctorId);
  }

  @override
  Override overrideWith(DoctorDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: DoctorDetailProvider._internal(
        () => create()..doctorId = doctorId,
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
  AutoDisposeAsyncNotifierProviderElement<DoctorDetail, DoctorDetailState>
  createElement() {
    return _DoctorDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DoctorDetailProvider && other.doctorId == doctorId;
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
mixin DoctorDetailRef
    on AutoDisposeAsyncNotifierProviderRef<DoctorDetailState> {
  /// The parameter `doctorId` of this provider.
  String get doctorId;
}

class _DoctorDetailProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<DoctorDetail, DoctorDetailState>
    with DoctorDetailRef {
  _DoctorDetailProviderElement(super.provider);

  @override
  String get doctorId => (origin as DoctorDetailProvider).doctorId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

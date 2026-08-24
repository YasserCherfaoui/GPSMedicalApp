// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_detail.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clinicDetailHash() => r'9ba4608fb412c018e8d6d94e3984b6fa68e6730b';

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

abstract class _$ClinicDetail
    extends BuildlessAutoDisposeAsyncNotifier<ClinicDetailState> {
  late final String clinicId;

  FutureOr<ClinicDetailState> build(String clinicId);
}

/// See also [ClinicDetail].
@ProviderFor(ClinicDetail)
const clinicDetailProvider = ClinicDetailFamily();

/// See also [ClinicDetail].
class ClinicDetailFamily extends Family<AsyncValue<ClinicDetailState>> {
  /// See also [ClinicDetail].
  const ClinicDetailFamily();

  /// See also [ClinicDetail].
  ClinicDetailProvider call(String clinicId) {
    return ClinicDetailProvider(clinicId);
  }

  @override
  ClinicDetailProvider getProviderOverride(
    covariant ClinicDetailProvider provider,
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
  String? get name => r'clinicDetailProvider';
}

/// See also [ClinicDetail].
class ClinicDetailProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<ClinicDetail, ClinicDetailState> {
  /// See also [ClinicDetail].
  ClinicDetailProvider(String clinicId)
    : this._internal(
        () => ClinicDetail()..clinicId = clinicId,
        from: clinicDetailProvider,
        name: r'clinicDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$clinicDetailHash,
        dependencies: ClinicDetailFamily._dependencies,
        allTransitiveDependencies:
            ClinicDetailFamily._allTransitiveDependencies,
        clinicId: clinicId,
      );

  ClinicDetailProvider._internal(
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
  FutureOr<ClinicDetailState> runNotifierBuild(
    covariant ClinicDetail notifier,
  ) {
    return notifier.build(clinicId);
  }

  @override
  Override overrideWith(ClinicDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: ClinicDetailProvider._internal(
        () => create()..clinicId = clinicId,
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
  AutoDisposeAsyncNotifierProviderElement<ClinicDetail, ClinicDetailState>
  createElement() {
    return _ClinicDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClinicDetailProvider && other.clinicId == clinicId;
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
mixin ClinicDetailRef
    on AutoDisposeAsyncNotifierProviderRef<ClinicDetailState> {
  /// The parameter `clinicId` of this provider.
  String get clinicId;
}

class _ClinicDetailProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<ClinicDetail, ClinicDetailState>
    with ClinicDetailRef {
  _ClinicDetailProviderElement(super.provider);

  @override
  String get clinicId => (origin as ClinicDetailProvider).clinicId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

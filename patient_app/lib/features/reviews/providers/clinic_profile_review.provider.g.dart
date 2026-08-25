// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_profile_review.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clinicProfileReviewHash() =>
    r'b38d433c8ec2d64c4e06ea7d83e5db5ee243e2ae';

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

/// See also [clinicProfileReview].
@ProviderFor(clinicProfileReview)
const clinicProfileReviewProvider = ClinicProfileReviewFamily();

/// See also [clinicProfileReview].
class ClinicProfileReviewFamily
    extends Family<AsyncValue<CachedClinicProfileReview?>> {
  /// See also [clinicProfileReview].
  const ClinicProfileReviewFamily();

  /// See also [clinicProfileReview].
  ClinicProfileReviewProvider call(String clinicId) {
    return ClinicProfileReviewProvider(clinicId);
  }

  @override
  ClinicProfileReviewProvider getProviderOverride(
    covariant ClinicProfileReviewProvider provider,
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
  String? get name => r'clinicProfileReviewProvider';
}

/// See also [clinicProfileReview].
class ClinicProfileReviewProvider
    extends AutoDisposeFutureProvider<CachedClinicProfileReview?> {
  /// See also [clinicProfileReview].
  ClinicProfileReviewProvider(String clinicId)
    : this._internal(
        (ref) => clinicProfileReview(ref as ClinicProfileReviewRef, clinicId),
        from: clinicProfileReviewProvider,
        name: r'clinicProfileReviewProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$clinicProfileReviewHash,
        dependencies: ClinicProfileReviewFamily._dependencies,
        allTransitiveDependencies:
            ClinicProfileReviewFamily._allTransitiveDependencies,
        clinicId: clinicId,
      );

  ClinicProfileReviewProvider._internal(
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
    FutureOr<CachedClinicProfileReview?> Function(
      ClinicProfileReviewRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClinicProfileReviewProvider._internal(
        (ref) => create(ref as ClinicProfileReviewRef),
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
  AutoDisposeFutureProviderElement<CachedClinicProfileReview?> createElement() {
    return _ClinicProfileReviewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClinicProfileReviewProvider && other.clinicId == clinicId;
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
mixin ClinicProfileReviewRef
    on AutoDisposeFutureProviderRef<CachedClinicProfileReview?> {
  /// The parameter `clinicId` of this provider.
  String get clinicId;
}

class _ClinicProfileReviewProviderElement
    extends AutoDisposeFutureProviderElement<CachedClinicProfileReview?>
    with ClinicProfileReviewRef {
  _ClinicProfileReviewProviderElement(super.provider);

  @override
  String get clinicId => (origin as ClinicProfileReviewProvider).clinicId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

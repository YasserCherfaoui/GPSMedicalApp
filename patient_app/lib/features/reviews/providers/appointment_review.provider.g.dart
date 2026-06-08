// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_review.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appointmentReviewHash() => r'ae1e54e8a619dd4e6ace0e75c3bf90f2688a6e42';

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

/// See also [appointmentReview].
@ProviderFor(appointmentReview)
const appointmentReviewProvider = AppointmentReviewFamily();

/// See also [appointmentReview].
class AppointmentReviewFamily
    extends Family<AsyncValue<CachedAppointmentReview?>> {
  /// See also [appointmentReview].
  const AppointmentReviewFamily();

  /// See also [appointmentReview].
  AppointmentReviewProvider call(String appointmentId) {
    return AppointmentReviewProvider(appointmentId);
  }

  @override
  AppointmentReviewProvider getProviderOverride(
    covariant AppointmentReviewProvider provider,
  ) {
    return call(provider.appointmentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'appointmentReviewProvider';
}

/// See also [appointmentReview].
class AppointmentReviewProvider
    extends AutoDisposeFutureProvider<CachedAppointmentReview?> {
  /// See also [appointmentReview].
  AppointmentReviewProvider(String appointmentId)
    : this._internal(
        (ref) => appointmentReview(ref as AppointmentReviewRef, appointmentId),
        from: appointmentReviewProvider,
        name: r'appointmentReviewProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$appointmentReviewHash,
        dependencies: AppointmentReviewFamily._dependencies,
        allTransitiveDependencies:
            AppointmentReviewFamily._allTransitiveDependencies,
        appointmentId: appointmentId,
      );

  AppointmentReviewProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.appointmentId,
  }) : super.internal();

  final String appointmentId;

  @override
  Override overrideWith(
    FutureOr<CachedAppointmentReview?> Function(AppointmentReviewRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AppointmentReviewProvider._internal(
        (ref) => create(ref as AppointmentReviewRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        appointmentId: appointmentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<CachedAppointmentReview?> createElement() {
    return _AppointmentReviewProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppointmentReviewProvider &&
        other.appointmentId == appointmentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, appointmentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AppointmentReviewRef
    on AutoDisposeFutureProviderRef<CachedAppointmentReview?> {
  /// The parameter `appointmentId` of this provider.
  String get appointmentId;
}

class _AppointmentReviewProviderElement
    extends AutoDisposeFutureProviderElement<CachedAppointmentReview?>
    with AppointmentReviewRef {
  _AppointmentReviewProviderElement(super.provider);

  @override
  String get appointmentId =>
      (origin as AppointmentReviewProvider).appointmentId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

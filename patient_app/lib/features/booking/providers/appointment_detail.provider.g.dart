// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_detail.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appointmentDetailHash() => r'09e47db78eb4c8bde0d65386e3f42358a91ec8a8';

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

abstract class _$AppointmentDetail
    extends BuildlessAutoDisposeAsyncNotifier<AppointmentDetailState> {
  late final String appointmentId;

  FutureOr<AppointmentDetailState> build(String appointmentId);
}

/// See also [AppointmentDetail].
@ProviderFor(AppointmentDetail)
const appointmentDetailProvider = AppointmentDetailFamily();

/// See also [AppointmentDetail].
class AppointmentDetailFamily
    extends Family<AsyncValue<AppointmentDetailState>> {
  /// See also [AppointmentDetail].
  const AppointmentDetailFamily();

  /// See also [AppointmentDetail].
  AppointmentDetailProvider call(String appointmentId) {
    return AppointmentDetailProvider(appointmentId);
  }

  @override
  AppointmentDetailProvider getProviderOverride(
    covariant AppointmentDetailProvider provider,
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
  String? get name => r'appointmentDetailProvider';
}

/// See also [AppointmentDetail].
class AppointmentDetailProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          AppointmentDetail,
          AppointmentDetailState
        > {
  /// See also [AppointmentDetail].
  AppointmentDetailProvider(String appointmentId)
    : this._internal(
        () => AppointmentDetail()..appointmentId = appointmentId,
        from: appointmentDetailProvider,
        name: r'appointmentDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$appointmentDetailHash,
        dependencies: AppointmentDetailFamily._dependencies,
        allTransitiveDependencies:
            AppointmentDetailFamily._allTransitiveDependencies,
        appointmentId: appointmentId,
      );

  AppointmentDetailProvider._internal(
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
  FutureOr<AppointmentDetailState> runNotifierBuild(
    covariant AppointmentDetail notifier,
  ) {
    return notifier.build(appointmentId);
  }

  @override
  Override overrideWith(AppointmentDetail Function() create) {
    return ProviderOverride(
      origin: this,
      override: AppointmentDetailProvider._internal(
        () => create()..appointmentId = appointmentId,
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
  AutoDisposeAsyncNotifierProviderElement<
    AppointmentDetail,
    AppointmentDetailState
  >
  createElement() {
    return _AppointmentDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AppointmentDetailProvider &&
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
mixin AppointmentDetailRef
    on AutoDisposeAsyncNotifierProviderRef<AppointmentDetailState> {
  /// The parameter `appointmentId` of this provider.
  String get appointmentId;
}

class _AppointmentDetailProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          AppointmentDetail,
          AppointmentDetailState
        >
    with AppointmentDetailRef {
  _AppointmentDetailProviderElement(super.provider);

  @override
  String get appointmentId =>
      (origin as AppointmentDetailProvider).appointmentId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

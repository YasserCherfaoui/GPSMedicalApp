// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_availability_slots.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$clinicAvailabilitySlotsHash() =>
    r'b343df934c7181bacaa88bde6da0d7c161866984';

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

/// See also [clinicAvailabilitySlots].
@ProviderFor(clinicAvailabilitySlots)
const clinicAvailabilitySlotsProvider = ClinicAvailabilitySlotsFamily();

/// See also [clinicAvailabilitySlots].
class ClinicAvailabilitySlotsFamily
    extends Family<AsyncValue<List<AvailabilitySlot>>> {
  /// See also [clinicAvailabilitySlots].
  const ClinicAvailabilitySlotsFamily();

  /// See also [clinicAvailabilitySlots].
  ClinicAvailabilitySlotsProvider call(
    String clinicId,
    String serviceId,
    String mode,
  ) {
    return ClinicAvailabilitySlotsProvider(clinicId, serviceId, mode);
  }

  @override
  ClinicAvailabilitySlotsProvider getProviderOverride(
    covariant ClinicAvailabilitySlotsProvider provider,
  ) {
    return call(provider.clinicId, provider.serviceId, provider.mode);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'clinicAvailabilitySlotsProvider';
}

/// See also [clinicAvailabilitySlots].
class ClinicAvailabilitySlotsProvider
    extends AutoDisposeFutureProvider<List<AvailabilitySlot>> {
  /// See also [clinicAvailabilitySlots].
  ClinicAvailabilitySlotsProvider(
    String clinicId,
    String serviceId,
    String mode,
  ) : this._internal(
        (ref) => clinicAvailabilitySlots(
          ref as ClinicAvailabilitySlotsRef,
          clinicId,
          serviceId,
          mode,
        ),
        from: clinicAvailabilitySlotsProvider,
        name: r'clinicAvailabilitySlotsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$clinicAvailabilitySlotsHash,
        dependencies: ClinicAvailabilitySlotsFamily._dependencies,
        allTransitiveDependencies:
            ClinicAvailabilitySlotsFamily._allTransitiveDependencies,
        clinicId: clinicId,
        serviceId: serviceId,
        mode: mode,
      );

  ClinicAvailabilitySlotsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.clinicId,
    required this.serviceId,
    required this.mode,
  }) : super.internal();

  final String clinicId;
  final String serviceId;
  final String mode;

  @override
  Override overrideWith(
    FutureOr<List<AvailabilitySlot>> Function(
      ClinicAvailabilitySlotsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ClinicAvailabilitySlotsProvider._internal(
        (ref) => create(ref as ClinicAvailabilitySlotsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        clinicId: clinicId,
        serviceId: serviceId,
        mode: mode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AvailabilitySlot>> createElement() {
    return _ClinicAvailabilitySlotsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ClinicAvailabilitySlotsProvider &&
        other.clinicId == clinicId &&
        other.serviceId == serviceId &&
        other.mode == mode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, clinicId.hashCode);
    hash = _SystemHash.combine(hash, serviceId.hashCode);
    hash = _SystemHash.combine(hash, mode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ClinicAvailabilitySlotsRef
    on AutoDisposeFutureProviderRef<List<AvailabilitySlot>> {
  /// The parameter `clinicId` of this provider.
  String get clinicId;

  /// The parameter `serviceId` of this provider.
  String get serviceId;

  /// The parameter `mode` of this provider.
  String get mode;
}

class _ClinicAvailabilitySlotsProviderElement
    extends AutoDisposeFutureProviderElement<List<AvailabilitySlot>>
    with ClinicAvailabilitySlotsRef {
  _ClinicAvailabilitySlotsProviderElement(super.provider);

  @override
  String get clinicId => (origin as ClinicAvailabilitySlotsProvider).clinicId;
  @override
  String get serviceId => (origin as ClinicAvailabilitySlotsProvider).serviceId;
  @override
  String get mode => (origin as ClinicAvailabilitySlotsProvider).mode;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

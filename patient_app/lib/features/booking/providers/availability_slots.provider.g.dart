// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_slots.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availabilitySlotsHash() => r'c45e844cbe8b2baf2cd4b500c90889de2ed4a450';

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

/// See also [availabilitySlots].
@ProviderFor(availabilitySlots)
const availabilitySlotsProvider = AvailabilitySlotsFamily();

/// See also [availabilitySlots].
class AvailabilitySlotsFamily
    extends Family<AsyncValue<List<AvailabilitySlot>>> {
  /// See also [availabilitySlots].
  const AvailabilitySlotsFamily();

  /// See also [availabilitySlots].
  AvailabilitySlotsProvider call(String doctorId, String mode) {
    return AvailabilitySlotsProvider(doctorId, mode);
  }

  @override
  AvailabilitySlotsProvider getProviderOverride(
    covariant AvailabilitySlotsProvider provider,
  ) {
    return call(provider.doctorId, provider.mode);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'availabilitySlotsProvider';
}

/// See also [availabilitySlots].
class AvailabilitySlotsProvider
    extends AutoDisposeFutureProvider<List<AvailabilitySlot>> {
  /// See also [availabilitySlots].
  AvailabilitySlotsProvider(String doctorId, String mode)
    : this._internal(
        (ref) => availabilitySlots(ref as AvailabilitySlotsRef, doctorId, mode),
        from: availabilitySlotsProvider,
        name: r'availabilitySlotsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$availabilitySlotsHash,
        dependencies: AvailabilitySlotsFamily._dependencies,
        allTransitiveDependencies:
            AvailabilitySlotsFamily._allTransitiveDependencies,
        doctorId: doctorId,
        mode: mode,
      );

  AvailabilitySlotsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.doctorId,
    required this.mode,
  }) : super.internal();

  final String doctorId;
  final String mode;

  @override
  Override overrideWith(
    FutureOr<List<AvailabilitySlot>> Function(AvailabilitySlotsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AvailabilitySlotsProvider._internal(
        (ref) => create(ref as AvailabilitySlotsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        doctorId: doctorId,
        mode: mode,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<AvailabilitySlot>> createElement() {
    return _AvailabilitySlotsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AvailabilitySlotsProvider &&
        other.doctorId == doctorId &&
        other.mode == mode;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, doctorId.hashCode);
    hash = _SystemHash.combine(hash, mode.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin AvailabilitySlotsRef
    on AutoDisposeFutureProviderRef<List<AvailabilitySlot>> {
  /// The parameter `doctorId` of this provider.
  String get doctorId;

  /// The parameter `mode` of this provider.
  String get mode;
}

class _AvailabilitySlotsProviderElement
    extends AutoDisposeFutureProviderElement<List<AvailabilitySlot>>
    with AvailabilitySlotsRef {
  _AvailabilitySlotsProviderElement(super.provider);

  @override
  String get doctorId => (origin as AvailabilitySlotsProvider).doctorId;
  @override
  String get mode => (origin as AvailabilitySlotsProvider).mode;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

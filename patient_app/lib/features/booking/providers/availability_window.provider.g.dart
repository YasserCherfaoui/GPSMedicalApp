// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_window.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$availabilityWindowNotifierHash() =>
    r'2b5993e059ddee231b7540199468cf8272c649ac';

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

abstract class _$AvailabilityWindowNotifier
    extends BuildlessAutoDisposeNotifier<AvailabilityWindow> {
  late final String doctorId;

  AvailabilityWindow build(String doctorId);
}

/// See also [AvailabilityWindowNotifier].
@ProviderFor(AvailabilityWindowNotifier)
const availabilityWindowNotifierProvider = AvailabilityWindowNotifierFamily();

/// See also [AvailabilityWindowNotifier].
class AvailabilityWindowNotifierFamily extends Family<AvailabilityWindow> {
  /// See also [AvailabilityWindowNotifier].
  const AvailabilityWindowNotifierFamily();

  /// See also [AvailabilityWindowNotifier].
  AvailabilityWindowNotifierProvider call(String doctorId) {
    return AvailabilityWindowNotifierProvider(doctorId);
  }

  @override
  AvailabilityWindowNotifierProvider getProviderOverride(
    covariant AvailabilityWindowNotifierProvider provider,
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
  String? get name => r'availabilityWindowNotifierProvider';
}

/// See also [AvailabilityWindowNotifier].
class AvailabilityWindowNotifierProvider
    extends
        AutoDisposeNotifierProviderImpl<
          AvailabilityWindowNotifier,
          AvailabilityWindow
        > {
  /// See also [AvailabilityWindowNotifier].
  AvailabilityWindowNotifierProvider(String doctorId)
    : this._internal(
        () => AvailabilityWindowNotifier()..doctorId = doctorId,
        from: availabilityWindowNotifierProvider,
        name: r'availabilityWindowNotifierProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$availabilityWindowNotifierHash,
        dependencies: AvailabilityWindowNotifierFamily._dependencies,
        allTransitiveDependencies:
            AvailabilityWindowNotifierFamily._allTransitiveDependencies,
        doctorId: doctorId,
      );

  AvailabilityWindowNotifierProvider._internal(
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
  AvailabilityWindow runNotifierBuild(
    covariant AvailabilityWindowNotifier notifier,
  ) {
    return notifier.build(doctorId);
  }

  @override
  Override overrideWith(AvailabilityWindowNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: AvailabilityWindowNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<
    AvailabilityWindowNotifier,
    AvailabilityWindow
  >
  createElement() {
    return _AvailabilityWindowNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AvailabilityWindowNotifierProvider &&
        other.doctorId == doctorId;
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
mixin AvailabilityWindowNotifierRef
    on AutoDisposeNotifierProviderRef<AvailabilityWindow> {
  /// The parameter `doctorId` of this provider.
  String get doctorId;
}

class _AvailabilityWindowNotifierProviderElement
    extends
        AutoDisposeNotifierProviderElement<
          AvailabilityWindowNotifier,
          AvailabilityWindow
        >
    with AvailabilityWindowNotifierRef {
  _AvailabilityWindowNotifierProviderElement(super.provider);

  @override
  String get doctorId =>
      (origin as AvailabilityWindowNotifierProvider).doctorId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

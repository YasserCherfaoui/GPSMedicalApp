// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_record_viewer.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$medicalRecordViewerHash() =>
    r'd96189aa6eb47f180f048782784b044a2f2b93ad';

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

abstract class _$MedicalRecordViewer
    extends BuildlessAutoDisposeAsyncNotifier<MedicalRecordViewerState> {
  late final String documentId;

  FutureOr<MedicalRecordViewerState> build(String documentId);
}

/// See also [MedicalRecordViewer].
@ProviderFor(MedicalRecordViewer)
const medicalRecordViewerProvider = MedicalRecordViewerFamily();

/// See also [MedicalRecordViewer].
class MedicalRecordViewerFamily
    extends Family<AsyncValue<MedicalRecordViewerState>> {
  /// See also [MedicalRecordViewer].
  const MedicalRecordViewerFamily();

  /// See also [MedicalRecordViewer].
  MedicalRecordViewerProvider call(String documentId) {
    return MedicalRecordViewerProvider(documentId);
  }

  @override
  MedicalRecordViewerProvider getProviderOverride(
    covariant MedicalRecordViewerProvider provider,
  ) {
    return call(provider.documentId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'medicalRecordViewerProvider';
}

/// See also [MedicalRecordViewer].
class MedicalRecordViewerProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          MedicalRecordViewer,
          MedicalRecordViewerState
        > {
  /// See also [MedicalRecordViewer].
  MedicalRecordViewerProvider(String documentId)
    : this._internal(
        () => MedicalRecordViewer()..documentId = documentId,
        from: medicalRecordViewerProvider,
        name: r'medicalRecordViewerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$medicalRecordViewerHash,
        dependencies: MedicalRecordViewerFamily._dependencies,
        allTransitiveDependencies:
            MedicalRecordViewerFamily._allTransitiveDependencies,
        documentId: documentId,
      );

  MedicalRecordViewerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.documentId,
  }) : super.internal();

  final String documentId;

  @override
  FutureOr<MedicalRecordViewerState> runNotifierBuild(
    covariant MedicalRecordViewer notifier,
  ) {
    return notifier.build(documentId);
  }

  @override
  Override overrideWith(MedicalRecordViewer Function() create) {
    return ProviderOverride(
      origin: this,
      override: MedicalRecordViewerProvider._internal(
        () => create()..documentId = documentId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        documentId: documentId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<
    MedicalRecordViewer,
    MedicalRecordViewerState
  >
  createElement() {
    return _MedicalRecordViewerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MedicalRecordViewerProvider &&
        other.documentId == documentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, documentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MedicalRecordViewerRef
    on AutoDisposeAsyncNotifierProviderRef<MedicalRecordViewerState> {
  /// The parameter `documentId` of this provider.
  String get documentId;
}

class _MedicalRecordViewerProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          MedicalRecordViewer,
          MedicalRecordViewerState
        >
    with MedicalRecordViewerRef {
  _MedicalRecordViewerProviderElement(super.provider);

  @override
  String get documentId => (origin as MedicalRecordViewerProvider).documentId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

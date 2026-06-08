// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messaging_thread.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$messagingThreadHash() => r'f8d576d903745f25652f3058295a48f5538c4e13';

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

abstract class _$MessagingThread
    extends BuildlessAutoDisposeAsyncNotifier<MessagingThreadState> {
  late final String threadId;

  FutureOr<MessagingThreadState> build(String threadId);
}

/// See also [MessagingThread].
@ProviderFor(MessagingThread)
const messagingThreadProvider = MessagingThreadFamily();

/// See also [MessagingThread].
class MessagingThreadFamily extends Family<AsyncValue<MessagingThreadState>> {
  /// See also [MessagingThread].
  const MessagingThreadFamily();

  /// See also [MessagingThread].
  MessagingThreadProvider call(String threadId) {
    return MessagingThreadProvider(threadId);
  }

  @override
  MessagingThreadProvider getProviderOverride(
    covariant MessagingThreadProvider provider,
  ) {
    return call(provider.threadId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'messagingThreadProvider';
}

/// See also [MessagingThread].
class MessagingThreadProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          MessagingThread,
          MessagingThreadState
        > {
  /// See also [MessagingThread].
  MessagingThreadProvider(String threadId)
    : this._internal(
        () => MessagingThread()..threadId = threadId,
        from: messagingThreadProvider,
        name: r'messagingThreadProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$messagingThreadHash,
        dependencies: MessagingThreadFamily._dependencies,
        allTransitiveDependencies:
            MessagingThreadFamily._allTransitiveDependencies,
        threadId: threadId,
      );

  MessagingThreadProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.threadId,
  }) : super.internal();

  final String threadId;

  @override
  FutureOr<MessagingThreadState> runNotifierBuild(
    covariant MessagingThread notifier,
  ) {
    return notifier.build(threadId);
  }

  @override
  Override overrideWith(MessagingThread Function() create) {
    return ProviderOverride(
      origin: this,
      override: MessagingThreadProvider._internal(
        () => create()..threadId = threadId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        threadId: threadId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<MessagingThread, MessagingThreadState>
  createElement() {
    return _MessagingThreadProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MessagingThreadProvider && other.threadId == threadId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, threadId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MessagingThreadRef
    on AutoDisposeAsyncNotifierProviderRef<MessagingThreadState> {
  /// The parameter `threadId` of this provider.
  String get threadId;
}

class _MessagingThreadProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          MessagingThread,
          MessagingThreadState
        >
    with MessagingThreadRef {
  _MessagingThreadProviderElement(super.provider);

  @override
  String get threadId => (origin as MessagingThreadProvider).threadId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

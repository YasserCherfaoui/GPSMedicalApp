import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

const _messagePageSize = 50;
const _pollInterval = Duration(seconds: 30);

class SpecialistMessagingThreadState {
  const SpecialistMessagingThreadState({
    required this.thread,
    required this.messages,
    required this.hasOlder,
    this.isLoadingOlder = false,
    this.isSending = false,
  });

  final Thread thread;
  final List<ThreadDisplayMessage> messages;
  final bool hasOlder;
  final bool isLoadingOlder;
  final bool isSending;

  SpecialistMessagingThreadState copyWith({
    Thread? thread,
    List<ThreadDisplayMessage>? messages,
    bool? hasOlder,
    bool? isLoadingOlder,
    bool? isSending,
  }) {
    return SpecialistMessagingThreadState(
      thread: thread ?? this.thread,
      messages: messages ?? this.messages,
      hasOlder: hasOlder ?? this.hasOlder,
      isLoadingOlder: isLoadingOlder ?? this.isLoadingOlder,
      isSending: isSending ?? this.isSending,
    );
  }
}

final specialistMessagingThreadProvider = AsyncNotifierProvider.family<
    SpecialistMessagingThreadNotifier,
    SpecialistMessagingThreadState,
    String
>(SpecialistMessagingThreadNotifier.new);

class SpecialistMessagingThreadNotifier
    extends FamilyAsyncNotifier<SpecialistMessagingThreadState, String> {
  Timer? _pollTimer;
  int _pendingCounter = 0;

  @override
  Future<SpecialistMessagingThreadState> build(String threadId) async {
    ref.onDispose(() => _pollTimer?.cancel());
    _pollTimer = Timer.periodic(_pollInterval, (_) => unawaited(pollLatest()));

    ref.listen<AsyncValue<MessagingRealtimeEvent>>(
      messagingRealtimeEventsProvider,
      (_, next) {
        next.whenData((event) {
          if (event.threadId != threadId) return;
          final message = event.toMessage();
          if (message != null) {
            unawaited(_mergeIncomingMessage(message));
          }
        });
      },
    );

    final repo = ref.read(messagingRepositoryProvider);
    final thread = await repo.getThread(threadId);
    final messages = await repo.listMessages(threadId, limit: _messagePageSize);
    final display = messages.map(ThreadDisplayMessage.fromMessage).toList();
    await _markIncomingRead(display);

    return SpecialistMessagingThreadState(
      thread: thread,
      messages: display,
      hasOlder: messages.length >= _messagePageSize,
    );
  }

  Future<void> _mergeIncomingMessage(Message message) async {
    final current = state.valueOrNull;
    if (current == null) return;
    final incoming = ThreadDisplayMessage.fromMessage(message);
    final merged = _mergeMessages(
      current.messages.where((m) => !m.isPending).toList(),
      [incoming],
    );
    await _markIncomingRead(merged);
    state = AsyncData(current.copyWith(messages: merged));
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => build(arg));
  }

  Future<void> pollLatest() async {
    final current = state.valueOrNull;
    if (current == null) return;
    try {
      final repo = ref.read(messagingRepositoryProvider);
      final latest = await repo.listMessages(arg, limit: _messagePageSize);
      final merged = _mergeMessages(
        current.messages.where((m) => !m.isPending).toList(),
        latest.map(ThreadDisplayMessage.fromMessage).toList(),
      );
      await _markIncomingRead(merged);
      state = AsyncData(current.copyWith(messages: merged));
    } catch (_) {}
  }

  Future<void> loadOlder() async {
    final current = state.valueOrNull;
    if (current == null ||
        !current.hasOlder ||
        current.isLoadingOlder ||
        current.messages.isEmpty) {
      return;
    }
    final oldest = current.messages.first;
    state = AsyncData(current.copyWith(isLoadingOlder: true));
    try {
      final repo = ref.read(messagingRepositoryProvider);
      final older = await repo.listMessages(
        arg,
        before: oldest.createdAt,
        limit: _messagePageSize,
      );
      final merged = _mergeMessages(
        older.map(ThreadDisplayMessage.fromMessage).toList(),
        current.messages,
      );
      state = AsyncData(
        current.copyWith(
          messages: merged,
          hasOlder: older.length >= _messagePageSize,
          isLoadingOlder: false,
        ),
      );
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingOlder: false));
      rethrow;
    }
  }

  Future<void> send({
    String? body,
    List<String>? attachmentDocumentIds,
  }) async {
    final trimmed = body?.trim() ?? '';
    final attachments = attachmentDocumentIds ?? const [];
    if (trimmed.isEmpty && attachments.isEmpty) return;

    final current = state.valueOrNull;
    if (current == null) return;

    final currentUserId = await _currentUserId();
    final pendingId = 'pending-${++_pendingCounter}';
    final pending = ThreadDisplayMessage(
      id: pendingId,
      senderId: currentUserId,
      body: trimmed,
      createdAt: DateTime.now().toUtc(),
      attachments: attachments.isEmpty
          ? null
          : BuiltList<MessageAttachmentsInner>(
              attachments.map(
                (id) => MessageAttachmentsInner((b) => b..documentId = id),
              ),
            ),
      isPending: true,
    );

    state = AsyncData(
      current.copyWith(messages: [...current.messages, pending], isSending: true),
    );

    try {
      final repo = ref.read(messagingRepositoryProvider);
      final sent = await repo.sendMessage(
        arg,
        body: trimmed.isEmpty ? null : trimmed,
        attachmentDocumentIds: attachments.isEmpty ? null : attachments,
      );
      final latest = state.valueOrNull;
      if (latest == null) return;
      final replaced = latest.messages
          .map(
            (m) => m.id == pendingId
                ? ThreadDisplayMessage.fromMessage(sent)
                : m,
          )
          .toList();
      state = AsyncData(latest.copyWith(messages: replaced, isSending: false));
    } catch (_) {
      final latest = state.valueOrNull;
      if (latest == null) return;
      final failed = latest.messages
          .map(
            (m) => m.id == pendingId
                ? m.copyWith(isPending: false, sendFailed: true)
                : m,
          )
          .toList();
      state = AsyncData(latest.copyWith(messages: failed, isSending: false));
      rethrow;
    }
  }

  List<ThreadDisplayMessage> _mergeMessages(
    List<ThreadDisplayMessage> older,
    List<ThreadDisplayMessage> newer,
  ) {
    final byId = <String, ThreadDisplayMessage>{};
    for (final message in [...older, ...newer]) {
      if (message.id.isEmpty) continue;
      byId[message.id] = message;
    }
    return byId.values.toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
  }

  Future<String> _currentUserId() async {
    final response = await ref.read(gpsMedicalClientProvider).auth.getMe();
    final id = response.data?.id;
    if (id == null || id.isEmpty) {
      throw StateError('Missing current user id');
    }
    return id;
  }

  Future<void> _markIncomingRead(List<ThreadDisplayMessage> messages) async {
    final currentUserId = await _currentUserId();
    final repo = ref.read(messagingRepositoryProvider);
    for (final message in messages) {
      if (message.senderId == currentUserId) continue;
      if (message.readAt != null) continue;
      if (message.id.isEmpty || message.id.startsWith('pending-')) continue;
      unawaited(repo.markMessageRead(message.id));
    }
  }
}

class SpecialistMessagingThreadsListState {
  const SpecialistMessagingThreadsListState({
    required this.threads,
    required this.page,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  final List<MessagingThreadItem> threads;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;

  SpecialistMessagingThreadsListState copyWith({
    List<MessagingThreadItem>? threads,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return SpecialistMessagingThreadsListState(
      threads: threads ?? this.threads,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

final specialistMessagingThreadsListProvider =
    AsyncNotifierProvider<
      SpecialistMessagingThreadsListNotifier,
      SpecialistMessagingThreadsListState
    >(SpecialistMessagingThreadsListNotifier.new);

class SpecialistMessagingThreadsListNotifier
    extends AsyncNotifier<SpecialistMessagingThreadsListState> {
  @override
  Future<SpecialistMessagingThreadsListState> build() =>
      _fetchPage(1, append: false);

  Future<SpecialistMessagingThreadsListState> _fetchPage(
    int page, {
    required bool append,
  }) async {
    final repo = ref.read(messagingRepositoryProvider);
    final result = await repo.listThreads(page: page);
    final current = state.valueOrNull;
    return SpecialistMessagingThreadsListState(
      threads: append && current != null
          ? [...current.threads, ...result.threads]
          : result.threads,
      page: page,
      hasMore: result.hasMore,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = AsyncData(await _fetchPage(1, append: false));
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;
    state = AsyncData(current.copyWith(isLoadingMore: true));
    state = AsyncData(await _fetchPage(current.page + 1, append: true));
  }
}

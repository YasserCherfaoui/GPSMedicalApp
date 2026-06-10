import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../booking/providers/doctor_cache.provider.dart';
import '../../profile/providers/patient_profile.provider.dart';

part 'messaging_thread.provider.g.dart';

const _messagePageSize = 50;
const _pollInterval = Duration(seconds: 30);

class MessagingThreadState {
  const MessagingThreadState({
    required this.thread,
    required this.doctor,
    required this.messages,
    required this.hasOlder,
    this.isLoadingOlder = false,
    this.isSending = false,
  });

  final Thread thread;
  final Doctor doctor;
  final List<ThreadDisplayMessage> messages;
  final bool hasOlder;
  final bool isLoadingOlder;
  final bool isSending;

  MessagingThreadState copyWith({
    Thread? thread,
    Doctor? doctor,
    List<ThreadDisplayMessage>? messages,
    bool? hasOlder,
    bool? isLoadingOlder,
    bool? isSending,
  }) {
    return MessagingThreadState(
      thread: thread ?? this.thread,
      doctor: doctor ?? this.doctor,
      messages: messages ?? this.messages,
      hasOlder: hasOlder ?? this.hasOlder,
      isLoadingOlder: isLoadingOlder ?? this.isLoadingOlder,
      isSending: isSending ?? this.isSending,
    );
  }
}

@riverpod
class MessagingThread extends _$MessagingThread {
  Timer? _pollTimer;
  int _pendingCounter = 0;

  @override
  Future<MessagingThreadState> build(String threadId) async {
    ref.onDispose(() => _pollTimer?.cancel());
    _pollTimer = Timer.periodic(_pollInterval, (_) => unawaited(pollLatest()));

    final repo = ref.read(messagingRepositoryProvider);
    final thread = await repo.getThread(threadId);
    final doctorId = thread.doctorId;
    if (doctorId == null) {
      throw StateError('Thread missing doctor_id');
    }
    final doctor = await ref.watch(cachedDoctorProvider(doctorId).future);
    final messages = await repo.listMessages(threadId, limit: _messagePageSize);
    final display = messages.map(ThreadDisplayMessage.fromMessage).toList();
    await _markIncomingRead(display);

    return MessagingThreadState(
      thread: thread,
      doctor: doctor,
      messages: display,
      hasOlder: messages.length >= _messagePageSize,
    );
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }

  Future<void> pollLatest() async {
    final current = state.value;
    if (current == null) return;

    try {
      final repo = ref.read(messagingRepositoryProvider);
      final latest = await repo.listMessages(threadId, limit: _messagePageSize);
      final merged = _mergeMessages(
        current.messages.where((m) => !m.isPending).toList(),
        latest.map(ThreadDisplayMessage.fromMessage).toList(),
      );
      await _markIncomingRead(merged);
      state = AsyncData(current.copyWith(messages: merged));
    } catch (_) {
      // Polling is best-effort in Phase 2.
    }
  }

  Future<void> loadOlder() async {
    final current = state.value;
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
        threadId,
        before: oldest.createdAt,
        limit: _messagePageSize,
      );
      final olderDisplay = older.map(ThreadDisplayMessage.fromMessage).toList();
      final merged = _mergeMessages(olderDisplay, current.messages);
      final next = current.copyWith(
        messages: merged,
        hasOlder: older.length >= _messagePageSize,
        isLoadingOlder: false,
      );
      state = AsyncData(next);
      await _markIncomingRead(merged);
    } catch (_) {
      state = AsyncData(current.copyWith(isLoadingOlder: false));
      rethrow;
    }
  }

  Future<void> send({String? body, List<String>? attachmentDocumentIds}) async {
    final trimmed = body?.trim() ?? '';
    final attachments = attachmentDocumentIds ?? const [];
    if (trimmed.isEmpty && attachments.isEmpty) return;

    final current = state.value;
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
      current.copyWith(
        messages: [...current.messages, pending],
        isSending: true,
      ),
    );

    try {
      final repo = ref.read(messagingRepositoryProvider);
      final sent = await repo.sendMessage(
        threadId,
        body: trimmed.isEmpty ? null : trimmed,
        attachmentDocumentIds: attachments.isEmpty ? null : attachments,
      );
      final sentDisplay = ThreadDisplayMessage.fromMessage(sent);
      final latest = state.value;
      if (latest == null) return;

      final replaced = latest.messages
          .map((m) => m.id == pendingId ? sentDisplay : m)
          .toList();
      state = AsyncData(latest.copyWith(messages: replaced, isSending: false));
    } catch (_) {
      final latest = state.value;
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
    final merged = byId.values.toList()
      ..sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return merged;
  }

  Future<String> _currentUserId() async {
    final patient = await ref.read(patientProfileProvider.future);
    final id = patient.id;
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

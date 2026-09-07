import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'messaging_realtime.provider.dart';
import 'messaging_websocket_client.dart';

/// Online / offline only (D-39.3 — no last-seen).
enum PresenceStatus { online, offline }

PresenceStatus? parsePresenceStatus(Object? raw) {
  if (raw is! String) return null;
  return switch (raw) {
    'online' => PresenceStatus.online,
    'offline' => PresenceStatus.offline,
    _ => null,
  };
}

class ThreadTypingState {
  const ThreadTypingState({required this.userId, required this.expiresAt});

  final String userId;
  final DateTime expiresAt;

  bool get isActive => DateTime.now().toUtc().isBefore(expiresAt.toUtc());
}

/// Live presence map keyed by auth [user_id] from `presence.changed` WS events.
final presenceByUserIdProvider =
    NotifierProvider<PresenceByUserIdNotifier, Map<String, PresenceStatus>>(
      PresenceByUserIdNotifier.new,
    );

class PresenceByUserIdNotifier extends Notifier<Map<String, PresenceStatus>> {
  @override
  Map<String, PresenceStatus> build() {
    ref.listen<AsyncValue<MessagingRealtimeEvent>>(
      messagingRealtimeEventsProvider,
      (_, next) {
        next.whenData(_onEvent);
      },
    );
    return const {};
  }

  void _onEvent(MessagingRealtimeEvent event) {
    if (event.type != 'presence.changed') return;
    final userId = event.payload['user_id'] as String?;
    final presence = parsePresenceStatus(event.payload['presence']);
    if (userId == null || userId.isEmpty || presence == null) return;
    state = {...state, userId: presence};
  }

  PresenceStatus? ofUser(String? userId) {
    if (userId == null || userId.isEmpty) return null;
    return state[userId];
  }
}

/// Peer typing indicator for a thread (`thread.typing`), cleared at [expires_at].
final threadTypingProvider = NotifierProvider.family<
  ThreadTypingNotifier,
  ThreadTypingState?,
  String
>(ThreadTypingNotifier.new);

class ThreadTypingNotifier extends FamilyNotifier<ThreadTypingState?, String> {
  Timer? _clearTimer;

  @override
  ThreadTypingState? build(String threadId) {
    ref.onDispose(() => _clearTimer?.cancel());
    ref.listen<AsyncValue<MessagingRealtimeEvent>>(
      messagingRealtimeEventsProvider,
      (_, next) {
        next.whenData((event) => _onEvent(threadId, event));
      },
    );
    return null;
  }

  void _onEvent(String threadId, MessagingRealtimeEvent event) {
    if (event.type != 'thread.typing') return;
    if (event.threadId != threadId) return;
    final userId = event.payload['user_id'] as String?;
    final expiresRaw = event.payload['expires_at'] as String?;
    if (userId == null || userId.isEmpty || expiresRaw == null) return;
    final expiresAt = DateTime.tryParse(expiresRaw);
    if (expiresAt == null) return;

    _clearTimer?.cancel();
    final typing = ThreadTypingState(userId: userId, expiresAt: expiresAt);
    state = typing.isActive ? typing : null;
    if (state == null) return;

    final delay = expiresAt.toUtc().difference(DateTime.now().toUtc());
    if (delay.isNegative) {
      state = null;
      return;
    }
    _clearTimer = Timer(delay, () {
      final current = state;
      if (current == null || current.userId != userId) return;
      if (!current.isActive) {
        state = null;
      }
    });
  }
}

/// Convenience: presence for a single user id.
final userPresenceProvider = Provider.family<PresenceStatus?, String?>((
  ref,
  userId,
) {
  if (userId == null || userId.isEmpty) return null;
  return ref.watch(presenceByUserIdProvider)[userId];
});

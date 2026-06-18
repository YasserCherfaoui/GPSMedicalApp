import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'messaging_websocket_client.dart';

final messagingWebSocketClientProvider = Provider<MessagingWebSocketClient?>((
  ref,
) {
  final auth = ref.watch(authSessionProvider);
  if (!auth.isAuthenticated) return null;

  final tokenStore = ref.watch(tokenStoreProvider);
  final client = ref.watch(gpsMedicalClientProvider);
  final accessToken = tokenStore.accessToken;
  if (accessToken == null || accessToken.isEmpty) return null;

  final ws = MessagingWebSocketClient(
    v1BaseUrl: client.v1BaseUrl,
    accessToken: accessToken,
  );
  unawaited(ws.connect());
  ref.onDispose(ws.disconnect);
  return ws;
});

final messagingRealtimeEventsProvider = StreamProvider<MessagingRealtimeEvent>((
  ref,
) {
  final ws = ref.watch(messagingWebSocketClientProvider);
  if (ws == null) {
    return const Stream.empty();
  }
  return ws.events;
});

/// Keeps the messaging WebSocket connected while the user session is active.
class MessagingRealtimeLifecycle extends ConsumerWidget {
  const MessagingRealtimeLifecycle({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(messagingWebSocketClientProvider);
    return child;
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:gps_medical_api/gps_medical_api.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Server → client envelope from `GET /v1/messaging/ws` (ADR 0013).
class MessagingRealtimeEvent {
  const MessagingRealtimeEvent({
    required this.type,
    required this.threadId,
    required this.payload,
  });

  final String type;
  final String threadId;
  final Map<String, dynamic> payload;

  factory MessagingRealtimeEvent.fromJson(Map<String, dynamic> json) {
    final payload = json['payload'];
    return MessagingRealtimeEvent(
      type: json['type'] as String? ?? '',
      threadId: json['thread_id'] as String? ?? '',
      payload: payload is Map<String, dynamic>
          ? payload
          : payload is Map
          ? payload.map((k, v) => MapEntry(k.toString(), v))
          : const {},
    );
  }

  Message? toMessage() {
    if (type != 'message.new') return null;
    try {
      return standardSerializers.deserializeWith(
        Message.serializer,
        payload,
      );
    } catch (_) {
      return null;
    }
  }
}

/// Builds a `ws`/`wss` URI for the messaging gateway from the v1 REST base URL.
Uri buildMessagingWebSocketUri({
  required String v1BaseUrl,
  required String accessToken,
}) {
  final rest = Uri.parse(v1BaseUrl);
  final wsScheme = switch (rest.scheme) {
    'https' => 'wss',
    'http' => 'ws',
    'wss' => 'wss',
    'ws' => 'ws',
    _ => 'ws',
  };
  final basePath = rest.path.replaceAll(RegExp(r'/+$'), '');
  return rest.replace(
    scheme: wsScheme,
    path: '$basePath/messaging/ws',
    queryParameters: {'token': accessToken},
    fragment: null,
  );
}

/// WebSocket transport for messaging with reconnect backoff (ADR 0013).
class MessagingWebSocketClient {
  MessagingWebSocketClient({
    required this.v1BaseUrl,
    required this.accessToken,
  });

  final String v1BaseUrl;
  final String accessToken;

  final _eventsController = StreamController<MessagingRealtimeEvent>.broadcast();
  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  Timer? _reconnectTimer;
  bool _disposed = false;
  int _attempt = 0;

  Stream<MessagingRealtimeEvent> get events => _eventsController.stream;

  bool get isConnected => _channel != null;

  Future<void> connect() async {
    if (_disposed) return;
    await _disconnectChannel();
    final uri = buildMessagingWebSocketUri(
      v1BaseUrl: v1BaseUrl,
      accessToken: accessToken,
    );
    try {
      final channel = WebSocketChannel.connect(uri);
      await channel.ready.timeout(const Duration(seconds: 10));
      if (_disposed) {
        await channel.sink.close();
        return;
      }
      _channel = channel;
      _subscription = channel.stream.listen(
        _onData,
        onError: _onConnectionLost,
        onDone: _onConnectionLost,
        cancelOnError: true,
      );
      _attempt = 0;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        debugPrint(
          'Messaging WS connect failed (attempt $_attempt): $e\n$stackTrace',
        );
      }
      _scheduleReconnect();
    }
  }

  void _onConnectionLost([Object? error, StackTrace? stackTrace]) {
    if (kDebugMode && error != null) {
      debugPrint('Messaging WS disconnected: $error');
    }
    _scheduleReconnect();
  }

  void _onData(dynamic data) {
    if (data is! String) return;
    try {
      final decoded = jsonDecode(data);
      if (decoded is! Map<String, dynamic>) return;
      _eventsController.add(MessagingRealtimeEvent.fromJson(decoded));
    } catch (_) {
      // Ignore malformed frames; REST remains source of truth.
    }
  }

  void _scheduleReconnect() {
    if (_disposed) return;
    unawaited(_disconnectChannel());
    _reconnectTimer?.cancel();
    _attempt++;
    final delay = Duration(
      seconds: (_attempt.clamp(1, 6) * 2).clamp(2, 30),
    );
    _reconnectTimer = Timer(delay, () {
      unawaited(connect().catchError((_) {}));
    });
  }

  Future<void> _disconnectChannel() async {
    await _subscription?.cancel();
    _subscription = null;
    try {
      await _channel?.sink.close();
    } catch (_) {
      // Channel may already be closed after a failed handshake.
    }
    _channel = null;
  }

  Future<void> disconnect() async {
    _disposed = true;
    _reconnectTimer?.cancel();
    await _disconnectChannel();
    await _eventsController.close();
  }
}

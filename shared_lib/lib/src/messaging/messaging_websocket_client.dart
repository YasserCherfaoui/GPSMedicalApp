import 'dart:async';
import 'dart:convert';

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
    final uri = _wsUri();
    try {
      _channel = WebSocketChannel.connect(uri);
      _subscription = _channel!.stream.listen(
        _onData,
        onError: (_) => _scheduleReconnect(),
        onDone: _scheduleReconnect,
        cancelOnError: true,
      );
      _attempt = 0;
    } catch (_) {
      _scheduleReconnect();
    }
  }

  Uri _wsUri() {
    final httpBase = v1BaseUrl.replaceFirst(RegExp(r'^http'), 'ws');
    return Uri.parse('$httpBase/messaging/ws').replace(
      queryParameters: {'token': accessToken},
    );
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
    _reconnectTimer = Timer(delay, connect);
  }

  Future<void> _disconnectChannel() async {
    await _subscription?.cancel();
    _subscription = null;
    await _channel?.sink.close();
    _channel = null;
  }

  Future<void> disconnect() async {
    _disposed = true;
    _reconnectTimer?.cancel();
    await _disconnectChannel();
    await _eventsController.close();
  }
}

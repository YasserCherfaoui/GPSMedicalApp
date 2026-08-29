import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class QueuedAnamnesisAnswer {
  const QueuedAnamnesisAnswer({
    required this.sessionId,
    required this.questionId,
    required this.value,
    required this.clientNonce,
    required this.answeredAt,
  });

  final String sessionId;
  final String questionId;
  final Map<String, dynamic> value;
  final String clientNonce;
  final DateTime answeredAt;

  Map<String, dynamic> toJson() => {
        'session_id': sessionId,
        'question_id': questionId,
        'value': value,
        'client_nonce': clientNonce,
        'answered_at': answeredAt.toUtc().toIso8601String(),
      };

  factory QueuedAnamnesisAnswer.fromJson(Map<String, dynamic> json) {
    return QueuedAnamnesisAnswer(
      sessionId: json['session_id'] as String,
      questionId: json['question_id'] as String,
      value: Map<String, dynamic>.from(json['value'] as Map),
      clientNonce: json['client_nonce'] as String,
      answeredAt: DateTime.parse(json['answered_at'] as String).toUtc(),
    );
  }
}

/// Offline answer queue (cahier §7.3 degraded mode).
class AnamnesisAnswerQueue {
  AnamnesisAnswerQueue({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  static const _key = 'anamnesis_answer_queue_v1';

  final FlutterSecureStorage _storage;

  Future<List<QueuedAnamnesisAnswer>> readAll() async {
    final raw = await _storage.read(key: _key);
    if (raw == null || raw.isEmpty) return const [];
    final list = jsonDecode(raw) as List<dynamic>;
    return list
        .map(
          (e) => QueuedAnamnesisAnswer.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }

  Future<void> enqueue(QueuedAnamnesisAnswer item) async {
    final items = await readAll();
    final filtered = [
      for (final existing in items)
        if (existing.clientNonce != item.clientNonce) existing,
      item,
    ];
    await _storage.write(key: _key, value: jsonEncode(filtered));
  }

  Future<void> removeNonce(String clientNonce) async {
    final items = await readAll();
    final filtered = [
      for (final item in items)
        if (item.clientNonce != clientNonce) item,
    ];
    if (filtered.isEmpty) {
      await _storage.delete(key: _key);
      return;
    }
    await _storage.write(key: _key, value: jsonEncode(filtered));
  }
}

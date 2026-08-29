import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/anamnesis/services/anamnesis_answer_queue.dart';

void main() {
  test('QueuedAnamnesisAnswer json roundtrip', () {
    final item = QueuedAnamnesisAnswer(
      sessionId: 's1',
      questionId: 'q1',
      value: {'type': 'single_choice', 'option_id': 'mechanical'},
      clientNonce: 'nonce-1',
      answeredAt: DateTime.utc(2026, 8, 29),
    );

    final restored = QueuedAnamnesisAnswer.fromJson(item.toJson());
    expect(restored.sessionId, item.sessionId);
    expect(restored.clientNonce, item.clientNonce);
    expect(restored.value['option_id'], 'mechanical');
  });
}

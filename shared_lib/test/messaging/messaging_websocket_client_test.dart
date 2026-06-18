import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  test('MessagingRealtimeEvent parses message.new payload', () {
    final event = MessagingRealtimeEvent.fromJson({
      'type': 'message.new',
      'thread_id': '00000000-0000-4000-8000-000000000001',
      'payload': {
        'id': '00000000-0000-4000-8000-000000000002',
        'thread_id': '00000000-0000-4000-8000-000000000001',
        'sender_id': '00000000-0000-4000-8000-000000000003',
        'body': 'Bonjour',
        'created_at': '2026-06-16T10:00:00Z',
      },
    });

    expect(event.type, 'message.new');
    expect(event.threadId, '00000000-0000-4000-8000-000000000001');
    final message = event.toMessage();
    expect(message, isNotNull);
    expect(message!.body, 'Bonjour');
  });
}

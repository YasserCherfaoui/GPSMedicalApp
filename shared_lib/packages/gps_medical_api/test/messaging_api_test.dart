import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for MessagingApi
void main() {
  final instance = GpsMedicalApi().getMessagingApi();

  group(MessagingApi, () {
    // Envoi d'un message
    //
    //Future<Message> createMessagingThreadMessage(String threadId, MessageCreate messageCreate) async
    test('test createMessagingThreadMessage', () async {
      // TODO
    });

    // Détail d'une conversation
    //
    //Future<Thread> getMessagingThread(String threadId) async
    test('test getMessagingThread', () async {
      // TODO
    });

    // Messages d'une conversation
    //
    //Future<BuiltList<Message>> listMessagingThreadMessages(String threadId, { DateTime before, int limit }) async
    test('test listMessagingThreadMessages', () async {
      // TODO
    });

    // Liste des conversations
    //
    //Future<PaginatedThreads> listMessagingThreads({ int page, int pageSize }) async
    test('test listMessagingThreads', () async {
      // TODO
    });

    // Marquer un message comme lu
    //
    //Future markMessagingMessageRead(String messageId) async
    test('test markMessagingMessageRead', () async {
      // TODO
    });

  });
}

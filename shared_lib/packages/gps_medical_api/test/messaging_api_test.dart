import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for MessagingApi
void main() {
  final instance = GpsMedicalApi().getMessagingApi();

  group(MessagingApi, () {
    // Marquer un message comme lu
    //
    //Future messagingMessagesMessageIdReadPost(String messageId) async
    test('test messagingMessagesMessageIdReadPost', () async {
      // TODO
    });

    // Liste des conversations
    //
    //Future<PaginatedThreads> messagingThreadsGet({ int page, int pageSize }) async
    test('test messagingThreadsGet', () async {
      // TODO
    });

    // Détail d'une conversation
    //
    //Future<Thread> messagingThreadsThreadIdGet(String threadId) async
    test('test messagingThreadsThreadIdGet', () async {
      // TODO
    });

    // Messages d'une conversation
    //
    //Future<BuiltList<Message>> messagingThreadsThreadIdMessagesGet(String threadId, { DateTime before, int limit }) async
    test('test messagingThreadsThreadIdMessagesGet', () async {
      // TODO
    });

    // Envoi d'un message
    //
    //Future<Message> messagingThreadsThreadIdMessagesPost(String threadId, MessageCreate messageCreate) async
    test('test messagingThreadsThreadIdMessagesPost', () async {
      // TODO
    });

  });
}

import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for MessagingApi
void main() {
  final instance = GpsMedicalApi().getMessagingApi();

  group(MessagingApi, () {
    // Canal WebSocket temps réel (messages et accusés de lecture)
    //
    // Upgrade WebSocket. Authentification via en-tête `Authorization: Bearer` ou paramètre `token` (JWT access). Réservé aux rôles `patient` et `specialist` avec participation au fil (même RBAC que B-9.1).  Événements serveur → client (`MessagingRealtimeEvent`) : - `message.new` — nouveau message dans un fil participé ; - `message.read` — accusé de lecture.  **Dégradation gracieuse :** REST reste la source de vérité pour l'historique et l'envoi ; si le WS est indisponible, les clients basculent sur le polling REST (Phase 2) sans perte. Voir ADR 0013 pour la sémantique de livraison (at-least-once côté push). 
    //
    //Future connectMessagingWebSocket({ String token }) async
    test('test connectMessagingWebSocket', () async {
      // TODO
    });

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

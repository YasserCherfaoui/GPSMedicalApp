import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for NotificationsApi
void main() {
  final instance = GpsMedicalApi().getNotificationsApi();

  group(NotificationsApi, () {
    // Désinscription d'un device
    //
    //Future deleteNotificationDevice(String deviceId) async
    test('test deleteNotificationDevice', () async {
      // TODO
    });

    // Préférences de notification
    //
    //Future<NotificationPreferences> getNotificationPreferences() async
    test('test getNotificationPreferences', () async {
      // TODO
    });

    // Liste des notifications de l'utilisateur
    //
    //Future<PaginatedNotifications> listNotifications({ bool unreadOnly, int page, int pageSize }) async
    test('test listNotifications', () async {
      // TODO
    });

    // Marquer toutes les notifications comme lues
    //
    //Future markAllNotificationsRead() async
    test('test markAllNotificationsRead', () async {
      // TODO
    });

    // Marquer comme lu
    //
    //Future markNotificationRead(String notificationId) async
    test('test markNotificationRead', () async {
      // TODO
    });

    // Enregistrement d'un device pour les push (FCM)
    //
    //Future<Device> registerNotificationDevice(DeviceRegistration deviceRegistration) async
    test('test registerNotificationDevice', () async {
      // TODO
    });

    // Mise à jour des préférences
    //
    //Future<NotificationPreferences> updateNotificationPreferences(NotificationPreferences notificationPreferences) async
    test('test updateNotificationPreferences', () async {
      // TODO
    });

  });
}

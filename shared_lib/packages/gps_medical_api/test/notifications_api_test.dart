import 'package:test/test.dart';
import 'package:gps_medical_api/gps_medical_api.dart';


/// tests for NotificationsApi
void main() {
  final instance = GpsMedicalApi().getNotificationsApi();

  group(NotificationsApi, () {
    // Désinscription d'un device
    //
    //Future notificationsDevicesDeviceIdDelete(String deviceId) async
    test('test notificationsDevicesDeviceIdDelete', () async {
      // TODO
    });

    // Enregistrement d'un device pour les push (FCM)
    //
    //Future<Device> notificationsDevicesPost(DeviceRegistration deviceRegistration) async
    test('test notificationsDevicesPost', () async {
      // TODO
    });

    // Liste des notifications de l'utilisateur
    //
    //Future<PaginatedNotifications> notificationsGet({ bool unreadOnly, int page, int pageSize }) async
    test('test notificationsGet', () async {
      // TODO
    });

    // Marquer comme lu
    //
    //Future notificationsNotificationIdReadPost(String notificationId) async
    test('test notificationsNotificationIdReadPost', () async {
      // TODO
    });

    // Préférences de notification
    //
    //Future<NotificationPreferences> notificationsPreferencesGet() async
    test('test notificationsPreferencesGet', () async {
      // TODO
    });

    // Mise à jour des préférences
    //
    //Future<NotificationPreferences> notificationsPreferencesPut(NotificationPreferences notificationPreferences) async
    test('test notificationsPreferencesPut', () async {
      // TODO
    });

    // Marquer toutes les notifications comme lues
    //
    //Future notificationsReadAllPost() async
    test('test notificationsReadAllPost', () async {
      // TODO
    });

  });
}

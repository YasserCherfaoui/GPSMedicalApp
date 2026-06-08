import 'package:gps_medical_shared/gps_medical_shared.dart';

class NotificationsRepository {
  NotificationsRepository(this._client);

  final GpsMedicalClient _client;

  Future<int> countUnread() async {
    final response = await _client.notifications.notificationsGet(
      unreadOnly: true,
      page: 1,
      pageSize: 1,
    );
    return response.data?.meta?.total ?? 0;
  }

  Future<({List<Notification> items, bool hasMore})> list({
    required int page,
    int pageSize = 20,
  }) async {
    final response = await _client.notifications.notificationsGet(
      page: page,
      pageSize: pageSize,
    );
    final paginated = response.data;
    final items = paginated?.data?.toList() ?? [];
    final meta = paginated?.meta;
    final total = meta?.total ?? items.length;
    final currentPage = meta?.page ?? page;
    final size = meta?.pageSize ?? pageSize;
    final totalPages = meta?.totalPages;
    final hasMore = totalPages != null
        ? currentPage < totalPages
        : currentPage * size < total;
    return (items: items, hasMore: hasMore);
  }

  Future<void> markRead(String notificationId) async {
    await _client.notifications.notificationsNotificationIdReadPost(
      notificationId: notificationId,
    );
  }

  Future<void> markAllRead() async {
    await _client.notifications.notificationsReadAllPost();
  }

  Future<NotificationPreferences> getPreferences() async {
    final response =
        await _client.notifications.notificationsPreferencesGet();
    final prefs = response.data;
    if (prefs == null) {
      throw StateError('Empty notification preferences response');
    }
    return prefs;
  }

  Future<NotificationPreferences> updatePreferences(
    NotificationPreferences preferences,
  ) async {
    final response =
        await _client.notifications.notificationsPreferencesPut(
          notificationPreferences: preferences,
        );
    final prefs = response.data;
    if (prefs == null) {
      throw StateError('Empty notification preferences response');
    }
    return prefs;
  }

  Future<Device> registerDevice(DeviceRegistration registration) async {
    final response = await _client.notifications.notificationsDevicesPost(
      deviceRegistration: registration,
    );
    final device = response.data;
    if (device == null) {
      throw StateError('Empty device registration response');
    }
    return device;
  }

  Future<void> unregisterDevice(String deviceId) async {
    await _client.notifications.notificationsDevicesDeviceIdDelete(
      deviceId: deviceId,
    );
  }
}

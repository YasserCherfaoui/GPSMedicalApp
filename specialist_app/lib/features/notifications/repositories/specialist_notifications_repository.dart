import 'package:gps_medical_shared/gps_medical_shared.dart';

class SpecialistNotificationsRepository {
  SpecialistNotificationsRepository(this._client);

  final GpsMedicalClient _client;

  Future<({List<Notification> items, bool hasMore})> list({
    required int page,
    int pageSize = 20,
  }) async {
    final response = await _client.notifications.listNotifications(
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
    await _client.notifications.markNotificationRead(
      notificationId: notificationId,
    );
  }

  Future<void> markAllRead() async {
    await _client.notifications.markAllNotificationsRead();
  }

  Future<Device> registerDevice(DeviceRegistration registration) async {
    final response = await _client.notifications.registerNotificationDevice(
      deviceRegistration: registration,
    );
    final device = response.data;
    if (device == null) {
      throw StateError('Empty device registration response');
    }
    return device;
  }
}

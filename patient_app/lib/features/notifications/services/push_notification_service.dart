import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../firebase_options.dart';
import '../../../routing/patient_router.dart';
import '../providers/notifications_repositories.provider.dart';
import '../providers/notifications_unread_count.provider.dart';
import '../utils/notification_display.dart';
import 'registered_device_store.dart';

final registeredDeviceStoreProvider = Provider<RegisteredDeviceStore>(
  (ref) => RegisteredDeviceStore(),
);

final pushNotificationServiceProvider = Provider<PushNotificationService>((ref) {
  return PushNotificationService(ref);
});

class PushNotificationService {
  PushNotificationService(this._ref);

  final Ref _ref;
  final _localNotifications = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized || kIsWeb) return;
    if (!DefaultFirebaseOptions.isConfigured) return;

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings();
    await _localNotifications.initialize(
      const InitializationSettings(android: android, iOS: ios),
      onDidReceiveNotificationResponse: (response) {
        final payload = response.payload;
        if (payload == null || payload.isEmpty) return;
        _handlePayload(payload);
      },
    );

    FirebaseMessaging.onMessage.listen(_showForegroundNotification);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleRemoteMessage);
    FirebaseMessaging.instance.onTokenRefresh.listen((_) {
      unawaited(registerIfNeeded());
    });

    final initial = await FirebaseMessaging.instance.getInitialMessage();
    if (initial != null) {
      _handleRemoteMessage(initial);
    }

    _initialized = true;
  }

  Future<void> registerIfNeeded() async {
    if (kIsWeb || !DefaultFirebaseOptions.isConfigured) return;

    try {
      await FirebaseMessaging.instance.requestPermission();
      final token = await FirebaseMessaging.instance.getToken();
      if (token == null || token.isEmpty) return;

      final repo = _ref.read(notificationsRepositoryProvider);
      final device = await repo.registerDevice(
        DeviceRegistration((b) {
          b
            ..fcmToken = token
            ..platform = Platform.isIOS
                ? DeviceRegistrationPlatformEnum.ios
                : DeviceRegistrationPlatformEnum.android
            ..appVersion = '1.0.0';
        }),
      );
      final deviceId = device.id;
      if (deviceId != null) {
        await _ref.read(registeredDeviceStoreProvider).saveDeviceId(deviceId);
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Push registration skipped: $e');
      }
    }
  }

  Future<void> unregisterDevice() async {
    final store = _ref.read(registeredDeviceStoreProvider);
    final deviceId = await store.readDeviceId();
    if (deviceId == null || deviceId.isEmpty) return;

    try {
      await _ref
          .read(notificationsRepositoryProvider)
          .unregisterDevice(deviceId);
    } catch (_) {
      // Best-effort on logout.
    } finally {
      await store.clearDeviceId();
    }
  }

  Future<void> _showForegroundNotification(RemoteMessage message) async {
    final notification = message.notification;
    final title = notification?.title ?? message.data['title']?.toString();
    final body = notification?.body ?? message.data['body']?.toString();
    if (title == null && body == null) return;

    await _localNotifications.show(
      message.hashCode,
      title,
      body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          'gps_medical_default',
          'GPS Médical',
          icon: '@mipmap/ic_launcher',
          largeIcon: const DrawableResourceAndroidBitmap('@mipmap/ic_launcher'),
        ),
        iOS: const DarwinNotificationDetails(),
      ),
      payload: _encodePayload(message.data),
    );

    unawaited(
      _ref.read(notificationsUnreadCountProvider.notifier).refresh(),
    );
  }

  void _handleRemoteMessage(RemoteMessage message) {
    _handlePayload(_encodePayload(message.data));
  }

  void _handlePayload(String payload) {
    final data = _decodePayload(payload);
    final context = patientRootNavigatorKey.currentContext;
    if (context == null) return;
    navigateFromNotificationData(context, data);
    unawaited(
      _ref.read(notificationsUnreadCountProvider.notifier).refresh(),
    );
  }

  String _encodePayload(Map<String, dynamic> data) {
    return data.entries.map((e) => '${e.key}=${e.value}').join('&');
  }

  Map<String, dynamic> _decodePayload(String payload) {
    final data = <String, dynamic>{};
    for (final part in payload.split('&')) {
      final idx = part.indexOf('=');
      if (idx <= 0) continue;
      data[part.substring(0, idx)] = part.substring(idx + 1);
    }
    return data;
  }
}

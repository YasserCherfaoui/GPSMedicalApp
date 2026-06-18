import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../routing/specialist_router.dart';
import '../providers/specialist_notifications.provider.dart';
import '../utils/specialist_notification_display.dart';

final specialistPushNotificationServiceProvider =
    Provider<SpecialistPushNotificationService>((ref) {
      return SpecialistPushNotificationService(ref);
    });

class SpecialistPushNotificationService {
  SpecialistPushNotificationService(this._ref);

  final Ref _ref;
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized || kIsWeb || Firebase.apps.isEmpty) return;

    try {
      FirebaseMessaging.onMessage.listen((_) {});
      FirebaseMessaging.onMessageOpenedApp.listen(_handleRemoteMessage);
      final initial = await FirebaseMessaging.instance.getInitialMessage();
      if (initial != null) _handleRemoteMessage(initial);

      FirebaseMessaging.instance.onTokenRefresh.listen((_) {
        unawaited(registerIfNeeded());
      });

      _initialized = true;
    } catch (e) {
      if (kDebugMode) debugPrint('Specialist push init skipped: $e');
    }
  }

  Future<void> registerIfNeeded() async {
    if (kIsWeb || Firebase.apps.isEmpty) return;
    try {
      await FirebaseMessaging.instance.requestPermission();
      final token = await FirebaseMessaging.instance.getToken();
      if (token == null || token.isEmpty) return;
      await _ref.read(specialistNotificationsRepositoryProvider).registerDevice(
        DeviceRegistration((b) {
          b
            ..fcmToken = token
            ..platform = Platform.isIOS
                ? DeviceRegistrationPlatformEnum.ios
                : DeviceRegistrationPlatformEnum.android
            ..appVersion = '1.0.0';
        }),
      );
    } catch (e) {
      if (kDebugMode) debugPrint('Specialist push registration skipped: $e');
    }
  }

  void _handleRemoteMessage(RemoteMessage message) {
    final context = specialistRootNavigatorKey.currentContext;
    if (context == null) return;
    navigateSpecialistFromNotificationData(context, message.data);
  }
}

class SpecialistPushNotificationsBootstrap extends ConsumerStatefulWidget {
  const SpecialistPushNotificationsBootstrap({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<SpecialistPushNotificationsBootstrap> createState() =>
      _SpecialistPushNotificationsBootstrapState();
}

class _SpecialistPushNotificationsBootstrapState
    extends ConsumerState<SpecialistPushNotificationsBootstrap> {
  bool _wasAuthenticated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  Future<void> _bootstrap() async {
    final auth = ref.read(authSessionProvider);
    _wasAuthenticated = auth.isAuthenticated;
    if (!auth.isAuthenticated) return;
    await ref.read(specialistPushNotificationServiceProvider).initialize();
    await ref.read(specialistPushNotificationServiceProvider).registerIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthSessionNotifier>(authSessionProvider, (prev, next) {
      if (!_wasAuthenticated && next.isAuthenticated) {
        _wasAuthenticated = true;
        unawaited(
          ref.read(specialistPushNotificationServiceProvider).initialize().then(
            (_) => ref
                .read(specialistPushNotificationServiceProvider)
                .registerIfNeeded(),
          ),
        );
      } else if (_wasAuthenticated && !next.isAuthenticated) {
        _wasAuthenticated = false;
      }
    });
    return widget.child;
  }
}

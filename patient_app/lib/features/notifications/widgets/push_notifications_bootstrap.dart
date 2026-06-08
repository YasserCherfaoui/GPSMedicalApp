import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/notifications_unread_count.provider.dart';
import '../services/push_notification_service.dart';

/// Registers FCM on login, initializes foreground push handling, and keeps the
/// unread badge fresh while the patient session is active.
class PushNotificationsBootstrap extends ConsumerStatefulWidget {
  const PushNotificationsBootstrap({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<PushNotificationsBootstrap> createState() =>
      _PushNotificationsBootstrapState();
}

class _PushNotificationsBootstrapState
    extends ConsumerState<PushNotificationsBootstrap> {
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

    final push = ref.read(pushNotificationServiceProvider);
    await push.initialize();
    await push.registerIfNeeded();
    await ref.read(notificationsUnreadCountProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthSessionNotifier>(authSessionProvider, (prev, next) {
      final isAuthenticated = next.isAuthenticated;
      if (!_wasAuthenticated && isAuthenticated) {
        _wasAuthenticated = true;
        final push = ref.read(pushNotificationServiceProvider);
        unawaited(push.initialize().then((_) => push.registerIfNeeded()));
        unawaited(
          ref.read(notificationsUnreadCountProvider.notifier).refresh(),
        );
      } else if (_wasAuthenticated && !isAuthenticated) {
        _wasAuthenticated = false;
      }
    });

    return widget.child;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../services/push_notification_service.dart';

Future<void> signOutPatient(WidgetRef ref, {BuildContext? context}) async {
  await ref.read(pushNotificationServiceProvider).unregisterDevice();
  await ref.read(authSessionProvider).signOut();
  if (context != null && context.mounted) {
    context.go(GpsRoutes.login);
  }
}

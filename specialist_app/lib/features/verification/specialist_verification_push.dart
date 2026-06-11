import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../routing/specialist_router.dart';
import '../../routing/specialist_routes.dart';
import '../../routing/specialist_verification_status.dart';
import 'specialist_verification.provider.dart';

final specialistVerificationPushProvider = Provider<SpecialistVerificationPush>(
  (ref) => SpecialistVerificationPush(ref),
);

/// Listens for admin verification FCM payloads and refreshes the gate.
class SpecialistVerificationPush {
  SpecialistVerificationPush(this._ref);

  final Ref _ref;
  bool _initialized = false;

  Future<void> initialize() async {
    if (_initialized || kIsWeb || Firebase.apps.isEmpty) return;

    FirebaseMessaging.onMessage.listen(_handleVerificationMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(_handleVerificationMessage);

    final initial = await FirebaseMessaging.instance.getInitialMessage();
    if (initial != null) {
      await _handleVerificationMessage(initial);
    }

    _initialized = true;
  }

  Future<void> _handleVerificationMessage(RemoteMessage message) async {
    final decision = message.data['verification_decision']?.toString();
    if (decision == null || decision.isEmpty) return;

    final gate = _ref.read(specialistVerificationGateProvider);
    await gate.refresh();

    final context = specialistRootNavigatorKey.currentContext;
    if (context == null || !context.mounted) return;

    if (gate.status == SpecialistVerificationStatus.verified) {
      context.go(SpecialistRoutes.shell);
    } else {
      context.go(SpecialistRoutes.verificationPending);
    }
  }
}

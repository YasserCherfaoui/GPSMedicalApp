import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'teleconsultation_call_controller.dart';

/// Lives outside the teleconsult route so the call survives minimize.
class ActiveTeleconsultationSession {
  ActiveTeleconsultationSession({
    required this.appointmentId,
    required this.controller,
    required this.isSpecialist,
    required this.endSession,
    required this.callRoute,
    this.minimized = false,
  });

  final String appointmentId;
  final TeleconsultationCallController controller;
  final bool isSpecialist;
  final Future<void> Function({required int durationSeconds}) endSession;
  final String callRoute;

  /// When true, the full-screen route is not showing; floating chip is.
  final bool minimized;

  ActiveTeleconsultationSession copyWith({bool? minimized}) {
    return ActiveTeleconsultationSession(
      appointmentId: appointmentId,
      controller: controller,
      isSpecialist: isSpecialist,
      endSession: endSession,
      callRoute: callRoute,
      minimized: minimized ?? this.minimized,
    );
  }
}

class ActiveTeleconsultation extends Notifier<ActiveTeleconsultationSession?> {
  @override
  ActiveTeleconsultationSession? build() => null;

  void attach(ActiveTeleconsultationSession session) {
    final previous = state;
    if (previous != null &&
        previous.appointmentId != session.appointmentId) {
      unawaited(previous.controller.dispose());
    }
    state = session;
  }

  void setMinimized(bool value) {
    final current = state;
    if (current == null || current.minimized == value) return;
    // Must assign a new instance — Notifier skips notify when identical.
    state = current.copyWith(minimized: value);
  }

  Future<void> hangup({bool notifyPeer = true}) async {
    final current = state;
    if (current == null) return;
    state = null;
    final duration = current.controller.elapsedSeconds();
    if (notifyPeer) {
      await current.controller.sendHangup();
    }
    await current.controller.dispose();
    if (duration > 0) {
      try {
        await current.endSession(durationSeconds: duration);
      } catch (e, st) {
        if (kDebugMode) {
          debugPrint('ActiveTeleconsultation endSession failed: $e\n$st');
        }
      }
    }
  }

  /// Called when the full-screen route is disposed without minimize/hangup.
  Future<void> disposeIfOwning(String appointmentId) async {
    final current = state;
    if (current == null || current.appointmentId != appointmentId) return;
    if (current.minimized) return;
    state = null;
    await current.controller.dispose();
  }
}

final activeTeleconsultationProvider =
    NotifierProvider<ActiveTeleconsultation, ActiveTeleconsultationSession?>(
      ActiveTeleconsultation.new,
    );

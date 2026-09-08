import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/appointments.provider.dart';
import '../screens/appointment_detail_screen.dart';

/// Invalidates specialist appointment providers when payment/status updates
/// arrive over the messaging WebSocket.
class SpecialistAppointmentRealtimeHost extends ConsumerStatefulWidget {
  const SpecialistAppointmentRealtimeHost({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<SpecialistAppointmentRealtimeHost> createState() =>
      _SpecialistAppointmentRealtimeHostState();
}

class _SpecialistAppointmentRealtimeHostState
    extends ConsumerState<SpecialistAppointmentRealtimeHost> {
  StreamSubscription<MessagingRealtimeEvent>? _sub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _attach());
  }

  @override
  void dispose() {
    unawaited(_sub?.cancel());
    super.dispose();
  }

  void _attach() {
    final ws = ref.read(messagingWebSocketClientProvider);
    if (ws == null) return;
    _sub?.cancel();
    _sub = ws.events.listen(_onEvent);
  }

  void _onEvent(MessagingRealtimeEvent event) {
    if (event.type != 'appointment.updated') return;
    final appointmentId = event.payload['appointment_id'] as String?;
    invalidateSpecialistAppointments(ref.invalidate);
    if (appointmentId != null && appointmentId.isNotEmpty) {
      ref.invalidate(specialistAppointmentDetailProvider(appointmentId));
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(messagingWebSocketClientProvider, (previous, next) {
      unawaited(_sub?.cancel());
      _sub = null;
      if (next != null) {
        _sub = next.events.listen(_onEvent);
      }
    });
    return widget.child;
  }
}

import 'package:gps_medical_shared/gps_medical_shared.dart';

class TeleconsultWindow {
  const TeleconsultWindow({required this.windowStart, required this.windowEnd});

  final DateTime windowStart;
  final DateTime windowEnd;

  bool get isOpen {
    final now = DateTime.now();
    return !now.isBefore(windowStart) && !now.isAfter(windowEnd);
  }

  Duration? timeUntilOpen() {
    final now = DateTime.now();
    if (!now.isBefore(windowStart)) return null;
    return windowStart.difference(now);
  }
}

TeleconsultWindow teleconsultWindowFor(Appointment appointment) {
  final start = appointment.startAt?.toLocal();
  final end = appointment.endAt?.toLocal();
  if (start == null || end == null) {
    return TeleconsultWindow(
      windowStart: DateTime.now(),
      windowEnd: DateTime.now(),
    );
  }
  return TeleconsultWindow(
    windowStart: start.subtract(const Duration(minutes: 15)),
    windowEnd: end.add(const Duration(minutes: 30)),
  );
}

String formatTeleconsultCountdown(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);
  final seconds = duration.inSeconds.remainder(60);
  if (hours > 0) {
    return '${hours}h ${minutes.toString().padLeft(2, '0')}m';
  }
  if (minutes > 0) {
    return '${minutes}m ${seconds.toString().padLeft(2, '0')}s';
  }
  return '${seconds}s';
}

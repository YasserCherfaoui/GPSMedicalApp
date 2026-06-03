import 'dart:math' as math;

import 'package:gps_medical_shared/gps_medical_shared.dart';

double? haversineKm({
  required double userLat,
  required double userLng,
  required Address? address,
}) {
  final lat = address?.latitude?.toDouble();
  final lng = address?.longitude?.toDouble();
  if (lat == null || lng == null) return null;

  const earthRadiusKm = 6371.0;
  final dLat = _toRad(lat - userLat);
  final dLng = _toRad(lng - userLng);
  final a =
      math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(_toRad(userLat)) *
          math.cos(_toRad(lat)) *
          math.sin(dLng / 2) *
          math.sin(dLng / 2);
  final c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  return earthRadiusKm * c;
}

double _toRad(double deg) => deg * math.pi / 180;

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class MapMarkerCluster {
  const MapMarkerCluster({
    required this.id,
    required this.position,
    required this.doctors,
    required this.isCluster,
  });

  final String id;
  final LatLng position;
  final List<DoctorWithDistance> doctors;
  final bool isCluster;
}

/// Grid-based clustering for zoom levels below 12 (ADR 0009).
List<MapMarkerCluster> clusterNearbyDoctors({
  required List<DoctorWithDistance> doctors,
  required double zoom,
}) {
  if (zoom >= 12) {
    return doctors
        .where((d) => _doctorLatLng(d) != null)
        .map(
          (d) => MapMarkerCluster(
            id: d.id ?? '',
            position: _doctorLatLng(d)!,
            doctors: [d],
            isCluster: false,
          ),
        )
        .toList();
  }

  final cellSize = zoom < 10 ? 0.08 : 0.04;
  final buckets = <String, List<DoctorWithDistance>>{};

  for (final doc in doctors) {
    final pos = _doctorLatLng(doc);
    if (pos == null) continue;
    final key =
        '${(pos.latitude / cellSize).floor()}_${(pos.longitude / cellSize).floor()}';
    buckets.putIfAbsent(key, () => []).add(doc);
  }

  return buckets.entries.map((entry) {
    final group = entry.value;
    final avgLat =
        group.map((d) => _doctorLatLng(d)!.latitude).reduce((a, b) => a + b) /
        group.length;
    final avgLng =
        group.map((d) => _doctorLatLng(d)!.longitude).reduce((a, b) => a + b) /
        group.length;
    return MapMarkerCluster(
      id: entry.key,
      position: LatLng(avgLat, avgLng),
      doctors: group,
      isCluster: group.length > 1,
    );
  }).toList();
}

LatLng? _doctorLatLng(DoctorWithDistance doc) {
  final lat = doc.practiceAddress?.latitude?.toDouble();
  final lng = doc.practiceAddress?.longitude?.toDouble();
  if (lat == null || lng == null) return null;
  return LatLng(lat, lng);
}

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

class MapClinicMarkerCluster {
  const MapClinicMarkerCluster({
    required this.id,
    required this.position,
    required this.clinics,
    required this.isCluster,
  });

  final String id;
  final LatLng position;
  final List<ClinicWithDistance> clinics;
  final bool isCluster;
}

/// Grid-based clustering for zoom levels below 12 (ADR 0009).
List<MapMarkerCluster> clusterNearbyDoctors({
  required List<DoctorWithDistance> doctors,
  required double zoom,
}) {
  return _clusterByGrid(
    items: doctors,
    zoom: zoom,
    positionOf: _doctorLatLng,
    idOf: (d) => d.id ?? '',
    toCluster: (id, position, group, isCluster) => MapMarkerCluster(
      id: id,
      position: position,
      doctors: group,
      isCluster: isCluster,
    ),
  );
}

/// Same grid clustering as doctors, for nearby clinics markers (A-18.1).
List<MapClinicMarkerCluster> clusterNearbyClinics({
  required List<ClinicWithDistance> clinics,
  required double zoom,
}) {
  return _clusterByGrid(
    items: clinics,
    zoom: zoom,
    positionOf: _clinicLatLng,
    idOf: (c) => c.id ?? '',
    toCluster: (id, position, group, isCluster) => MapClinicMarkerCluster(
      id: id,
      position: position,
      clinics: group,
      isCluster: isCluster,
    ),
  );
}

List<TCluster> _clusterByGrid<TItem, TCluster>({
  required List<TItem> items,
  required double zoom,
  required LatLng? Function(TItem) positionOf,
  required String Function(TItem) idOf,
  required TCluster Function(
    String id,
    LatLng position,
    List<TItem> group,
    bool isCluster,
  )
  toCluster,
}) {
  if (zoom >= 12) {
    return items
        .where((item) => positionOf(item) != null)
        .map(
          (item) => toCluster(
            idOf(item),
            positionOf(item)!,
            [item],
            false,
          ),
        )
        .toList();
  }

  final cellSize = zoom < 10 ? 0.08 : 0.04;
  final buckets = <String, List<TItem>>{};

  for (final item in items) {
    final pos = positionOf(item);
    if (pos == null) continue;
    final key =
        '${(pos.latitude / cellSize).floor()}_${(pos.longitude / cellSize).floor()}';
    buckets.putIfAbsent(key, () => []).add(item);
  }

  return buckets.entries.map((entry) {
    final group = entry.value;
    final avgLat =
        group.map((i) => positionOf(i)!.latitude).reduce((a, b) => a + b) /
        group.length;
    final avgLng =
        group.map((i) => positionOf(i)!.longitude).reduce((a, b) => a + b) /
        group.length;
    return toCluster(
      entry.key,
      LatLng(avgLat, avgLng),
      group,
      group.length > 1,
    );
  }).toList();
}

LatLng? _doctorLatLng(DoctorWithDistance doc) {
  final lat = doc.practiceAddress?.latitude?.toDouble();
  final lng = doc.practiceAddress?.longitude?.toDouble();
  if (lat == null || lng == null) return null;
  return LatLng(lat, lng);
}

LatLng? _clinicLatLng(ClinicWithDistance clinic) {
  final lat = clinic.address?.latitude?.toDouble();
  final lng = clinic.address?.longitude?.toDouble();
  if (lat == null || lng == null) return null;
  return LatLng(lat, lng);
}

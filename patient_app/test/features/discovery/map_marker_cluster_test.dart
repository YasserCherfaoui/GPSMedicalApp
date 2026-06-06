import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/discovery/utils/map_marker_cluster.dart';

DoctorWithDistance doctorAt({
  required String id,
  required double lat,
  required double lng,
}) {
  return DoctorWithDistance(
    (b) => b
      ..id = id
      ..fullName = 'Doctor $id'
      ..verified = true
      ..practiceAddress = (Address(
        (a) => a
          ..latitude = lat
          ..longitude = lng,
      ).toBuilder()),
  );
}

void main() {
  test('returns individual markers when zoom is 12 or above', () {
    final doctors = [
      doctorAt(id: 'd1', lat: 36.75, lng: 3.05),
      doctorAt(id: 'd2', lat: 36.76, lng: 3.06),
    ];

    final clusters = clusterNearbyDoctors(doctors: doctors, zoom: 12);

    expect(clusters, hasLength(2));
    expect(clusters.every((c) => !c.isCluster), isTrue);
    expect(clusters.map((c) => c.id).toSet(), {'d1', 'd2'});
  });

  test('clusters nearby doctors when zoom is below 12', () {
    final doctors = [
      doctorAt(id: 'd1', lat: 36.7500, lng: 3.0500),
      doctorAt(id: 'd2', lat: 36.7501, lng: 3.0501),
      doctorAt(id: 'd3', lat: 37.5000, lng: 4.0000),
    ];

    final clusters = clusterNearbyDoctors(doctors: doctors, zoom: 10);

    expect(clusters.length, lessThan(3));
    final multiCluster = clusters.firstWhere((c) => c.isCluster);
    expect(multiCluster.doctors, hasLength(2));
  });

  test('skips doctors without practice coordinates', () {
    final doctors = [
      doctorAt(id: 'd1', lat: 36.75, lng: 3.05),
      DoctorWithDistance(
        (b) => b
          ..id = 'd2'
          ..fullName = 'No coords'
          ..verified = true,
      ),
    ];

    final clusters = clusterNearbyDoctors(doctors: doctors, zoom: 13);

    expect(clusters, hasLength(1));
    expect(clusters.first.id, 'd1');
  });
}

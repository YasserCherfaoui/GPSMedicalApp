import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/discovery/utils/wilaya_centroids.dart';

void main() {
  test('kWilayaCentroids has all 58 official codes', () {
    expect(kWilayaCentroids.length, 58);
    for (var i = 1; i <= 58; i++) {
      final code = i.toString().padLeft(2, '0');
      expect(
        kWilayaCentroids.containsKey(code),
        isTrue,
        reason: 'missing wilaya $code',
      );
    }
  });

  test('wilayaCentroid normalizes unpadded codes', () {
    expect(wilayaCentroid('1'), wilayaCentroid('01'));
    expect(wilayaCentroid('16'), kWilayaCentroids['16']);
  });

  test('01 is Adrar not Alger', () {
    final (lat, _) = kWilayaCentroids['01']!;
    expect(lat, lessThan(30));
    final (algerLat, _) = kWilayaCentroids['16']!;
    expect(algerLat, greaterThan(36));
  });

  test('each centroid is within Algeria bounding box', () {
    for (final entry in kWilayaCentroids.entries) {
      final (lat, lng) = entry.value;
      expect(lat, inInclusiveRange(19.0, 37.5), reason: entry.key);
      expect(lng, inInclusiveRange(-8.8, 12.0), reason: entry.key);
    }
  });
}

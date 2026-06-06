import 'package:flutter_test/flutter_test.dart';
import 'package:patient_app/features/discovery/utils/map_zoom_for_radius.dart';

void main() {
  test('maps 5 km default radius to mid zoom range', () {
    final zoom = zoomLevelForRadiusKm(5);
    expect(zoom, greaterThan(9));
    expect(zoom, lessThan(15));
  });

  test('clamps radius below minimum to max zoom', () {
    expect(zoomLevelForRadiusKm(0.5), zoomLevelForRadiusKm(1));
  });

  test('clamps radius above maximum to min zoom', () {
    expect(zoomLevelForRadiusKm(100), zoomLevelForRadiusKm(50));
  });

  test('zoom decreases as radius increases', () {
    expect(
      zoomLevelForRadiusKm(1),
      greaterThan(zoomLevelForRadiusKm(50)),
    );
  });
}

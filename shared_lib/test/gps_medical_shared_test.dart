import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  test('GpsMedicalAppInfo exposes display name and client kind', () {
    const info = GpsMedicalAppInfo(
      displayName: 'GPS Médical — Patient',
      clientKind: GpsMedicalClientKind.patient,
    );

    expect(info.displayName, 'GPS Médical — Patient');
    expect(info.clientKind, GpsMedicalClientKind.patient);
  });
}

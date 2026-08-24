import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:patient_app/features/discovery/utils/clinic_display.dart';

void main() {
  test('clinicServiceSummary joins up to three teaser names', () {
    final clinic = $Clinic(
      (b) => b
        ..name = 'El Shifa'
        ..serviceTeasers.addAll([
          ClinicServiceTeaser(
            (t) => t
              ..name = 'Consultation'
              ..priceAmount = 3500,
          ),
          ClinicServiceTeaser(
            (t) => t
              ..name = 'Échographie'
              ..priceAmount = 6000,
          ),
        ]),
    );

    expect(clinicServiceSummary(clinic), 'Consultation · Échographie');
    expect(clinicStartingFee(clinic), 3500);
    expect(clinicStartingCurrency(clinic), 'DZD');
  });
}

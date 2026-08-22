import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

void main() {
  test('GpsMedicalClient is not rebuilt when session tokens refresh', () {
    final container = ProviderContainer();
    addTearDown(container.dispose);

    final first = container.read(gpsMedicalClientProvider);
    container
        .read(authSessionProvider)
        .applyRefreshedTokens(
          TokenPair(
            (b) => b
              ..accessToken = 'new-access-token'
              ..refreshToken = 'new-refresh-token'
              ..expiresIn = 900,
          ),
        );

    expect(identical(first, container.read(gpsMedicalClientProvider)), isTrue);
  });
}

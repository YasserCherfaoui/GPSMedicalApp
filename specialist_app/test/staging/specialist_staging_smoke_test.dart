@Tags(['staging'])
library;

import 'package:flutter_test/flutter_test.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import 'staging_env.dart';

/// Lightweight staging smoke: login → GET /doctors/me → GET /appointments.
void main() {
  final runStaging = StagingEnv.enabled;

  group('specialist staging smoke', () {
    test(
      'login as specialist then fetch profile and appointments',
      () async {
        final tokenStore = InMemoryTokenStore();
        final client = GpsMedicalClient(
          tokenStore: tokenStore,
          apiRootUrl: StagingEnv.apiRoot,
        );

        final loginResponse = await client.phase1.login(
          loginRequest: LoginRequest(
            (b) => b
              ..phone = StagingEnv.specialistPhone
              ..password = StagingEnv.specialistPassword,
          ),
        );
        final tokens = loginResponse.data;
        expect(tokens?.accessToken, isNotEmpty);

        await tokenStore.saveTokens(tokens!);
        client.applyBearerToken(tokens.accessToken!);

        final me = await client.doctors.doctorsMeGet();
        expect(me.data?.id, isNotNull);
        expect(me.data?.fullName, isNotEmpty);

        final appointments = await client.appointments.appointmentsGet(
          page: 1,
          pageSize: 5,
        );
        expect(appointments.data, isNotNull);
      },
      skip: runStaging ? null : StagingEnv.skipReason,
    );
  });
}

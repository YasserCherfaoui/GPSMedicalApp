import 'package:gps_medical_shared/gps_medical_shared.dart';

class ConsentRepository {
  ConsentRepository(this._client);

  final GpsMedicalClient _client;

  Future<List<ConsentGrant>> listConsents() async {
    final response = await _client.phase1.listMyConsents();
    return response.data?.toList() ?? [];
  }

  Future<void> revokeConsent(RevokeConsentRequestConsentTypeEnum type) async {
    await _client.phase1.revokeMyConsent(
      revokeConsentRequest: RevokeConsentRequest(
        (b) => b..consentType = type,
      ),
    );
  }
}

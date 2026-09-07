import 'package:dio/dio.dart';

import '../../client/gps_medical_client.dart';

class PresenceSettings {
  const PresenceSettings({
    required this.presenceVisible,
    required this.acceptsMessageRequests,
  });

  final bool presenceVisible;
  final bool acceptsMessageRequests;

  factory PresenceSettings.fromJson(Map<String, dynamic> json) {
    return PresenceSettings(
      presenceVisible: json['presence_visible'] as bool? ?? true,
      acceptsMessageRequests: json['accepts_message_requests'] as bool? ?? true,
    );
  }
}

/// REST overlay for `PATCH /doctors/me/presence-settings` (Phase 3.9 addendum).
class PresenceSettingsRepository {
  PresenceSettingsRepository(this._client);

  final GpsMedicalClient _client;

  Future<PresenceSettings> update({
    bool? presenceVisible,
    bool? acceptsMessageRequests,
  }) async {
    final body = <String, dynamic>{};
    if (presenceVisible != null) body['presence_visible'] = presenceVisible;
    if (acceptsMessageRequests != null) {
      body['accepts_message_requests'] = acceptsMessageRequests;
    }
    if (body.isEmpty) {
      throw ArgumentError('At least one presence setting field is required');
    }

    final response = await _client.v1.dio.patch<Map<String, dynamic>>(
      '/doctors/me/presence-settings',
      data: body,
      options: Options(contentType: Headers.jsonContentType),
    );
    final data = response.data;
    if (data == null) {
      throw StateError('Empty presence settings response');
    }
    return PresenceSettings.fromJson(data);
  }
}

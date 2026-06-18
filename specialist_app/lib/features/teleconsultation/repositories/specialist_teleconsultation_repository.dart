import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class TeleconsultationSessionException implements Exception {
  const TeleconsultationSessionException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;
}

class SpecialistTeleconsultationRepository {
  SpecialistTeleconsultationRepository(this._client);

  final GpsMedicalClient _client;

  Future<TeleSession> startSession(String appointmentId) async {
    try {
      final response = await _client.teleconsultation
          .teleconsultationsAppointmentIdSessionPost(
            appointmentId: appointmentId,
          );
      final session = response.data;
      if (session == null) {
        throw StateError('Empty teleconsultation session response');
      }
      return session;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<TurnCredentials?> fetchTurnCredentials() async {
    try {
      final response =
          await _client.teleconsultation.teleconsultationsTurnCredentialsGet();
      return response.data;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  Future<TeleSession> endSession({
    required String appointmentId,
    required int durationSeconds,
    int? qualityScore,
  }) async {
    try {
      final request = TeleconsultationsAppointmentIdEndPostRequest((b) {
        b
          ..durationSeconds = durationSeconds
          ..qualityScore = qualityScore;
      });
      final response = await _client.teleconsultation
          .teleconsultationsAppointmentIdEndPost(
            appointmentId: appointmentId,
            teleconsultationsAppointmentIdEndPostRequest: request,
          );
      final session = response.data;
      if (session == null) {
        throw StateError('Empty teleconsultation end response');
      }
      return session;
    } on DioException catch (e) {
      throw _mapDioError(e);
    }
  }

  TeleconsultationSessionException _mapDioError(DioException e) {
    final status = e.response?.statusCode;
    final data = e.response?.data;
    final map = data is Map
        ? data.map((k, v) => MapEntry(k.toString(), v))
        : null;
    final detail = map?['detail'] as String? ?? map?['title'] as String?;
    return TeleconsultationSessionException(
      detail ?? 'Teleconsultation unavailable',
      statusCode: status,
    );
  }
}

List<Map<String, dynamic>> buildIceServers({
  required TeleSession session,
  TurnCredentials? turnCredentials,
}) {
  final servers = <Map<String, dynamic>>[];

  for (final server in session.iceServers ?? BuiltList<IceServer>([])) {
    final urls = _iceServerUrls(server);
    if (urls.isEmpty) continue;
    servers.add({
      'urls': urls.length == 1 ? urls.first : urls,
      if (server.username != null && server.username!.isNotEmpty)
        'username': server.username,
      if (server.credential != null && server.credential!.isNotEmpty)
        'credential': server.credential,
    });
  }

  if (turnCredentials != null) {
    final urls = turnCredentials.urls?.toList() ?? const [];
    if (urls.isNotEmpty) {
      servers.add({
        'urls': urls.length == 1 ? urls.first : urls,
        'username': turnCredentials.username,
        'credential': turnCredentials.credential,
      });
    }
  }

  if (servers.isEmpty) {
    servers.add({'urls': 'stun:stun.l.google.com:19302'});
  }
  return servers;
}

List<String> _iceServerUrls(IceServer server) {
  final urls = server.urls;
  if (urls == null) return const [];
  final value = urls.oneOf.value;
  if (value is String) return [value];
  if (value is BuiltList<String>) return value.toList();
  return [value.toString()];
}

/// Manages local media + peer connection for a teleconsultation (ADR 0012).
/// No media is persisted — streams are disposed on end.
class TeleconsultationCallController {
  TeleconsultationCallController({this.onRemoteStreamChanged});

  VoidCallback? onRemoteStreamChanged;

  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  MediaStream? _remoteStream;
  bool _micEnabled = true;
  bool _cameraEnabled = true;
  DateTime? _startedAt;

  MediaStream? get localStream => _localStream;
  MediaStream? get remoteStream => _remoteStream;
  bool get micEnabled => _micEnabled;
  bool get cameraEnabled => _cameraEnabled;
  DateTime? get startedAt => _startedAt;

  Future<void> initialize({
    required List<Map<String, dynamic>> iceServers,
  }) async {
    _localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': {'facingMode': 'user'},
    });
    _peerConnection = await createPeerConnection({'iceServers': iceServers});
    for (final track in _localStream!.getTracks()) {
      await _peerConnection!.addTrack(track, _localStream!);
    }
    _peerConnection!.onTrack = (event) {
      if (event.streams.isNotEmpty) {
        _remoteStream = event.streams.first;
        onRemoteStreamChanged?.call();
      }
    };
    _startedAt = DateTime.now();
  }

  Future<void> setMicEnabled(bool enabled) async {
    _micEnabled = enabled;
    for (final track in _localStream?.getAudioTracks() ?? []) {
      track.enabled = enabled;
    }
  }

  Future<void> setCameraEnabled(bool enabled) async {
    _cameraEnabled = enabled;
    for (final track in _localStream?.getVideoTracks() ?? []) {
      track.enabled = enabled;
    }
  }

  int elapsedSeconds() {
    final start = _startedAt;
    if (start == null) return 0;
    return DateTime.now().difference(start).inSeconds;
  }

  Future<void> dispose() async {
    for (final track in _localStream?.getTracks() ?? []) {
      await track.stop();
    }
    await _localStream?.dispose();
    _localStream = null;
    _remoteStream = null;
    await _peerConnection?.close();
    _peerConnection = null;
    _startedAt = null;
  }
}

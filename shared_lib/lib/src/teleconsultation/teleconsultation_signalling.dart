import 'package:dio/dio.dart';

class TeleconsultIceCandidate {
  const TeleconsultIceCandidate({
    required this.candidate,
    this.sdpMid,
    this.sdpMLineIndex,
  });

  final String candidate;
  final String? sdpMid;
  final int? sdpMLineIndex;

  factory TeleconsultIceCandidate.fromJson(Map<String, dynamic> json) {
    return TeleconsultIceCandidate(
      candidate: json['candidate'] as String? ?? '',
      sdpMid: json['sdp_mid'] as String?,
      sdpMLineIndex: (json['sdp_mline_index'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
    'candidate': candidate,
    if (sdpMid != null) 'sdp_mid': sdpMid,
    if (sdpMLineIndex != null) 'sdp_mline_index': sdpMLineIndex,
  };
}

class TeleconsultSignal {
  const TeleconsultSignal({
    required this.seq,
    required this.type,
    this.sdp,
    this.candidate,
  });

  final int seq;
  final String type;
  final String? sdp;
  final TeleconsultIceCandidate? candidate;

  factory TeleconsultSignal.fromJson(Map<String, dynamic> json) {
    final rawCandidate = json['candidate'];
    return TeleconsultSignal(
      seq: (json['seq'] as num?)?.toInt() ?? 0,
      type: json['type'] as String? ?? '',
      sdp: json['sdp'] as String?,
      candidate: rawCandidate is Map
          ? TeleconsultIceCandidate.fromJson(
              Map<String, dynamic>.from(rawCandidate),
            )
          : null,
    );
  }
}

/// REST mailbox for WebRTC SDP / ICE (ADR 0012).
class TeleconsultationSignallingClient {
  TeleconsultationSignallingClient(this._dio);

  final Dio _dio;

  Future<TeleconsultSignal> post({
    required String appointmentId,
    required String type,
    String? sdp,
    TeleconsultIceCandidate? candidate,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/teleconsultations/$appointmentId/signals',
      data: {
        'type': type,
        if (sdp != null) 'sdp': sdp,
        if (candidate != null) 'candidate': candidate.toJson(),
      },
    );
    final data = response.data;
    if (data == null) {
      throw StateError('Empty teleconsultation signal response');
    }
    return TeleconsultSignal.fromJson(data);
  }

  Future<List<TeleconsultSignal>> list({
    required String appointmentId,
    required int since,
    int waitMs = 0,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/teleconsultations/$appointmentId/signals',
      queryParameters: {'since': since, if (waitMs > 0) 'wait_ms': waitMs},
      cancelToken: cancelToken,
    );
    final raw = response.data?['signals'];
    if (raw is! List) return const [];
    final signals = <TeleconsultSignal>[];
    for (final item in raw) {
      if (item is Map<dynamic, dynamic>) {
        signals.add(
          TeleconsultSignal.fromJson(
            item.map((key, value) => MapEntry(key.toString(), value)),
          ),
        );
      }
    }
    return signals;
  }
}

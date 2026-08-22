import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import 'sdp_compat.dart';
import 'teleconsultation_signalling.dart';

/// Local media + peer connection with REST SDP/ICE signalling (ADR 0012).
/// No media is persisted — streams are disposed on end.
class TeleconsultationCallController {
  TeleconsultationCallController({
    this.onRemoteStreamChanged,
    this.onRemoteHangup,
    this.onIceFailed,
  });

  VoidCallback? onRemoteStreamChanged;
  VoidCallback? onRemoteHangup;
  VoidCallback? onIceFailed;

  RTCPeerConnection? _peerConnection;
  MediaStream? _localStream;
  MediaStream? _remoteStream;
  TeleconsultationSignallingClient? _signalling;
  String? _appointmentId;
  CancelToken? _pollCancel;
  bool _micEnabled = true;
  bool _cameraEnabled = true;
  bool _isOfferer = false;
  bool _disposed = false;
  bool _polling = false;
  bool _remoteDescriptionSet = false;
  bool _hangupNotified = false;
  bool _localSdpPublished = false;
  String? _localSdpText;
  bool _firstPoll = true;
  int _since = 0;
  DateTime? _startedAt;
  Future<void> _iceSendChain = Future.value();
  final List<RTCIceCandidate> _pendingRemoteIce = [];
  final List<RTCIceCandidate> _queuedLocalIce = [];

  MediaStream? get localStream => _localStream;
  MediaStream? get remoteStream => _remoteStream;
  bool get micEnabled => _micEnabled;
  bool get cameraEnabled => _cameraEnabled;
  DateTime? get startedAt => _startedAt;

  Future<void> initialize({
    required List<Map<String, dynamic>> iceServers,
    required TeleconsultationSignallingClient signalling,
    required String appointmentId,
    required bool isOfferer,
  }) async {
    _signalling = signalling;
    _appointmentId = appointmentId;
    _isOfferer = isOfferer;

    _log(
      'getUserMedia + peerConnection isOfferer=$isOfferer ice=${iceServers.length}',
    );
    _localStream = await navigator.mediaDevices.getUserMedia({
      'audio': true,
      'video': {'facingMode': 'user'},
    });
    _peerConnection = await createPeerConnection({'iceServers': iceServers});
    for (final track in _localStream!.getTracks()) {
      await _peerConnection!.addTrack(track, _localStream!);
    }
    _peerConnection!.onTrack = (event) {
      _log('onTrack streams=${event.streams.length}');
      if (event.streams.isNotEmpty) {
        _remoteStream = event.streams.first;
        onRemoteStreamChanged?.call();
      }
    };
    _peerConnection!.onIceCandidate = (candidate) {
      if (!_localSdpPublished) {
        _queuedLocalIce.add(candidate);
        return;
      }
      _iceSendChain = _iceSendChain.then((_) async {
        if (_disposed) return;
        await _sendLocalIce(candidate);
      });
    };
    _peerConnection!.onIceConnectionState = (state) {
      _log('iceConnectionState=$state');
      if (state == RTCIceConnectionState.RTCIceConnectionStateFailed) {
        onIceFailed?.call();
      }
    };
    _peerConnection!.onConnectionState = (state) {
      _log('connectionState=$state');
    };
    _startedAt = DateTime.now();

    if (isOfferer) {
      await _createAndSendOffer();
    }
    unawaited(_pollLoop());
  }

  Future<void> sendHangup() async {
    final signalling = _signalling;
    final appointmentId = _appointmentId;
    if (signalling == null || appointmentId == null) return;
    try {
      await signalling.post(appointmentId: appointmentId, type: 'hangup');
      _log('--> hangup');
    } catch (error) {
      _log('hangup post failed: $error');
    }
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
    _disposed = true;
    _pollCancel?.cancel();
    _pollCancel = null;
    _pendingRemoteIce.clear();
    _queuedLocalIce.clear();
    for (final track in _localStream?.getTracks() ?? []) {
      await track.stop();
    }
    await _localStream?.dispose();
    _localStream = null;
    _remoteStream = null;
    await _peerConnection?.close();
    _peerConnection = null;
    _startedAt = null;
    _signalling = null;
  }

  Future<void> _createAndSendOffer() async {
    final pc = _peerConnection;
    final signalling = _signalling;
    final appointmentId = _appointmentId;
    if (pc == null || signalling == null || appointmentId == null) return;

    final offer = await pc.createOffer({
      'offerToReceiveAudio': true,
      'offerToReceiveVideo': true,
    });
    await pc.setLocalDescription(offer);
    final offerSdp = compatSdp(offer.sdp ?? '');
    _localSdpText = offerSdp;
    await signalling.post(
      appointmentId: appointmentId,
      type: 'offer',
      sdp: offerSdp,
    );
    _localSdpPublished = true;
    _log('--> offer sdpChars=${offerSdp.length}');
    await _flushQueuedLocalIce();
  }

  Future<void> _pollLoop() async {
    while (!_disposed) {
      _pollCancel = CancelToken();
      try {
        await _poll();
      } on DioException catch (error) {
        if (_disposed || CancelToken.isCancel(error)) {
          return;
        }
        _log('poll failed: $error');
        await Future<void>.delayed(const Duration(seconds: 1));
      } catch (error) {
        if (_disposed) return;
        _log('poll failed: $error');
        await Future<void>.delayed(const Duration(seconds: 1));
      }
    }
  }

  Future<void> _poll() async {
    if (_disposed || _polling) return;
    final signalling = _signalling;
    final appointmentId = _appointmentId;
    if (signalling == null || appointmentId == null) return;

    _polling = true;
    try {
      final signals = await signalling.list(
        appointmentId: appointmentId,
        since: _since,
        waitMs: _firstPoll ? 0 : 10000,
        cancelToken: _pollCancel,
      );
      _firstPoll = false;
      for (final signal in signals) {
        if (_disposed) return;
        await _applyRemoteSignal(signal);
        if (signal.seq > _since) {
          _since = signal.seq;
        }
      }
    } finally {
      _polling = false;
    }
  }

  Future<void> _applyRemoteSignal(TeleconsultSignal signal) async {
    _log('<-- ${signal.type} seq=${signal.seq}');
    switch (signal.type) {
      case 'offer':
        if (_isOfferer) {
          _log('ignoring offer (local peer is offerer)');
          return;
        }
        await _acceptOffer(signal.sdp);
      case 'answer':
        if (!_isOfferer) {
          _log('ignoring answer (local peer is answerer)');
          return;
        }
        await _acceptAnswer(signal.sdp);
      case 'ice_candidate':
        await _acceptRemoteIce(signal.candidate);
      case 'hangup':
        if (!_hangupNotified) {
          _hangupNotified = true;
          onRemoteHangup?.call();
        }
      default:
        _log('unknown signal type ${signal.type}');
    }
  }

  Future<void> _acceptOffer(String? sdp) async {
    final pc = _peerConnection;
    final signalling = _signalling;
    final appointmentId = _appointmentId;
    if (pc == null || signalling == null || appointmentId == null) return;
    if (sdp == null || sdp.isEmpty) return;

    if (!_remoteDescriptionSet) {
      final remoteSdp = compatSdp(sdp);
      await pc.setRemoteDescription(RTCSessionDescription(remoteSdp, 'offer'));
      _remoteDescriptionSet = true;
      await _flushPendingIce();
      final answer = await pc.createAnswer();
      await pc.setLocalDescription(answer);
      _localSdpText = compatSdp(answer.sdp ?? '');
    }

    final answerSdp = _localSdpText;
    if (answerSdp == null || answerSdp.isEmpty) return;
    if (_localSdpPublished) return;

    await signalling.post(
      appointmentId: appointmentId,
      type: 'answer',
      sdp: answerSdp,
    );
    _localSdpPublished = true;
    _log('--> answer sdpChars=${answerSdp.length}');
    await _flushQueuedLocalIce();
  }

  Future<void> _acceptAnswer(String? sdp) async {
    final pc = _peerConnection;
    if (pc == null || sdp == null || sdp.isEmpty) return;
    await pc.setRemoteDescription(
      RTCSessionDescription(compatSdp(sdp), 'answer'),
    );
    _remoteDescriptionSet = true;
    await _flushPendingIce();
  }

  Future<void> _acceptRemoteIce(TeleconsultIceCandidate? candidate) async {
    if (candidate == null || candidate.candidate.isEmpty) return;
    final ice = RTCIceCandidate(
      candidate.candidate,
      candidate.sdpMid,
      candidate.sdpMLineIndex,
    );
    if (!_remoteDescriptionSet) {
      _pendingRemoteIce.add(ice);
      _log('queued ICE candidate (${_pendingRemoteIce.length} pending)');
      return;
    }
    await _peerConnection?.addCandidate(ice);
  }

  Future<void> _flushPendingIce() async {
    if (_pendingRemoteIce.isEmpty) return;
    _log('flushing ${_pendingRemoteIce.length} queued ICE candidates');
    for (final ice in List<RTCIceCandidate>.from(_pendingRemoteIce)) {
      await _peerConnection?.addCandidate(ice);
    }
    _pendingRemoteIce.clear();
  }

  Future<void> _flushQueuedLocalIce() async {
    if (_queuedLocalIce.isEmpty) return;
    final queued = List<RTCIceCandidate>.from(_queuedLocalIce);
    _queuedLocalIce.clear();
    _log('sending ${queued.length} queued local ICE candidates');
    for (final candidate in queued) {
      if (_disposed) return;
      await _sendLocalIce(candidate);
    }
  }

  Future<void> _sendLocalIce(RTCIceCandidate candidate) async {
    final signalling = _signalling;
    final appointmentId = _appointmentId;
    final value = candidate.candidate;
    if (signalling == null ||
        appointmentId == null ||
        value == null ||
        value.isEmpty) {
      return;
    }
    try {
      await signalling.post(
        appointmentId: appointmentId,
        type: 'ice_candidate',
        candidate: TeleconsultIceCandidate(
          candidate: value,
          sdpMid: candidate.sdpMid,
          sdpMLineIndex: candidate.sdpMLineIndex,
        ),
      );
      _log('--> ice candidate');
    } on DioException catch (error) {
      final status = error.response?.statusCode;
      if (status == 500) {
        try {
          await signalling.post(
            appointmentId: appointmentId,
            type: 'ice_candidate',
            candidate: TeleconsultIceCandidate(
              candidate: value,
              sdpMid: candidate.sdpMid,
              sdpMLineIndex: candidate.sdpMLineIndex,
            ),
          );
          _log('--> ice candidate (retry)');
          return;
        } catch (retryError) {
          _log('ICE post failed: $retryError');
          return;
        }
      }
      _log('ICE post failed: $error');
    } catch (error) {
      _log('ICE post failed: $error');
    }
  }

  void _log(String message) {
    if (kDebugMode) {
      debugPrint('[GPS WebRTC] $message');
    }
  }
}

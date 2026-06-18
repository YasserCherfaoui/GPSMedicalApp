import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../appointments/providers/appointments.provider.dart';
import '../providers/teleconsultation.provider.dart';
import '../repositories/specialist_teleconsultation_repository.dart';
import '../utils/teleconsult_window.dart';

class SpecialistTeleconsultationScreen extends ConsumerStatefulWidget {
  const SpecialistTeleconsultationScreen({
    required this.appointmentId,
    super.key,
  });

  final String appointmentId;

  @override
  ConsumerState<SpecialistTeleconsultationScreen> createState() =>
      _SpecialistTeleconsultationScreenState();
}

class _SpecialistTeleconsultationScreenState
    extends ConsumerState<SpecialistTeleconsultationScreen> {
  TeleconsultationCallController? _controller;
  Timer? _countdownTimer;
  String? _errorMessage;
  bool _loading = true;
  Duration? _opensIn;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    unawaited(_controller?.dispose());
    super.dispose();
  }

  Future<void> _bootstrap() async {
    final appointment = await ref.read(
      specialistAppointmentDetailProvider(widget.appointmentId).future,
    );
    final window = teleconsultWindowFor(appointment);
    if (!window.isOpen) {
      _startCountdown(window);
      setState(() {
        _loading = false;
        _errorMessage = null;
      });
      return;
    }
    await _startCall(appointment);
  }

  void _startCountdown(TeleconsultWindow window) {
    _countdownTimer?.cancel();
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) {
      final remaining = window.timeUntilOpen();
      if (remaining == null) {
        _countdownTimer?.cancel();
        unawaited(_bootstrap());
        return;
      }
      if (mounted) setState(() => _opensIn = remaining);
    });
  }

  Future<void> _startCall(Appointment appointment) async {
    setState(() {
      _loading = true;
      _errorMessage = null;
    });
    try {
      final repo = ref.read(specialistTeleconsultationRepositoryProvider);
      final session = await repo.startSession(widget.appointmentId);
      final turn = await repo.fetchTurnCredentials();
      final iceServers = buildIceServers(session: session, turnCredentials: turn);
      final controller = TeleconsultationCallController(
        onRemoteStreamChanged: () {
          if (mounted) setState(() {});
        },
      );
      await controller.initialize(iceServers: iceServers);
      if (!mounted) {
        await controller.dispose();
        return;
      }
      setState(() {
        _controller = controller;
        _loading = false;
      });
    } on TeleconsultationSessionException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 425) {
        final window = teleconsultWindowFor(appointment);
        _startCountdown(window);
        setState(() {
          _loading = false;
          _errorMessage = e.message;
        });
      } else {
        setState(() {
          _loading = false;
          _errorMessage = e.message;
        });
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _errorMessage =
            AppLocalizations.of(context)!.specialistTeleconsultConnectionError;
      });
    }
  }

  Future<void> _endCall() async {
    final controller = _controller;
    final duration = controller?.elapsedSeconds() ?? 0;
    await controller?.dispose();
    _controller = null;
    try {
      if (duration > 0) {
        await ref
            .read(specialistTeleconsultationRepositoryProvider)
            .endSession(
              appointmentId: widget.appointmentId,
              durationSeconds: duration,
            );
      }
    } catch (_) {
      // End is best-effort once local media is torn down.
    }
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final controller = _controller;

    if (_loading) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.specialistTeleconsultTitle)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (controller == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.specialistTeleconsultTitle)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(GpsSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _errorMessage ?? l10n.specialistTeleconsultWindowClosed,
                  textAlign: TextAlign.center,
                ),
                if (_opensIn != null) ...[
                  const SizedBox(height: GpsSpacing.md),
                  Text(
                    l10n.specialistTeleconsultOpensIn(
                      formatTeleconsultCountdown(_opensIn!),
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
                const SizedBox(height: GpsSpacing.lg),
                SecondaryButton(
                  label: l10n.retry,
                  onPressed: _bootstrap,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(l10n.specialistTeleconsultTitle),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (controller.remoteStream != null)
            _RemoteVideoPreview(stream: controller.remoteStream!)
          else
            Center(
              child: Text(
                l10n.specialistTeleconsultWaitingPatient,
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          Positioned(
            right: GpsSpacing.md,
            top: GpsSpacing.md,
            width: 120,
            height: 160,
            child: controller.localStream != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(GpsRadii.md),
                    child: _LocalVideoPreview(stream: controller.localStream!),
                  )
                : const SizedBox.shrink(),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: GpsSpacing.lg,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton.filled(
                  onPressed: () =>
                      controller.setMicEnabled(!controller.micEnabled),
                  icon: Icon(
                    controller.micEnabled ? Icons.mic : Icons.mic_off,
                  ),
                ),
                const SizedBox(width: GpsSpacing.md),
                IconButton.filled(
                  onPressed: () =>
                      controller.setCameraEnabled(!controller.cameraEnabled),
                  icon: Icon(
                    controller.cameraEnabled
                        ? Icons.videocam
                        : Icons.videocam_off,
                  ),
                ),
                const SizedBox(width: GpsSpacing.md),
                IconButton.filled(
                  style: IconButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.error,
                  ),
                  onPressed: _endCall,
                  icon: const Icon(Icons.call_end),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RemoteVideoPreview extends StatefulWidget {
  const _RemoteVideoPreview({required this.stream});

  final MediaStream stream;

  @override
  State<_RemoteVideoPreview> createState() => _RemoteVideoPreviewState();
}

class _RemoteVideoPreviewState extends State<_RemoteVideoPreview> {
  final _renderer = RTCVideoRenderer();

  @override
  void initState() {
    super.initState();
    _initRenderer();
  }

  Future<void> _initRenderer() async {
    await _renderer.initialize();
    _renderer.srcObject = widget.stream;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _renderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RTCVideoView(_renderer, objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover);
  }
}

class _LocalVideoPreview extends StatefulWidget {
  const _LocalVideoPreview({required this.stream});

  final MediaStream stream;

  @override
  State<_LocalVideoPreview> createState() => _LocalVideoPreviewState();
}

class _LocalVideoPreviewState extends State<_LocalVideoPreview> {
  final _renderer = RTCVideoRenderer();

  @override
  void initState() {
    super.initState();
    _initRenderer();
  }

  Future<void> _initRenderer() async {
    await _renderer.initialize();
    _renderer.srcObject = widget.stream;
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _renderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RTCVideoView(_renderer, mirror: true);
  }
}

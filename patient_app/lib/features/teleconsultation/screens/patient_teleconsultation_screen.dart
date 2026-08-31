import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/appointment_detail.provider.dart';
import '../providers/teleconsultation.provider.dart';
import '../repositories/patient_teleconsultation_repository.dart';
import '../utils/teleconsult_window.dart';

class PatientTeleconsultationScreen extends ConsumerStatefulWidget {
  const PatientTeleconsultationScreen({required this.appointmentId, super.key});

  final String appointmentId;

  @override
  ConsumerState<PatientTeleconsultationScreen> createState() =>
      _PatientTeleconsultationScreenState();
}

class _PatientTeleconsultationScreenState
    extends ConsumerState<PatientTeleconsultationScreen> {
  TeleconsultationCallController? _controller;
  Timer? _countdownTimer;
  String? _errorMessage;
  bool _loading = true;
  bool _ending = false;
  bool _confirmingHangup = false;
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
    try {
      final detail = await ref.read(
        appointmentDetailProvider(widget.appointmentId).future,
      );
      final appointment = detail.appointment;
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
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _loading = false;
        _errorMessage = AppLocalizations.of(
          context,
        )!.patientTeleconsultConnectionError;
      });
    }
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
      final repo = ref.read(patientTeleconsultationRepositoryProvider);
      final session = await repo.startSession(widget.appointmentId);
      final turn = await repo.fetchTurnCredentials();
      final iceServers = buildIceServers(
        session: session,
        turnCredentials: turn,
      );
      final controller = TeleconsultationCallController(
        onRemoteStreamChanged: () {
          if (mounted) setState(() {});
        },
        onLocalMediaChanged: () {
          if (mounted) setState(() {});
        },
        onRemoteHangup: () {
          if (mounted) unawaited(_endCall(notifyPeer: false));
        },
        onIceFailed: () {
          if (!mounted) return;
          setState(() {
            _errorMessage = AppLocalizations.of(
              context,
            )!.patientTeleconsultConnectionError;
          });
        },
      );
      await controller.initialize(
        iceServers: iceServers,
        signalling: repo.signallingClient(),
        appointmentId: widget.appointmentId,
        isOfferer: false,
      );
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
        _errorMessage = AppLocalizations.of(
          context,
        )!.patientTeleconsultConnectionError;
      });
    }
  }

  Future<void> _requestHangup() async {
    if (_ending || _confirmingHangup) return;
    _confirmingHangup = true;
    try {
      final confirmed = await TeleconsultationCallBar.confirmHangup(context);
      if (!mounted || !confirmed) return;
      await _endCall();
    } finally {
      _confirmingHangup = false;
    }
  }

  Future<void> _endCall({bool notifyPeer = true}) async {
    if (_ending) return;
    _ending = true;
    final controller = _controller;
    final duration = controller?.elapsedSeconds() ?? 0;
    if (notifyPeer) {
      await controller?.sendHangup();
    }
    await controller?.dispose();
    _controller = null;
    try {
      if (duration > 0) {
        await ref
            .read(patientTeleconsultationRepositoryProvider)
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
        appBar: AppBar(title: Text(l10n.patientTeleconsultTitle)),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    if (controller == null) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.patientTeleconsultTitle)),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(GpsSpacing.lg),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _errorMessage ?? l10n.patientTeleconsultWindowClosed,
                  textAlign: TextAlign.center,
                ),
                if (_opensIn != null) ...[
                  const SizedBox(height: GpsSpacing.md),
                  Text(
                    l10n.patientTeleconsultOpensIn(
                      formatTeleconsultCountdown(_opensIn!),
                    ),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
                const SizedBox(height: GpsSpacing.lg),
                SecondaryButton(label: l10n.retry, onPressed: _bootstrap),
              ],
            ),
          ),
        ),
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        unawaited(_requestHangup());
      },
      child: Scaffold(
        backgroundColor: GpsColors.darkSurface,
        appBar: AppBar(
          title: Text(l10n.patientTeleconsultTitle),
          backgroundColor: GpsColors.darkSurface,
          foregroundColor: GpsColors.darkOnSurface,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: MaterialLocalizations.of(context).backButtonTooltip,
            onPressed: _requestHangup,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            TeleconsultationRemotePreview(
              stream: controller.remoteStream,
              waitingLabel: l10n.patientTeleconsultWaitingDoctor,
            ),
            Positioned(
              right: GpsSpacing.md,
              top: GpsSpacing.md,
              width: 120,
              height: 160,
              child: controller.localStream != null
                  ? TeleconsultationLocalPreview(
                      stream: controller.localStream!,
                      cameraEnabled: controller.cameraEnabled,
                    )
                  : const SizedBox.shrink(),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: GpsSpacing.lg,
              child: TeleconsultationCallBar(
                micEnabled: controller.micEnabled,
                cameraEnabled: controller.cameraEnabled,
                onMicPressed: () =>
                    controller.setMicEnabled(!controller.micEnabled),
                onCameraPressed: () =>
                    controller.setCameraEnabled(!controller.cameraEnabled),
                onHangupPressed: _requestHangup,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

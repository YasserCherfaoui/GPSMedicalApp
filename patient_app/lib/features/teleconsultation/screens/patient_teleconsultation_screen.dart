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
  final _remotePreviewKey = GlobalKey<TeleconsultationRemotePreviewState>();
  final _localPreviewKey = GlobalKey<TeleconsultationLocalPreviewState>();
  TeleconsultationCallController? _controller;
  Timer? _countdownTimer;
  String? _errorMessage;
  bool _loading = true;
  bool _ending = false;
  bool _confirmingLeave = false;
  bool _providerOwnsController = false;
  bool _allowPop = false;
  Duration? _opensIn;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _bootstrap());
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    if (!_providerOwnsController) {
      unawaited(_controller?.dispose());
    }
    super.dispose();
  }

  void _bindController(TeleconsultationCallController controller) {
    controller
      ..onRemoteStreamChanged = () {
        if (mounted) setState(() {});
      }
      ..onLocalMediaChanged = () {
        if (mounted) setState(() {});
      }
      ..onRemoteHangup = () {
        if (mounted) unawaited(_endCall(notifyPeer: false));
      }
      ..onIceFailed = () {
        if (!mounted) return;
        setState(() {
          _errorMessage = AppLocalizations.of(
            context,
          )!.patientTeleconsultConnectionError;
        });
      };
  }

  Future<void> _bootstrap() async {
    final existing = ref.read(activeTeleconsultationProvider);
    if (existing != null &&
        existing.appointmentId == widget.appointmentId &&
        !existing.isSpecialist) {
      _bindController(existing.controller);
      _providerOwnsController = true;
      ref.read(activeTeleconsultationProvider.notifier).setMinimized(false);
      setState(() {
        _controller = existing.controller;
        _loading = false;
        _errorMessage = null;
      });
      return;
    }

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
      final controller = TeleconsultationCallController();
      _bindController(controller);
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
      ref
          .read(activeTeleconsultationProvider.notifier)
          .attach(
            ActiveTeleconsultationSession(
              appointmentId: widget.appointmentId,
              controller: controller,
              isSpecialist: false,
              callRoute: GpsRoutes.appointmentTeleconsultation(
                widget.appointmentId,
              ),
              endSession: ({required int durationSeconds}) {
                return repo.endSession(
                  appointmentId: widget.appointmentId,
                  durationSeconds: durationSeconds,
                );
              },
            ),
          );
      _providerOwnsController = true;
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

  Future<void> _requestLeave() async {
    if (_ending || _confirmingLeave) return;
    _confirmingLeave = true;
    try {
      final choice = await TeleconsultationCallBar.confirmLeaveScreen(context);
      if (!mounted || choice == null) return;
      if (choice == TeleconsultLeaveChoice.minimize) {
        await _minimize();
      } else {
        await _endCall();
      }
    } finally {
      _confirmingLeave = false;
    }
  }

  Future<void> _requestHangup() async {
    if (_ending || _confirmingLeave) return;
    _confirmingLeave = true;
    try {
      final confirmed = await TeleconsultationCallBar.confirmHangup(context);
      if (!mounted || !confirmed) return;
      await _endCall();
    } finally {
      _confirmingLeave = false;
    }
  }

  Future<void> _detachVideo() async {
    await Future.wait<void>([
      _remotePreviewKey.currentState?.detach() ?? Future<void>.value(),
      _localPreviewKey.currentState?.detach() ?? Future<void>.value(),
    ]);
    await settleTeleconsultationVideoDetach();
  }

  Future<void> _minimize() async {
    _providerOwnsController = true;
    await _detachVideo();
    if (!mounted) return;
    setState(() => _allowPop = true);
    ref.read(activeTeleconsultationProvider.notifier).setMinimized(true);
    if (mounted) context.pop();
  }

  Future<void> _endCall({bool notifyPeer = true}) async {
    if (_ending) return;
    _ending = true;
    _providerOwnsController = true;
    await _detachVideo();
    if (mounted) setState(() => _allowPop = true);
    await ref
        .read(activeTeleconsultationProvider.notifier)
        .hangup(notifyPeer: notifyPeer);
    _controller = null;
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
      canPop: _allowPop,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        unawaited(_requestLeave());
      },
      child: Scaffold(
        backgroundColor: GpsColors.darkSurface,
        appBar: AppBar(
          title: Text(l10n.patientTeleconsultTitle),
          backgroundColor: GpsColors.darkSurface,
          foregroundColor: GpsColors.darkOnSurface,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: l10n.teleconsultMinimize,
            onPressed: _requestLeave,
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            TeleconsultationRemotePreview(
              key: _remotePreviewKey,
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
                      key: _localPreviewKey,
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
                onMicPressed: () {
                  unawaited(
                    controller.setMicEnabled(!controller.micEnabled),
                  );
                  setState(() {});
                },
                onCameraPressed: () {
                  unawaited(
                    controller.setCameraEnabled(!controller.cameraEnabled),
                  );
                  setState(() {});
                },
                onMinimizePressed: _minimize,
                onHangupPressed: _requestHangup,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

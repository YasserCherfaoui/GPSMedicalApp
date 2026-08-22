import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../l10n/generated/app_localizations.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';
import '../widgets/gps_modal.dart';

/// Mic, camera, and hang-up controls with a clear on/off appearance.
class TeleconsultationCallBar extends StatelessWidget {
  const TeleconsultationCallBar({
    required this.micEnabled,
    required this.cameraEnabled,
    required this.onMicPressed,
    required this.onCameraPressed,
    required this.onHangupPressed,
    super.key,
  });

  static const micKey = Key('teleconsult-mic');
  static const cameraKey = Key('teleconsult-camera');
  static const hangupKey = Key('teleconsult-hangup');

  final bool micEnabled;
  final bool cameraEnabled;
  final VoidCallback onMicPressed;
  final VoidCallback onCameraPressed;
  final VoidCallback onHangupPressed;

  static Future<bool> confirmHangup(BuildContext context) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await GpsModal.show<bool>(
      context: context,
      title: l10n.teleconsultHangupTitle,
      message: l10n.teleconsultHangupMessage,
      primaryActionLabel: l10n.teleconsultHangupConfirm,
      secondaryActionLabel: l10n.teleconsultHangupStay,
      primaryIsDestructive: true,
    );
    return confirmed == true;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _CallToggle(
              buttonKey: micKey,
              enabled: micEnabled,
              enabledIcon: Icons.mic,
              disabledIcon: Icons.mic_off,
              enabledTooltip: l10n.teleconsultMicOn,
              disabledTooltip: l10n.teleconsultMicOff,
              onPressed: onMicPressed,
            ),
            const SizedBox(width: GpsSpacing.md),
            _CallToggle(
              buttonKey: cameraKey,
              enabled: cameraEnabled,
              enabledIcon: Icons.videocam,
              disabledIcon: Icons.videocam_off,
              enabledTooltip: l10n.teleconsultCameraOn,
              disabledTooltip: l10n.teleconsultCameraOff,
              onPressed: onCameraPressed,
            ),
            const SizedBox(width: GpsSpacing.md),
            _CallToggle(
              buttonKey: hangupKey,
              enabled: true,
              enabledIcon: Icons.call_end,
              disabledIcon: Icons.call_end,
              enabledTooltip: l10n.teleconsultHangupConfirm,
              disabledTooltip: l10n.teleconsultHangupConfirm,
              onPressed: onHangupPressed,
              destructive: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _CallToggle extends StatelessWidget {
  const _CallToggle({
    required this.buttonKey,
    required this.enabled,
    required this.enabledIcon,
    required this.disabledIcon,
    required this.enabledTooltip,
    required this.disabledTooltip,
    required this.onPressed,
    this.destructive = false,
  });

  final Key buttonKey;
  final bool enabled;
  final IconData enabledIcon;
  final IconData disabledIcon;
  final String enabledTooltip;
  final String disabledTooltip;
  final VoidCallback onPressed;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final tooltip = enabled ? enabledTooltip : disabledTooltip;
    final background = destructive
        ? scheme.error
        : enabled
        ? Colors.white
        : scheme.error;
    final foreground = destructive || !enabled
        ? scheme.onError
        : Colors.black87;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Tooltip(
          message: tooltip,
          child: Semantics(
            button: true,
            enabled: true,
            label: tooltip,
            selected: !destructive && enabled,
            child: Material(
              color: background,
              shape: const CircleBorder(),
              elevation: 2,
              child: InkWell(
                key: buttonKey,
                customBorder: const CircleBorder(),
                onTap: onPressed,
                child: SizedBox(
                  width: 56,
                  height: 56,
                  child: Icon(
                    enabled ? enabledIcon : disabledIcon,
                    color: foreground,
                    size: 26,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: GpsSpacing.xs),
        SizedBox(
          width: 88,
          child: Text(
            tooltip,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

/// Remote peer video, or a waiting placeholder.
class TeleconsultationRemotePreview extends StatefulWidget {
  const TeleconsultationRemotePreview({
    required this.waitingLabel,
    super.key,
    this.stream,
  });

  final MediaStream? stream;
  final String waitingLabel;

  @override
  State<TeleconsultationRemotePreview> createState() =>
      _TeleconsultationRemotePreviewState();
}

class _TeleconsultationRemotePreviewState
    extends State<TeleconsultationRemotePreview> {
  final _renderer = RTCVideoRenderer();
  var _initialized = false;

  @override
  void initState() {
    super.initState();
    unawaited(_bind());
  }

  @override
  void didUpdateWidget(TeleconsultationRemotePreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stream != widget.stream) {
      unawaited(_bind());
    }
  }

  Future<void> _bind() async {
    if (!_initialized) {
      await _renderer.initialize();
      _initialized = true;
    }
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
    if (widget.stream == null) {
      return Center(
        child: Text(
          widget.waitingLabel,
          style: const TextStyle(color: Colors.white70),
        ),
      );
    }
    return RTCVideoView(
      _renderer,
      objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
    );
  }
}

/// Local camera pip. Dims and labels when the camera is muted.
class TeleconsultationLocalPreview extends StatefulWidget {
  const TeleconsultationLocalPreview({
    required this.stream,
    required this.cameraEnabled,
    super.key,
  });

  final MediaStream stream;
  final bool cameraEnabled;

  @override
  State<TeleconsultationLocalPreview> createState() =>
      _TeleconsultationLocalPreviewState();
}

class _TeleconsultationLocalPreviewState
    extends State<TeleconsultationLocalPreview> {
  final _renderer = RTCVideoRenderer();
  var _initialized = false;

  @override
  void initState() {
    super.initState();
    unawaited(_bind());
  }

  @override
  void didUpdateWidget(TeleconsultationLocalPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.stream != widget.stream) {
      unawaited(_bind());
    }
  }

  Future<void> _bind() async {
    if (!_initialized) {
      await _renderer.initialize();
      _initialized = true;
    }
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
    final l10n = AppLocalizations.of(context)!;
    return ClipRRect(
      borderRadius: BorderRadius.circular(GpsRadii.md),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(
            color: Colors.black,
            child: widget.cameraEnabled
                ? RTCVideoView(_renderer, mirror: true)
                : const SizedBox.expand(),
          ),
          if (!widget.cameraEnabled)
            ColoredBox(
              color: Colors.black.withValues(alpha: 0.72),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.videocam_off, color: Colors.white, size: 28),
                  const SizedBox(height: GpsSpacing.xs),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GpsSpacing.xs,
                    ),
                    child: Text(
                      l10n.teleconsultCameraOff,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 11),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

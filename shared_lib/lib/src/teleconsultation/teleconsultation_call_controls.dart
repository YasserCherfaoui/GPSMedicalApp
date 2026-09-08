import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

import '../l10n/generated/app_localizations.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';
import '../widgets/gps_modal.dart';

/// Result of [TeleconsultationCallBar.confirmLeaveScreen].
enum TeleconsultLeaveChoice { minimize, hangup }

/// Mic, camera, and hang-up controls with a clear on/off appearance.
class TeleconsultationCallBar extends StatelessWidget {
  const TeleconsultationCallBar({
    required this.micEnabled,
    required this.cameraEnabled,
    required this.onMicPressed,
    required this.onCameraPressed,
    required this.onHangupPressed,
    this.onMinimizePressed,
    super.key,
  });

  static const micKey = Key('teleconsult-mic');
  static const cameraKey = Key('teleconsult-camera');
  static const hangupKey = Key('teleconsult-hangup');
  static const minimizeKey = Key('teleconsult-minimize');

  final bool micEnabled;
  final bool cameraEnabled;
  final VoidCallback onMicPressed;
  final VoidCallback onCameraPressed;
  final VoidCallback onHangupPressed;
  final VoidCallback? onMinimizePressed;

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

  /// Back navigation while in call: minimize, hang up, or stay.
  static Future<TeleconsultLeaveChoice?> confirmLeaveScreen(
    BuildContext context,
  ) {
    final l10n = AppLocalizations.of(context)!;
    return showModalBottomSheet<TeleconsultLeaveChoice>(
      context: context,
      showDragHandle: true,
      builder: (ctx) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              GpsSpacing.md,
              0,
              GpsSpacing.md,
              GpsSpacing.md,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  l10n.teleconsultHangupOrMinimizeTitle,
                  style: Theme.of(ctx).textTheme.titleMedium,
                ),
                const SizedBox(height: GpsSpacing.sm),
                Text(l10n.teleconsultHangupOrMinimizeMessage),
                const SizedBox(height: GpsSpacing.md),
                FilledButton.tonal(
                  onPressed: () =>
                      Navigator.pop(ctx, TeleconsultLeaveChoice.minimize),
                  child: Text(l10n.teleconsultMinimizeAction),
                ),
                const SizedBox(height: GpsSpacing.sm),
                FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(ctx).colorScheme.error,
                  ),
                  onPressed: () =>
                      Navigator.pop(ctx, TeleconsultLeaveChoice.hangup),
                  child: Text(l10n.teleconsultHangupConfirm),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: Text(l10n.teleconsultHangupStay),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.sm),
        child: Row(
          children: [
            Expanded(
              child: _CallToggle(
                buttonKey: micKey,
                enabled: micEnabled,
                enabledIcon: Icons.mic,
                disabledIcon: Icons.mic_off,
                enabledTooltip: l10n.teleconsultMicOn,
                disabledTooltip: l10n.teleconsultMicOff,
                onPressed: onMicPressed,
              ),
            ),
            Expanded(
              child: _CallToggle(
                buttonKey: cameraKey,
                enabled: cameraEnabled,
                enabledIcon: Icons.videocam,
                disabledIcon: Icons.videocam_off,
                enabledTooltip: l10n.teleconsultCameraOn,
                disabledTooltip: l10n.teleconsultCameraOff,
                onPressed: onCameraPressed,
              ),
            ),
            if (onMinimizePressed != null)
              Expanded(
                child: _CallToggle(
                  buttonKey: minimizeKey,
                  enabled: true,
                  enabledIcon: Icons.picture_in_picture_alt,
                  disabledIcon: Icons.picture_in_picture_alt,
                  enabledTooltip: l10n.teleconsultMinimize,
                  disabledTooltip: l10n.teleconsultMinimize,
                  onPressed: onMinimizePressed!,
                ),
              ),
            Expanded(
              child: _CallToggle(
                buttonKey: hangupKey,
                enabled: true,
                enabledIcon: Icons.call_end,
                disabledIcon: Icons.call_end,
                enabledTooltip: l10n.teleconsultHangupConfirm,
                disabledTooltip: l10n.teleconsultHangupConfirm,
                onPressed: onHangupPressed,
                destructive: true,
              ),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.xs),
      child: Column(
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
                    width: 52,
                    height: 52,
                    child: Icon(
                      enabled ? enabledIcon : disabledIcon,
                      color: foreground,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: GpsSpacing.xs),
          Text(
            tooltip,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 10,
              height: 1.15,
            ),
          ),
        ],
      ),
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
  TeleconsultationRemotePreviewState createState() =>
      TeleconsultationRemotePreviewState();
}

class TeleconsultationRemotePreviewState
    extends State<TeleconsultationRemotePreview> {
  final _renderer = RTCVideoRenderer();
  var _initialized = false;
  var _bindGeneration = 0;
  var _detached = false;

  @override
  void initState() {
    super.initState();
    unawaited(_bind());
  }

  @override
  void didUpdateWidget(TeleconsultationRemotePreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_detached && oldWidget.stream != widget.stream) {
      unawaited(_bind());
    }
  }

  Future<void> _bind() async {
    if (_detached) return;
    final generation = ++_bindGeneration;
    if (!_initialized) {
      await _renderer.initialize();
      if (!mounted || generation != _bindGeneration || _detached) return;
      _initialized = true;
    }
    if (generation != _bindGeneration || _detached) return;
    _renderer.srcObject = widget.stream;
    if (mounted) setState(() {});
  }

  /// Clears the texture before the route is popped (avoids ghost frames).
  Future<void> detach() async {
    if (_detached) return;
    _detached = true;
    _bindGeneration++;
    _renderer.srcObject = null;
    if (_initialized) {
      _initialized = false;
      await _renderer.dispose();
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _bindGeneration++;
    if (!_detached) {
      _renderer.srcObject = null;
      if (_initialized) {
        unawaited(_renderer.dispose());
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_detached || widget.stream == null) {
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
  TeleconsultationLocalPreviewState createState() =>
      TeleconsultationLocalPreviewState();
}

class TeleconsultationLocalPreviewState
    extends State<TeleconsultationLocalPreview> {
  final _renderer = RTCVideoRenderer();
  var _initialized = false;
  var _bindGeneration = 0;
  var _detached = false;

  @override
  void initState() {
    super.initState();
    unawaited(_bind());
  }

  @override
  void didUpdateWidget(TeleconsultationLocalPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!_detached && oldWidget.stream != widget.stream) {
      unawaited(_bind());
    }
  }

  Future<void> _bind() async {
    if (_detached) return;
    final generation = ++_bindGeneration;
    if (!_initialized) {
      await _renderer.initialize();
      if (!mounted || generation != _bindGeneration || _detached) return;
      _initialized = true;
    }
    if (generation != _bindGeneration || _detached) return;
    _renderer.srcObject = widget.stream;
    if (mounted) setState(() {});
  }

  Future<void> detach() async {
    if (_detached) return;
    _detached = true;
    _bindGeneration++;
    _renderer.srcObject = null;
    if (_initialized) {
      _initialized = false;
      await _renderer.dispose();
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _bindGeneration++;
    if (!_detached) {
      _renderer.srcObject = null;
      if (_initialized) {
        unawaited(_renderer.dispose());
      }
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_detached) {
      return const ColoredBox(color: Colors.black);
    }
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

/// Waits a couple of frames after video widgets have detached their textures.
Future<void> settleTeleconsultationVideoDetach() async {
  await WidgetsBinding.instance.endOfFrame;
  await Future<void>.delayed(const Duration(milliseconds: 50));
  await WidgetsBinding.instance.endOfFrame;
}

/// Removes [RTCVideoView] platform layers before popping a call route.
@Deprecated('Use preview.detach() + settleTeleconsultationVideoDetach')
Future<void> detachTeleconsultationVideoPlatformViews(
  VoidCallback removeVideoFromTree,
) async {
  removeVideoFromTree();
  await settleTeleconsultationVideoDetach();
}

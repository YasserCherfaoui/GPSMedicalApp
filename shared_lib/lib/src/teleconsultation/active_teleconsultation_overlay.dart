import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../l10n/generated/app_localizations.dart';
import '../theme/gps_radii.dart';
import '../theme/gps_spacing.dart';
import 'active_teleconsultation.dart';
import 'teleconsultation_call_controls.dart';

/// Inserts the minimized-call chip into the root [Navigator] overlay.
///
/// Must not paint the chip as a sibling of the navigator in [MaterialApp.builder]
/// — that context has no [Overlay], so [Tooltip]/[IconButton] throw
/// "No Overlay widget found".
class ActiveTeleconsultationOverlay extends ConsumerStatefulWidget {
  const ActiveTeleconsultationOverlay({
    required this.child,
    required this.navigatorKey,
    super.key,
  });

  final Widget child;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  ConsumerState<ActiveTeleconsultationOverlay> createState() =>
      _ActiveTeleconsultationOverlayState();
}

class _ActiveTeleconsultationOverlayState
    extends ConsumerState<ActiveTeleconsultationOverlay> {
  OverlayEntry? _entry;

  @override
  void dispose() {
    _removeEntry();
    super.dispose();
  }

  void _syncOverlay(ActiveTeleconsultationSession? session) {
    final show = session != null && session.minimized;
    if (show) {
      _insertEntry();
    } else {
      _removeEntry();
    }
  }

  void _insertEntry() {
    final overlay = widget.navigatorKey.currentState?.overlay;
    if (overlay == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        final current = ref.read(activeTeleconsultationProvider);
        if (current != null && current.minimized) {
          _insertEntry();
        }
      });
      return;
    }

    if (_entry != null) {
      _entry!.markNeedsBuild();
      return;
    }

    _entry = OverlayEntry(
      builder: (overlayContext) {
        final current = ref.read(activeTeleconsultationProvider);
        if (current == null || !current.minimized) {
          return const SizedBox.shrink();
        }
        return _ActiveCallChip(
          session: current,
          navigatorKey: widget.navigatorKey,
        );
      },
    );
    overlay.insert(_entry!);
  }

  void _removeEntry() {
    _entry?.remove();
    _entry = null;
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<ActiveTeleconsultationSession?>(
      activeTeleconsultationProvider,
      (previous, next) => _syncOverlay(next),
    );
    return widget.child;
  }
}

class _ActiveCallChip extends ConsumerWidget {
  const _ActiveCallChip({
    required this.session,
    required this.navigatorKey,
  });

  final ActiveTeleconsultationSession session;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return SafeArea(
      child: Align(
        alignment: Alignment.bottomRight,
        child: Padding(
          padding: const EdgeInsets.only(
            right: GpsSpacing.md,
            bottom: GpsSpacing.xl,
          ),
          child: Material(
            elevation: 8,
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(GpsRadii.full),
            child: InkWell(
              borderRadius: BorderRadius.circular(GpsRadii.full),
              onTap: () {
                ref
                    .read(activeTeleconsultationProvider.notifier)
                    .setMinimized(false);
                final navContext = navigatorKey.currentContext;
                if (navContext != null && navContext.mounted) {
                  navContext.push(session.callRoute);
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  GpsSpacing.md,
                  GpsSpacing.sm,
                  GpsSpacing.xs,
                  GpsSpacing.sm,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.videocam,
                      color: theme.colorScheme.onPrimaryContainer,
                      size: 20,
                    ),
                    const SizedBox(width: GpsSpacing.sm),
                    Text(
                      l10n.teleconsultReturnToCall,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onPrimaryContainer,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      visualDensity: VisualDensity.compact,
                      tooltip: l10n.teleconsultHangupConfirm,
                      onPressed: () async {
                        final confirmed =
                            await TeleconsultationCallBar.confirmHangup(
                          context,
                        );
                        if (!confirmed) return;
                        await ref
                            .read(activeTeleconsultationProvider.notifier)
                            .hangup();
                      },
                      icon: Icon(
                        Icons.call_end,
                        color: theme.colorScheme.error,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

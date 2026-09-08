import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Listens for `instant.request` WS events and shows a blocking accept/decline.
///
/// Must sit above [MaterialApp] for lifecycle, but dialogs use [navigatorKey]
/// (root GoRouter navigator) — this widget's own [BuildContext] has no
/// [Navigator] / [Localizations].
class InstantRequestPromptHost extends ConsumerStatefulWidget {
  const InstantRequestPromptHost({
    required this.navigatorKey,
    required this.child,
    super.key,
  });

  final GlobalKey<NavigatorState> navigatorKey;
  final Widget child;

  @override
  ConsumerState<InstantRequestPromptHost> createState() =>
      _InstantRequestPromptHostState();
}

class _InstantRequestPromptHostState
    extends ConsumerState<InstantRequestPromptHost> {
  var _showing = false;
  final _seenRequestIds = <String>{};

  Future<void> _showPrompt(
    String requestId,
    Map<String, dynamic> payload,
  ) async {
    final navCtx = widget.navigatorKey.currentContext;
    if (navCtx == null || !navCtx.mounted) {
      if (kDebugMode) {
        debugPrint(
          'InstantRequestPromptHost: no navigator context yet for $requestId; retrying',
        );
      }
      Future<void>.delayed(const Duration(milliseconds: 400), () {
        if (!mounted || _showing) return;
        unawaited(_showPrompt(requestId, payload));
      });
      return;
    }

    _showing = true;
    final l10n = AppLocalizations.of(navCtx)!;
    final theme = Theme.of(navCtx);
    try {
      if (kDebugMode) {
        debugPrint('InstantRequestPromptHost: showing dialog for $requestId');
      }
      await showDialog<void>(
        context: navCtx,
        barrierDismissible: false,
        builder: (ctx) {
          var busy = false;
          return StatefulBuilder(
            builder: (ctx, setLocal) {
              Future<void> act(bool accept) async {
                setLocal(() => busy = true);
                try {
                  final repo = ref.read(engagementRepositoryProvider);
                  if (accept) {
                    await repo.acceptInstantConsultRequest(requestId);
                  } else {
                    await repo.declineInstantConsultRequest(requestId);
                  }
                  if (ctx.mounted) Navigator.of(ctx).pop();
                } catch (_) {
                  if (!ctx.mounted) return;
                  ScaffoldMessenger.of(ctx).showSnackBar(
                    SnackBar(content: Text(l10n.networkError)),
                  );
                  setLocal(() => busy = false);
                }
              }

              return AlertDialog(
                title: Text(l10n.engagementInstantIncomingTitle),
                content: Text(l10n.engagementInstantIncomingBody),
                actions: [
                  TextButton(
                    onPressed: busy ? null : () => act(false),
                    child: Text(l10n.engagementDeclineRequest),
                  ),
                  FilledButton(
                    onPressed: busy ? null : () => act(true),
                    style: FilledButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                    ),
                    child: Text(l10n.engagementAcceptRequest),
                  ),
                ],
              );
            },
          );
        },
      );
    } catch (e, st) {
      if (kDebugMode) {
        debugPrint('InstantRequestPromptHost: dialog failed: $e\n$st');
      }
      _seenRequestIds.remove(requestId);
    } finally {
      _showing = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<MessagingRealtimeEvent>>(
      messagingRealtimeEventsProvider,
      (_, next) {
        final event = next.asData?.value;
        if (event == null || event.type != 'instant.request') return;
        final requestId = event.payload['id'] as String? ?? '';
        if (requestId.isEmpty || _showing || !mounted) return;
        if (!_seenRequestIds.add(requestId)) return;
        if (kDebugMode) {
          debugPrint('InstantRequestPromptHost: received instant.request $requestId');
        }
        unawaited(_showPrompt(requestId, event.payload));
      },
    );
    return widget.child;
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Listens for `instant.request` WS events and shows a blocking accept/decline.
class InstantRequestPromptHost extends ConsumerStatefulWidget {
  const InstantRequestPromptHost({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<InstantRequestPromptHost> createState() =>
      _InstantRequestPromptHostState();
}

class _InstantRequestPromptHostState
    extends ConsumerState<InstantRequestPromptHost> {
  StreamSubscription<MessagingRealtimeEvent>? _sub;
  var _showing = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _attach());
  }

  void _attach() {
    _sub?.cancel();
    final ws = ref.read(messagingWebSocketClientProvider);
    if (ws == null) return;
    _sub = ws.events.listen((event) {
      if (event.type != 'instant.request') return;
      final requestId = event.payload['id'] as String? ?? '';
      if (requestId.isEmpty || _showing || !mounted) return;
      unawaited(_showPrompt(requestId, event.payload));
    });
  }

  Future<void> _showPrompt(
    String requestId,
    Map<String, dynamic> payload,
  ) async {
    _showing = true;
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    try {
      await showDialog<void>(
        context: context,
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
    } finally {
      _showing = false;
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Re-attach when WS client appears after auth.
    ref.listen(messagingWebSocketClientProvider, (_, __) => _attach());
    return widget.child;
  }
}

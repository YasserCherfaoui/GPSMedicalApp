import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Placeholder until task **9.2** (thread detail / chat UI).
class MessagingThreadScreen extends StatelessWidget {
  const MessagingThreadScreen({required this.threadId, super.key});

  final String threadId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.messagingTitle)),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(GpsSpacing.lg),
          child: Text(
            l10n.messagingThreadPlaceholder,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

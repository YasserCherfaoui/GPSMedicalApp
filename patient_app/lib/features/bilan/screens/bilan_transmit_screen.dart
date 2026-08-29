import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/bilan_providers.dart';
import '../repositories/bilan_repository.dart';

class BilanTransmitScreen extends ConsumerStatefulWidget {
  const BilanTransmitScreen({required this.bilanId, super.key});

  final String bilanId;

  @override
  ConsumerState<BilanTransmitScreen> createState() =>
      _BilanTransmitScreenState();
}

class _BilanTransmitScreenState extends ConsumerState<BilanTransmitScreen> {
  final _specialistController = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _specialistController.dispose();
    super.dispose();
  }

  Future<void> _transmit() async {
    final l10n = AppLocalizations.of(context)!;
    final specialistId = _specialistController.text.trim();
    if (specialistId.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.bilanTransmitSpecialistRequired)),
      );
      return;
    }
    setState(() => _busy = true);
    try {
      final repo = ref.read(bilanRepositoryProvider);
      await repo.transmit(bilanId: widget.bilanId, specialistId: specialistId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.bilanTransmitSuccess)),
        );
        context.pop();
      }
    } on BilanApiException catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.bilanTransmitTitle)),
      body: Padding(
        padding: const EdgeInsets.all(GpsSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(l10n.bilanTransmitHelp),
            const SizedBox(height: GpsSpacing.lg),
            TextField(
              controller: _specialistController,
              decoration: InputDecoration(
                labelText: l10n.bilanTransmitSpecialistId,
              ),
            ),
            const SizedBox(height: GpsSpacing.xl),
            FilledButton(
              onPressed: _busy ? null : _transmit,
              child: _busy
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : Text(l10n.bilanTransmitConfirm),
            ),
          ],
        ),
      ),
    );
  }
}

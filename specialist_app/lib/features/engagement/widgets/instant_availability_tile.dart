import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Instant availability controls on the specialist profile hub.
class InstantAvailabilityTile extends ConsumerStatefulWidget {
  const InstantAvailabilityTile({super.key});

  @override
  ConsumerState<InstantAvailabilityTile> createState() =>
      _InstantAvailabilityTileState();
}

class _InstantAvailabilityTileState
    extends ConsumerState<InstantAvailabilityTile> {
  var _active = false;
  var _busy = false;
  final _priceController = TextEditingController(text: '5000');

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _toggle(bool value) async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _busy = true);
    try {
      final repo = ref.read(engagementRepositoryProvider);
      if (value) {
        final price = int.tryParse(_priceController.text.trim()) ?? 0;
        await repo.setInstantAvailability(
          active: true,
          priceMinor: price,
          currency: 'DZD',
        );
      } else {
        await repo.clearInstantAvailability();
      }
      if (!mounted) return;
      setState(() => _active = value);
    } on DioException catch (e) {
      if (!mounted) return;
      final msg = e.response?.statusCode == 503
          ? l10n.engagementInstantDisabled
          : l10n.networkError;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.networkError)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.engagementInstantToggleTitle),
          subtitle: Text(l10n.engagementInstantToggleSubtitle),
          value: _active,
          onChanged: _busy ? null : _toggle,
        ),
        TextField(
          controller: _priceController,
          enabled: !_busy && !_active,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: l10n.engagementInstantPriceLabel,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}

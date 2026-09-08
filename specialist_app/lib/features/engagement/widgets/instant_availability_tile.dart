import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../providers/instant_availability.provider.dart';

/// Instant availability controls on the specialist profile hub.
///
/// State is loaded from the API and kept in
/// [specialistInstantAvailabilityProvider] so navigating away does not reset
/// the switch before [InstantAvailability.autoExpiresAt].
class InstantAvailabilityTile extends ConsumerStatefulWidget {
  const InstantAvailabilityTile({super.key});

  @override
  ConsumerState<InstantAvailabilityTile> createState() =>
      _InstantAvailabilityTileState();
}

class _InstantAvailabilityTileState
    extends ConsumerState<InstantAvailabilityTile> {
  var _busy = false;
  var _priceSeeded = false;
  final _priceController = TextEditingController(text: '5000');

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  void _seedPrice(InstantAvailability? avail) {
    if (_priceSeeded || avail == null || avail.priceMinor <= 0) return;
    _priceSeeded = true;
    _priceController.text = '${avail.priceMinor}';
  }

  Future<void> _toggle(bool value) async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _busy = true);
    try {
      final price = int.tryParse(_priceController.text.trim()) ?? 0;
      await ref
          .read(specialistInstantAvailabilityProvider.notifier)
          .setActive(
            active: value,
            priceMinor: price,
            currency: 'DZD',
          );
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
    final async = ref.watch(specialistInstantAvailabilityProvider);
    final avail = async.valueOrNull;
    final active = avail?.active ?? false;
    final expiresAt = avail?.autoExpiresAt?.toLocal();
    _seedPrice(avail);

    final subtitle = active && expiresAt != null
        ? l10n.engagementInstantToggleUntil(
            DateFormat.Hm().format(expiresAt),
          )
        : l10n.engagementInstantToggleSubtitle;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SwitchListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(l10n.engagementInstantToggleTitle),
          subtitle: Text(subtitle),
          value: active,
          onChanged: _busy || async.isLoading ? null : _toggle,
        ),
        TextField(
          controller: _priceController,
          enabled: !_busy && !active,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          decoration: InputDecoration(
            labelText: l10n.engagementInstantPriceLabel,
            border: const OutlineInputBorder(),
          ),
        ),
        if (active) ...[
          const SizedBox(height: GpsSpacing.sm),
          Text(
            l10n.engagementInstantTogglePresenceHint,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}

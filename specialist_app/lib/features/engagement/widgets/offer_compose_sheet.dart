import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Specialist compose sheet: propose a paid slot to the patient on this thread.
Future<void> showOfferComposeSheet(
  BuildContext context,
  WidgetRef ref, {
  required String patientId,
  String? threadId,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (ctx) => _OfferComposeSheet(
      patientId: patientId,
      threadId: threadId,
    ),
  );
}

class _OfferComposeSheet extends ConsumerStatefulWidget {
  const _OfferComposeSheet({
    required this.patientId,
    this.threadId,
  });

  final String patientId;
  final String? threadId;

  @override
  ConsumerState<_OfferComposeSheet> createState() => _OfferComposeSheetState();
}

class _OfferComposeSheetState extends ConsumerState<_OfferComposeSheet> {
  final _priceController = TextEditingController(text: '5000');
  var _durationMinutes = 30;
  var _mode = 'telehealth';
  DateTime _startAt = DateTime.now().add(const Duration(hours: 2));
  var _busy = false;

  @override
  void dispose() {
    _priceController.dispose();
    super.dispose();
  }

  Future<void> _pickStart() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _startAt,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 90)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(_startAt),
    );
    if (time == null || !mounted) return;
    setState(() {
      _startAt = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    });
  }

  Future<void> _submit() async {
    final l10n = AppLocalizations.of(context)!;
    final price = int.tryParse(_priceController.text.trim()) ?? 0;
    if (price <= 0) return;
    setState(() => _busy = true);
    try {
      await ref.read(engagementRepositoryProvider).createOffer(
            patientId: widget.patientId,
            startAt: _startAt,
            durationMinutes: _durationMinutes,
            mode: _mode,
            priceMinor: price,
            currency: 'DZD',
            threadId: widget.threadId,
            expiresAt: DateTime.now().add(const Duration(hours: 24)),
          );
      if (!mounted) return;
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.engagementOfferSent)),
      );
    } on DioException catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.engagementOfferError)),
      );
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.engagementOfferError)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final bottom = MediaQuery.viewInsetsOf(context).bottom;
    return Padding(
      padding: EdgeInsets.fromLTRB(
        GpsSpacing.lg,
        GpsSpacing.lg,
        GpsSpacing.lg,
        GpsSpacing.lg + bottom,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.engagementOfferComposeTitle,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: GpsSpacing.md),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.engagementOfferStartLabel),
              subtitle: Text(_startAt.toLocal().toString()),
              trailing: const Icon(Icons.schedule),
              onTap: _busy ? null : _pickStart,
            ),
            DropdownButtonFormField<int>(
              value: _durationMinutes,
              decoration: InputDecoration(
                labelText: l10n.engagementOfferDurationLabel,
                border: const OutlineInputBorder(),
              ),
              items: const [
                DropdownMenuItem(value: 15, child: Text('15')),
                DropdownMenuItem(value: 30, child: Text('30')),
                DropdownMenuItem(value: 45, child: Text('45')),
                DropdownMenuItem(value: 60, child: Text('60')),
              ],
              onChanged: _busy
                  ? null
                  : (v) {
                      if (v != null) setState(() => _durationMinutes = v);
                    },
            ),
            const SizedBox(height: GpsSpacing.md),
            DropdownButtonFormField<String>(
              value: _mode,
              decoration: InputDecoration(
                labelText: l10n.engagementOfferModeLabel,
                border: const OutlineInputBorder(),
              ),
              items: [
                DropdownMenuItem(
                  value: 'telehealth',
                  child: Text(l10n.bookingModeTelehealth),
                ),
                DropdownMenuItem(
                  value: 'in_person',
                  child: Text(l10n.bookingModeInPerson),
                ),
              ],
              onChanged: _busy
                  ? null
                  : (v) {
                      if (v != null) setState(() => _mode = v);
                    },
            ),
            const SizedBox(height: GpsSpacing.md),
            TextField(
              controller: _priceController,
              enabled: !_busy,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: l10n.engagementInstantPriceLabel,
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: GpsSpacing.lg),
            PrimaryButton(
              label: l10n.engagementOfferSend,
              onPressed: _busy ? null : _submit,
            ),
          ],
        ),
      ),
    );
  }
}

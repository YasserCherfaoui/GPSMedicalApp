import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../../appointments/providers/appointments.provider.dart';
import '../../../routing/specialist_routes.dart';
import '../providers/prescription.provider.dart';
import '../repositories/specialist_prescription_repository.dart';

class _DrugDraft {
  _DrugDraft()
      : nameController = TextEditingController(),
        dosageController = TextEditingController(),
        frequencyController = TextEditingController(),
        durationController = TextEditingController(),
        instructionsController = TextEditingController();

  final TextEditingController nameController;
  final TextEditingController dosageController;
  final TextEditingController frequencyController;
  final TextEditingController durationController;
  final TextEditingController instructionsController;

  void dispose() {
    nameController.dispose();
    dosageController.dispose();
    frequencyController.dispose();
    durationController.dispose();
    instructionsController.dispose();
  }
}

class SpecialistPrescriptionComposeScreen extends ConsumerStatefulWidget {
  const SpecialistPrescriptionComposeScreen({
    required this.appointmentId,
    super.key,
  });

  final String appointmentId;

  @override
  ConsumerState<SpecialistPrescriptionComposeScreen> createState() =>
      _SpecialistPrescriptionComposeScreenState();
}

class _SpecialistPrescriptionComposeScreenState
    extends ConsumerState<SpecialistPrescriptionComposeScreen> {
  final _diagnosisController = TextEditingController();
  final _drugs = <_DrugDraft>[_DrugDraft()];
  DateTime? _validUntil;
  bool _submitting = false;

  @override
  void dispose() {
    _diagnosisController.dispose();
    for (final drug in _drugs) {
      drug.dispose();
    }
    super.dispose();
  }

  void _addDrug() {
    setState(() => _drugs.add(_DrugDraft()));
  }

  void _removeDrug(int index) {
    if (_drugs.length <= 1) return;
    setState(() {
      _drugs[index].dispose();
      _drugs.removeAt(index);
    });
  }

  Future<void> _pickValidUntil() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _validUntil ?? now.add(const Duration(days: 30)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _validUntil = picked);
    }
  }

  List<PrescriptionItem> _buildItems() {
    return _drugs
        .where((drug) => drug.nameController.text.trim().isNotEmpty)
        .map((drug) {
          final duration = int.tryParse(drug.durationController.text.trim());
          return PrescriptionItem((b) {
            b
              ..drugName = drug.nameController.text.trim()
              ..dosage = drug.dosageController.text.trim().isEmpty
                  ? '-'
                  : drug.dosageController.text.trim()
              ..frequency = drug.frequencyController.text.trim().isEmpty
                  ? '-'
                  : drug.frequencyController.text.trim()
              ..durationDays = duration ?? 1
              ..instructions = drug.instructionsController.text.trim().isEmpty
                  ? null
                  : drug.instructionsController.text.trim();
          });
        })
        .toList();
  }

  Future<void> _submit() async {
    if (_submitting) return;
    final l10n = AppLocalizations.of(context)!;
    final items = _buildItems();
    if (items.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.specialistPrescriptionAtLeastOneDrug)),
      );
      return;
    }

    setState(() => _submitting = true);
    try {
      final prescription = await ref
          .read(specialistPrescriptionRepositoryProvider)
          .create(
            appointmentId: widget.appointmentId,
            items: items,
            diagnosis: _diagnosisController.text.trim().isEmpty
                ? null
                : _diagnosisController.text.trim(),
            validUntil: _validUntil == null
                ? null
                : Date(
                    _validUntil!.year,
                    _validUntil!.month,
                    _validUntil!.day,
                  ),
          );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.specialistPrescriptionSuccess)),
      );
      final pdfId = prescription.pdfDocumentId;
      if (pdfId != null && pdfId.isNotEmpty) {
        context.pushReplacement(SpecialistRoutes.medicalRecordViewer(pdfId));
      } else {
        context.pop();
      }
    } on PrescriptionSubmitException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final appointmentAsync = ref.watch(
      specialistAppointmentDetailProvider(widget.appointmentId),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.specialistPrescriptionTitle)),
      body: appointmentAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorState(
          title: l10n.appointmentDetailLoadError,
          onRetry: () => ref.invalidate(
            specialistAppointmentDetailProvider(widget.appointmentId),
          ),
        ),
        data: (_) => Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(GpsSpacing.md),
              children: [
                GpsTextField(
                  controller: _diagnosisController,
                  label: l10n.specialistPrescriptionDiagnosis,
                ),
                const SizedBox(height: GpsSpacing.md),
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(l10n.specialistPrescriptionValidUntil),
                  subtitle: Text(
                    _validUntil == null
                        ? l10n.specialistSchedulePickDates
                        : DateFormat.yMMMd(locale).format(_validUntil!),
                  ),
                  trailing: const Icon(Icons.calendar_today_outlined),
                  onTap: _pickValidUntil,
                ),
                const SizedBox(height: GpsSpacing.md),
                Text(
                  l10n.specialistPrescriptionDrugsSection,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: GpsSpacing.sm),
                for (var i = 0; i < _drugs.length; i++) ...[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(GpsSpacing.md),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  l10n.specialistPrescriptionDrugNumber(i + 1),
                                  style:
                                      Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                              if (_drugs.length > 1)
                                IconButton(
                                  onPressed: () => _removeDrug(i),
                                  icon: const Icon(Icons.delete_outline),
                                ),
                            ],
                          ),
                          GpsTextField(
                            controller: _drugs[i].nameController,
                            label: l10n.specialistPrescriptionDrugName,
                          ),
                          const SizedBox(height: GpsSpacing.sm),
                          GpsTextField(
                            controller: _drugs[i].dosageController,
                            label: l10n.specialistPrescriptionDosage,
                          ),
                          const SizedBox(height: GpsSpacing.sm),
                          GpsTextField(
                            controller: _drugs[i].frequencyController,
                            label: l10n.specialistPrescriptionFrequency,
                          ),
                          const SizedBox(height: GpsSpacing.sm),
                          GpsTextField(
                            controller: _drugs[i].durationController,
                            label: l10n.specialistPrescriptionDurationDays,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(height: GpsSpacing.sm),
                          GpsTextField(
                            controller: _drugs[i].instructionsController,
                            label: l10n.specialistPrescriptionInstructions,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: GpsSpacing.sm),
                ],
                SecondaryButton(
                  label: l10n.specialistPrescriptionAddDrug,
                  onPressed: _addDrug,
                ),
                const SizedBox(height: GpsSpacing.xl),
                PrimaryButton(
                  label: l10n.specialistPrescriptionSubmit,
                  onPressed: _submitting ? null : _submit,
                ),
              ],
            ),
            if (_submitting)
              const ColoredBox(
                color: Color(0x33000000),
                child: Center(child: CircularProgressIndicator()),
              ),
          ],
        ),
      ),
    );
  }
}

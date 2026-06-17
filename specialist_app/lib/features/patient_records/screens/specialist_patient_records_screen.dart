import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../../appointments/providers/appointments.provider.dart';
import '../../../routing/specialist_routes.dart';
import '../providers/patient_records.provider.dart';

String _medicalRecordTypeLabel(
  MedicalDocumentTypeEnum? type,
  AppLocalizations l10n,
) {
  return switch (type) {
    MedicalDocumentTypeEnum.prescription => l10n.medicalRecordTypePrescription,
    MedicalDocumentTypeEnum.report => l10n.medicalRecordTypeReport,
    MedicalDocumentTypeEnum.labResult => l10n.medicalRecordTypeLabResult,
    MedicalDocumentTypeEnum.imaging => l10n.medicalRecordTypeImaging,
    MedicalDocumentTypeEnum.certificate => l10n.medicalRecordTypeCertificate,
    MedicalDocumentTypeEnum.other => l10n.medicalRecordTypeOther,
    _ => l10n.medicalRecordsTitle,
  };
}

IconData _medicalRecordTypeIcon(MedicalDocumentTypeEnum? type) {
  return switch (type) {
    MedicalDocumentTypeEnum.prescription => Icons.medication_outlined,
    MedicalDocumentTypeEnum.report => Icons.article_outlined,
    MedicalDocumentTypeEnum.labResult => Icons.biotech_outlined,
    MedicalDocumentTypeEnum.imaging => Icons.scanner_outlined,
    MedicalDocumentTypeEnum.certificate => Icons.verified_outlined,
    _ => Icons.insert_drive_file_outlined,
  };
}

class SpecialistPatientRecordsScreen extends ConsumerStatefulWidget {
  const SpecialistPatientRecordsScreen({
    required this.appointmentId,
    super.key,
  });

  final String appointmentId;

  @override
  ConsumerState<SpecialistPatientRecordsScreen> createState() =>
      _SpecialistPatientRecordsScreenState();
}

class _SpecialistPatientRecordsScreenState
    extends ConsumerState<SpecialistPatientRecordsScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final appointmentAsync = ref.read(
      specialistAppointmentDetailProvider(widget.appointmentId),
    );
    final patientId = appointmentAsync.valueOrNull?.patientId;
    if (patientId == null) return;
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(specialistPatientRecordsProvider(patientId).notifier).loadMore();
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
      appBar: AppBar(title: Text(l10n.specialistPatientRecordsTitle)),
      body: appointmentAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorState(
          title: l10n.appointmentDetailLoadError,
          onRetry: () => ref.invalidate(
            specialistAppointmentDetailProvider(widget.appointmentId),
          ),
        ),
        data: (appointment) {
          final patientId = appointment.patientId;
          if (patientId == null || patientId.isEmpty) {
            return EmptyState(
              title: l10n.specialistPatientRecordsEmpty,
              icon: Icons.folder_off_outlined,
            );
          }

          final recordsAsync = ref.watch(
            specialistPatientRecordsProvider(patientId),
          );

          return recordsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => ErrorState(
              title: l10n.specialistPatientRecordsLoadError,
              onRetry: () =>
                  ref.invalidate(specialistPatientRecordsProvider(patientId)),
            ),
            data: (state) {
              if (state.noAccess) {
                return EmptyState(
                  title: l10n.specialistPatientRecordsForbidden,
                  icon: Icons.lock_outline,
                );
              }
              if (state.documents.isEmpty) {
                return EmptyState(
                  title: l10n.specialistPatientRecordsEmpty,
                  icon: Icons.folder_open_outlined,
                );
              }
              return RefreshIndicator(
                onRefresh: () => ref
                    .read(specialistPatientRecordsProvider(patientId).notifier)
                    .refresh(),
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  itemCount:
                      state.documents.length + (state.isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index >= state.documents.length) {
                      return const Padding(
                        padding: EdgeInsets.all(GpsSpacing.md),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    final document = state.documents[index];
                    final id = document.id;
                    if (id == null) return const SizedBox.shrink();
                    final title = document.title?.trim();
                    return Card(
                      child: ListTile(
                        leading: Icon(_medicalRecordTypeIcon(document.type)),
                        title: Text(
                          title != null && title.isNotEmpty
                              ? title
                              : _medicalRecordTypeLabel(document.type, l10n),
                        ),
                        subtitle: document.createdAt == null
                            ? null
                            : Text(
                                DateFormat.yMMMd(locale).format(
                                  document.createdAt!.toLocal(),
                                ),
                              ),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () => context.push(
                          SpecialistRoutes.medicalRecordViewer(
                            id,
                            title: title,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

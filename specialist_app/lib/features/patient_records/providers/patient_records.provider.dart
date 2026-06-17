import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/specialist_patient_records_repository.dart';

final specialistPatientRecordsRepositoryProvider =
    Provider<SpecialistPatientRecordsRepository>((ref) {
      return SpecialistPatientRecordsRepository(
        ref.watch(gpsMedicalClientProvider),
      );
    });

class PatientRecordsListState {
  const PatientRecordsListState({
    required this.documents,
    required this.page,
    required this.hasMore,
    this.isLoadingMore = false,
    this.noAccess = false,
  });

  final List<MedicalDocument> documents;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;
  final bool noAccess;

  PatientRecordsListState copyWith({
    List<MedicalDocument>? documents,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
    bool? noAccess,
  }) {
    return PatientRecordsListState(
      documents: documents ?? this.documents,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      noAccess: noAccess ?? this.noAccess,
    );
  }
}

final specialistPatientRecordsProvider = AsyncNotifierProvider.family<
    SpecialistPatientRecordsNotifier,
    PatientRecordsListState,
    String>(SpecialistPatientRecordsNotifier.new);

class SpecialistPatientRecordsNotifier
    extends FamilyAsyncNotifier<PatientRecordsListState, String> {
  @override
  Future<PatientRecordsListState> build(String patientId) =>
      _fetch(patientId, 1, append: false);

  Future<PatientRecordsListState> _fetch(
    String patientId,
    int page, {
    required bool append,
  }) async {
    try {
      final repo = ref.read(specialistPatientRecordsRepositoryProvider);
      final result = await repo.listForPatient(patientId: patientId, page: page);
      final current = state.valueOrNull;
      return PatientRecordsListState(
        documents: append && current != null
            ? [...current.documents, ...result.documents]
            : result.documents,
        page: page,
        hasMore: result.hasMore,
      );
    } on SpecialistPatientRecordsForbidden {
      return const PatientRecordsListState(
        documents: [],
        page: 1,
        hasMore: false,
        noAccess: true,
      );
    }
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetch(arg, 1, append: false));
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null ||
        !current.hasMore ||
        current.isLoadingMore ||
        current.noAccess) {
      return;
    }
    state = AsyncData(current.copyWith(isLoadingMore: true));
    final next = await _fetch(arg, current.page + 1, append: true);
    state = AsyncData(next);
  }
}

final specialistMedicalRecordViewerProvider = FutureProvider.family<
    ({MedicalDocument document, List<int> bytes}),
    String
>((ref, documentId) async {
  final repo = ref.read(specialistPatientRecordsRepositoryProvider);
  final document = await repo.fetchById(documentId);
  final bytes = await repo.fetchDocumentBytes(documentId);
  return (document: document, bytes: bytes);
});

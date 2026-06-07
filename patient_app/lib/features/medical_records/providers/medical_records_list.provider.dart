import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'medical_records_repositories.provider.dart';
import 'medical_records_type_filter.provider.dart';

part 'medical_records_list.provider.g.dart';

class MedicalRecordsListState {
  const MedicalRecordsListState({
    required this.documents,
    required this.page,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  final List<MedicalDocument> documents;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;

  MedicalRecordsListState copyWith({
    List<MedicalDocument>? documents,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return MedicalRecordsListState(
      documents: documents ?? this.documents,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class MedicalRecordsList extends _$MedicalRecordsList {
  @override
  Future<MedicalRecordsListState> build() async {
    final type = ref.watch(medicalRecordsTypeFilterProvider);
    return _fetchPage(1, type: type, append: false);
  }

  Future<MedicalRecordsListState> _fetchPage(
    int page, {
    required MedicalDocumentTypeEnum? type,
    required bool append,
  }) async {
    final repo = ref.read(medicalRecordsRepositoryProvider);
    final result = await repo.list(type: type, page: page);
    final current = state.value;
    final merged = append && current != null
        ? [...current.documents, ...result.documents]
        : result.documents;
    return MedicalRecordsListState(
      documents: merged,
      page: page,
      hasMore: result.hasMore,
    );
  }

  Future<void> refresh() async {
    final type = ref.read(medicalRecordsTypeFilterProvider);
    state = const AsyncLoading();
    state = AsyncData(await _fetchPage(1, type: type, append: false));
  }

  Future<void> loadMore() async {
    final current = state.value;
    final type = ref.read(medicalRecordsTypeFilterProvider);
    if (current == null || !current.hasMore || current.isLoadingMore) return;
    state = AsyncData(current.copyWith(isLoadingMore: true));
    final next = await _fetchPage(
      current.page + 1,
      type: type,
      append: true,
    );
    state = AsyncData(next);
  }

  void prependDocument(MedicalDocument document) {
    final current = state.value;
    if (current == null) return;
    final typeFilter = ref.read(medicalRecordsTypeFilterProvider);
    if (typeFilter != null && document.type != typeFilter) return;
    state = AsyncData(
      current.copyWith(documents: [document, ...current.documents]),
    );
  }
}

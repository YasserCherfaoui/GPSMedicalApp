import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'discovery_repositories.provider.dart';
import 'doctor_search.provider.dart';

part 'clinic_search.provider.g.dart';

class ClinicSearchResultState {
  const ClinicSearchResultState({
    required this.clinics,
    required this.currentPage,
    required this.hasMore,
    this.total = 0,
    this.isLoadingMore = false,
  });

  final List<Clinic> clinics;
  final int currentPage;
  final bool hasMore;
  final int total;
  final bool isLoadingMore;

  ClinicSearchResultState copyWith({
    List<Clinic>? clinics,
    int? currentPage,
    bool? hasMore,
    int? total,
    bool? isLoadingMore,
  }) {
    return ClinicSearchResultState(
      clinics: clinics ?? this.clinics,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class ClinicSearch extends _$ClinicSearch {
  @override
  Future<ClinicSearchResultState> build() async {
    final filters = ref.watch(searchFiltersNotifierProvider);
    if (filters.entity != DiscoveryEntity.clinics) {
      return const ClinicSearchResultState(
        clinics: [],
        currentPage: 1,
        hasMore: false,
      );
    }
    return _fetchPage(filters, 1);
  }

  Future<ClinicSearchResultState> _fetchPage(
    SearchFilters filters,
    int page,
  ) async {
    final result = await ref
        .read(searchRepositoryProvider)
        .searchClinics(filters: filters, page: page, pageSize: 20);
    final clinics = result.clinics;
    final total = result.total;
    final hasMore = clinics.length == 20 && (page * 20) < total;

    return ClinicSearchResultState(
      clinics: clinics,
      currentPage: page,
      hasMore: hasMore,
      total: total,
    );
  }

  Future<void> loadNextPage() async {
    final current = state.value;
    if (current == null ||
        !current.hasMore ||
        current.isLoadingMore ||
        state.isLoading ||
        state.isRefreshing) {
      return;
    }

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));

    final nextPageData = await AsyncValue.guard(() async {
      final filters = ref.read(searchFiltersNotifierProvider);
      final nextPage = current.currentPage + 1;
      final result = await _fetchPage(filters, nextPage);
      return ClinicSearchResultState(
        clinics: [...current.clinics, ...result.clinics],
        currentPage: nextPage,
        hasMore: result.hasMore,
        total: result.total,
      );
    });

    if (nextPageData.hasValue) {
      state = AsyncValue.data(nextPageData.value!);
    } else if (nextPageData.hasError) {
      state = AsyncValue.error(nextPageData.error!, nextPageData.stackTrace!);
    }
  }
}

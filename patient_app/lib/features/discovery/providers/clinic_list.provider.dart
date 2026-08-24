import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'discovery_repositories.provider.dart';

part 'clinic_list.provider.g.dart';

class ClinicListState {
  const ClinicListState({
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

  ClinicListState copyWith({
    List<Clinic>? clinics,
    int? currentPage,
    bool? hasMore,
    int? total,
    bool? isLoadingMore,
  }) {
    return ClinicListState(
      clinics: clinics ?? this.clinics,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class ClinicList extends _$ClinicList {
  @override
  Future<ClinicListState> build() async {
    return _fetchPage(1);
  }

  Future<ClinicListState> _fetchPage(int page) async {
    final result = await ref
        .read(clinicRepositoryProvider)
        .listVerified(page: page, pageSize: 20);
    final clinics = result.clinics;
    final total = result.total;
    final hasMore = clinics.length == 20 && (page * 20) < total;

    return ClinicListState(
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
      final nextPage = current.currentPage + 1;
      final result = await _fetchPage(nextPage);
      return ClinicListState(
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

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetchPage(1));
  }
}

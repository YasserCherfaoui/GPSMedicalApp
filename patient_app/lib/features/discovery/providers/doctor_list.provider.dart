import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'discovery_repositories.provider.dart';

part 'doctor_list.provider.g.dart';

class DoctorListState {
  const DoctorListState({
    required this.doctors,
    required this.currentPage,
    required this.hasMore,
    this.total = 0,
    this.isLoadingMore = false,
  });

  final List<Doctor> doctors;
  final int currentPage;
  final bool hasMore;
  final int total;
  final bool isLoadingMore;

  DoctorListState copyWith({
    List<Doctor>? doctors,
    int? currentPage,
    bool? hasMore,
    int? total,
    bool? isLoadingMore,
  }) {
    return DoctorListState(
      doctors: doctors ?? this.doctors,
      currentPage: currentPage ?? this.currentPage,
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

@riverpod
class DoctorList extends _$DoctorList {
  @override
  Future<DoctorListState> build() async {
    return _fetchPage(1);
  }

  Future<DoctorListState> _fetchPage(int page) async {
    final result = await ref.read(doctorRepositoryProvider).listVerified(
      page: page,
      pageSize: 20,
    );
    final doctors = result.doctors;
    final total = result.total;
    final hasMore = doctors.length == 20 && (page * 20) < total;

    return DoctorListState(
      doctors: doctors,
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
      return DoctorListState(
        doctors: [...current.doctors, ...result.doctors],
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

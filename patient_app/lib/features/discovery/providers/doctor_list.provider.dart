import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'doctor_list.provider.g.dart';

class DoctorListState {
  const DoctorListState({
    required this.doctors,
    required this.currentPage,
    required this.hasMore,
    this.total = 0,
  });

  final List<Doctor> doctors;
  final int currentPage;
  final bool hasMore;
  final int total;
}

@riverpod
class DoctorList extends _$DoctorList {
  @override
  Future<DoctorListState> build() async {
    return _fetchPage(1);
  }

  Future<DoctorListState> _fetchPage(int page) async {
    final client = ref.read(gpsMedicalClientProvider);
    final response = await client.doctors.doctorsGet(
      page: page,
      pageSize: 20,
      verifiedOnly: true,
    );
    final paginated = response.data;
    if (paginated == null) {
      return const DoctorListState(doctors: [], currentPage: 1, hasMore: false);
    }
    final doctors = paginated.data?.toList() ?? [];
    final total = paginated.meta?.total ?? 0;
    // If we fetched a full page and haven't hit the total yet, there's more.
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
    if (current == null || !current.hasMore) return;
    if (state.isLoading || state.isRefreshing || state.hasError) return;

    // Set temporary data with loading state
    state = AsyncValue.data(current);

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

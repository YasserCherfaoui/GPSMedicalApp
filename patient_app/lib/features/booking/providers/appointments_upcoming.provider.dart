import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'booking_repositories.provider.dart';

part 'appointments_upcoming.provider.g.dart';

class AppointmentsListState {
  const AppointmentsListState({
    required this.appointments,
    required this.page,
    required this.hasMore,
    this.isLoadingMore = false,
  });

  final List<Appointment> appointments;
  final int page;
  final bool hasMore;
  final bool isLoadingMore;
}

@riverpod
class AppointmentsUpcoming extends _$AppointmentsUpcoming {
  static const _statuses = ['pending', 'confirmed'];

  @override
  Future<AppointmentsListState> build() async {
    return _fetchPage(1, append: false);
  }

  Future<AppointmentsListState> _fetchPage(
    int page, {
    required bool append,
  }) async {
    final repo = ref.read(appointmentRepositoryProvider);
    final results = await Future.wait(
      _statuses.map((status) => repo.list(status: status, page: page)),
    );
    final all = <Appointment>[];
    var hasMore = false;
    for (final result in results) {
      all.addAll(result.appointments);
      if (result.hasMore) hasMore = true;
    }
    all.sort((a, b) {
      final sa = a.startAt;
      final sb = b.startAt;
      if (sa == null || sb == null) return 0;
      return sa.compareTo(sb);
    });
    final current = state.valueOrNull;
    final merged = append && current != null
        ? [...current.appointments, ...all]
        : all;
    return AppointmentsListState(
      appointments: merged,
      page: page,
      hasMore: hasMore,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchPage(1, append: false));
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;
    state = AsyncData(current.copyWith(isLoadingMore: true));
    state = await AsyncValue.guard(
      () => _fetchPage(current.page + 1, append: true),
    );
  }
}

extension on AppointmentsListState {
  AppointmentsListState copyWith({
    List<Appointment>? appointments,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return AppointmentsListState(
      appointments: appointments ?? this.appointments,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

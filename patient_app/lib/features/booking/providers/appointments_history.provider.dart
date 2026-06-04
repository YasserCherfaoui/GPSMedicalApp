import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'booking_repositories.provider.dart';

part 'appointments_history.provider.g.dart';

class AppointmentsHistoryState {
  const AppointmentsHistoryState({
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
class AppointmentsHistory extends _$AppointmentsHistory {
  static const _statuses = ['completed', 'cancelled', 'no_show'];

  @override
  Future<AppointmentsHistoryState> build() async {
    return _fetchPage(1, append: false);
  }

  Future<AppointmentsHistoryState> _fetchPage(int page, {required bool append}) async {
    final repo = ref.read(appointmentRepositoryProvider);
    final all = <Appointment>[];
    var hasMore = false;
    for (final status in _statuses) {
      final result = await repo.list(status: status, page: page);
      all.addAll(result.appointments);
      if (result.hasMore) hasMore = true;
    }
    all.sort((a, b) {
      final sa = a.startAt;
      final sb = b.startAt;
      if (sa == null || sb == null) return 0;
      return sb.compareTo(sa);
    });
    final current = state.value;
    final merged = append && current != null
        ? [...current.appointments, ...all]
        : all;
    return AppointmentsHistoryState(
      appointments: merged,
      page: page,
      hasMore: hasMore,
    );
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _fetchPage(1, append: false));
  }

  Future<void> loadMore() async {
    final current = state.value;
    if (current == null || !current.hasMore || current.isLoadingMore) return;
    state = AsyncData(current.copyWith(isLoadingMore: true));
    final next = await _fetchPage(current.page + 1, append: true);
    state = AsyncData(next);
  }
}

extension on AppointmentsHistoryState {
  AppointmentsHistoryState copyWith({
    List<Appointment>? appointments,
    int? page,
    bool? hasMore,
    bool? isLoadingMore,
  }) {
    return AppointmentsHistoryState(
      appointments: appointments ?? this.appointments,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }
}

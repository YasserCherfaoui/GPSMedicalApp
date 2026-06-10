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
    final all = <Appointment>[];
    for (final status in _statuses) {
      final result = await repo.list(status: status, page: page);
      all.addAll(result.appointments);
    }
    all.sort((a, b) {
      final sa = a.startAt;
      final sb = b.startAt;
      if (sa == null || sb == null) return 0;
      return sa.compareTo(sb);
    });
    final current = state.value;
    final merged = append && current != null
        ? [...current.appointments, ...all]
        : all;
    return AppointmentsListState(
      appointments: merged,
      page: page,
      hasMore: all.isNotEmpty,
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

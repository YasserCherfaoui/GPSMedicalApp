import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/specialist_appointment_repository.dart';

final specialistAppointmentRepositoryProvider =
    Provider<SpecialistAppointmentRepository>((ref) {
      return SpecialistAppointmentRepository(ref.watch(gpsMedicalClientProvider));
    });

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

final specialistPendingAppointmentsProvider =
    AsyncNotifierProvider<SpecialistPendingAppointmentsNotifier,
        AppointmentsListState>(
      SpecialistPendingAppointmentsNotifier.new,
    );

class SpecialistPendingAppointmentsNotifier
    extends AsyncNotifier<AppointmentsListState> {
  @override
  Future<AppointmentsListState> build() => _fetch(1, append: false);

  Future<AppointmentsListState> _fetch(int page, {required bool append}) async {
    final repo = ref.read(specialistAppointmentRepositoryProvider);
    final result = await repo.list(status: 'pending', page: page);
    final sorted = result.appointments.toList()
      ..sort((a, b) {
        final sa = a.startAt;
        final sb = b.startAt;
        if (sa == null || sb == null) return 0;
        return sa.compareTo(sb);
      });
    final current = state.valueOrNull;
    return AppointmentsListState(
      appointments: append && current != null
          ? [...current.appointments, ...sorted]
          : sorted,
      page: page,
      hasMore: result.hasMore,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetch(1, append: false));
  }
}

final specialistPendingCountProvider = FutureProvider<int>((ref) async {
  final result = await ref
      .read(specialistAppointmentRepositoryProvider)
      .list(status: 'pending', page: 1, pageSize: 1);
  return result.total;
});

final specialistConfirmedAppointmentsProvider =
    AsyncNotifierProvider<SpecialistConfirmedAppointmentsNotifier,
        AppointmentsListState>(
      SpecialistConfirmedAppointmentsNotifier.new,
    );

class SpecialistConfirmedAppointmentsNotifier
    extends AsyncNotifier<AppointmentsListState> {
  @override
  Future<AppointmentsListState> build() => _fetch(1, append: false);

  Future<AppointmentsListState> _fetch(int page, {required bool append}) async {
    final repo = ref.read(specialistAppointmentRepositoryProvider);
    final result = await repo.list(status: 'confirmed', page: page);
    final sorted = result.appointments.toList()
      ..sort((a, b) {
        final sa = a.startAt;
        final sb = b.startAt;
        if (sa == null || sb == null) return 0;
        return sa.compareTo(sb);
      });
    final current = state.valueOrNull;
    return AppointmentsListState(
      appointments: append && current != null
          ? [...current.appointments, ...sorted]
          : sorted,
      page: page,
      hasMore: result.hasMore,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetch(1, append: false));
  }
}

final specialistHistoryAppointmentsProvider =
    AsyncNotifierProvider<SpecialistHistoryAppointmentsNotifier,
        AppointmentsListState>(
      SpecialistHistoryAppointmentsNotifier.new,
    );

class SpecialistHistoryAppointmentsNotifier
    extends AsyncNotifier<AppointmentsListState> {
  static const _statuses = ['completed', 'cancelled', 'no_show'];

  @override
  Future<AppointmentsListState> build() => _fetch(1, append: false);

  Future<AppointmentsListState> _fetch(int page, {required bool append}) async {
    final repo = ref.read(specialistAppointmentRepositoryProvider);
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
    final current = state.valueOrNull;
    return AppointmentsListState(
      appointments: append && current != null
          ? [...current.appointments, ...all]
          : all,
      page: page,
      hasMore: hasMore,
    );
  }

  Future<void> refresh() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _fetch(1, append: false));
  }

  Future<void> loadMore() async {
    final current = state.valueOrNull;
    if (current == null || !current.hasMore || current.isLoadingMore) return;
    state = AsyncData(current.copyWith(isLoadingMore: true));
    final next = await _fetch(current.page + 1, append: true);
    state = AsyncData(next);
  }
}

final specialistAppointmentDetailProvider = FutureProvider.family<Appointment,
    String>((ref, appointmentId) {
  return ref
      .read(specialistAppointmentRepositoryProvider)
      .fetchById(appointmentId);
});

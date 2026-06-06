import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/appointments_history.provider.dart';
import '../providers/appointments_upcoming.provider.dart';
import '../providers/doctor_cache.provider.dart';
import '../widgets/appointment_row_tile.dart';
import '../widgets/booking_error_view.dart';

class AppointmentsListScreen extends ConsumerStatefulWidget {
  const AppointmentsListScreen({super.key});

  @override
  ConsumerState<AppointmentsListScreen> createState() =>
      _AppointmentsListScreenState();
}

class _AppointmentsListScreenState extends ConsumerState<AppointmentsListScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appointmentsTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.appointmentsUpcoming),
            Tab(text: l10n.appointmentsHistory),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _UpcomingTab(l10n: l10n),
          _HistoryTab(l10n: l10n),
        ],
      ),
    );
  }
}

class _UpcomingTab extends ConsumerWidget {
  const _UpcomingTab({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final async = ref.watch(appointmentsUpcomingProvider);

    return async.when(
      data: (state) {
        if (state.appointments.isEmpty) {
          return EmptyState(
            title: l10n.appointmentsEmptyUpcoming,
            icon: Icons.event_available_outlined,
            actionLabel: l10n.appointmentsEmptyUpcomingCta,
            onAction: () => context.push(GpsRoutes.search),
          );
        }
        return RefreshIndicator(
          onRefresh: () =>
              ref.read(appointmentsUpcomingProvider.notifier).refresh(),
          child: ListView.builder(
            padding: const EdgeInsets.all(GpsSpacing.md),
            itemCount: state.appointments.length,
            itemBuilder: (context, index) {
              final appointment = state.appointments[index];
              return _AppointmentRow(
                appointment: appointment,
                onTap: () {
                  final id = appointment.id;
                  if (id != null) {
                    context.push(GpsRoutes.appointmentDetail(id));
                  }
                },
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => BookingErrorView(
        error: e,
        message: l10n.appointmentsLoadError,
        onRetry: () => ref.invalidate(appointmentsUpcomingProvider),
      ),
    );
  }
}

class _HistoryTab extends ConsumerStatefulWidget {
  const _HistoryTab({required this.l10n});

  final AppLocalizations l10n;

  @override
  ConsumerState<_HistoryTab> createState() => _HistoryTabState();
}

class _HistoryTabState extends ConsumerState<_HistoryTab> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(appointmentsHistoryProvider.notifier).loadMore();
    }
  }

  @override
  Widget build(BuildContext context) {
    final async = ref.watch(appointmentsHistoryProvider);

    return async.when(
      data: (state) {
        if (state.appointments.isEmpty) {
          return EmptyState(
            title: widget.l10n.appointmentsEmptyHistory,
            icon: Icons.history,
          );
        }
        return RefreshIndicator(
          onRefresh: () =>
              ref.read(appointmentsHistoryProvider.notifier).refresh(),
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(GpsSpacing.md),
            itemCount:
                state.appointments.length + (state.isLoadingMore ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= state.appointments.length) {
                return const Padding(
                  padding: EdgeInsets.all(GpsSpacing.md),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              final appointment = state.appointments[index];
              return _AppointmentRow(
                appointment: appointment,
                onTap: () {
                  final id = appointment.id;
                  if (id != null) {
                    context.push(GpsRoutes.appointmentDetail(id));
                  }
                },
              );
            },
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => BookingErrorView(
        error: e,
        message: widget.l10n.appointmentsLoadError,
        onRetry: () => ref.invalidate(appointmentsHistoryProvider),
      ),
    );
  }
}

class _AppointmentRow extends ConsumerWidget {
  const _AppointmentRow({required this.appointment, required this.onTap});

  final Appointment appointment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctorId = appointment.doctorId;
    if (doctorId == null) return const SizedBox.shrink();

    final doctorAsync = ref.watch(cachedDoctorProvider(doctorId));
    return doctorAsync.when(
      data: (doctor) => AppointmentRowTile(
        appointment: appointment,
        doctor: doctor,
        onTap: onTap,
      ),
      loading: () => const Padding(
        padding: EdgeInsets.only(bottom: GpsSpacing.sm),
        child: LoadingSkeleton(height: 88),
      ),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}

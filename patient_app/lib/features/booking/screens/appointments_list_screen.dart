import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../engagement/widgets/patient_offers_banner.dart';
import '../../notifications/widgets/notifications_bell_button.dart';
import '../providers/appointments_history.provider.dart';
import '../providers/appointments_upcoming.provider.dart';
import '../providers/clinic_cache.provider.dart';
import '../providers/doctor_cache.provider.dart';
import '../utils/booking_enums.dart';
import '../widgets/appointment_row_tile.dart';
import '../widgets/booking_error_view.dart';

enum _AppointmentSort { soonest, latest }

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
        actions: const [NotificationsBellButton()],
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

class _UpcomingTab extends ConsumerStatefulWidget {
  const _UpcomingTab({required this.l10n});

  final AppLocalizations l10n;

  @override
  ConsumerState<_UpcomingTab> createState() => _UpcomingTabState();
}

class _UpcomingTabState extends ConsumerState<_UpcomingTab> {
  String? _statusFilter;
  _AppointmentSort _sort = _AppointmentSort.soonest;

  static const _filters = <String?>[
    null,
    'pending',
    'pending_payment',
    'confirmed',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = widget.l10n;
    final async = ref.watch(appointmentsUpcomingProvider);

    return async.when(
      data: (state) {
        final filtered = _applyFilterAndSort(state.appointments);
        Widget body;
        if (filtered.isEmpty) {
          body = EmptyState(
            title: l10n.appointmentsEmptyUpcoming,
            icon: Icons.event_available_outlined,
            actionLabel: l10n.appointmentsEmptyUpcomingCta,
            onAction: () => context.push(GpsRoutes.search),
          );
        } else {
          body = RefreshIndicator(
            onRefresh: () =>
                ref.read(appointmentsUpcomingProvider.notifier).refresh(),
            child: ListView.builder(
              padding: const EdgeInsets.all(GpsSpacing.md),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final appointment = filtered[index];
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
        }
        return Column(
          children: [
            const PatientOffersBanner(),
            _AppointmentControls(
              statuses: _filters,
              statusFilter: _statusFilter,
              sort: _sort,
              onStatusChanged: (value) => setState(() => _statusFilter = value),
              onSortChanged: (value) => setState(() => _sort = value),
            ),
            Expanded(child: body),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _AppointmentsError(
        l10n: l10n,
        error: e,
        onRetry: () =>
            ref.read(appointmentsUpcomingProvider.notifier).refresh(),
      ),
    );
  }

  List<Appointment> _applyFilterAndSort(List<Appointment> source) {
    final filtered = source.where((appointment) {
      if (_statusFilter == null) return true;
      return appointmentStatusWire(appointment.status) == _statusFilter;
    }).toList();
    filtered.sort((a, b) {
      final sa = a.startAt;
      final sb = b.startAt;
      if (sa == null || sb == null) return 0;
      return _sort == _AppointmentSort.soonest
          ? sa.compareTo(sb)
          : sb.compareTo(sa);
    });
    return filtered;
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
  String? _statusFilter;
  _AppointmentSort _sort = _AppointmentSort.latest;

  static const _filters = <String?>[
    null,
    'completed',
    'cancelled',
    'no_show',
  ];

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
        final filtered = _applyFilterAndSort(state.appointments);
        if (state.appointments.isEmpty) {
          return EmptyState(
            title: widget.l10n.appointmentsEmptyHistory,
            icon: Icons.history,
          );
        }
        return Column(
          children: [
            _AppointmentControls(
              statuses: _filters,
              statusFilter: _statusFilter,
              sort: _sort,
              onStatusChanged: (value) => setState(() => _statusFilter = value),
              onSortChanged: (value) => setState(() => _sort = value),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () =>
                    ref.read(appointmentsHistoryProvider.notifier).refresh(),
                child: filtered.isEmpty
                    ? ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.4,
                            child: EmptyState(
                              title: widget.l10n.appointmentsEmptyHistory,
                              icon: Icons.history,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        controller: _scrollController,
                        padding: const EdgeInsets.all(GpsSpacing.md),
                        itemCount: filtered.length +
                            (state.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index >= filtered.length) {
                            return const Padding(
                              padding: EdgeInsets.all(GpsSpacing.md),
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          final appointment = filtered[index];
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
              ),
            ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => _AppointmentsError(
        l10n: widget.l10n,
        error: e,
        onRetry: () => ref.read(appointmentsHistoryProvider.notifier).refresh(),
      ),
    );
  }

  List<Appointment> _applyFilterAndSort(List<Appointment> source) {
    final filtered = source.where((appointment) {
      if (_statusFilter == null) return true;
      return appointmentStatusWire(appointment.status) == _statusFilter;
    }).toList();
    filtered.sort((a, b) {
      final sa = a.startAt;
      final sb = b.startAt;
      if (sa == null || sb == null) return 0;
      return _sort == _AppointmentSort.soonest
          ? sa.compareTo(sb)
          : sb.compareTo(sa);
    });
    return filtered;
  }
}

class _AppointmentControls extends StatelessWidget {
  const _AppointmentControls({
    required this.statuses,
    required this.statusFilter,
    required this.sort,
    required this.onStatusChanged,
    required this.onSortChanged,
  });

  final List<String?> statuses;
  final String? statusFilter;
  final _AppointmentSort sort;
  final ValueChanged<String?> onStatusChanged;
  final ValueChanged<_AppointmentSort> onSortChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(
            GpsSpacing.md,
            GpsSpacing.sm,
            GpsSpacing.md,
            GpsSpacing.xs,
          ),
          child: Row(
            children: [
              for (final status in statuses) ...[
                FilterChip(
                  label: Text(
                    status == null
                        ? l10n.appointmentsFilterAll
                        : _statusLabel(l10n, status),
                  ),
                  selected: statusFilter == status,
                  selectedColor: scheme.primaryContainer,
                  onSelected: (_) => onStatusChanged(status),
                  showCheckmark: false,
                  visualDensity: VisualDensity.compact,
                ),
                const SizedBox(width: GpsSpacing.sm),
              ],
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(
            GpsSpacing.md,
            0,
            GpsSpacing.md,
            GpsSpacing.sm,
          ),
          child: Row(
            children: [
              ChoiceChip(
                label: Text(l10n.appointmentsSortSoonest),
                selected: sort == _AppointmentSort.soonest,
                onSelected: (_) => onSortChanged(_AppointmentSort.soonest),
              ),
              const SizedBox(width: GpsSpacing.sm),
              ChoiceChip(
                label: Text(l10n.appointmentsSortLatest),
                selected: sort == _AppointmentSort.latest,
                onSelected: (_) => onSortChanged(_AppointmentSort.latest),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

String _statusLabel(AppLocalizations l10n, String status) {
  return switch (status) {
    'pending' => l10n.appointmentStatusPending,
    'pending_payment' => l10n.appointmentStatusPendingPayment,
    'confirmed' => l10n.appointmentStatusConfirmed,
    'cancelled' => l10n.appointmentStatusCancelled,
    'completed' => l10n.appointmentStatusCompleted,
    'no_show' => l10n.appointmentStatusNoShow,
    _ => status,
  };
}

class _AppointmentRow extends ConsumerWidget {
  const _AppointmentRow({required this.appointment, required this.onTap});

  final Appointment appointment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doctorId = appointment.doctorId;
    final clinicId = appointment.clinicId;
    final isClinicBooking =
        appointment.origin == AppointmentOriginEnum.clinicService;

    if (isClinicBooking) {
      if (clinicId == null || clinicId.isEmpty) {
        return const SizedBox.shrink();
      }
      final clinicAsync = ref.watch(cachedClinicProvider(clinicId));
      if (doctorId == null || doctorId.isEmpty) {
        return clinicAsync.when(
          data: (clinic) => AppointmentRowTile(
            appointment: appointment,
            clinic: clinic,
            onTap: onTap,
          ),
          loading: () => const Padding(
            padding: EdgeInsets.only(bottom: GpsSpacing.sm),
            child: LoadingSkeleton(height: 88),
          ),
          error: (_, _) => const SizedBox.shrink(),
        );
      }

      final doctorAsync = ref.watch(cachedDoctorProvider(doctorId));
      return clinicAsync.when(
        data: (clinic) => doctorAsync.when(
          data: (doctor) => AppointmentRowTile(
            appointment: appointment,
            clinic: clinic,
            doctor: doctor,
            onTap: onTap,
          ),
          loading: () => const Padding(
            padding: EdgeInsets.only(bottom: GpsSpacing.sm),
            child: LoadingSkeleton(height: 88),
          ),
          error: (_, _) => AppointmentRowTile(
            appointment: appointment,
            clinic: clinic,
            onTap: onTap,
          ),
        ),
        loading: () => const Padding(
          padding: EdgeInsets.only(bottom: GpsSpacing.sm),
          child: LoadingSkeleton(height: 88),
        ),
        error: (_, _) => const SizedBox.shrink(),
      );
    }

    if (doctorId == null || doctorId.isEmpty) {
      return const SizedBox.shrink();
    }

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

class _AppointmentsError extends StatelessWidget {
  const _AppointmentsError({
    required this.l10n,
    required this.error,
    required this.onRetry,
  });

  final AppLocalizations l10n;
  final Object error;
  final Future<void> Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRetry,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.55,
            child: BookingErrorView(
              error: error,
              message: l10n.appointmentsLoadError,
              onRetry: () => onRetry(),
            ),
          ),
        ],
      ),
    );
  }
}

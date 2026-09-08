import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../routing/specialist_routes.dart';
import '../../incoming_bilans/screens/incoming_bilans_list_screen.dart';
import '../providers/appointments.provider.dart';
import '../utils/appointment_enums.dart';
import '../widgets/specialist_appointment_row_tile.dart';

enum _InboxSort { soonest, latest }

class AppointmentsInboxScreen extends ConsumerStatefulWidget {
  const AppointmentsInboxScreen({super.key});

  @override
  ConsumerState<AppointmentsInboxScreen> createState() =>
      _AppointmentsInboxScreenState();
}

class _AppointmentsInboxScreenState extends ConsumerState<AppointmentsInboxScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final _historyScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _historyScrollController.addListener(_onHistoryScroll);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _historyScrollController.dispose();
    super.dispose();
  }

  void _onHistoryScroll() {
    if (_historyScrollController.position.pixels >=
        _historyScrollController.position.maxScrollExtent - 200) {
      ref.read(specialistHistoryAppointmentsProvider.notifier).loadMore();
    }
  }

  void _openDetail(String appointmentId) {
    context.push(SpecialistRoutes.appointmentDetail(appointmentId));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.specialistInboxTabRequests),
            Tab(text: l10n.specialistIncomingBilansTab),
            Tab(text: l10n.specialistInboxTabConfirmed),
            Tab(text: l10n.specialistInboxTabHistory),
          ],
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              _AppointmentTab(
                asyncValue: ref.watch(specialistPendingAppointmentsProvider),
                emptyTitle: l10n.specialistInboxEmptyRequests,
                defaultSort: _InboxSort.soonest,
                statusFilters: const [null, 'pending', 'pending_payment'],
                onRefresh: () async {
                  await ref
                      .read(specialistPendingAppointmentsProvider.notifier)
                      .refresh();
                  ref.invalidate(specialistPendingCountProvider);
                },
                onTap: _openDetail,
              ),
              const IncomingBilansListScreen(),
              _AppointmentTab(
                asyncValue: ref.watch(specialistConfirmedAppointmentsProvider),
                emptyTitle: l10n.specialistInboxEmptyConfirmed,
                defaultSort: _InboxSort.soonest,
                statusFilters: const [null, 'confirmed'],
                onRefresh: () => ref
                    .read(specialistConfirmedAppointmentsProvider.notifier)
                    .refresh(),
                onTap: _openDetail,
              ),
              _AppointmentTab(
                asyncValue: ref.watch(specialistHistoryAppointmentsProvider),
                emptyTitle: l10n.specialistInboxEmptyHistory,
                defaultSort: _InboxSort.latest,
                statusFilters: const [
                  null,
                  'completed',
                  'cancelled',
                  'no_show',
                ],
                onRefresh: () => ref
                    .read(specialistHistoryAppointmentsProvider.notifier)
                    .refresh(),
                onTap: _openDetail,
                scrollController: _historyScrollController,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _AppointmentTab extends StatefulWidget {
  const _AppointmentTab({
    required this.asyncValue,
    required this.emptyTitle,
    required this.defaultSort,
    required this.statusFilters,
    required this.onRefresh,
    required this.onTap,
    this.scrollController,
  });

  final AsyncValue<AppointmentsListState> asyncValue;
  final String emptyTitle;
  final _InboxSort defaultSort;
  final List<String?> statusFilters;
  final Future<void> Function() onRefresh;
  final void Function(String id) onTap;
  final ScrollController? scrollController;

  @override
  State<_AppointmentTab> createState() => _AppointmentTabState();
}

class _AppointmentTabState extends State<_AppointmentTab> {
  late _InboxSort _sort = widget.defaultSort;
  String? _statusFilter;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return widget.asyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => ErrorState(
        title: l10n.appointmentsLoadError,
        onRetry: widget.onRefresh,
      ),
      data: (state) {
        final filtered = _apply(state.appointments);
        return Column(
          children: [
            _InboxControls(
              statuses: widget.statusFilters,
              statusFilter: _statusFilter,
              sort: _sort,
              onStatusChanged: (value) =>
                  setState(() => _statusFilter = value),
              onSortChanged: (value) => setState(() => _sort = value),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: widget.onRefresh,
                child: filtered.isEmpty
                    ? ListView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(GpsSpacing.md),
                        children: [
                          SizedBox(
                            height: MediaQuery.sizeOf(context).height * 0.45,
                            child: EmptyState(
                              title: widget.emptyTitle,
                              icon: Icons.inbox_outlined,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        controller: widget.scrollController,
                        physics: const AlwaysScrollableScrollPhysics(),
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
                          final id = appointment.id;
                          if (id == null) return const SizedBox.shrink();
                          return SpecialistAppointmentRowTile(
                            appointment: appointment,
                            onTap: () => widget.onTap(id),
                          );
                        },
                      ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<Appointment> _apply(List<Appointment> source) {
    final filtered = source.where((appointment) {
      if (_statusFilter == null) return true;
      return appointmentStatusWire(appointment.status) == _statusFilter;
    }).toList();
    filtered.sort((a, b) {
      final sa = a.startAt;
      final sb = b.startAt;
      if (sa == null || sb == null) return 0;
      return _sort == _InboxSort.soonest ? sa.compareTo(sb) : sb.compareTo(sa);
    });
    return filtered;
  }
}

class _InboxControls extends StatelessWidget {
  const _InboxControls({
    required this.statuses,
    required this.statusFilter,
    required this.sort,
    required this.onStatusChanged,
    required this.onSortChanged,
  });

  final List<String?> statuses;
  final String? statusFilter;
  final _InboxSort sort;
  final ValueChanged<String?> onStatusChanged;
  final ValueChanged<_InboxSort> onSortChanged;

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
                selected: sort == _InboxSort.soonest,
                onSelected: (_) => onSortChanged(_InboxSort.soonest),
              ),
              const SizedBox(width: GpsSpacing.sm),
              ChoiceChip(
                label: Text(l10n.appointmentsSortLatest),
                selected: sort == _InboxSort.latest,
                onSelected: (_) => onSortChanged(_InboxSort.latest),
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

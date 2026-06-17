import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../routing/specialist_routes.dart';
import '../providers/appointments.provider.dart';
import '../widgets/specialist_appointment_row_tile.dart';

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
    _tabController = TabController(length: 3, vsync: this);
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
                onRefresh: () => ref
                    .read(specialistPendingAppointmentsProvider.notifier)
                    .refresh(),
                onTap: _openDetail,
              ),
              _AppointmentTab(
                asyncValue: ref.watch(specialistConfirmedAppointmentsProvider),
                emptyTitle: l10n.specialistInboxEmptyConfirmed,
                onRefresh: () => ref
                    .read(specialistConfirmedAppointmentsProvider.notifier)
                    .refresh(),
                onTap: _openDetail,
              ),
              _AppointmentTab(
                asyncValue: ref.watch(specialistHistoryAppointmentsProvider),
                emptyTitle: l10n.specialistInboxEmptyHistory,
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

class _AppointmentTab extends StatelessWidget {
  const _AppointmentTab({
    required this.asyncValue,
    required this.emptyTitle,
    required this.onRefresh,
    required this.onTap,
    this.scrollController,
  });

  final AsyncValue<AppointmentsListState> asyncValue;
  final String emptyTitle;
  final Future<void> Function() onRefresh;
  final void Function(String id) onTap;
  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return asyncValue.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, __) => ErrorState(
        title: l10n.appointmentsLoadError,
        onRetry: onRefresh,
      ),
      data: (state) {
        if (state.appointments.isEmpty) {
          return EmptyState(title: emptyTitle, icon: Icons.inbox_outlined);
        }
        return RefreshIndicator(
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
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
              final id = appointment.id;
              if (id == null) return const SizedBox.shrink();
              return SpecialistAppointmentRowTile(
                appointment: appointment,
                onTap: () => onTap(id),
              );
            },
          ),
        );
      },
    );
  }
}

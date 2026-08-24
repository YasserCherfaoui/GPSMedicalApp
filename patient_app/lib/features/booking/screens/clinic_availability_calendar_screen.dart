import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/availability_window.provider.dart';
import '../providers/booking_draft.provider.dart';
import '../providers/clinic_availability_slots.provider.dart';
import '../providers/connectivity.provider.dart';
import '../utils/booking_dates.dart';
import '../widgets/availability_slot_widgets.dart';
import '../widgets/booking_error_view.dart';
import '../widgets/offline_banner.dart';
import '../widgets/slot_lock_banner.dart';

class ClinicAvailabilityCalendarScreen extends ConsumerStatefulWidget {
  const ClinicAvailabilityCalendarScreen({
    required this.clinicId,
    required this.serviceId,
    super.key,
  });

  final String clinicId;
  final String serviceId;

  @override
  ConsumerState<ClinicAvailabilityCalendarScreen> createState() =>
      _ClinicAvailabilityCalendarScreenState();
}

class _ClinicAvailabilityCalendarScreenState
    extends ConsumerState<ClinicAvailabilityCalendarScreen> {
  late String _apiMode;

  @override
  void initState() {
    super.initState();
    final draft = ref.read(bookingDraftProvider);
    _apiMode = draft.offersTelehealth ? draft.modeFilter : 'in_person';
  }

  bool get _showModeFilter => ref.read(bookingDraftProvider).offersTelehealth;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final draft = ref.watch(bookingDraftProvider);
    final slotsAsync = ref.watch(
      clinicAvailabilitySlotsProvider(
        widget.clinicId,
        widget.serviceId,
        _apiMode,
      ),
    );
    final window = ref.watch(
      availabilityWindowNotifierProvider(widget.clinicId),
    );

    final rangeLabel = l10n.bookingWeekRange(
      formatShortDate(window.from, locale),
      formatShortDate(window.to, locale),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(l10n.bookingAvailabilityTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const OfflineBanner(),
          SlotLockBanner(
            onExpired: () {
              ref.read(bookingDraftProvider.notifier).clearSlotLock();
              ref.invalidate(
                clinicAvailabilitySlotsProvider(
                  widget.clinicId,
                  widget.serviceId,
                  _apiMode,
                ),
              );
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(l10n.bookingLockExpired)));
            },
          ),
          AvailabilityWeekBar(
            rangeLabel: rangeLabel,
            canGoBack: window.from.compareTo(todayDate()) > 0,
            canGoForward:
                window.to.compareTo(addDays(todayDate(), kBookingWindowDays)) <
                0,
            onPrevious: () => ref
                .read(
                  availabilityWindowNotifierProvider(widget.clinicId).notifier,
                )
                .previousWeek(_apiMode),
            onNext: () => ref
                .read(
                  availabilityWindowNotifierProvider(widget.clinicId).notifier,
                )
                .nextWeek(_apiMode),
          ),
          if (_showModeFilter)
            AvailabilityModeFilter(
              selected: _apiMode,
              onSelected: (mode) {
                setState(() => _apiMode = mode);
                ref.invalidate(
                  clinicAvailabilitySlotsProvider(
                    widget.clinicId,
                    widget.serviceId,
                    mode,
                  ),
                );
              },
            ),
          Expanded(
            child: slotsAsync.when(
              data: (slots) {
                if (slots.isEmpty) {
                  return Center(child: Text(l10n.bookingSlotsCount(0)));
                }
                final grouped = groupSlotsByDay(slots);
                final title =
                    draft.serviceName ??
                    draft.clinicName ??
                    l10n.clinicDetailTitle;

                return RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(
                      clinicAvailabilitySlotsProvider(
                        widget.clinicId,
                        widget.serviceId,
                        _apiMode,
                      ),
                    );
                    await ref.read(
                      clinicAvailabilitySlotsProvider(
                        widget.clinicId,
                        widget.serviceId,
                        _apiMode,
                      ).future,
                    );
                  },
                  child: ListView(
                    padding: const EdgeInsets.fromLTRB(
                      GpsSpacing.md,
                      GpsSpacing.sm,
                      GpsSpacing.md,
                      GpsSpacing.xl,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: GpsSpacing.md),
                        child: GpsCard(
                          showAccentBorder: true,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                draft.clinicName ?? '',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              if (draft.serviceName != null) ...[
                                const SizedBox(height: 4),
                                Text(
                                  draft.serviceName!,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                              const SizedBox(height: GpsSpacing.sm),
                              Text(
                                l10n.clinicDetailAssignNotice,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                      ),
                      for (final entry in grouped.entries) ...[
                        AvailabilityDayCard(
                          title: formatDaySectionTitle(entry.key, locale),
                          slotCountLabel: l10n.bookingSlotsCount(
                            entry.value.length,
                          ),
                          groups: groupSlotsByStartTime(entry.value),
                          locale: locale,
                          onSlotTap: (slot) =>
                              _onSlotSelected(displayName: title, slot: slot),
                        ),
                      ],
                    ],
                  ),
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => BookingErrorView(
                error: e,
                message: l10n.bookingLoadError,
                onRetry: () => ref.invalidate(
                  clinicAvailabilitySlotsProvider(
                    widget.clinicId,
                    widget.serviceId,
                    _apiMode,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSlotSelected({
    required String displayName,
    required AvailabilitySlot slot,
  }) {
    showSlotConfirmSheet(
      context: context,
      slot: slot,
      doctorName: displayName,
      onConfirm: () {
        Navigator.pop(context);
        final online = ref.read(isOnlineProvider).value ?? true;
        final draft = ref.read(bookingDraftProvider.notifier);
        if (online) {
          draft.selectSlot(slot);
        } else {
          draft.selectSlotDraftOnly(slot);
        }
        context.push(GpsRoutes.booking);
      },
    );
  }
}

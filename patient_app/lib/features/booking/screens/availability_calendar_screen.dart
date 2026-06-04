import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../discovery/providers/doctor_detail.provider.dart';
import '../providers/availability_slots.provider.dart';
import '../providers/availability_window.provider.dart';
import '../providers/booking_draft.provider.dart';
import '../utils/booking_dates.dart';
import '../widgets/availability_slot_widgets.dart';
import '../widgets/booking_error_view.dart';
import '../widgets/offline_banner.dart';
import '../widgets/slot_lock_banner.dart';

class AvailabilityCalendarScreen extends ConsumerStatefulWidget {
  const AvailabilityCalendarScreen({
    required this.doctorId,
    this.modeFilter = 'both',
    this.rescheduleAppointmentId,
    super.key,
  });

  final String doctorId;
  final String modeFilter;
  final String? rescheduleAppointmentId;

  @override
  ConsumerState<AvailabilityCalendarScreen> createState() =>
      _AvailabilityCalendarScreenState();
}

class _AvailabilityCalendarScreenState
    extends ConsumerState<AvailabilityCalendarScreen> {
  late String _apiMode;

  @override
  void initState() {
    super.initState();
    _apiMode = widget.modeFilter == 'telehealth' ? 'telehealth' : widget.modeFilter;
    WidgetsBinding.instance.addPostFrameCallback((_) => _syncDraftFromDetail());
  }

  void _syncDraftFromDetail() {
    if (!mounted) return;
    ref
        .read(doctorDetailProvider(widget.doctorId))
        .whenData((detail) => _ensureBookingDraft(detail.doctor));
  }

  bool get _showModeFilter =>
      widget.modeFilter != 'telehealth' && widget.modeFilter != 'in_person';

  /// Ensures draft is set when entering via reschedule/deep link (not from profile CTA).
  void _ensureBookingDraft(Doctor doctor) {
    final draft = ref.read(bookingDraftProvider);
    if (draft.doctorId == widget.doctorId && draft.doctor != null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final current = ref.read(bookingDraftProvider);
      if (current.doctorId == widget.doctorId && current.doctor != null) {
        return;
      }
      ref.read(bookingDraftProvider.notifier).startBooking(
        doctorId: widget.doctorId,
        doctor: doctor,
        modeFilter: _apiMode,
        rescheduleAppointmentId: widget.rescheduleAppointmentId,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final slotsAsync = ref.watch(
      availabilitySlotsProvider(widget.doctorId, _apiMode),
    );
    final detailAsync = ref.watch(doctorDetailProvider(widget.doctorId));
    final window = ref.watch(
      availabilityWindowNotifierProvider(widget.doctorId),
    );

    final rangeLabel = l10n.bookingWeekRange(
      formatShortDate(window.from, locale),
      formatShortDate(window.to, locale),
    );

    ref.listen(doctorDetailProvider(widget.doctorId), (previous, next) {
      next.whenData((detail) => _ensureBookingDraft(detail.doctor));
    });

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
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.bookingLockExpired)),
              );
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
                  availabilityWindowNotifierProvider(widget.doctorId).notifier,
                )
                .previousWeek(_apiMode),
            onNext: () => ref
                .read(
                  availabilityWindowNotifierProvider(widget.doctorId).notifier,
                )
                .nextWeek(_apiMode),
          ),
          if (_showModeFilter)
            AvailabilityModeFilter(
              selected: _apiMode,
              onSelected: (mode) {
                setState(() => _apiMode = mode);
                ref.invalidate(
                  availabilitySlotsProvider(widget.doctorId, mode),
                );
              },
            ),
          Expanded(
            child: detailAsync.when(
              data: (detail) {
                final doc = detail.doctor;
                return slotsAsync.when(
                  data: (slots) {
                    if (slots.isEmpty) {
                      return _EmptySlots(message: l10n.bookingSlotsCount(0));
                    }
                    final grouped = groupSlotsByDay(slots);
                    final doctorName =
                        '${doc.title ?? 'Dr.'} ${doc.fullName ?? ''}'.trim();

                    return RefreshIndicator(
                      onRefresh: () async {
                        ref.invalidate(
                          availabilitySlotsProvider(widget.doctorId, _apiMode),
                        );
                        await ref.read(
                          availabilitySlotsProvider(
                            widget.doctorId,
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
                          _DoctorAvailabilityHeader(doctor: doc),
                          for (final entry in grouped.entries) ...[
                            AvailabilityDayCard(
                              title: formatDaySectionTitle(entry.key, locale),
                              slotCountLabel: l10n.bookingSlotsCount(
                                entry.value.length,
                              ),
                              groups: groupSlotsByStartTime(entry.value),
                              locale: locale,
                              onSlotTap: (slot) => _onSlotSelected(
                                doctorName: doctorName,
                                slot: slot,
                              ),
                            ),
                          ],
                        ],
                      ),
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => BookingErrorView(
                    error: e,
                    message: l10n.bookingLoadError,
                    onRetry: () => ref.invalidate(
                      availabilitySlotsProvider(widget.doctorId, _apiMode),
                    ),
                  ),
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (e, _) => BookingErrorView(
                error: e,
                message: l10n.bookingLoadError,
                onRetry: () =>
                    ref.invalidate(doctorDetailProvider(widget.doctorId)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSlotSelected({
    required String doctorName,
    required AvailabilitySlot slot,
  }) {
    showSlotConfirmSheet(
      context: context,
      slot: slot,
      doctorName: doctorName,
      onConfirm: () {
        Navigator.pop(context);
        ref.read(bookingDraftProvider.notifier).selectSlot(slot);
        context.push(GpsRoutes.booking);
      },
    );
  }
}

class _DoctorAvailabilityHeader extends StatelessWidget {
  const _DoctorAvailabilityHeader({required this.doctor});

  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final l10n = AppLocalizations.of(context)!;
    final name = '${doctor.title ?? 'Dr.'} ${doctor.fullName ?? ''}'.trim();
    final specialty = doctor.specialties?.isNotEmpty == true
        ? (doctor.specialties!.first.nameFr ?? '')
        : '';
    final fee = doctor.consultationFeeDzd;

    return Padding(
      padding: const EdgeInsets.only(bottom: GpsSpacing.md),
      child: GpsCard(
        showAccentBorder: true,
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: colorScheme.surfaceContainerHigh,
              backgroundImage:
                  doctor.photoUrl != null && doctor.photoUrl!.isNotEmpty
                  ? NetworkImage(doctor.photoUrl!)
                  : null,
              child: doctor.photoUrl == null || doctor.photoUrl!.isEmpty
                  ? Icon(Icons.person, color: colorScheme.onSurfaceVariant)
                  : null,
            ),
            const SizedBox(width: GpsSpacing.md),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (specialty.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      specialty,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (fee != null) ...[
                    const SizedBox(height: GpsSpacing.xs),
                    Text(
                      '${l10n.bookingFeeLabel}: $fee DZD',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptySlots extends StatelessWidget {
  const _EmptySlots({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(GpsSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.event_busy_outlined,
              size: 56,
              color: colorScheme.onSurfaceVariant.withValues(alpha: 0.5),
            ),
            const SizedBox(height: GpsSpacing.md),
            Text(
              message,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

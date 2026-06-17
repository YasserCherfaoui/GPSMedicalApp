import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../../profile/providers/specialist_profile.provider.dart';
import '../providers/schedule.provider.dart';
import '../utils/schedule_display.dart';

Date _dateFromDateTime(DateTime dt) => Date(dt.year, dt.month, dt.day);

Date _addDays(Date date, int days) {
  final base = date.toDateTime().add(Duration(days: days));
  return _dateFromDateTime(base);
}

class ScheduleAvailabilityPreview extends ConsumerStatefulWidget {
  const ScheduleAvailabilityPreview({super.key});

  @override
  ConsumerState<ScheduleAvailabilityPreview> createState() =>
      _ScheduleAvailabilityPreviewState();
}

class _ScheduleAvailabilityPreviewState
    extends ConsumerState<ScheduleAvailabilityPreview> {
  late Date _from;
  late Date _to;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    _from = _dateFromDateTime(today);
    _to = _addDays(_from, 13);
  }

  void _shiftWeek(int deltaWeeks) {
    setState(() {
      _from = _addDays(_from, deltaWeeks * 7);
      _to = _addDays(_to, deltaWeeks * 7);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final profile = ref.watch(specialistProfileProvider).valueOrNull;
    final doctorId = profile?.id;

    if (doctorId == null || doctorId.isEmpty) {
      return Center(child: Text(l10n.profileLoadError));
    }

    final previewAsync = ref.watch(
      scheduleAvailabilityPreviewProvider((
        doctorId: doctorId,
        from: _from,
        to: _to,
      )),
    );

    final rangeLabel = l10n.bookingWeekRange(
      DateFormat.yMMMd(locale).format(_from.toDateTime()),
      DateFormat.yMMMd(locale).format(_to.toDateTime()),
    );

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
          child: Row(
            children: [
              IconButton(
                onPressed: () => _shiftWeek(-1),
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              Expanded(
                child: Text(
                  rangeLabel,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              IconButton(
                onPressed: () => _shiftWeek(1),
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
        ),
        Expanded(
          child: previewAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => ErrorState(
              title: l10n.bookingLoadError,
              onRetry: () => ref.invalidate(
                scheduleAvailabilityPreviewProvider((
                  doctorId: doctorId,
                  from: _from,
                  to: _to,
                )),
              ),
            ),
            data: (slots) {
              if (slots.isEmpty) {
                return EmptyState(
                  title: l10n.specialistSchedulePreviewEmptyTitle,
                  message: l10n.specialistSchedulePreviewEmptyBody,
                );
              }

              final grouped = <Date, List<AvailabilitySlot>>{};
              for (final slot in slots) {
                final start = slot.startAt;
                if (start == null) continue;
                final day = _dateFromDateTime(start.toLocal());
                grouped.putIfAbsent(day, () => []).add(slot);
              }
              final days = grouped.keys.toList()..sort();

              return ListView.builder(
                padding: const EdgeInsets.all(GpsSpacing.md),
                itemCount: days.length,
                itemBuilder: (context, index) {
                  final day = days[index];
                  final daySlots = grouped[day]!..sort(
                    (a, b) => (a.startAt ?? DateTime.now()).compareTo(
                      b.startAt ?? DateTime.now(),
                    ),
                  );
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat.yMMMEd(locale).format(day.toDateTime()),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: GpsSpacing.xs),
                      Wrap(
                        spacing: GpsSpacing.xs,
                        runSpacing: GpsSpacing.xs,
                        children: daySlots.map((slot) {
                          final start = slot.startAt!;
                          final mode = slot.mode?.name ?? 'in_person';
                          return Chip(
                            label: Text(
                              '${DateFormat.Hm(locale).format(start.toLocal())} · ${scheduleModeLabel(l10n, mode)}',
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: GpsSpacing.md),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

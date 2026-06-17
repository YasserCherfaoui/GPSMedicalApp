import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../../routing/specialist_routes.dart';
import '../../schedule/providers/schedule.provider.dart';
import '../../schedule/utils/schedule_display.dart';
import '../providers/calendar.provider.dart';
import '../utils/appointment_dates.dart';
import '../widgets/specialist_appointment_row_tile.dart';

class AppointmentsCalendarScreen extends ConsumerStatefulWidget {
  const AppointmentsCalendarScreen({super.key});

  @override
  ConsumerState<AppointmentsCalendarScreen> createState() =>
      _AppointmentsCalendarScreenState();
}

class _AppointmentsCalendarScreenState
    extends ConsumerState<AppointmentsCalendarScreen> {
  DateTime _focusedMonth = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  bool _weekView = false;

  Date _monthRangeFrom() => firstDayOfMonth(_focusedMonth);

  Date _monthRangeTo() => lastDayOfMonth(_focusedMonth);

  DateTime _weekStart(DateTime day) {
    final weekday = day.weekday;
    return DateTime(day.year, day.month, day.day - (weekday - 1));
  }

  void _openDetail(String appointmentId) {
    context.push(SpecialistRoutes.appointmentDetail(appointmentId));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final monthFrom = _monthRangeFrom();
    final monthTo = _monthRangeTo();
    final appointmentsAsync = ref.watch(
      specialistCalendarAppointmentsProvider((from: monthFrom, to: monthTo)),
    );
    final exceptionsAsync = ref.watch(scheduleExceptionsProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            GpsSpacing.md,
            GpsSpacing.sm,
            GpsSpacing.md,
            0,
          ),
          child: SegmentedButton<bool>(
            segments: [
              ButtonSegment(
                value: false,
                label: Text(l10n.specialistCalendarMonthView),
              ),
              ButtonSegment(
                value: true,
                label: Text(l10n.specialistCalendarWeekView),
              ),
            ],
            selected: {_weekView},
            onSelectionChanged: (values) {
              setState(() => _weekView = values.first);
            },
          ),
        ),
        Expanded(
          child: appointmentsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => ErrorState(
              title: l10n.specialistCalendarLoadError,
              onRetry: () => ref.invalidate(
                specialistCalendarAppointmentsProvider((
                  from: monthFrom,
                  to: monthTo,
                )),
              ),
            ),
            data: (appointments) {
              final exceptions = exceptionsAsync.valueOrNull ?? [];
              if (_weekView) {
                return _WeekView(
                  weekStart: _weekStart(_selectedDay),
                  appointments: appointments,
                  exceptions: exceptions,
                  selectedDay: _selectedDay,
                  onSelectDay: (day) => setState(() => _selectedDay = day),
                  onOpenDetail: _openDetail,
                  onPreviousWeek: () => setState(() {
                    _selectedDay = _selectedDay.subtract(const Duration(days: 7));
                  }),
                  onNextWeek: () => setState(() {
                    _selectedDay = _selectedDay.add(const Duration(days: 7));
                  }),
                );
              }
              return _MonthView(
                focusedMonth: _focusedMonth,
                selectedDay: _selectedDay,
                appointments: appointments,
                exceptions: exceptions,
                onPreviousMonth: () => setState(() {
                  _focusedMonth = DateTime(
                    _focusedMonth.year,
                    _focusedMonth.month - 1,
                  );
                }),
                onNextMonth: () => setState(() {
                  _focusedMonth = DateTime(
                    _focusedMonth.year,
                    _focusedMonth.month + 1,
                  );
                }),
                onSelectDay: (day) => setState(() => _selectedDay = day),
                onOpenDetail: _openDetail,
                colorScheme: colorScheme,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _MonthView extends StatelessWidget {
  const _MonthView({
    required this.focusedMonth,
    required this.selectedDay,
    required this.appointments,
    required this.exceptions,
    required this.onPreviousMonth,
    required this.onNextMonth,
    required this.onSelectDay,
    required this.onOpenDetail,
    required this.colorScheme,
  });

  final DateTime focusedMonth;
  final DateTime selectedDay;
  final List<Appointment> appointments;
  final List<ScheduleException> exceptions;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;
  final ValueChanged<DateTime> onSelectDay;
  final void Function(String id) onOpenDetail;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final monthLabel = MaterialLocalizations.of(context).formatMonthYear(
      focusedMonth,
    );
    final firstDay = DateTime(focusedMonth.year, focusedMonth.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(
      focusedMonth.year,
      focusedMonth.month,
    );
    final leadingEmpty = firstDay.weekday - 1;

    final exceptionDays = <DateTime, ScheduleExceptionKindEnum>{};
    for (final ex in exceptions) {
      final start = ex.startAt?.toLocal();
      final end = ex.endAt?.toLocal();
      if (start == null || end == null || ex.kind == null) continue;
      var day = DateTime(start.year, start.month, start.day);
      final last = DateTime(end.year, end.month, end.day);
      while (!day.isAfter(last)) {
        exceptionDays[DateTime(day.year, day.month, day.day)] = ex.kind!;
        day = day.add(const Duration(days: 1));
      }
    }

    final appointmentDays = <DateTime>{};
    for (final appointment in appointments) {
      final start = appointment.startAt?.toLocal();
      if (start == null) continue;
      appointmentDays.add(DateTime(start.year, start.month, start.day));
    }

    final dayAppointments = appointmentsOnDay(appointments, selectedDay);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
          child: Row(
            children: [
              IconButton(
                onPressed: onPreviousMonth,
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              Expanded(
                child: Text(
                  monthLabel,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              IconButton(
                onPressed: onNextMonth,
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
          child: Row(
            children: List.generate(7, (index) {
              final weekday = index + 1;
              final name = MaterialLocalizations.of(context).narrowWeekdays[
                  weekday % 7];
              return Expanded(
                child: Center(
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ),
              );
            }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: leadingEmpty + daysInMonth,
            itemBuilder: (context, index) {
              if (index < leadingEmpty) return const SizedBox.shrink();
              final dayNumber = index - leadingEmpty + 1;
              final day = DateTime(
                focusedMonth.year,
                focusedMonth.month,
                dayNumber,
              );
              final isSelected = isSameCalendarDay(day, selectedDay);
              final hasAppointment = appointmentDays.contains(
                DateTime(day.year, day.month, day.day),
              );
              final exceptionKind = exceptionDays[DateTime(
                day.year,
                day.month,
                day.day,
              )];
              return InkWell(
                onTap: () => onSelectDay(day),
                borderRadius: BorderRadius.circular(GpsRadii.sm),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme.primaryContainer
                        : exceptionKind != null
                        ? exceptionKindColor(
                            context,
                            exceptionKind,
                          ).withValues(alpha: 0.25)
                        : null,
                    borderRadius: BorderRadius.circular(GpsRadii.sm),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$dayNumber'),
                      if (hasAppointment)
                        Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.only(top: 2),
                          decoration: BoxDecoration(
                            color: colorScheme.primary,
                            shape: BoxShape.circle,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: _DayAppointmentList(
            title: l10n.specialistCalendarDayAppointments,
            appointments: dayAppointments,
            emptyMessage: l10n.specialistCalendarEmptyDay,
            onOpenDetail: onOpenDetail,
          ),
        ),
      ],
    );
  }
}

class _WeekView extends StatelessWidget {
  const _WeekView({
    required this.weekStart,
    required this.appointments,
    required this.exceptions,
    required this.selectedDay,
    required this.onSelectDay,
    required this.onOpenDetail,
    required this.onPreviousWeek,
    required this.onNextWeek,
  });

  final DateTime weekStart;
  final List<Appointment> appointments;
  final List<ScheduleException> exceptions;
  final DateTime selectedDay;
  final ValueChanged<DateTime> onSelectDay;
  final void Function(String id) onOpenDetail;
  final VoidCallback onPreviousWeek;
  final VoidCallback onNextWeek;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final weekEnd = weekStart.add(const Duration(days: 6));
    final dayAppointments = appointmentsOnDay(appointments, selectedDay);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: Row(
            children: [
              IconButton(
                onPressed: onPreviousWeek,
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              Expanded(
                child: Text(
                  l10n.bookingWeekRange(
                    MaterialLocalizations.of(context).formatMediumDate(
                      weekStart,
                    ),
                    MaterialLocalizations.of(context).formatMediumDate(
                      weekEnd,
                    ),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              IconButton(
                onPressed: onNextWeek,
                icon: const Icon(Icons.chevron_right_rounded),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 72,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
            itemCount: 7,
            itemBuilder: (context, index) {
              final day = weekStart.add(Duration(days: index));
              final isSelected = isSameCalendarDay(day, selectedDay);
              final count = appointmentsOnDay(appointments, day).length;
              return Padding(
                padding: const EdgeInsets.only(right: GpsSpacing.sm),
                child: ChoiceChip(
                  label: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        MaterialLocalizations.of(context).formatShortMonthDay(
                          day,
                        ),
                      ),
                      if (count > 0) Text('$count'),
                    ],
                  ),
                  selected: isSelected,
                  onSelected: (_) => onSelectDay(day),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: _DayAppointmentList(
            title: l10n.specialistCalendarDayAppointments,
            appointments: dayAppointments,
            emptyMessage: l10n.specialistCalendarEmptyDay,
            onOpenDetail: onOpenDetail,
          ),
        ),
      ],
    );
  }
}

class _DayAppointmentList extends StatelessWidget {
  const _DayAppointmentList({
    required this.title,
    required this.appointments,
    required this.emptyMessage,
    required this.onOpenDetail,
  });

  final String title;
  final List<Appointment> appointments;
  final String emptyMessage;
  final void Function(String id) onOpenDetail;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            GpsSpacing.md,
            0,
            GpsSpacing.md,
            GpsSpacing.sm,
          ),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        Expanded(
          child: appointments.isEmpty
              ? EmptyState(title: emptyMessage, icon: Icons.event_busy_outlined)
              : ListView.builder(
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    final appointment = appointments[index];
                    final id = appointment.id;
                    if (id == null) return const SizedBox.shrink();
                    return SpecialistAppointmentRowTile(
                      appointment: appointment,
                      onTap: () => onOpenDetail(id),
                    );
                  },
                ),
        ),
      ],
    );
  }
}

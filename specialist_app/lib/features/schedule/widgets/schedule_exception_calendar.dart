import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/schedule_display.dart';

/// Month grid highlighting schedule exception days.
class ScheduleExceptionCalendar extends StatelessWidget {
  const ScheduleExceptionCalendar({
    required this.focusedMonth,
    required this.exceptions,
    required this.onPreviousMonth,
    required this.onNextMonth,
    super.key,
  });

  final DateTime focusedMonth;
  final List<ScheduleException> exceptions;
  final VoidCallback onPreviousMonth;
  final VoidCallback onNextMonth;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final monthLabel = MaterialLocalizations.of(context).formatMonthYear(
      focusedMonth,
    );

    final firstDay = DateTime(focusedMonth.year, focusedMonth.month, 1);
    final daysInMonth = DateUtils.getDaysInMonth(
      focusedMonth.year,
      focusedMonth.month,
    );
    final leadingEmpty = firstDay.weekday - 1;

    final markedDays = <DateTime, ScheduleExceptionKindEnum>{};
    for (final ex in exceptions) {
      final start = ex.startAt?.toLocal();
      final end = ex.endAt?.toLocal();
      if (start == null || end == null || ex.kind == null) continue;
      var day = DateTime(start.year, start.month, start.day);
      final last = DateTime(end.year, end.month, end.day);
      while (!day.isAfter(last)) {
        markedDays[DateTime(day.year, day.month, day.day)] = ex.kind!;
        day = day.add(const Duration(days: 1));
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: onPreviousMonth,
                icon: const Icon(Icons.chevron_left_rounded),
              ),
              Expanded(
                child: Text(
                  monthLabel,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleSmall?.copyWith(
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
          const SizedBox(height: GpsSpacing.xs),
          Row(
            children: List.generate(7, (index) {
              final weekday = index + 1;
              final name = MaterialLocalizations.of(context).narrowWeekdays[
                  weekday % 7];
              return Expanded(
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: GpsSpacing.xs),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: leadingEmpty + daysInMonth,
            itemBuilder: (context, index) {
              if (index < leadingEmpty) {
                return const SizedBox.shrink();
              }
              final day = index - leadingEmpty + 1;
              final date = DateTime(focusedMonth.year, focusedMonth.month, day);
              final kind = markedDays[DateTime(date.year, date.month, date.day)];
              final color = kind == null
                  ? null
                  : exceptionKindColor(context, kind);

              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: color?.withValues(alpha: 0.18),
                  borderRadius: BorderRadius.circular(GpsRadii.sm),
                  border: kind != null
                      ? Border.all(color: color ?? theme.colorScheme.outline)
                      : null,
                ),
                child: Text(
                  '$day',
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: kind != null ? FontWeight.w600 : null,
                  ),
                ),
              );
            },
          ),
          if (exceptions.isNotEmpty) ...[
            const SizedBox(height: GpsSpacing.sm),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(
                l10n.specialistScheduleExceptionCount(exceptions.length),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

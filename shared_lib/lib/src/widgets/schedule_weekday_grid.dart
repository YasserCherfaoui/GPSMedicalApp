import 'package:flutter/material.dart';

import '../schedule/schedule_weekday.dart';
import '../theme/gps_spacing.dart';

/// Horizontal weekday selector with indicators for days that have schedule templates.
///
/// Uses the API convention: weekday `0` = Sunday … `6` = Saturday.
class ScheduleWeekdayGrid extends StatelessWidget {
  const ScheduleWeekdayGrid({
    required this.selectedWeekday,
    required this.weekdaysWithTemplates,
    required this.onWeekdaySelected,
    super.key,
  });

  final int selectedWeekday;
  final Set<int> weekdaysWithTemplates;
  final ValueChanged<int> onWeekdaySelected;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    final theme = Theme.of(context);

    return SizedBox(
      height: 72,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: GpsSpacing.md),
        itemCount: 7,
        separatorBuilder: (_, __) => const SizedBox(width: GpsSpacing.xs),
        itemBuilder: (context, index) {
          final weekday = index;
          final selected = weekday == selectedWeekday;
          final hasTemplates = weekdaysWithTemplates.contains(weekday);
          final label = formatApiWeekday(weekday, locale);
          final shortLabel = label.length > 3 ? label.substring(0, 3) : label;

          return ChoiceChip(
            label: Text(shortLabel),
            selected: selected,
            avatar: hasTemplates
                ? Icon(
                    Icons.circle,
                    size: 8,
                    color: selected
                        ? theme.colorScheme.onPrimaryContainer
                        : theme.colorScheme.primary,
                  )
                : null,
            onSelected: (_) => onWeekdaySelected(weekday),
          );
        },
      ),
    );
  }
}

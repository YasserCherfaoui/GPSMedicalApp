import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../providers/schedule.provider.dart';
import '../utils/schedule_api_error.dart';
import '../utils/schedule_display.dart';
import '../utils/schedule_validation.dart';

class ScheduleTemplateEditorSheet extends StatefulWidget {
  const ScheduleTemplateEditorSheet({
    this.template,
    required this.weekday,
    super.key,
  });

  final ScheduleTemplate? template;
  final int weekday;

  @override
  State<ScheduleTemplateEditorSheet> createState() =>
      _ScheduleTemplateEditorSheetState();
}

class _ScheduleTemplateEditorSheetState
    extends State<ScheduleTemplateEditorSheet> {
  late TimeOfDay _start;
  late TimeOfDay _end;
  late int _slotDuration;
  late String _mode;
  late bool _active;
  Map<String, String> _errors = {};

  @override
  void initState() {
    super.initState();
    final template = widget.template;
    _start = _parseTime(template?.startTime) ?? const TimeOfDay(hour: 9, minute: 0);
    _end = _parseTime(template?.endTime) ?? const TimeOfDay(hour: 17, minute: 0);
    _slotDuration = template == null ? 30 : slotDurationFromTemplate(template);
    _mode = template == null ? 'both' : modeFromTemplate(template);
    _active = template?.active ?? true;
  }

  TimeOfDay? _parseTime(String? value) {
    if (value == null || value.isEmpty) return null;
    final parts = value.split(':');
    if (parts.length != 2) return null;
    final hour = int.tryParse(parts[0]);
    final minute = int.tryParse(parts[1]);
    if (hour == null || minute == null) return null;
    return TimeOfDay(hour: hour, minute: minute);
  }

  String _formatTime(TimeOfDay time) {
    return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
  }

  Future<void> _pickTime({required bool isStart}) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isStart ? _start : _end,
    );
    if (picked == null) return;
    setState(() {
      if (isStart) {
        _start = picked;
      } else {
        _end = picked;
      }
      _errors = {};
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsets.fromLTRB(
        GpsSpacing.lg,
        GpsSpacing.lg,
        GpsSpacing.lg,
        GpsSpacing.lg + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            widget.template == null
                ? l10n.specialistScheduleAddWindow
                : l10n.specialistScheduleEditWindow,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: GpsSpacing.xs),
          Text(
            formatApiWeekday(widget.weekday, locale),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: GpsSpacing.lg),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.specialistScheduleStartTime),
            subtitle: _errors['start_time'] != null
                ? Text(
                    validationErrorMessage(l10n, _errors['start_time']!),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  )
                : null,
            trailing: OutlinedButton(
              onPressed: () => _pickTime(isStart: true),
              child: Text(formatScheduleTime(_formatTime(_start), locale)),
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.specialistScheduleEndTime),
            subtitle: _errors['end_time'] != null
                ? Text(
                    validationErrorMessage(l10n, _errors['end_time']!),
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  )
                : null,
            trailing: OutlinedButton(
              onPressed: () => _pickTime(isStart: false),
              child: Text(formatScheduleTime(_formatTime(_end), locale)),
            ),
          ),
          const SizedBox(height: GpsSpacing.sm),
          DropdownButtonFormField<int>(
            value: _slotDuration,
            decoration: InputDecoration(
              labelText: l10n.specialistScheduleSlotDuration,
              errorText: _errors['slot_duration_minutes'] != null
                  ? validationErrorMessage(
                      l10n,
                      _errors['slot_duration_minutes']!,
                    )
                  : null,
            ),
            items: kValidSlotDurations
                .map(
                  (minutes) => DropdownMenuItem(
                    value: minutes,
                    child: Text(l10n.specialistScheduleSlotMinutes(minutes)),
                  ),
                )
                .toList(),
            onChanged: (value) {
              if (value == null) return;
              setState(() {
                _slotDuration = value;
                _errors = {};
              });
            },
          ),
          const SizedBox(height: GpsSpacing.sm),
          DropdownButtonFormField<String>(
            value: _mode,
            decoration: InputDecoration(labelText: l10n.specialistScheduleMode),
            items: [
              DropdownMenuItem(
                value: 'in_person',
                child: Text(l10n.specialistScheduleModeInPerson),
              ),
              DropdownMenuItem(
                value: 'telehealth',
                child: Text(l10n.specialistScheduleModeTelehealth),
              ),
              DropdownMenuItem(
                value: 'both',
                child: Text(l10n.specialistScheduleModeBoth),
              ),
            ],
            onChanged: (value) {
              if (value == null) return;
              setState(() => _mode = value);
            },
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.specialistScheduleActive),
            subtitle: Text(l10n.specialistScheduleActiveHint),
            value: _active,
            onChanged: (value) => setState(() => _active = value),
          ),
          const SizedBox(height: GpsSpacing.lg),
          PrimaryButton(
            label: l10n.specialistScheduleSaveWindow,
            onPressed: () {
              final errors = ScheduleValidation.validateTemplate(
                weekday: widget.weekday,
                startTime: _formatTime(_start),
                endTime: _formatTime(_end),
                slotDurationMinutes: _slotDuration,
                mode: _mode,
              );
              if (errors.isNotEmpty) {
                setState(() => _errors = errors);
                return;
              }
              Navigator.of(context).pop(
                ScheduleTemplateDraft(
                  templateId: widget.template?.id,
                  weekday: widget.weekday,
                  startTime: _formatTime(_start),
                  endTime: _formatTime(_end),
                  slotDurationMinutes: _slotDuration,
                  mode: _mode,
                  active: _active,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ScheduleTemplateDraft {
  const ScheduleTemplateDraft({
    required this.templateId,
    required this.weekday,
    required this.startTime,
    required this.endTime,
    required this.slotDurationMinutes,
    required this.mode,
    required this.active,
  });

  final String? templateId;
  final int weekday;
  final String startTime;
  final String endTime;
  final int slotDurationMinutes;
  final String mode;
  final bool active;
}

Future<ScheduleTemplateDraft?> showScheduleTemplateEditor(
  BuildContext context, {
  ScheduleTemplate? template,
  required int weekday,
}) {
  return showModalBottomSheet<ScheduleTemplateDraft>(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) => ScheduleTemplateEditorSheet(
      template: template,
      weekday: weekday,
    ),
  );
}

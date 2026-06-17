import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../providers/schedule.provider.dart';
import '../utils/schedule_api_error.dart';
import '../utils/schedule_display.dart';
import '../utils/schedule_validation.dart';
import '../widgets/schedule_availability_preview.dart';
import '../widgets/schedule_exception_calendar.dart';
import '../widgets/schedule_template_editor_sheet.dart';

class ScheduleEditorScreen extends ConsumerStatefulWidget {
  const ScheduleEditorScreen({super.key});

  @override
  ConsumerState<ScheduleEditorScreen> createState() =>
      _ScheduleEditorScreenState();
}

class _ScheduleEditorScreenState extends ConsumerState<ScheduleEditorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedWeekday = DateTime.now().weekday % 7;
  DateTime _focusedMonth = DateTime(DateTime.now().year, DateTime.now().month);

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Set<int> _weekdaysWithTemplates(List<ScheduleTemplate> templates) {
    return templates
        .where((t) => t.active != false)
        .map((t) => t.weekday ?? 0)
        .toSet();
  }

  List<ScheduleTemplate> _templatesForWeekday(
    List<ScheduleTemplate> templates,
    int weekday,
  ) {
    return templates.where((t) => t.weekday == weekday).toList();
  }

  Future<void> _openTemplateEditor({
    ScheduleTemplate? template,
    required int weekday,
  }) async {
    final draft = await showScheduleTemplateEditor(
      context,
      template: template,
      weekday: weekday,
    );
    if (draft == null || !mounted) return;

    try {
      await ref.read(scheduleTemplatesProvider.notifier).saveTemplate(
        templateId: draft.templateId,
        weekday: draft.weekday,
        startTime: draft.startTime,
        endTime: draft.endTime,
        slotDurationMinutes: draft.slotDurationMinutes,
        mode: draft.mode,
        active: draft.active,
      );
      if (!mounted) return;
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.specialistScheduleSaveSuccess)),
      );
      _tabController.animateTo(2);
    } on ScheduleValidationException catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context)!;
      final message = e.fieldErrors.values
          .map((code) => validationErrorMessage(l10n, code))
          .join('\n');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }
  }

  Future<void> _confirmDeleteTemplate(ScheduleTemplate template) async {
    final l10n = AppLocalizations.of(context)!;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.specialistScheduleDeleteWindowTitle),
        content: Text(l10n.specialistScheduleDeleteWindowBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(l10n.appointmentCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(l10n.dependentsDeleteConfirm),
          ),
        ],
      ),
    );
    if (confirmed != true || template.id == null) return;
    await ref.read(scheduleTemplatesProvider.notifier).deleteTemplate(
      template.id!,
    );
  }

  Future<void> _openExceptionForm() async {
    final l10n = AppLocalizations.of(context)!;
    final now = DateTime.now();
    DateTimeRange? range = DateTimeRange(
      start: DateTime(now.year, now.month, now.day),
      end: DateTime(now.year, now.month, now.day, 23, 59),
    );
    var kind = ScheduleExceptionCreateKindEnum.vacation;
    final noteController = TextEditingController();

    String? noteText;

    final saved = await showDialog<bool>(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setLocalState) {
          return AlertDialog(
            title: Text(l10n.specialistScheduleAddException),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(l10n.specialistScheduleExceptionDates),
                    subtitle: range == null
                        ? null
                        : Text(
                            '${DateFormat.yMMMd().format(range!.start)} – ${DateFormat.yMMMd().format(range!.end)}',
                          ),
                    trailing: OutlinedButton(
                      onPressed: () async {
                        final picked = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime(now.year - 1),
                          lastDate: DateTime(now.year + 2),
                          initialDateRange: range,
                        );
                        if (picked != null) {
                          setLocalState(() => range = picked);
                        }
                      },
                      child: Text(l10n.specialistSchedulePickDates),
                    ),
                  ),
                  DropdownButtonFormField<ScheduleExceptionCreateKindEnum>(
                    value: kind,
                    decoration: InputDecoration(
                      labelText: l10n.specialistScheduleExceptionKind,
                    ),
                    items: [
                      DropdownMenuItem(
                        value: ScheduleExceptionCreateKindEnum.vacation,
                        child: Text(l10n.specialistScheduleExceptionVacation),
                      ),
                      DropdownMenuItem(
                        value: ScheduleExceptionCreateKindEnum.sick,
                        child: Text(l10n.specialistScheduleExceptionSick),
                      ),
                      DropdownMenuItem(
                        value: ScheduleExceptionCreateKindEnum.blocked,
                        child: Text(l10n.specialistScheduleExceptionBlocked),
                      ),
                    ],
                    onChanged: (value) {
                      if (value == null) return;
                      setLocalState(() => kind = value);
                    },
                  ),
                  const SizedBox(height: GpsSpacing.sm),
                  GpsTextField(
                    controller: noteController,
                    label: l10n.specialistScheduleExceptionNote,
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.appointmentCancel),
              ),
              TextButton(
                onPressed: () {
                  noteText = noteController.text.trim();
                  Navigator.pop(context, true);
                },
                child: Text(l10n.profileSave),
              ),
            ],
          );
        },
      ),
    );

    if (saved != true || range == null) {
      noteController.dispose();
      return;
    }

    try {
      await ref.read(scheduleExceptionsProvider.notifier).addException(
        startAt: range!.start,
        endAt: range!.end,
        kind: kind,
        note: (noteText == null || noteText!.isEmpty) ? null : noteText,
      );
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.specialistScheduleExceptionSaved)),
      );
    } on ScheduleValidationException catch (e) {
      if (!mounted) return;
      final message = e.fieldErrors.values
          .map((code) => validationErrorMessage(l10n, code))
          .join('\n');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } finally {
      noteController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final templatesAsync = ref.watch(scheduleTemplatesProvider);
    final exceptionsAsync = ref.watch(scheduleExceptionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.specialistScheduleTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.specialistScheduleTabTemplates),
            Tab(text: l10n.specialistScheduleTabExceptions),
            Tab(text: l10n.specialistScheduleTabPreview),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          templatesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => ErrorState(
              title: l10n.specialistScheduleLoadError,
              onRetry: () =>
                  ref.read(scheduleTemplatesProvider.notifier).refresh(),
            ),
            data: (templates) {
              final weekdays = _weekdaysWithTemplates(templates);
              final dayTemplates = _templatesForWeekday(
                templates,
                _selectedWeekday,
              );

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: GpsSpacing.sm),
                  ScheduleWeekdayGrid(
                    selectedWeekday: _selectedWeekday,
                    weekdaysWithTemplates: weekdays,
                    onWeekdaySelected: (day) =>
                        setState(() => _selectedWeekday = day),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: GpsSpacing.md,
                      vertical: GpsSpacing.sm,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            formatApiWeekday(_selectedWeekday, locale),
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () => _openTemplateEditor(
                            weekday: _selectedWeekday,
                          ),
                          icon: const Icon(Icons.add_rounded),
                          label: Text(l10n.specialistScheduleAddWindow),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: dayTemplates.isEmpty
                        ? EmptyState(
                            title: l10n.specialistScheduleNoWindowsTitle,
                            message: l10n.specialistScheduleNoWindowsBody,
                            actionLabel: l10n.specialistScheduleAddWindow,
                            onAction: () => _openTemplateEditor(
                              weekday: _selectedWeekday,
                            ),
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(GpsSpacing.md),
                            itemCount: dayTemplates.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: GpsSpacing.sm),
                            itemBuilder: (context, index) {
                              final template = dayTemplates[index];
                              final start = template.startTime ?? '';
                              final end = template.endTime ?? '';
                              final mode = modeFromTemplate(template);
                              final duration = slotDurationFromTemplate(template);
                              final active = template.active ?? true;

                              return GpsCard(
                                child: ListTile(
                                  title: Text(
                                    formatScheduleWindow(start, end, locale),
                                  ),
                                  subtitle: Text(
                                    '${scheduleModeLabel(l10n, mode)} · ${l10n.specialistScheduleSlotMinutes(duration)}${active ? '' : ' · ${l10n.specialistScheduleInactive}'}',
                                  ),
                                  trailing: PopupMenuButton<String>(
                                    onSelected: (value) {
                                      if (value == 'edit') {
                                        _openTemplateEditor(
                                          template: template,
                                          weekday: _selectedWeekday,
                                        );
                                      } else if (value == 'delete') {
                                        _confirmDeleteTemplate(template);
                                      }
                                    },
                                    itemBuilder: (context) => [
                                      PopupMenuItem(
                                        value: 'edit',
                                        child: Text(l10n.profileEdit),
                                      ),
                                      PopupMenuItem(
                                        value: 'delete',
                                        child: Text(l10n.dependentsDeleteConfirm),
                                      ),
                                    ],
                                  ),
                                  onTap: () => _openTemplateEditor(
                                    template: template,
                                    weekday: _selectedWeekday,
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          ),
          exceptionsAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (_, __) => ErrorState(
              title: l10n.specialistScheduleLoadError,
              onRetry: () =>
                  ref.read(scheduleExceptionsProvider.notifier).refresh(),
            ),
            data: (exceptions) {
              return Column(
                children: [
                  const SizedBox(height: GpsSpacing.sm),
                  ScheduleExceptionCalendar(
                    focusedMonth: _focusedMonth,
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
                  ),
                  const SizedBox(height: GpsSpacing.md),
                  Expanded(
                    child: exceptions.isEmpty
                        ? EmptyState(
                            title: l10n.specialistScheduleNoExceptionsTitle,
                            message: l10n.specialistScheduleNoExceptionsBody,
                            actionLabel: l10n.specialistScheduleAddException,
                            onAction: _openExceptionForm,
                          )
                        : ListView.separated(
                            padding: const EdgeInsets.all(GpsSpacing.md),
                            itemCount: exceptions.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: GpsSpacing.sm),
                            itemBuilder: (context, index) {
                              final ex = exceptions[index];
                              final start = ex.startAt?.toLocal();
                              final end = ex.endAt?.toLocal();
                              return GpsCard(
                                child: ListTile(
                                  leading: Icon(
                                    Icons.event_busy_outlined,
                                    color: exceptionKindColor(
                                      context,
                                      ex.kind,
                                    ),
                                  ),
                                  title: Text(
                                    scheduleExceptionKindLabel(l10n, ex.kind),
                                  ),
                                  subtitle: start != null && end != null
                                      ? Text(
                                          '${DateFormat.yMMMd(locale).format(start)} – ${DateFormat.yMMMd(locale).format(end)}',
                                        )
                                      : null,
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            },
          ),
          const ScheduleAvailabilityPreview(),
        ],
      ),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton.extended(
              onPressed: _openExceptionForm,
              icon: const Icon(Icons.add_rounded),
              label: Text(l10n.specialistScheduleAddException),
            )
          : null,
    );
  }
}

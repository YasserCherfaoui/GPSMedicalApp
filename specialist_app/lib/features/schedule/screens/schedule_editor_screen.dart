import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../../profile/providers/clinic_memberships.provider.dart';
import '../providers/schedule.provider.dart';
import '../utils/donated_schedule_notice.dart';
import '../utils/schedule_api_error.dart';
import '../utils/schedule_display.dart';
import '../utils/schedule_validation.dart';
import '../widgets/schedule_availability_preview.dart';
import '../widgets/schedule_exception_calendar.dart';
import '../widgets/schedule_template_editor_sheet.dart';

class ScheduleEditorScreen extends ConsumerStatefulWidget {
  const ScheduleEditorScreen({this.filterClinicId, super.key});

  /// When set, templates tab shows only blocks donated to this clinic.
  final String? filterClinicId;

  @override
  ConsumerState<ScheduleEditorScreen> createState() =>
      _ScheduleEditorScreenState();
}

class _ScheduleEditorScreenState extends ConsumerState<ScheduleEditorScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedWeekday = DateTime.now().weekday % 7;
  DateTime _focusedMonth = DateTime(DateTime.now().year, DateTime.now().month);
  late String? _filterClinicId;
  var _donationNoticeChecked = false;

  @override
  void initState() {
    super.initState();
    _filterClinicId = widget.filterClinicId;
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<ScheduleTemplate> _applyClinicFilter(List<ScheduleTemplate> templates) {
    final clinicId = _filterClinicId;
    if (clinicId == null || clinicId.isEmpty) return templates;
    return templates.where((t) => t.clinicId == clinicId).toList();
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

  String? _clinicName(
    List<ClinicMembership> memberships,
    String clinicId,
    AppLocalizations l10n,
  ) {
    for (final membership in memberships) {
      if (membership.clinicId == clinicId) {
        final name = membership.clinicName?.trim();
        if (name != null && name.isNotEmpty) return name;
        break;
      }
    }
    return l10n.specialistScheduleLocationClinicFallback;
  }

  bool _touchesDonated({
    String? clinicId,
    String? previousClinicId,
  }) {
    return (clinicId != null && clinicId.isNotEmpty) ||
        (previousClinicId != null && previousClinicId.isNotEmpty);
  }

  Future<void> _maybeShowFirstTimeDonationNotice(
    List<ClinicMembership> memberships,
  ) async {
    if (_donationNoticeChecked || !mounted) return;
    _donationNoticeChecked = true;
    final hasActive = memberships.any(
      (m) =>
          m.status == ClinicMembershipStatus.active &&
          (m.clinicId ?? '').isNotEmpty,
    );
    if (!hasActive) return;
    if (await hasSeenDonatedScheduleNotice()) return;
    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    await showDialog<void>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(l10n.specialistScheduleDonationNoticeTitle),
        content: Text(l10n.specialistScheduleDonationNotice),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.specialistScheduleDonationNoticeGotIt),
          ),
        ],
      ),
    );
    await markDonatedScheduleNoticeSeen();
  }

  Future<void> _openTemplateEditor({
    ScheduleTemplate? template,
    required int weekday,
  }) async {
    final draft = await showScheduleTemplateEditor(
      context,
      template: template,
      weekday: weekday,
      preferredClinicId: _filterClinicId,
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
        clinicId: draft.clinicId,
        previousClinicId: draft.previousClinicId,
      );
      if (!mounted) return;
      final l10n = AppLocalizations.of(context)!;
      final donatedTouch = _touchesDonated(
        clinicId: draft.clinicId,
        previousClinicId: draft.previousClinicId,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            donatedTouch
                ? l10n.specialistScheduleDonationNotice
                : l10n.specialistScheduleSaveSuccess,
          ),
        ),
      );
      if (donatedTouch) {
        await markDonatedScheduleNoticeSeen();
      }
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
    } on ScheduleConflictException catch (e) {
      if (!mounted) return;
      final l10n = AppLocalizations.of(context)!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            e.code == 'SPECIALIST_SCHEDULE_CONFLICT'
                ? l10n.specialistScheduleConflictMessage
                : (e.message ?? l10n.specialistScheduleLoadError),
          ),
        ),
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
    final wasDonated =
        template.clinicId != null && template.clinicId!.isNotEmpty;
    await ref.read(scheduleTemplatesProvider.notifier).deleteTemplate(
      template.id!,
    );
    if (!mounted || !wasDonated) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(l10n.specialistScheduleDonationNotice)),
    );
    await markDonatedScheduleNoticeSeen();
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
    final memberships =
        ref.watch(clinicMembershipsProvider).valueOrNull ??
            const <ClinicMembership>[];

    ref.listen(clinicMembershipsProvider, (previous, next) {
      next.whenData((items) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _maybeShowFirstTimeDonationNotice(items);
        });
      });
    });
    if (!_donationNoticeChecked && memberships.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _maybeShowFirstTimeDonationNotice(memberships);
      });
    }

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
            data: (allTemplates) {
              final templates = _applyClinicFilter(allTemplates);
              final weekdays = _weekdaysWithTemplates(templates);
              final dayTemplates = _templatesForWeekday(
                templates,
                _selectedWeekday,
              );
              final filterId = _filterClinicId;
              final filterName = filterId == null
                  ? null
                  : _clinicName(memberships, filterId, l10n);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (filterId != null && filterName != null)
                    Material(
                      color: Theme.of(context)
                          .colorScheme
                          .secondaryContainer
                          .withValues(alpha: 0.5),
                      child: ListTile(
                        dense: true,
                        title: Text(
                          l10n.specialistScheduleDonationFilterBanner(
                            filterName,
                          ),
                        ),
                        trailing: TextButton(
                          onPressed: () =>
                              setState(() => _filterClinicId = null),
                          child: Text(l10n.specialistScheduleDonationFilterClear),
                        ),
                      ),
                    ),
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
                              final duration =
                                  slotDurationFromTemplate(template);
                              final active = template.active ?? true;

                              final locationLabel = scheduleLocationLabel(
                                l10n,
                                clinicId: template.clinicId,
                                memberships: memberships,
                              );

                              return GpsCard(
                                child: ListTile(
                                  title: Text(
                                    formatScheduleWindow(start, end, locale),
                                  ),
                                  subtitle: Text(
                                    '$locationLabel · ${scheduleModeLabel(l10n, mode)} · ${l10n.specialistScheduleSlotMinutes(duration)}${active ? '' : ' · ${l10n.specialistScheduleInactive}'}',
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
                                        child: Text(
                                          l10n.dependentsDeleteConfirm,
                                        ),
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

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../../profile/providers/specialist_profile.provider.dart';
import '../providers/appointments.provider.dart';
import '../utils/appointment_api_error.dart';
import '../utils/appointment_dates.dart';
import 'appointment_detail_screen.dart';

final _rescheduleSlotsProvider = FutureProvider.family<
    List<AvailabilitySlot>,
    ({String doctorId, Date from, Date to, String mode})
>((ref, params) async {
  final response = await ref
      .read(gpsMedicalClientProvider)
      .availability
      .doctorsDoctorIdAvailabilityGet(
        doctorId: params.doctorId,
        from: params.from,
        to: params.to,
        mode: params.mode,
      );
  return response.data?.toList() ?? [];
});

class SpecialistRescheduleScreen extends ConsumerStatefulWidget {
  const SpecialistRescheduleScreen({required this.appointmentId, super.key});

  final String appointmentId;

  @override
  ConsumerState<SpecialistRescheduleScreen> createState() =>
      _SpecialistRescheduleScreenState();
}

class _SpecialistRescheduleScreenState
    extends ConsumerState<SpecialistRescheduleScreen> {
  late Date _from;
  late Date _to;
  bool _saving = false;

  @override
  void initState() {
    super.initState();
    final today = todayDate();
    _from = today;
    _to = addDays(today, 13);
  }

  void _shiftWeek(int delta) {
    setState(() {
      _from = addDays(_from, delta * 7);
      _to = addDays(_to, delta * 7);
    });
  }

  Future<void> _pickSlot(AvailabilitySlot slot) async {
    if (_saving) return;
    final start = slot.startAt;
    if (start == null) return;
    setState(() => _saving = true);
    try {
      await ref.read(specialistAppointmentRepositoryProvider).reschedule(
        appointmentId: widget.appointmentId,
        startAt: start,
      );
      invalidateSpecialistAppointments(ref);
      ref.invalidate(specialistAppointmentDetailProvider(widget.appointmentId));
      if (!mounted) return;
      context.pop();
    } on AppointmentActionException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final profile = ref.watch(specialistProfileProvider).valueOrNull;
    final doctorId = profile?.id;
    final appointmentAsync = ref.watch(
      specialistAppointmentDetailProvider(widget.appointmentId),
    );

    if (doctorId == null || doctorId.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text(l10n.appointmentReschedule)),
        body: Center(child: Text(l10n.profileLoadError)),
      );
    }

    final mode = appointmentAsync.valueOrNull?.mode;
    final apiMode = mode == AppointmentModeEnum.telehealth
        ? 'telehealth'
        : 'in_person';

    final slotsAsync = ref.watch(
      _rescheduleSlotsProvider((
        doctorId: doctorId,
        from: _from,
        to: _to,
        mode: apiMode,
      )),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appointmentReschedule)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(GpsSpacing.md),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => _shiftWeek(-1),
                  icon: const Icon(Icons.chevron_left_rounded),
                ),
                Expanded(
                  child: Text(
                    l10n.bookingWeekRange(
                      DateFormat.yMMMd(locale).format(_from.toDateTime()),
                      DateFormat.yMMMd(locale).format(_to.toDateTime()),
                    ),
                    textAlign: TextAlign.center,
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
            child: slotsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (_, __) => ErrorState(
                title: l10n.bookingLoadError,
                onRetry: () => ref.invalidate(
                  _rescheduleSlotsProvider((
                    doctorId: doctorId,
                    from: _from,
                    to: _to,
                    mode: apiMode,
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
                return ListView.builder(
                  padding: const EdgeInsets.all(GpsSpacing.md),
                  itemCount: slots.length,
                  itemBuilder: (context, index) {
                    final slot = slots[index];
                    final start = slot.startAt?.toLocal();
                    if (start == null) return const SizedBox.shrink();
                    return Card(
                      child: ListTile(
                        title: Text(
                          DateFormat.yMMMEd(locale).add_Hm().format(start),
                        ),
                        trailing: _saving
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(strokeWidth: 2),
                              )
                            : const Icon(Icons.chevron_right_rounded),
                        onTap: _saving ? null : () => _pickSlot(slot),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../../../routing/specialist_routes.dart';
import '../../profile/providers/specialist_profile.provider.dart';
import '../providers/appointments.provider.dart';
import '../utils/appointment_api_error.dart';
import '../utils/appointment_display.dart';
import '../utils/appointment_enums.dart';
import '../widgets/specialist_appointment_row_tile.dart';

void invalidateSpecialistAppointments(WidgetRef ref) {
  ref.invalidate(specialistPendingAppointmentsProvider);
  ref.invalidate(specialistConfirmedAppointmentsProvider);
  ref.invalidate(specialistHistoryAppointmentsProvider);
  ref.invalidate(specialistPendingCountProvider);
}

class SpecialistAppointmentDetailScreen extends ConsumerWidget {
  const SpecialistAppointmentDetailScreen({
    required this.appointmentId,
    super.key,
  });

  final String appointmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final appointmentAsync = ref.watch(
      specialistAppointmentDetailProvider(appointmentId),
    );
    final profile = ref.watch(specialistProfileProvider).valueOrNull;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.specialistAppointmentDetailTitle)),
      body: appointmentAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => ErrorState(
          title: l10n.appointmentDetailLoadError,
          onRetry: () => ref.invalidate(
            specialistAppointmentDetailProvider(appointmentId),
          ),
        ),
        data: (appointment) => _DetailBody(
          appointment: appointment,
          appointmentId: appointmentId,
          offersTelehealth: profile?.offersTelehealth == true,
        ),
      ),
    );
  }
}

class _DetailBody extends ConsumerStatefulWidget {
  const _DetailBody({
    required this.appointment,
    required this.appointmentId,
    required this.offersTelehealth,
  });

  final Appointment appointment;
  final String appointmentId;
  final bool offersTelehealth;

  @override
  ConsumerState<_DetailBody> createState() => _DetailBodyState();
}

class _DetailBodyState extends ConsumerState<_DetailBody> {
  bool _busy = false;

  Future<void> _runAction(Future<void> Function() action) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await action();
    } on AppointmentActionException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message)),
      );
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _confirm() async {
    await _runAction(() async {
      await ref
          .read(specialistAppointmentRepositoryProvider)
          .confirm(widget.appointmentId);
      invalidateSpecialistAppointments(ref);
      ref.invalidate(specialistAppointmentDetailProvider(widget.appointmentId));
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(AppLocalizations.of(context)!.specialistAppointmentConfirmed),
        ),
      );
    });
  }

  Future<void> _cancel() async {
    final l10n = AppLocalizations.of(context)!;
    final reasonController = TextEditingController();
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.specialistAppointmentCancelTitle),
        content: GpsTextField(
          controller: reasonController,
          label: l10n.appointmentCancelReasonHint,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(l10n.appointmentCancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(l10n.appointmentConfirmCancel),
          ),
        ],
      ),
    );
    final reason = reasonController.text.trim();
    reasonController.dispose();
    if (confirmed != true) return;

    await _runAction(() async {
      await ref.read(specialistAppointmentRepositoryProvider).cancel(
        appointmentId: widget.appointmentId,
        reason: reason.isEmpty ? null : reason,
      );
      invalidateSpecialistAppointments(ref);
      if (mounted) context.pop();
    });
  }

  Future<void> _noShow() async {
    await _runAction(() async {
      await ref
          .read(specialistAppointmentRepositoryProvider)
          .markNoShow(widget.appointmentId);
      invalidateSpecialistAppointments(ref);
      ref.invalidate(specialistAppointmentDetailProvider(widget.appointmentId));
    });
  }

  String _paymentLabel(String status, AppLocalizations l10n) {
    return switch (status) {
      'unpaid' => l10n.appointmentPaymentUnpaid,
      'deposit_paid' => l10n.appointmentPaymentDeposit,
      'paid' => l10n.appointmentPaymentPaid,
      'refunded' => l10n.appointmentPaymentRefunded,
      _ => status,
    };
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final locale = Localizations.localeOf(context).languageCode;
    final appointment = widget.appointment;
    final status = appointmentStatusWire(appointment.status);
    final start = appointment.startAt?.toLocal();
    final showTelehealthCta = widget.offersTelehealth &&
        appointment.mode == AppointmentModeEnum.telehealth &&
        isTeleconsultWindowOpen(appointment);
    final canConfirm = status == 'pending';
    final canCancel = status == 'pending' || status == 'confirmed';
    final canReschedule =
        status == 'pending' || status == 'confirmed' || status == 'completed';
    final canNoShow = canMarkNoShow(appointment);
    final canPrescribe = status == 'confirmed' || status == 'completed';
    final canViewRecords = appointment.patientId != null;

    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(GpsSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SpecialistAppointmentRowTile(
                appointment: appointment,
                onTap: () {},
              ),
              const SizedBox(height: GpsSpacing.md),
              if (start != null)
                Text(
                  DateFormat.yMMMEd(locale).add_Hm().format(start),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              if (appointment.paymentStatus != null) ...[
                const SizedBox(height: GpsSpacing.sm),
                Text(
                  _paymentLabel(
                    paymentStatusWire(appointment.paymentStatus),
                    l10n,
                  ),
                ),
              ],
              if (appointment.reason != null &&
                  appointment.reason!.trim().isNotEmpty) ...[
                const SizedBox(height: GpsSpacing.lg),
                Text(
                  l10n.bookingSummaryReason,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: GpsSpacing.xs),
                Text(appointment.reason!),
              ],
              if (showTelehealthCta) ...[
                const SizedBox(height: GpsSpacing.lg),
                PrimaryButton(
                  label: l10n.specialistAppointmentStartTelehealth,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l10n.specialistTelehealthComingSoon)),
                    );
                  },
                ),
              ],
              if (canViewRecords) ...[
                const SizedBox(height: GpsSpacing.md),
                SecondaryButton(
                  label: l10n.specialistAppointmentViewRecords,
                  onPressed: () => context.push(
                    SpecialistRoutes.patientRecords(widget.appointmentId),
                  ),
                ),
              ],
              if (canPrescribe) ...[
                const SizedBox(height: GpsSpacing.sm),
                SecondaryButton(
                  label: l10n.specialistAppointmentIssuePrescription,
                  onPressed: () => context.push(
                    SpecialistRoutes.prescriptionCompose(widget.appointmentId),
                  ),
                ),
              ],
              const SizedBox(height: GpsSpacing.xl),
              if (canConfirm)
                PrimaryButton(
                  label: l10n.specialistAppointmentConfirm,
                  onPressed: _busy ? null : _confirm,
                ),
              if (canReschedule) ...[
                const SizedBox(height: GpsSpacing.sm),
                SecondaryButton(
                  label: l10n.appointmentReschedule,
                  onPressed: _busy
                      ? null
                      : () => context.push(
                          SpecialistRoutes.appointmentReschedule(
                            widget.appointmentId,
                          ),
                        ),
                ),
              ],
              if (canNoShow) ...[
                const SizedBox(height: GpsSpacing.sm),
                SecondaryButton(
                  label: l10n.specialistAppointmentMarkNoShow,
                  onPressed: _busy ? null : _noShow,
                ),
              ],
              if (canCancel) ...[
                const SizedBox(height: GpsSpacing.sm),
                TextButton(
                  onPressed: _busy ? null : _cancel,
                  child: Text(
                    l10n.appointmentCancel,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
        if (_busy)
          const ColoredBox(
            color: Color(0x33000000),
            child: Center(child: CircularProgressIndicator()),
          ),
      ],
    );
  }
}

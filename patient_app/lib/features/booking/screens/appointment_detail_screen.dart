import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';
import 'package:intl/intl.dart';

import '../../discovery/utils/relative_time.dart';
import '../providers/appointment_detail.provider.dart';
import '../providers/booking_draft.provider.dart';
import '../utils/address_launcher.dart';
import '../utils/booking_dates.dart';
import '../utils/booking_enums.dart';
import '../widgets/booking_error_view.dart';
import '../widgets/mode_badge.dart';
import '../widgets/status_pill.dart';

class AppointmentDetailScreen extends ConsumerWidget {
  const AppointmentDetailScreen({required this.appointmentId, super.key});

  final String appointmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final detailAsync = ref.watch(appointmentDetailProvider(appointmentId));

    return Scaffold(
      appBar: AppBar(title: Text(l10n.appointmentDetailTitle)),
      body: detailAsync.when(
        data: (state) => _DetailBody(
          state: state,
          appointmentId: appointmentId,
          l10n: l10n,
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => BookingErrorView(
          error: e,
          message: l10n.appointmentDetailLoadError,
          onRetry: () =>
              ref.invalidate(appointmentDetailProvider(appointmentId)),
        ),
      ),
    );
  }
}

class _DetailBody extends ConsumerWidget {
  const _DetailBody({
    required this.state,
    required this.appointmentId,
    required this.l10n,
  });

  final AppointmentDetailState state;
  final String appointmentId;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointment = state.appointment;
    final doctor = state.doctor;
    final theme = Theme.of(context);
    final locale = Localizations.localeOf(context).languageCode;
    final start = appointment.startAt?.toLocal();
    final status = appointment.status;
    final statusWire = appointmentStatusWire(status);
    final canModify =
        start != null &&
        (status == AppointmentStatusEnum.pending ||
            status == AppointmentStatusEnum.confirmed) &&
        canPatientModifyAppointment(start);
    final showJoin =
        start != null &&
        appointment.mode == AppointmentModeEnum.telehealth &&
        canJoinTelehealth(start, statusWire);
    final relative =
        start != null ? formatReviewRelativeTime(start, locale) : '';

    return SingleChildScrollView(
      padding: const EdgeInsets.all(GpsSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (statusWire.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: GpsSpacing.md),
              child: StatusPill(status: statusWire),
            ),
          GpsCard(
            showAccentBorder: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${doctor.title ?? 'Dr.'} ${doctor.fullName ?? ''}',
                  style: theme.textTheme.headlineSmall,
                ),
                if (start != null) ...[
                  const SizedBox(height: GpsSpacing.sm),
                  Text(
                    DateFormat.yMMMEd(locale).add_Hm().format(start),
                    style: theme.textTheme.bodyLarge,
                  ),
                  if (relative.isNotEmpty)
                    Text(
                      relative,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                ],
                const SizedBox(height: GpsSpacing.sm),
                if (appointment.mode != null)
                  ModeBadge(mode: appointmentModeWire(appointment.mode)),
                const SizedBox(height: GpsSpacing.sm),
                Text(
                  '${l10n.bookingFeeLabel}: ${appointment.feeDzd ?? doctor.consultationFeeDzd ?? '—'} DZD',
                ),
                if (appointment.paymentStatus != null) ...[
                  const SizedBox(height: GpsSpacing.xs),
                  Text(
                    _paymentLabel(
                      paymentStatusWire(appointment.paymentStatus),
                      l10n,
                    ),
                  ),
                ],
                if (appointment.reason != null &&
                    appointment.reason!.isNotEmpty) ...[
                  const SizedBox(height: GpsSpacing.md),
                  Text(l10n.bookingSummaryReason),
                  Text(appointment.reason!),
                ],
              ],
            ),
          ),
          if (appointment.mode == AppointmentModeEnum.inPerson &&
              doctor.practiceAddress != null) ...[
            const SizedBox(height: GpsSpacing.md),
            OutlinedButton.icon(
              onPressed: () => openDirections(address: doctor.practiceAddress),
              icon: const Icon(Icons.directions_outlined),
              label: Text(l10n.appointmentDirections),
            ),
          ],
          if (showJoin) ...[
            const SizedBox(height: GpsSpacing.md),
            Tooltip(
              message: l10n.appointmentJoinTelehealthHint,
              child: FilledButton.icon(
                onPressed: null,
                icon: const Icon(Icons.videocam_outlined),
                label: Text(l10n.appointmentJoinTelehealth),
              ),
            ),
          ],
          if (status == AppointmentStatusEnum.completed) ...[
            const SizedBox(height: GpsSpacing.md),
            OutlinedButton(
              onPressed: null,
              child: Text(l10n.appointmentLeaveReview),
            ),
          ],
          if (canModify) ...[
            const SizedBox(height: GpsSpacing.lg),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _showCancelSheet(context, ref),
                    child: Text(l10n.appointmentCancel),
                  ),
                ),
                const SizedBox(width: GpsSpacing.sm),
                Expanded(
                  child: PrimaryButton(
                    label: l10n.appointmentReschedule,
                    onPressed: () {
                      final docId = doctor.id;
                      if (docId == null) return;
                      ref.read(bookingDraftProvider.notifier).startBooking(
                        doctorId: docId,
                        doctor: doctor,
                        rescheduleAppointmentId: appointmentId,
                      );
                      context.push(GpsRoutes.doctorBooking(docId));
                    },
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }

  String _paymentLabel(String status, AppLocalizations l10n) {
    return switch (status) {
      'unpaid' => l10n.appointmentPaymentUnpaid,
      'depositPaid' => l10n.appointmentPaymentDeposit,
      'paid' => l10n.appointmentPaymentPaid,
      'refunded' => l10n.appointmentPaymentRefunded,
      _ => status,
    };
  }

  Future<void> _showCancelSheet(BuildContext context, WidgetRef ref) async {
    final reasonController = TextEditingController();
    final confirmed = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: GpsSpacing.md,
            right: GpsSpacing.md,
            top: GpsSpacing.lg,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + GpsSpacing.lg,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.appointmentCancel,
                style: Theme.of(ctx).textTheme.titleLarge,
              ),
              const SizedBox(height: GpsSpacing.md),
              TextField(
                controller: reasonController,
                decoration: InputDecoration(
                  labelText: l10n.appointmentCancelReasonHint,
                ),
                maxLines: 2,
              ),
              const SizedBox(height: GpsSpacing.lg),
              PrimaryButton(
                label: l10n.appointmentConfirmCancel,
                onPressed: () => Navigator.pop(ctx, true),
              ),
            ],
          ),
        );
      },
    );
    final cancelReason = reasonController.text.trim();
    reasonController.dispose();
    if (confirmed != true || !context.mounted) return;
    try {
      await ref
          .read(appointmentDetailProvider(appointmentId).notifier)
          .cancel(
            reason: cancelReason.isEmpty ? null : cancelReason,
          );
    } catch (_) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.networkError)),
        );
      }
    }
  }
}

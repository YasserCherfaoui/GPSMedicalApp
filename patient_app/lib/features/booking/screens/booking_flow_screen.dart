import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../providers/appointments_upcoming.provider.dart';
import '../providers/booking_draft.provider.dart';
import '../providers/connectivity.provider.dart';
import '../providers/dependents_list.provider.dart';
import '../utils/booking_api_error.dart';
import '../utils/booking_dates.dart';
import '../utils/booking_enums.dart';
import '../widgets/mode_badge.dart';
import '../widgets/offline_banner.dart';
import '../widgets/slot_lock_banner.dart';

class BookingFlowScreen extends ConsumerStatefulWidget {
  const BookingFlowScreen({super.key});

  @override
  ConsumerState<BookingFlowScreen> createState() => _BookingFlowScreenState();
}

class _BookingFlowScreenState extends ConsumerState<BookingFlowScreen> {
  final _reasonController = TextEditingController();
  Map<String, String> _fieldErrors = {};
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowResumePrompt());
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  void _maybeShowResumePrompt() {
    final draft = ref.read(bookingDraftProvider);
    if (!draft.pendingResumePrompt) return;
    final l10n = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.bookingResumeDraftTitle),
        content: Text(l10n.bookingResumeDraftMessage),
        actions: [
          TextButton(
            onPressed: () {
              ref.read(bookingDraftProvider.notifier).dismissResumePrompt();
              ref.read(bookingDraftProvider.notifier).clearDraft();
              Navigator.pop(ctx);
              context.pop();
            },
            child: Text(l10n.bookingDiscard),
          ),
          FilledButton(
            onPressed: () {
              ref.read(bookingDraftProvider.notifier).dismissResumePrompt();
              Navigator.pop(ctx);
            },
            child: Text(l10n.bookingResume),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final draft = ref.watch(bookingDraftProvider);
    final l10n = AppLocalizations.of(context)!;
    final online = ref.watch(isOnlineProvider).value ?? true;

    if (draft.doctorId == null || draft.selectedSlot == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    _reasonController.text = draft.reason;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          draft.isReschedule
              ? l10n.appointmentReschedule
              : l10n.bookingStepConfirm,
        ),
      ),
      body: Column(
        children: [
          const OfflineBanner(),
          SlotLockBanner(
            onExpired: () {
              ref.read(bookingDraftProvider.notifier).clearSlotLock();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(l10n.bookingLockExpired)),
              );
              if (draft.doctorId != null) {
                context.go(GpsRoutes.doctorBooking(draft.doctorId!));
              }
            },
          ),
          Expanded(
            child: Stepper(
              currentStep: draft.step - 1,
              controlsBuilder: (_, details) => const SizedBox.shrink(),
              steps: [
                Step(
                  title: Text(l10n.bookingStepConfirm),
                  isActive: draft.step >= 1,
                  content: _StepConfirm(draft: draft, l10n: l10n),
                ),
                Step(
                  title: Text(l10n.bookingStepPatient),
                  isActive: draft.step >= 2,
                  content: _StepPatient(
                    selectedDependentId: draft.dependentId,
                    onSelect: (id) => ref
                        .read(bookingDraftProvider.notifier)
                        .setDependent(id),
                  ),
                ),
                Step(
                  title: Text(l10n.bookingStepReview),
                  isActive: draft.step >= 3,
                  content: _StepReview(
                    draft: draft,
                    l10n: l10n,
                    reasonController: _reasonController,
                    fieldErrors: _fieldErrors,
                    onReasonChanged: (v) => ref
                        .read(bookingDraftProvider.notifier)
                        .setReason(v),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(GpsSpacing.md),
            child: Row(
              children: [
                if (draft.step > 1)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: _submitting
                          ? null
                          : () => ref
                                .read(bookingDraftProvider.notifier)
                                .setStep(draft.step - 1),
                      child: Text(l10n.bookingBack),
                    ),
                  ),
                if (draft.step > 1) const SizedBox(width: GpsSpacing.sm),
                Expanded(
                  flex: 2,
                  child: PrimaryButton(
                    label: draft.step < 3
                        ? l10n.next
                        : (draft.isReschedule
                              ? l10n.bookingRescheduleSubmit
                              : l10n.bookingSubmit),
                    onPressed: _submitting
                        ? null
                        : () => _onPrimaryAction(draft, online, l10n),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _onPrimaryAction(
    BookingDraftState draft,
    bool online,
    AppLocalizations l10n,
  ) async {
    if (draft.step < 3) {
      ref.read(bookingDraftProvider.notifier).setStep(draft.step + 1);
      return;
    }
    if (!online) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.bookingOfflineSubmit)),
      );
      return;
    }
    setState(() {
      _submitting = true;
      _fieldErrors = {};
    });
    try {
      final notifier = ref.read(bookingDraftProvider.notifier);
      final appointment = draft.isReschedule
          ? await notifier.submitReschedule()
          : await notifier.submitCreate();
      await notifier.clearDraft();
      ref.invalidate(appointmentsUpcomingProvider);
      if (!mounted) return;
      context.go(GpsRoutes.appointmentDetail(appointment.id!));
    } on SlotTakenException {
      if (!mounted) return;
      await _showSlotTakenDialog(l10n);
    } on BookingValidationException catch (e) {
      setState(() => _fieldErrors = e.fieldErrors);
      ref.read(bookingDraftProvider.notifier).setStep(3);
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.networkError)),
      );
    } finally {
      if (mounted) setState(() => _submitting = false);
    }
  }

  Future<void> _showSlotTakenDialog(AppLocalizations l10n) async {
    final draft = ref.read(bookingDraftProvider);
    final doctorId = draft.doctorId;
    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.bookingSlotTakenTitle),
        content: Text(l10n.bookingSlotTakenMessage),
        actions: [
          FilledButton(
            onPressed: () {
              Navigator.pop(ctx);
              ref.read(bookingDraftProvider.notifier).clearSlotLock();
              if (doctorId != null) {
                context.go(GpsRoutes.doctorBooking(doctorId));
              }
            },
            child: Text(l10n.bookingChooseAnotherSlot),
          ),
        ],
      ),
    );
  }
}

class _StepConfirm extends StatelessWidget {
  const _StepConfirm({required this.draft, required this.l10n});

  final BookingDraftState draft;
  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    final doctor = draft.doctor;
    final slot = draft.selectedSlot;
    final locale = Localizations.localeOf(context).languageCode;
    final start = slot?.startAt?.toLocal();

    return GpsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.bookingSummaryDoctor,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            '${doctor?.title ?? 'Dr.'} ${doctor?.fullName ?? ''}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: GpsSpacing.md),
          Text(l10n.bookingSummarySlot),
          if (start != null) ...[
            Text(
              formatDaySectionTitle(
                Date(start.year, start.month, start.day),
                locale,
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              formatSlotTime(start, locale),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (slot != null && slotDurationMinutes(slot) > 0) ...[
              const SizedBox(height: GpsSpacing.xs),
              Text(
                l10n.bookingSlotDuration(slotDurationMinutes(slot)),
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ],
          if (slot?.mode != null) ...[
            const SizedBox(height: GpsSpacing.sm),
            ModeBadge(mode: slotModeWire(slot!.mode)),
          ],
          const SizedBox(height: GpsSpacing.md),
          Text(l10n.bookingFeeLabel),
          Text(
            '${doctor?.consultationFeeDzd ?? '—'} DZD',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _StepPatient extends ConsumerWidget {
  const _StepPatient({
    required this.selectedDependentId,
    required this.onSelect,
  });

  final String? selectedDependentId;
  final void Function(String?) onSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dependentsAsync = ref.watch(dependentsListProvider);

    return dependentsAsync.when(
      data: (dependents) {
        return Column(
          children: [
            RadioListTile<String?>(
              title: Text(l10n.bookingForMe),
              value: null,
              groupValue: selectedDependentId,
              onChanged: onSelect,
            ),
            for (final d in dependents)
              RadioListTile<String?>(
                title: Text(d.fullName ?? ''),
                subtitle: Text(d.relation?.name ?? ''),
                value: d.id,
                groupValue: selectedDependentId,
                onChanged: onSelect,
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) => Text(l10n.networkError),
    );
  }
}

class _StepReview extends ConsumerWidget {
  const _StepReview({
    required this.draft,
    required this.l10n,
    required this.reasonController,
    required this.fieldErrors,
    required this.onReasonChanged,
  });

  final BookingDraftState draft;
  final AppLocalizations l10n;
  final TextEditingController reasonController;
  final Map<String, String> fieldErrors;
  final ValueChanged<String> onReasonChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = Localizations.localeOf(context).languageCode;
    final slot = draft.selectedSlot;
    final start = slot?.startAt?.toLocal();
    final dependentsAsync = ref.watch(dependentsListProvider);

    final patientLabel = dependentsAsync.maybeWhen(
      data: (dependents) {
        if (draft.dependentId == null) return l10n.bookingForMe;
        for (final d in dependents) {
          if (d.id == draft.dependentId) {
            return d.fullName ?? l10n.bookingForMe;
          }
        }
        return l10n.bookingForMe;
      },
      orElse: () => l10n.bookingForMe,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: reasonController,
          maxLength: 500,
          decoration: InputDecoration(
            labelText: l10n.bookingReasonHint,
            errorText: fieldErrors['reason'],
          ),
          onChanged: onReasonChanged,
          maxLines: 3,
        ),
        const SizedBox(height: GpsSpacing.md),
        GpsCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.bookingStepReview,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: GpsSpacing.sm),
              Text(
                l10n.bookingSummaryDoctor,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                '${draft.doctor?.title ?? 'Dr.'} ${draft.doctor?.fullName ?? ''}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: GpsSpacing.sm),
              Text(
                l10n.bookingSummarySlot,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              if (start != null)
                Text(
                  '${formatDaySectionTitle(Date(start.year, start.month, start.day), locale)} · ${formatSlotTime(start, locale)}',
                ),
              if (slot?.mode != null) ...[
                const SizedBox(height: GpsSpacing.xs),
                ModeBadge(mode: slotModeWire(slot!.mode)),
              ],
              const SizedBox(height: GpsSpacing.sm),
              Text(
                l10n.bookingFeeLabel,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(
                '${draft.doctor?.consultationFeeDzd ?? '—'} DZD',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: GpsSpacing.sm),
              Text(
                l10n.bookingSummaryPatient,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Text(patientLabel),
              if (draft.reason.isNotEmpty) ...[
                const SizedBox(height: GpsSpacing.sm),
                Text(
                  l10n.bookingSummaryReason,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(draft.reason),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

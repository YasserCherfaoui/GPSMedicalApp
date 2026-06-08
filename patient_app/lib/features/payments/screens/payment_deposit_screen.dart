import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/appointment_detail.provider.dart';
import '../../booking/widgets/booking_error_view.dart';
import '../providers/payments_repository.provider.dart';
import '../utils/deposit_eligibility.dart';
import '../utils/payment_url_launcher.dart';
import '../utils/payments_api_error.dart';
import '../utils/sandbox_gateway_token.dart';

class PaymentDepositScreen extends ConsumerStatefulWidget {
  const PaymentDepositScreen({required this.appointmentId, super.key});

  final String appointmentId;

  @override
  ConsumerState<PaymentDepositScreen> createState() =>
      _PaymentDepositScreenState();
}

class _PaymentDepositScreenState extends ConsumerState<PaymentDepositScreen> {
  bool _paying = false;

  Future<void> _startPayment({
    required int amountDzd,
    required bool sandboxSucceed,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    setState(() => _paying = true);
    try {
      final repo = ref.read(paymentsRepositoryProvider);
      final intent = await repo.createDepositIntent(
        appointmentId: widget.appointmentId,
        amountDzd: amountDzd,
      );
      final intentId = intent.id;
      if (intentId == null) {
        throw StateError('Payment intent missing id');
      }

      final redirect = intent.redirectUrl;
      if (redirect != null && redirect.isNotEmpty) {
        await openPaymentRedirectUrl(redirect);
      } else {
        await repo.confirm(
          intentId: intentId,
          gatewayToken: sandboxGatewayToken(succeed: sandboxSucceed),
        );
      }

      final finalIntent = await repo.pollUntilTerminal(intentId);
      if (!mounted) return;

      if (finalIntent.status == PaymentIntentStatusEnum.succeeded) {
        ref.invalidate(appointmentDetailProvider(widget.appointmentId));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.paymentDepositSuccess)),
        );
        context.pop();
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.paymentDepositFailed)),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            paymentErrorMessage(e, l10n.paymentDepositFailed),
          ),
        ),
      );
    } finally {
      if (mounted) setState(() => _paying = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final detailAsync = ref.watch(
      appointmentDetailProvider(widget.appointmentId),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.paymentDepositTitle)),
      body: detailAsync.when(
        data: (state) {
          final appointment = state.appointment;
          final doctor = state.doctor;
          if (!canPayAppointmentDeposit(appointment)) {
            return Center(child: Text(l10n.paymentDepositNotEligible));
          }
          final amount = appointmentDepositAmountDzd(appointment, doctor);
          if (amount == null) {
            return Center(child: Text(l10n.paymentDepositNotEligible));
          }

          return Padding(
            padding: const EdgeInsets.all(GpsSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GpsCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${doctor.title ?? 'Dr.'} ${doctor.fullName ?? ''}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      Text(
                        l10n.paymentDepositAmountLabel(amount),
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      Text(l10n.paymentDepositProviderStripeTest),
                      const SizedBox(height: GpsSpacing.xs),
                      Text(
                        l10n.paymentDepositSandboxHint,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                PrimaryButton(
                  label: l10n.paymentDepositCta,
                  isLoading: _paying,
                  onPressed: _paying
                      ? null
                      : () => _startPayment(
                          amountDzd: amount,
                          sandboxSucceed: true,
                        ),
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => BookingErrorView(
          error: e,
          message: l10n.appointmentDetailLoadError,
          onRetry: () => ref.invalidate(
            appointmentDetailProvider(widget.appointmentId),
          ),
        ),
      ),
    );
  }
}

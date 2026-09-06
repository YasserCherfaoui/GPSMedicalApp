import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../../booking/providers/appointment_detail.provider.dart';
import '../../booking/widgets/booking_error_view.dart';
import '../providers/payments_repository.provider.dart';
import '../providers/stripe_payment_sheet.provider.dart';
import '../utils/deposit_eligibility.dart';
import '../utils/payments_api_error.dart';
import '../utils/price_format.dart';
import '../utils/stripe_payment_errors.dart';
import '../widgets/payment_eur_decline_dialog.dart';
import '../widgets/price_with_fx_label.dart';
/// Full-consultation / teleconsultation EUR payment via Stripe PaymentSheet.
class EurPaymentScreen extends ConsumerStatefulWidget {
  const EurPaymentScreen({
    required this.appointmentId,
    this.currency,
    this.amountMinor,
    this.purpose,
    super.key,
  });

  final String appointmentId;
  final String? currency;
  final int? amountMinor;
  final String? purpose;

  @override
  ConsumerState<EurPaymentScreen> createState() => _EurPaymentScreenState();
}

class _EurPaymentScreenState extends ConsumerState<EurPaymentScreen> {
  bool _paying = false;

  Future<void> _startPayment({
    required int amountMinor,
    required String purpose,
  }) async {
    final l10n = AppLocalizations.of(context)!;
    final sheet = ref.read(stripePaymentSheetServiceProvider);
    if (!sheet.isAvailable) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.paymentSheetUnavailable)),
      );
      return;
    }

    setState(() => _paying = true);
    try {
      final repo = ref.read(paymentsRepositoryProvider);
      final created = await repo.createEurIntent(
        appointmentId: widget.appointmentId,
        amountMinor: amountMinor,
        purpose: purpose,
      );
      final secret = created.clientSecret;
      if (secret == null || secret.isEmpty) {
        throw StateError('Payment intent missing client_secret');
      }

      try {
        await sheet.present(
          clientSecret: secret,
          merchantDisplayName: l10n.paymentSheetMerchantName,
        );
      } catch (e) {
        if (!mounted) return;
        if (isStripePaymentCanceled(e)) return;
        if (isStripeCardDeclineOrUnsupported(e)) {
          await showPaymentEurDeclineDialog(context);
          return;
        }
        rethrow;
      }

      // Webhook may still be in flight — poll as fallback.
      final finalIntent = await repo.pollUntilTerminal(created.id);
      if (!mounted) return;

      if (finalIntent.status == PaymentIntentStatusEnum.succeeded) {
        ref.invalidate(appointmentDetailProvider(widget.appointmentId));
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(l10n.paymentEurSuccess)));
        context.pop();
        return;
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.paymentEurFailed)));
    } catch (e) {
      if (!mounted) return;
      if (isStripeCardDeclineOrUnsupported(e)) {
        await showPaymentEurDeclineDialog(context);
        return;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(paymentErrorMessage(e, l10n.paymentEurFailed)),
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
      appBar: AppBar(title: Text(l10n.paymentEurTitle)),
      body: detailAsync.when(
        data: (state) {
          final appointment = state.appointment;
          final doctor = state.doctor;
          if (!canPayAppointmentEur(appointment)) {
            return Center(child: Text(l10n.paymentEurNotEligible));
          }

          final currency = resolvePaymentCurrency(
            overrideCurrency: widget.currency,
            serviceCurrency: state.serviceCurrency,
            clinicCountryCode: state.clinic?.countryCode,
          );
          if (!isEurCurrency(currency)) {
            return Center(child: Text(l10n.paymentEurNotEligible));
          }

          final amountMinor = appointmentEurAmountMinor(
            appointment: appointment,
            overrideAmountMinor: widget.amountMinor,
            servicePriceMajor: state.servicePriceAmount,
            doctor: doctor,
          );
          if (amountMinor == null) {
            return Center(child: Text(l10n.paymentEurNotEligible));
          }

          final purpose =
              (widget.purpose?.trim().isNotEmpty == true)
              ? widget.purpose!.trim()
              : eurPaymentPurpose(appointment);
          final amountMajor = amountMinor ~/ 100;
          final clinicPayee = isClinicBookingPayment(appointment);
          final payeeTitle = clinicPayee
              ? (state.clinic?.name?.trim().isNotEmpty == true
                    ? state.clinic!.name!.trim()
                    : l10n.paymentDepositPayeeClinicFallback)
              : '${doctor?.title ?? 'Dr.'} ${doctor?.fullName ?? ''}'.trim();

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
                        payeeTitle,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      if (clinicPayee) ...[
                        const SizedBox(height: GpsSpacing.xs),
                        Text(
                          l10n.paymentDepositPayeeClinicHint,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                      const SizedBox(height: GpsSpacing.sm),
                      PriceWithFxLabel(
                        amount: amountMajor,
                        currency: 'EUR',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: GpsSpacing.sm),
                      Text(l10n.paymentEurBody(amountMajor)),
                    ],
                  ),
                ),
                const Spacer(),
                PrimaryButton(
                  label: l10n.paymentEurCta,
                  isLoading: _paying,
                  onPressed: _paying
                      ? null
                      : () => _startPayment(
                          amountMinor: amountMinor,
                          purpose: purpose,
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
          onRetry: () =>
              ref.invalidate(appointmentDetailProvider(widget.appointmentId)),
        ),
      ),
    );
  }
}

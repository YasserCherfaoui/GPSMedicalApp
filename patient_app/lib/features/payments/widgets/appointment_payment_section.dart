import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/deposit_eligibility.dart';
import '../utils/price_format.dart';

class AppointmentPaymentSection extends StatelessWidget {
  const AppointmentPaymentSection({
    required this.appointment,
    required this.doctor,
    required this.appointmentId,
    this.clinicName,
    this.clinicCountryCode,
    this.serviceCurrency,
    this.servicePriceAmount,
    super.key,
  });

  final Appointment appointment;
  final Doctor? doctor;
  final String appointmentId;
  final String? clinicName;
  final String? clinicCountryCode;
  final String? serviceCurrency;
  final int? servicePriceAmount;

  @override
  Widget build(BuildContext context) {
    if (!canPayAppointmentDeposit(appointment)) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context)!;
    final currency = resolvePaymentCurrency(
      serviceCurrency: serviceCurrency,
      clinicCountryCode: clinicCountryCode,
    );
    final eur = isEurCurrency(currency);
    final clinicPayee = isClinicBookingPayment(appointment);

    if (eur) {
      final amountMinor = appointmentEurAmountMinor(
        appointment: appointment,
        servicePriceMajor: servicePriceAmount,
        doctor: doctor,
      );
      if (amountMinor == null) return const SizedBox.shrink();
      final amountMajor = amountMinor ~/ 100;
      final purpose = eurPaymentPurpose(appointment);
      final route = GpsRoutes.appointmentPaymentEur(
        appointmentId,
        currency: 'EUR',
        amountMinor: amountMinor,
        purpose: purpose,
      );

      return GpsCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              l10n.paymentEurTitle,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: GpsSpacing.xs),
            Text(l10n.paymentEurBody(amountMajor)),
            if (clinicPayee) ...[
              const SizedBox(height: GpsSpacing.xs),
              Text(
                clinicName != null && clinicName!.trim().isNotEmpty
                    ? l10n.paymentDepositPayeeClinicNamed(clinicName!.trim())
                    : l10n.paymentDepositPayeeClinicHint,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ],
            const SizedBox(height: GpsSpacing.md),
            PrimaryButton(
              label: l10n.paymentEurCta,
              onPressed: () => context.push(route),
            ),
          ],
        ),
      );
    }

    final amount = appointmentDepositAmountDzd(appointment, doctor);
    if (amount == null) return const SizedBox.shrink();

    return GpsCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.paymentDepositTitle,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: GpsSpacing.xs),
          Text(l10n.paymentDepositBody(amount)),
          if (clinicPayee) ...[
            const SizedBox(height: GpsSpacing.xs),
            Text(
              clinicName != null && clinicName!.trim().isNotEmpty
                  ? l10n.paymentDepositPayeeClinicNamed(clinicName!.trim())
                  : l10n.paymentDepositPayeeClinicHint,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
            ),
          ],
          const SizedBox(height: GpsSpacing.md),
          PrimaryButton(
            label: l10n.paymentDepositCta,
            onPressed: () => context.push(
              GpsRoutes.appointmentPaymentDeposit(appointmentId),
            ),
          ),
        ],
      ),
    );
  }
}

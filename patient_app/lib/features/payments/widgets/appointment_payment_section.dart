import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../utils/deposit_eligibility.dart';

class AppointmentPaymentSection extends StatelessWidget {
  const AppointmentPaymentSection({
    required this.appointment,
    required this.doctor,
    required this.appointmentId,
    super.key,
  });

  final Appointment appointment;
  final Doctor doctor;
  final String appointmentId;

  @override
  Widget build(BuildContext context) {
    if (!canPayAppointmentDeposit(appointment)) {
      return const SizedBox.shrink();
    }
    final l10n = AppLocalizations.of(context)!;
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
          const SizedBox(height: GpsSpacing.md),
          PrimaryButton(
            label: l10n.paymentDepositCta,
            onPressed: () =>
                context.push(GpsRoutes.appointmentPaymentDeposit(appointmentId)),
          ),
        ],
      ),
    );
  }
}

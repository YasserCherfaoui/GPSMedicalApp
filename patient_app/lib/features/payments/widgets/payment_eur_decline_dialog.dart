import 'package:flutter/material.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

/// Dedicated explainer when Stripe declines / rejects a non-international card.
Future<void> showPaymentEurDeclineDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (ctx) {
      return AlertDialog(
        title: Text(l10n.paymentEurDeclineTitle),
        content: Text(l10n.paymentEurDeclineBody),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l10n.paymentEurDeclineDismiss),
          ),
        ],
      );
    },
  );
}

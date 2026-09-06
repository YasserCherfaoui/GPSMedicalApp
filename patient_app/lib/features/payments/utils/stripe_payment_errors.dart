import 'package:flutter_stripe/flutter_stripe.dart';

/// Whether [error] is a Stripe PaymentSheet / card failure that should show the
/// dedicated international-card explainer (not a generic toast).
bool isStripeCardDeclineOrUnsupported(Object error) {
  if (error is! StripeException) return false;
  final code = error.error.code;
  if (code == FailureCode.Canceled) return false;

  final decline = (error.error.declineCode ?? '').toLowerCase();
  final message = (error.error.message ?? '').toLowerCase();
  final localized = (error.error.localizedMessage ?? '').toLowerCase();
  final haystack = '$decline $message $localized';

  const markers = [
    'card_declined',
    'card_not_supported',
    'do_not_honor',
    'generic_decline',
    'invalid_account',
    'currency_not_supported',
    'not supported',
    'non support',
    'n\'est pas prise en charge',
    'carte refus',
    'declined',
  ];
  for (final m in markers) {
    if (haystack.contains(m)) return true;
  }

  // PaymentSheet Failed without cancel → treat as card/payment decline UX.
  return code == FailureCode.Failed;
}

bool isStripePaymentCanceled(Object error) {
  return error is StripeException && error.error.code == FailureCode.Canceled;
}

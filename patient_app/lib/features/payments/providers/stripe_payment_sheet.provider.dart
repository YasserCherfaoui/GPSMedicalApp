import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/stripe_payment_sheet_service.dart';

final stripePaymentSheetServiceProvider = Provider<StripePaymentSheetService>((
  ref,
) {
  return StripePaymentSheetService();
});

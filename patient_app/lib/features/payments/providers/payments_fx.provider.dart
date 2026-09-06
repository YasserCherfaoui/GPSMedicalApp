import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

import '../repositories/payments_fx_repository.dart';

final paymentsFxRepositoryProvider = Provider<PaymentsFxRepository>((ref) {
  final client = ref.watch(gpsMedicalClientProvider);
  return PaymentsFxRepository(client.v1.dio);
});

/// Cached EUR→DZD indicative rate (K-4). Null when the endpoint fails —
/// callers should still show the EUR price without the approx label.
final indicativeEurDzdRateProvider =
    FutureProvider.autoDispose<IndicativeFxRate?>((ref) async {
  // Keep the result briefly so list scrolling does not refetch every card.
  final link = ref.keepAlive();
  ref.onCancel(() {
    Future<void>.delayed(const Duration(minutes: 5), link.close);
  });

  try {
    final repo = ref.watch(paymentsFxRepositoryProvider);
    final rate = await repo.fetchIndicative(base: 'EUR', quote: 'DZD');
    if (rate.rate <= 0) return null;
    return rate;
  } catch (_) {
    return null;
  }
});

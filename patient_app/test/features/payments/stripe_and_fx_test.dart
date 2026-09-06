import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:patient_app/features/payments/repositories/payments_fx_repository.dart';
import 'package:patient_app/features/payments/services/stripe_payment_sheet_service.dart';

void main() {
  group('PaymentsFxRepository', () {
    late Dio dio;
    late DioAdapter adapter;
    late PaymentsFxRepository repo;

    setUp(() {
      dio = Dio(BaseOptions(baseUrl: 'http://localhost/v1'));
      adapter = DioAdapter(dio: dio);
      repo = PaymentsFxRepository(dio);
    });

    test('parses indicative EUR→DZD response', () async {
      adapter.onGet(
        '/payments/fx/indicative',
        (server) => server.reply(200, {
          'base': 'EUR',
          'quote': 'DZD',
          'rate': 260.12,
          'as_of': '2026-09-06',
          'source': 'ecb',
          'transactional': false,
          'caveat_fr': 'montant débité en EUR',
        }),
        queryParameters: {'base': 'EUR', 'quote': 'DZD'},
      );

      final rate = await repo.fetchIndicative();
      expect(rate.base, 'EUR');
      expect(rate.quote, 'DZD');
      expect(rate.rate, closeTo(260.12, 0.001));
      expect(rate.transactional, isFalse);
      expect(rate.caveatFr, 'montant débité en EUR');
    });
  });

  group('StripePaymentSheetService', () {
    test('is unavailable when key unset', () {
      final service = StripePaymentSheetService(
        publishableKey: '',
        enabled: true,
      );
      expect(service.isAvailable, isFalse);
    });

    test('is unavailable when eur rail disabled', () {
      final service = StripePaymentSheetService(
        publishableKey: 'pk_test_x',
        enabled: false,
      );
      expect(service.isAvailable, isFalse);
    });

    test('ensureInitialized no-ops when unavailable', () async {
      final service = StripePaymentSheetService(
        publishableKey: '',
        enabled: false,
      );
      await service.ensureInitialized();
    });

    test('present throws when unavailable', () async {
      final service = StripePaymentSheetService(
        publishableKey: '',
        enabled: false,
      );
      await expectLater(
        service.present(
          clientSecret: 'pi_test_secret',
          merchantDisplayName: 'Medora',
        ),
        throwsA(isA<StateError>()),
      );
    });
  });
}

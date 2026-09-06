import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:specialist_app/features/payments/repositories/stripe_connect_repository.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late StripeConnectRepository repo;

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'http://localhost:8080/v1'));
    adapter = DioAdapter(
      dio: dio,
      matcher: const UrlRequestMatcher(matchMethod: true),
    );
    dio.httpClientAdapter = adapter;
    repo = StripeConnectRepository(dio);
  });

  test('fetchMyAccount parses connect account', () async {
    adapter.onGet('/payments/connect/me', (server) {
      return server.reply(200, {
        'id': 'acct-ref-1',
        'payee_type': 'specialist',
        'payee_id': 'doc-1',
        'stripe_account_id': 'acct_test',
        'status': 'incomplete',
        'requirements_due_count': 2,
        'created_at': '2026-06-01T00:00:00Z',
        'updated_at': '2026-06-01T00:00:00Z',
      });
    });

    final account = await repo.fetchMyAccount();
    expect(account.id, 'acct-ref-1');
    expect(account.status, 'incomplete');
    expect(account.needsOnboarding, isTrue);
    expect(account.requirementsDueCount, 2);
  });

  test('fetchMyAccount maps 404 to ConnectAccountNotFoundException', () async {
    adapter.onGet('/payments/connect/me', (server) {
      return server.reply(404, {
        'title': 'Not found',
        'status': 404,
      });
    });

    expect(
      () => repo.fetchMyAccount(),
      throwsA(isA<ConnectAccountNotFoundException>()),
    );
  });

  test('createOnboardingLink posts account link', () async {
    adapter.onPost(
      '/payments/connect/accounts/acct-ref-1/onboarding-link',
      (server) {
        return server.reply(201, {
          'url': 'https://connect.stripe.com/setup/test',
          'expires_at': '2026-06-01T01:00:00Z',
        });
      },
    );

    final link = await repo.createOnboardingLink('acct-ref-1');
    expect(link.url, contains('stripe.com'));
  });
}

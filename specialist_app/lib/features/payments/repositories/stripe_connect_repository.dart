import 'package:dio/dio.dart';

/// Stripe Connect Express account for the authenticated specialist.
class ConnectAccount {
  const ConnectAccount({
    required this.id,
    required this.status,
    required this.requirementsDueCount,
    this.payeeType,
    this.payeeId,
    this.stripeAccountId,
  });

  final String id;
  final String status;
  final int requirementsDueCount;
  final String? payeeType;
  final String? payeeId;
  final String? stripeAccountId;

  bool get needsOnboarding =>
      status == 'incomplete' || status == 'pending' || status == 'restricted';

  factory ConnectAccount.fromJson(Map<String, dynamic> json) {
    return ConnectAccount(
      id: json['id'] as String? ?? '',
      status: (json['status'] as String? ?? 'incomplete').toLowerCase(),
      requirementsDueCount: (json['requirements_due_count'] as num?)?.toInt() ??
          0,
      payeeType: json['payee_type'] as String?,
      payeeId: json['payee_id'] as String?,
      stripeAccountId: json['stripe_account_id'] as String?,
    );
  }
}

class ConnectOnboardingLink {
  const ConnectOnboardingLink({
    required this.url,
    required this.expiresAt,
  });

  final String url;
  final String expiresAt;

  factory ConnectOnboardingLink.fromJson(Map<String, dynamic> json) {
    return ConnectOnboardingLink(
      url: json['url'] as String? ?? '',
      expiresAt: json['expires_at'] as String? ?? '',
    );
  }
}

class ConnectAccountNotFoundException implements Exception {
  const ConnectAccountNotFoundException();
}

class StripeConnectRepository {
  StripeConnectRepository(this._dio);

  final Dio _dio;

  /// `GET /payments/connect/me` — 404 when not provisioned.
  Future<ConnectAccount> fetchMyAccount() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/payments/connect/me',
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty connect account response');
      }
      return ConnectAccount.fromJson(data);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw const ConnectAccountNotFoundException();
      }
      rethrow;
    }
  }

  Future<ConnectOnboardingLink> createOnboardingLink(String accountRef) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/payments/connect/accounts/$accountRef/onboarding-link',
    );
    final data = response.data;
    if (data == null) {
      throw StateError('Empty onboarding link response');
    }
    final link = ConnectOnboardingLink.fromJson(data);
    if (link.url.isEmpty) {
      throw StateError('Onboarding link missing url');
    }
    return link;
  }
}

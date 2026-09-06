import 'package:dio/dio.dart';

/// K-4 display-only FX rate from `GET /v1/payments/fx/indicative`.
class IndicativeFxRate {
  const IndicativeFxRate({
    required this.base,
    required this.quote,
    required this.rate,
    required this.asOf,
    required this.source,
    required this.transactional,
    this.caveatFr,
  });

  final String base;
  final String quote;
  final double rate;
  final String asOf;
  final String source;
  final bool transactional;
  final String? caveatFr;

  factory IndicativeFxRate.fromJson(Map<String, dynamic> json) {
    final rateRaw = json['rate'];
    final rate = rateRaw is num
        ? rateRaw.toDouble()
        : double.tryParse('$rateRaw') ?? 0;
    return IndicativeFxRate(
      base: json['base'] as String? ?? 'EUR',
      quote: json['quote'] as String? ?? 'DZD',
      rate: rate,
      asOf: json['as_of'] as String? ?? '',
      source: json['source'] as String? ?? 'stub',
      transactional: json['transactional'] == true,
      caveatFr: json['caveat_fr'] as String?,
    );
  }
}

class PaymentsFxRepository {
  PaymentsFxRepository(this._dio);

  final Dio _dio;

  Future<IndicativeFxRate> fetchIndicative({
    String base = 'EUR',
    String quote = 'DZD',
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/payments/fx/indicative',
      queryParameters: {'base': base, 'quote': quote},
    );
    final data = response.data;
    if (data == null) {
      throw StateError('Empty indicative FX response');
    }
    return IndicativeFxRate.fromJson(data);
  }
}

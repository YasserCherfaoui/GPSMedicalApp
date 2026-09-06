import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gps_medical_shared/gps_medical_shared.dart';

class SettlementSummary {
  const SettlementSummary({
    required this.status,
    required this.sellerAmountMinor,
    this.releasedAt,
  });

  final String status;
  final int sellerAmountMinor;
  final DateTime? releasedAt;

  factory SettlementSummary.fromJson(Map<String, dynamic> json) {
    return SettlementSummary(
      status: json['status'] as String? ?? '',
      sellerAmountMinor: (json['seller_amount_minor'] as num?)?.toInt() ?? 0,
      releasedAt: json['released_at'] != null
          ? DateTime.tryParse(json['released_at'] as String)
          : null,
    );
  }
}

final settlementByAppointmentProvider =
    FutureProvider.autoDispose.family<SettlementSummary?, String>((
  ref,
  appointmentId,
) async {
  final dio = ref.watch(gpsMedicalClientProvider).v1.dio;
  try {
    final res = await dio.get<Map<String, dynamic>>(
      '/payments/settlements/by-appointment/$appointmentId',
    );
    final data = res.data;
    if (data == null) return null;
    return SettlementSummary.fromJson(data);
  } on DioException catch (e) {
    if (e.response?.statusCode == 404) return null;
    rethrow;
  }
});

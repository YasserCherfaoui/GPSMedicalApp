import 'package:dio/dio.dart';

import '../models/incoming_bilan_models.dart';

class IncomingBilanRepository {
  IncomingBilanRepository(this._dio);

  final Dio _dio;

  Future<List<IncomingBilanTransmission>> list({
    String reviewed = 'open',
    int page = 1,
    int pageSize = 10,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/specialists/me/incoming-bilans',
      queryParameters: {
        'reviewed': reviewed,
        'page': page,
        'page_size': pageSize,
      },
    );
    final data = response.data;
    if (data == null) return const [];
    final items = data['data'] as List<dynamic>? ?? const [];
    return items
        .map(
          (e) => IncomingBilanTransmission.fromJson(
            Map<String, dynamic>.from(e as Map),
          ),
        )
        .toList();
  }

  Future<IncomingBilanDetail> getDetail(String transmissionId) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/specialists/me/incoming-bilans/$transmissionId',
    );
    final data = response.data;
    if (data == null) {
      throw StateError('Empty incoming bilan response');
    }
    return IncomingBilanDetail.fromJson(data);
  }

  Future<IncomingBilanTransmission> markReviewed(String transmissionId) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/specialists/me/incoming-bilans/$transmissionId/review',
    );
    final data = response.data;
    if (data == null) {
      throw StateError('Empty review response');
    }
    return IncomingBilanTransmission.fromJson(data);
  }
}

import 'package:dio/dio.dart';

import '../models/bilan_models.dart';

class BilanApiException implements Exception {
  const BilanApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

class BilanRepository {
  BilanRepository(this._dio);

  final Dio _dio;

  Future<BilanDetail> createBilan({required String sessionId}) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/bilans',
        data: {'session_id': sessionId},
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty bilan response');
      }
      return BilanDetail.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<List<BilanSummary>> listBilans({int page = 1, int pageSize = 10}) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/bilans',
        queryParameters: {'page': page, 'page_size': pageSize},
      );
      final data = response.data;
      if (data == null) return const [];
      final items = data['data'] as List<dynamic>? ?? const [];
      return items
          .map(
            (e) => BilanSummary.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<BilanDetail> getBilan(String bilanId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>('/bilans/$bilanId');
      final data = response.data;
      if (data == null) {
        throw StateError('Empty bilan detail response');
      }
      return BilanDetail.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<BilanPdfDownload> getPdfDownload(String bilanId) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/bilans/$bilanId/pdf');
      final data = response.data;
      if (data == null) {
        throw StateError('Empty pdf response');
      }
      return BilanPdfDownload.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<BilanTransmission> transmit({
    required String bilanId,
    required String specialistId,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/bilans/$bilanId/transmit',
        data: {'specialist_id': specialistId},
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty transmit response');
      }
      return BilanTransmission.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  BilanApiException _mapDio(DioException e) {
    final status = e.response?.statusCode;
    final data = e.response?.data;
    final map = data is Map
        ? data.map((k, v) => MapEntry(k.toString(), v))
        : null;
    final detail = map?['detail'] as String? ?? map?['title'] as String?;
    return BilanApiException(
      detail ?? 'Bilan unavailable',
      statusCode: status,
    );
  }
}

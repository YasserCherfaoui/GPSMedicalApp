import 'package:dio/dio.dart';

import '../models/anamnesis_models.dart';

class AnamnesisApiException implements Exception {
  const AnamnesisApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

class AnamnesisRepository {
  AnamnesisRepository(this._dio);

  final Dio _dio;

  Future<AnamnesisSession> createSession({
    required String zoneCode,
    required String bodyModel,
    Map<String, dynamic>? painSelection,
    bool resumeIfExists = true,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/anamnesis/sessions',
        queryParameters: {'resume_if_exists': resumeIfExists},
        data: {
          'zone_code': zoneCode,
          'body_model': bodyModel,
          if (painSelection != null) 'pain_selection': painSelection,
        },
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty anamnesis session response');
      }
      return AnamnesisSession.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<AnamnesisQuestion?> fetchNextQuestion(String sessionId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/anamnesis/sessions/$sessionId/next-question',
      );
      if (response.statusCode == 204) return null;
      final data = response.data;
      if (data == null) return null;
      return AnamnesisQuestion.fromJson(
        Map<String, dynamic>.from(data['question'] as Map),
      );
    } on DioException catch (e) {
      if (e.response?.statusCode == 204) return null;
      throw _mapDio(e);
    }
  }

  Future<AnamnesisAnswerResult> submitAnswer({
    required String sessionId,
    required String questionId,
    required Map<String, dynamic> value,
    DateTime? answeredAt,
    String? clientNonce,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/anamnesis/sessions/$sessionId/answers',
        data: {
          'question_id': questionId,
          'value': value,
          if (answeredAt != null)
            'answered_at': answeredAt.toUtc().toIso8601String(),
          if (clientNonce != null) 'client_nonce': clientNonce,
        },
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty anamnesis answer response');
      }
      return AnamnesisAnswerResult.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  AnamnesisApiException _mapDio(DioException e) {
    final status = e.response?.statusCode;
    final data = e.response?.data;
    final map = data is Map
        ? data.map((k, v) => MapEntry(k.toString(), v))
        : null;
    final detail = map?['detail'] as String? ?? map?['title'] as String?;
    if (e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout) {
      return AnamnesisApiException(
        'network',
        statusCode: status,
      );
    }
    return AnamnesisApiException(
      detail ?? 'Anamnesis unavailable',
      statusCode: status,
    );
  }
}

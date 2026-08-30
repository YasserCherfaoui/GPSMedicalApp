import 'package:dio/dio.dart';

import '../models/referral_models.dart';

class ReferralApiException implements Exception {
  const ReferralApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

class ReferralRepository {
  ReferralRepository(this._dio);

  final Dio _dio;

  Future<List<ReferralMatch>> generateMatches(String sessionId) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/referral/matches/generate',
        queryParameters: {'session_id': sessionId},
      );
      return _parseList(response.data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<List<ReferralMatch>> listMatches(String sessionId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/referral/matches',
        queryParameters: {'session_id': sessionId},
      );
      return _parseList(response.data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<ReferralMatch> getMatch(String matchId) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/referral/matches/$matchId');
      final data = response.data;
      if (data == null) {
        throw StateError('Empty referral match response');
      }
      return ReferralMatch.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<void> selectMatch(String matchId) async {
    try {
      await _dio.post<void>('/referral/matches/$matchId/select');
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  List<ReferralMatch> _parseList(Map<String, dynamic>? data) {
    if (data == null) return const [];
    final items = data['data'] as List<dynamic>? ?? const [];
    return items
        .map(
          (e) => ReferralMatch.fromJson(Map<String, dynamic>.from(e as Map)),
        )
        .toList();
  }

  ReferralApiException _mapDio(DioException e) {
    final status = e.response?.statusCode;
    final body = e.response?.data;
    final map = body is Map
        ? body.map((k, v) => MapEntry(k.toString(), v))
        : null;
    final detail = map?['detail'] as String? ?? map?['title'] as String?;
    return ReferralApiException(
      detail ?? 'Referral unavailable',
      statusCode: status,
    );
  }
}

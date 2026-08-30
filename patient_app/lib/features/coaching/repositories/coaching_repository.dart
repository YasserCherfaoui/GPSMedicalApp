import 'package:dio/dio.dart';

import '../models/coaching_models.dart';

class CoachingApiException implements Exception {
  const CoachingApiException(this.message, {this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => message;
}

class CoachingRepository {
  CoachingRepository(this._dio);

  final Dio _dio;

  Future<List<CoachingPlanSummary>> listPlans({
    String? sessionId,
    int page = 1,
    int pageSize = 10,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/coaching/plans',
        queryParameters: {
          if (sessionId != null) 'session_id': sessionId,
          'page': page,
          'page_size': pageSize,
        },
      );
      final data = response.data;
      if (data == null) return const [];
      final items = data['data'] as List<dynamic>? ?? const [];
      return items
          .map(
            (e) => CoachingPlanSummary.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList();
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<CoachingPlan> generatePlan(String sessionId) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/coaching/plans/generate',
        queryParameters: {'session_id': sessionId},
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty coaching plan response');
      }
      return CoachingPlan.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<CoachingPlan> getPlan(String planId) async {
    try {
      final response =
          await _dio.get<Map<String, dynamic>>('/coaching/plans/$planId');
      final data = response.data;
      if (data == null) {
        throw StateError('Empty coaching plan response');
      }
      return CoachingPlan.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<CoachingProgress> getProgress(String planId) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/coaching/plans/$planId/progress',
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty coaching progress response');
      }
      return CoachingProgress.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<CoachingHydrationDay> getHydrationDay(
    String planId, {
    String? date,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/coaching/plans/$planId/hydration',
        queryParameters: {if (date != null) 'date': date},
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty hydration response');
      }
      return CoachingHydrationDay.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<CoachingHydrationEntry> logHydration(
    String planId, {
    required int amountMl,
    DateTime? loggedAt,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/coaching/plans/$planId/hydration',
        data: {
          'amount_ml': amountMl,
          if (loggedAt != null) 'logged_at': loggedAt.toIso8601String(),
        },
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty hydration log response');
      }
      return CoachingHydrationEntry.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<List<CoachingSleepEntry>> listSleep(
    String planId, {
    String? from,
    String? to,
  }) async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        '/coaching/plans/$planId/sleep',
        queryParameters: {
          if (from != null) 'from': from,
          if (to != null) 'to': to,
        },
      );
      final data = response.data;
      if (data == null) return const [];
      final items = data['data'] as List<dynamic>? ?? const [];
      return items
          .map(
            (e) => CoachingSleepEntry.fromJson(
              Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList();
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  Future<CoachingSleepEntry> logSleep(
    String planId, {
    required double hours,
    required int quality,
    String? loggedOn,
  }) async {
    try {
      final response = await _dio.post<Map<String, dynamic>>(
        '/coaching/plans/$planId/sleep',
        data: {
          'hours': hours,
          'quality': quality,
          if (loggedOn != null) 'logged_on': loggedOn,
        },
      );
      final data = response.data;
      if (data == null) {
        throw StateError('Empty sleep log response');
      }
      return CoachingSleepEntry.fromJson(data);
    } on DioException catch (e) {
      throw _mapDio(e);
    }
  }

  CoachingApiException _mapDio(DioException e) {
    final status = e.response?.statusCode;
    final data = e.response?.data;
    final map = data is Map
        ? data.map((k, v) => MapEntry(k.toString(), v))
        : null;
    final detail = map?['detail'] as String? ?? map?['title'] as String?;
    return CoachingApiException(
      detail ?? 'Coaching unavailable',
      statusCode: status,
    );
  }
}

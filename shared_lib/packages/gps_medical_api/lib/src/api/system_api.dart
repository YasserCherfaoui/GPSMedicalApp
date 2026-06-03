//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:gps_medical_api/src/model/health_check.dart';

class SystemApi {

  final Dio _dio;

  final Serializers _serializers;

  const SystemApi(this._dio, this._serializers);

  /// Santé de l&#39;&#39;API — PostgreSQL et Redis
  /// Vérifie la disponibilité de PostgreSQL (&#x60;db&#x60;), de Redis (&#x60;redis&#x60;) et, si configuré, du stockage objet (&#x60;storage&#x60;). &#x60;storage&#x3D;disabled&#x60; lorsque &#x60;STORAGE_PROVIDER&#x60; est vide (uploads désactivés) ; cela ne dégrade pas le statut global. Une réponse &#x60;200&#x60; indique une plateforme prête (&#x60;status&#x3D;ok&#x60;). Une réponse &#x60;503&#x60; indique une perte ou refus (&#x60;status&#x3D;degraded&#x60;). Une corrélation requête/réponse est toujours possible via **X-Request-ID** renvoyé dans l&#39;&#39;en-tête de réponse. 
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [HealthCheck] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<HealthCheck>> getHealth({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/health';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    HealthCheck? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null ? null : _serializers.deserialize(
        rawResponse,
        specifiedType: const FullType(HealthCheck),
      ) as HealthCheck;

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<HealthCheck>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';

import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/api_util.dart';
import 'package:gps_medical_api/src/model/paginated_doctors.dart';
import 'package:gps_medical_api/src/model/search_suggest_get200_response.dart';

class SearchApi {
  final Dio _dio;

  final Serializers _serializers;

  const SearchApi(this._dio, this._serializers);

  /// Recherche multicritères de médecins
  ///
  ///
  /// Parameters:
  /// * [q] - Mot-clé libre (nom, spécialité, cabinet)
  /// * [specialtyId]
  /// * [wilayaCode]
  /// * [communeId]
  /// * [gender]
  /// * [language] - Langue parlée (codes ISO 639-1)
  /// * [acceptsCnas] - Conventionné CNAS
  /// * [acceptsCasnos] - Conventionné CASNOS
  /// * [maxFeeDzd]
  /// * [telehealth] - Propose la téléconsultation
  /// * [availableWithinDays]
  /// * [sort]
  /// * [page]
  /// * [pageSize]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [PaginatedDoctors] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<PaginatedDoctors>> searchDoctorsGet({
    String? q,
    String? specialtyId,
    String? wilayaCode,
    String? communeId,
    String? gender = 'any',
    BuiltList<String>? language,
    bool? acceptsCnas,
    bool? acceptsCasnos,
    int? maxFeeDzd,
    bool? telehealth,
    int? availableWithinDays,
    String? sort = 'relevance',
    int? page = 1,
    int? pageSize = 20,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/search/doctors';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{'secure': <Map<String, String>>[], ...?extra},
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (q != null)
        r'q': encodeQueryParameter(_serializers, q, const FullType(String)),
      if (specialtyId != null)
        r'specialty_id': encodeQueryParameter(
          _serializers,
          specialtyId,
          const FullType(String),
        ),
      if (wilayaCode != null)
        r'wilaya_code': encodeQueryParameter(
          _serializers,
          wilayaCode,
          const FullType(String),
        ),
      if (communeId != null)
        r'commune_id': encodeQueryParameter(
          _serializers,
          communeId,
          const FullType(String),
        ),
      if (gender != null)
        r'gender': encodeQueryParameter(
          _serializers,
          gender,
          const FullType(String),
        ),
      if (language != null)
        r'language': encodeCollectionQueryParameter<String>(
          _serializers,
          language,
          const FullType(BuiltList, [FullType(String)]),
          format: ListFormat.csv,
        ),
      if (acceptsCnas != null)
        r'accepts_cnas': encodeQueryParameter(
          _serializers,
          acceptsCnas,
          const FullType(bool),
        ),
      if (acceptsCasnos != null)
        r'accepts_casnos': encodeQueryParameter(
          _serializers,
          acceptsCasnos,
          const FullType(bool),
        ),
      if (maxFeeDzd != null)
        r'max_fee_dzd': encodeQueryParameter(
          _serializers,
          maxFeeDzd,
          const FullType(int),
        ),
      if (telehealth != null)
        r'telehealth': encodeQueryParameter(
          _serializers,
          telehealth,
          const FullType(bool),
        ),
      if (availableWithinDays != null)
        r'available_within_days': encodeQueryParameter(
          _serializers,
          availableWithinDays,
          const FullType(int),
        ),
      if (sort != null)
        r'sort': encodeQueryParameter(
          _serializers,
          sort,
          const FullType(String),
        ),
      if (page != null)
        r'page': encodeQueryParameter(_serializers, page, const FullType(int)),
      if (pageSize != null)
        r'page_size': encodeQueryParameter(
          _serializers,
          pageSize,
          const FullType(int),
        ),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    PaginatedDoctors? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
                  rawResponse,
                  specifiedType: const FullType(PaginatedDoctors),
                )
                as PaginatedDoctors;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<PaginatedDoctors>(
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

  /// Suggestions auto-complétion (médecins, spécialités, communes)
  ///
  ///
  /// Parameters:
  /// * [q]
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [SearchSuggestGet200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<SearchSuggestGet200Response>> searchSuggestGet({
    required String q,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/search/suggest';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{...?headers},
      extra: <String, dynamic>{'secure': <Map<String, String>>[], ...?extra},
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      r'q': encodeQueryParameter(_serializers, q, const FullType(String)),
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    SearchSuggestGet200Response? _responseData;

    try {
      final rawResponse = _response.data;
      _responseData = rawResponse == null
          ? null
          : _serializers.deserialize(
                  rawResponse,
                  specifiedType: const FullType(SearchSuggestGet200Response),
                )
                as SearchSuggestGet200Response;
    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<SearchSuggestGet200Response>(
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

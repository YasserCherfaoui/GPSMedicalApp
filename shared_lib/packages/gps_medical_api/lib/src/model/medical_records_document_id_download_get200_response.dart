//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'medical_records_document_id_download_get200_response.g.dart';

/// MedicalRecordsDocumentIdDownloadGet200Response
///
/// Properties:
/// * [url] 
/// * [expiresAt] 
@BuiltValue()
abstract class MedicalRecordsDocumentIdDownloadGet200Response implements Built<MedicalRecordsDocumentIdDownloadGet200Response, MedicalRecordsDocumentIdDownloadGet200ResponseBuilder> {
  @BuiltValueField(wireName: r'url')
  String? get url;

  @BuiltValueField(wireName: r'expires_at')
  DateTime? get expiresAt;

  MedicalRecordsDocumentIdDownloadGet200Response._();

  factory MedicalRecordsDocumentIdDownloadGet200Response([void updates(MedicalRecordsDocumentIdDownloadGet200ResponseBuilder b)]) = _$MedicalRecordsDocumentIdDownloadGet200Response;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(MedicalRecordsDocumentIdDownloadGet200ResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<MedicalRecordsDocumentIdDownloadGet200Response> get serializer => _$MedicalRecordsDocumentIdDownloadGet200ResponseSerializer();
}

class _$MedicalRecordsDocumentIdDownloadGet200ResponseSerializer implements PrimitiveSerializer<MedicalRecordsDocumentIdDownloadGet200Response> {
  @override
  final Iterable<Type> types = const [MedicalRecordsDocumentIdDownloadGet200Response, _$MedicalRecordsDocumentIdDownloadGet200Response];

  @override
  final String wireName = r'MedicalRecordsDocumentIdDownloadGet200Response';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    MedicalRecordsDocumentIdDownloadGet200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.url != null) {
      yield r'url';
      yield serializers.serialize(
        object.url,
        specifiedType: const FullType(String),
      );
    }
    if (object.expiresAt != null) {
      yield r'expires_at';
      yield serializers.serialize(
        object.expiresAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    MedicalRecordsDocumentIdDownloadGet200Response object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required MedicalRecordsDocumentIdDownloadGet200ResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.url = valueDes;
          break;
        case r'expires_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.expiresAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  MedicalRecordsDocumentIdDownloadGet200Response deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = MedicalRecordsDocumentIdDownloadGet200ResponseBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}


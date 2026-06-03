//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/medical_document.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_medical_documents.g.dart';

/// PaginatedMedicalDocuments
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedMedicalDocuments implements Built<PaginatedMedicalDocuments, PaginatedMedicalDocumentsBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<MedicalDocument>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedMedicalDocuments._();

  factory PaginatedMedicalDocuments([void updates(PaginatedMedicalDocumentsBuilder b)]) = _$PaginatedMedicalDocuments;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedMedicalDocumentsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedMedicalDocuments> get serializer => _$PaginatedMedicalDocumentsSerializer();
}

class _$PaginatedMedicalDocumentsSerializer implements PrimitiveSerializer<PaginatedMedicalDocuments> {
  @override
  final Iterable<Type> types = const [PaginatedMedicalDocuments, _$PaginatedMedicalDocuments];

  @override
  final String wireName = r'PaginatedMedicalDocuments';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedMedicalDocuments object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(MedicalDocument)]),
      );
    }
    if (object.meta != null) {
      yield r'meta';
      yield serializers.serialize(
        object.meta,
        specifiedType: const FullType(PaginationMeta),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedMedicalDocuments object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedMedicalDocumentsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(MedicalDocument)]),
          ) as BuiltList<MedicalDocument>;
          result.data.replace(valueDes);
          break;
        case r'meta':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaginationMeta),
          ) as PaginationMeta;
          result.meta.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaginatedMedicalDocuments deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedMedicalDocumentsBuilder();
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


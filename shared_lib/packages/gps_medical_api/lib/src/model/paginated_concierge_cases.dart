//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:gps_medical_api/src/model/concierge_case.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_concierge_cases.g.dart';

/// PaginatedConciergeCases
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedConciergeCases implements Built<PaginatedConciergeCases, PaginatedConciergeCasesBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<ConciergeCase> get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta get meta;

  PaginatedConciergeCases._();

  factory PaginatedConciergeCases([void updates(PaginatedConciergeCasesBuilder b)]) = _$PaginatedConciergeCases;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedConciergeCasesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedConciergeCases> get serializer => _$PaginatedConciergeCasesSerializer();
}

class _$PaginatedConciergeCasesSerializer implements PrimitiveSerializer<PaginatedConciergeCases> {
  @override
  final Iterable<Type> types = const [PaginatedConciergeCases, _$PaginatedConciergeCases];

  @override
  final String wireName = r'PaginatedConciergeCases';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedConciergeCases object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BuiltList, [FullType(ConciergeCase)]),
    );
    yield r'meta';
    yield serializers.serialize(
      object.meta,
      specifiedType: const FullType(PaginationMeta),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    PaginatedConciergeCases object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedConciergeCasesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ConciergeCase)]),
          ) as BuiltList<ConciergeCase>;
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
  PaginatedConciergeCases deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedConciergeCasesBuilder();
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


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:gps_medical_api/src/model/seeded_specialist_admin.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_seeded_specialists.g.dart';

/// PaginatedSeededSpecialists
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedSeededSpecialists implements Built<PaginatedSeededSpecialists, PaginatedSeededSpecialistsBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<SeededSpecialistAdmin> get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta get meta;

  PaginatedSeededSpecialists._();

  factory PaginatedSeededSpecialists([void updates(PaginatedSeededSpecialistsBuilder b)]) = _$PaginatedSeededSpecialists;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedSeededSpecialistsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedSeededSpecialists> get serializer => _$PaginatedSeededSpecialistsSerializer();
}

class _$PaginatedSeededSpecialistsSerializer implements PrimitiveSerializer<PaginatedSeededSpecialists> {
  @override
  final Iterable<Type> types = const [PaginatedSeededSpecialists, _$PaginatedSeededSpecialists];

  @override
  final String wireName = r'PaginatedSeededSpecialists';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedSeededSpecialists object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'data';
    yield serializers.serialize(
      object.data,
      specifiedType: const FullType(BuiltList, [FullType(SeededSpecialistAdmin)]),
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
    PaginatedSeededSpecialists object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedSeededSpecialistsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SeededSpecialistAdmin)]),
          ) as BuiltList<SeededSpecialistAdmin>;
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
  PaginatedSeededSpecialists deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedSeededSpecialistsBuilder();
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


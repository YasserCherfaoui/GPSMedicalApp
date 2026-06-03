//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:gps_medical_api/src/model/doctor_with_distance.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_doctors_with_distance.g.dart';

/// PaginatedDoctorsWithDistance
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedDoctorsWithDistance implements Built<PaginatedDoctorsWithDistance, PaginatedDoctorsWithDistanceBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<DoctorWithDistance>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedDoctorsWithDistance._();

  factory PaginatedDoctorsWithDistance([void updates(PaginatedDoctorsWithDistanceBuilder b)]) = _$PaginatedDoctorsWithDistance;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedDoctorsWithDistanceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedDoctorsWithDistance> get serializer => _$PaginatedDoctorsWithDistanceSerializer();
}

class _$PaginatedDoctorsWithDistanceSerializer implements PrimitiveSerializer<PaginatedDoctorsWithDistance> {
  @override
  final Iterable<Type> types = const [PaginatedDoctorsWithDistance, _$PaginatedDoctorsWithDistance];

  @override
  final String wireName = r'PaginatedDoctorsWithDistance';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedDoctorsWithDistance object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(DoctorWithDistance)]),
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
    PaginatedDoctorsWithDistance object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedDoctorsWithDistanceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DoctorWithDistance)]),
          ) as BuiltList<DoctorWithDistance>;
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
  PaginatedDoctorsWithDistance deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedDoctorsWithDistanceBuilder();
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


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/clinic_with_distance.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_clinics_with_distance.g.dart';

/// PaginatedClinicsWithDistance
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedClinicsWithDistance implements Built<PaginatedClinicsWithDistance, PaginatedClinicsWithDistanceBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<ClinicWithDistance>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedClinicsWithDistance._();

  factory PaginatedClinicsWithDistance([void updates(PaginatedClinicsWithDistanceBuilder b)]) = _$PaginatedClinicsWithDistance;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedClinicsWithDistanceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedClinicsWithDistance> get serializer => _$PaginatedClinicsWithDistanceSerializer();
}

class _$PaginatedClinicsWithDistanceSerializer implements PrimitiveSerializer<PaginatedClinicsWithDistance> {
  @override
  final Iterable<Type> types = const [PaginatedClinicsWithDistance, _$PaginatedClinicsWithDistance];

  @override
  final String wireName = r'PaginatedClinicsWithDistance';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedClinicsWithDistance object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(ClinicWithDistance)]),
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
    PaginatedClinicsWithDistance object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedClinicsWithDistanceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicWithDistance)]),
          ) as BuiltList<ClinicWithDistance>;
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
  PaginatedClinicsWithDistance deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedClinicsWithDistanceBuilder();
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


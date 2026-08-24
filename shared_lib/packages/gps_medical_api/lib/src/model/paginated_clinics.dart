//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/clinic.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_clinics.g.dart';

/// PaginatedClinics
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedClinics implements Built<PaginatedClinics, PaginatedClinicsBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<Clinic>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedClinics._();

  factory PaginatedClinics([void updates(PaginatedClinicsBuilder b)]) = _$PaginatedClinics;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedClinicsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedClinics> get serializer => _$PaginatedClinicsSerializer();
}

class _$PaginatedClinicsSerializer implements PrimitiveSerializer<PaginatedClinics> {
  @override
  final Iterable<Type> types = const [PaginatedClinics, _$PaginatedClinics];

  @override
  final String wireName = r'PaginatedClinics';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedClinics object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(Clinic)]),
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
    PaginatedClinics object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedClinicsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Clinic)]),
          ) as BuiltList<Clinic>;
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
  PaginatedClinics deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedClinicsBuilder();
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


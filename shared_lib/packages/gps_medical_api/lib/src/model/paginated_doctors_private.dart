//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/doctor_private.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_doctors_private.g.dart';

/// PaginatedDoctorsPrivate
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedDoctorsPrivate implements Built<PaginatedDoctorsPrivate, PaginatedDoctorsPrivateBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<DoctorPrivate>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedDoctorsPrivate._();

  factory PaginatedDoctorsPrivate([void updates(PaginatedDoctorsPrivateBuilder b)]) = _$PaginatedDoctorsPrivate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedDoctorsPrivateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedDoctorsPrivate> get serializer => _$PaginatedDoctorsPrivateSerializer();
}

class _$PaginatedDoctorsPrivateSerializer implements PrimitiveSerializer<PaginatedDoctorsPrivate> {
  @override
  final Iterable<Type> types = const [PaginatedDoctorsPrivate, _$PaginatedDoctorsPrivate];

  @override
  final String wireName = r'PaginatedDoctorsPrivate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedDoctorsPrivate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(DoctorPrivate)]),
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
    PaginatedDoctorsPrivate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedDoctorsPrivateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DoctorPrivate)]),
          ) as BuiltList<DoctorPrivate>;
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
  PaginatedDoctorsPrivate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedDoctorsPrivateBuilder();
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


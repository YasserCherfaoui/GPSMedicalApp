//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:gps_medical_api/src/model/doctor.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_doctors.g.dart';

/// PaginatedDoctors
///
/// Properties:
/// * [data]
/// * [meta]
@BuiltValue()
abstract class PaginatedDoctors
    implements Built<PaginatedDoctors, PaginatedDoctorsBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<Doctor>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedDoctors._();

  factory PaginatedDoctors([void updates(PaginatedDoctorsBuilder b)]) =
      _$PaginatedDoctors;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedDoctorsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedDoctors> get serializer =>
      _$PaginatedDoctorsSerializer();
}

class _$PaginatedDoctorsSerializer
    implements PrimitiveSerializer<PaginatedDoctors> {
  @override
  final Iterable<Type> types = const [PaginatedDoctors, _$PaginatedDoctors];

  @override
  final String wireName = r'PaginatedDoctors';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedDoctors object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(Doctor)]),
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
    PaginatedDoctors object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedDoctorsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(Doctor),
                    ]),
                  )
                  as BuiltList<Doctor>;
          result.data.replace(valueDes);
          break;
        case r'meta':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(PaginationMeta),
                  )
                  as PaginationMeta;
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
  PaginatedDoctors deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedDoctorsBuilder();
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

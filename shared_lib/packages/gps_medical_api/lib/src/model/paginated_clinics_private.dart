//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/pagination_meta.dart';
import 'package:gps_medical_api/src/model/clinic_private.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paginated_clinics_private.g.dart';

/// PaginatedClinicsPrivate
///
/// Properties:
/// * [data] 
/// * [meta] 
@BuiltValue()
abstract class PaginatedClinicsPrivate implements Built<PaginatedClinicsPrivate, PaginatedClinicsPrivateBuilder> {
  @BuiltValueField(wireName: r'data')
  BuiltList<ClinicPrivate>? get data;

  @BuiltValueField(wireName: r'meta')
  PaginationMeta? get meta;

  PaginatedClinicsPrivate._();

  factory PaginatedClinicsPrivate([void updates(PaginatedClinicsPrivateBuilder b)]) = _$PaginatedClinicsPrivate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaginatedClinicsPrivateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaginatedClinicsPrivate> get serializer => _$PaginatedClinicsPrivateSerializer();
}

class _$PaginatedClinicsPrivateSerializer implements PrimitiveSerializer<PaginatedClinicsPrivate> {
  @override
  final Iterable<Type> types = const [PaginatedClinicsPrivate, _$PaginatedClinicsPrivate];

  @override
  final String wireName = r'PaginatedClinicsPrivate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaginatedClinicsPrivate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType: const FullType(BuiltList, [FullType(ClinicPrivate)]),
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
    PaginatedClinicsPrivate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaginatedClinicsPrivateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicPrivate)]),
          ) as BuiltList<ClinicPrivate>;
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
  PaginatedClinicsPrivate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaginatedClinicsPrivateBuilder();
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


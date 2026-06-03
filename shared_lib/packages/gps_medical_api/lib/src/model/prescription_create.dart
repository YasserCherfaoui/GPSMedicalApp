//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/prescription_item.dart';
import 'package:gps_medical_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prescription_create.g.dart';

/// PrescriptionCreate
///
/// Properties:
/// * [appointmentId] 
/// * [diagnosis] 
/// * [items] 
/// * [validUntil] 
@BuiltValue(instantiable: false)
abstract class PrescriptionCreate  {
  @BuiltValueField(wireName: r'appointment_id')
  String get appointmentId;

  @BuiltValueField(wireName: r'diagnosis')
  String? get diagnosis;

  @BuiltValueField(wireName: r'items')
  BuiltList<PrescriptionItem> get items;

  @BuiltValueField(wireName: r'valid_until')
  Date? get validUntil;

  @BuiltValueSerializer(custom: true)
  static Serializer<PrescriptionCreate> get serializer => _$PrescriptionCreateSerializer();
}

class _$PrescriptionCreateSerializer implements PrimitiveSerializer<PrescriptionCreate> {
  @override
  final Iterable<Type> types = const [PrescriptionCreate];

  @override
  final String wireName = r'PrescriptionCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PrescriptionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'appointment_id';
    yield serializers.serialize(
      object.appointmentId,
      specifiedType: const FullType(String),
    );
    if (object.diagnosis != null) {
      yield r'diagnosis';
      yield serializers.serialize(
        object.diagnosis,
        specifiedType: const FullType(String),
      );
    }
    yield r'items';
    yield serializers.serialize(
      object.items,
      specifiedType: const FullType(BuiltList, [FullType(PrescriptionItem)]),
    );
    if (object.validUntil != null) {
      yield r'valid_until';
      yield serializers.serialize(
        object.validUntil,
        specifiedType: const FullType(Date),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PrescriptionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  PrescriptionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($PrescriptionCreate)) as $PrescriptionCreate;
  }
}

/// a concrete implementation of [PrescriptionCreate], since [PrescriptionCreate] is not instantiable
@BuiltValue(instantiable: true)
abstract class $PrescriptionCreate implements PrescriptionCreate, Built<$PrescriptionCreate, $PrescriptionCreateBuilder> {
  $PrescriptionCreate._();

  factory $PrescriptionCreate([void Function($PrescriptionCreateBuilder)? updates]) = _$$PrescriptionCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($PrescriptionCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$PrescriptionCreate> get serializer => _$$PrescriptionCreateSerializer();
}

class _$$PrescriptionCreateSerializer implements PrimitiveSerializer<$PrescriptionCreate> {
  @override
  final Iterable<Type> types = const [$PrescriptionCreate, _$$PrescriptionCreate];

  @override
  final String wireName = r'$PrescriptionCreate';

  @override
  Object serialize(
    Serializers serializers,
    $PrescriptionCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(PrescriptionCreate))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PrescriptionCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'appointment_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.appointmentId = valueDes;
          break;
        case r'diagnosis':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.diagnosis = valueDes;
          break;
        case r'items':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PrescriptionItem)]),
          ) as BuiltList<PrescriptionItem>;
          result.items.replace(valueDes);
          break;
        case r'valid_until':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.validUntil = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $PrescriptionCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $PrescriptionCreateBuilder();
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


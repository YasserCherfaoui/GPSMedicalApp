//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'availability_slot.g.dart';

/// AvailabilitySlot
///
/// Properties:
/// * [startAt] 
/// * [endAt] 
/// * [mode] 
/// * [slotLockToken] - À transmettre lors de la création de RDV (TTL 5 min)
@BuiltValue()
abstract class AvailabilitySlot implements Built<AvailabilitySlot, AvailabilitySlotBuilder> {
  @BuiltValueField(wireName: r'start_at')
  DateTime? get startAt;

  @BuiltValueField(wireName: r'end_at')
  DateTime? get endAt;

  @BuiltValueField(wireName: r'mode')
  AvailabilitySlotModeEnum? get mode;
  // enum modeEnum {  in_person,  telehealth,  };

  /// À transmettre lors de la création de RDV (TTL 5 min)
  @BuiltValueField(wireName: r'slot_lock_token')
  String? get slotLockToken;

  AvailabilitySlot._();

  factory AvailabilitySlot([void updates(AvailabilitySlotBuilder b)]) = _$AvailabilitySlot;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AvailabilitySlotBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AvailabilitySlot> get serializer => _$AvailabilitySlotSerializer();
}

class _$AvailabilitySlotSerializer implements PrimitiveSerializer<AvailabilitySlot> {
  @override
  final Iterable<Type> types = const [AvailabilitySlot, _$AvailabilitySlot];

  @override
  final String wireName = r'AvailabilitySlot';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AvailabilitySlot object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.startAt != null) {
      yield r'start_at';
      yield serializers.serialize(
        object.startAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.endAt != null) {
      yield r'end_at';
      yield serializers.serialize(
        object.endAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.mode != null) {
      yield r'mode';
      yield serializers.serialize(
        object.mode,
        specifiedType: const FullType(AvailabilitySlotModeEnum),
      );
    }
    if (object.slotLockToken != null) {
      yield r'slot_lock_token';
      yield serializers.serialize(
        object.slotLockToken,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AvailabilitySlot object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AvailabilitySlotBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'start_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startAt = valueDes;
          break;
        case r'end_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endAt = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AvailabilitySlotModeEnum),
          ) as AvailabilitySlotModeEnum;
          result.mode = valueDes;
          break;
        case r'slot_lock_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.slotLockToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AvailabilitySlot deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AvailabilitySlotBuilder();
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

class AvailabilitySlotModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'in_person')
  static const AvailabilitySlotModeEnum inPerson = _$availabilitySlotModeEnum_inPerson;
  @BuiltValueEnumConst(wireName: r'telehealth')
  static const AvailabilitySlotModeEnum telehealth = _$availabilitySlotModeEnum_telehealth;

  static Serializer<AvailabilitySlotModeEnum> get serializer => _$availabilitySlotModeEnumSerializer;

  const AvailabilitySlotModeEnum._(String name): super(name);

  static BuiltSet<AvailabilitySlotModeEnum> get values => _$availabilitySlotModeEnumValues;
  static AvailabilitySlotModeEnum valueOf(String name) => _$availabilitySlotModeEnumValueOf(name);
}


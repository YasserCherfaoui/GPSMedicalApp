//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_availability_slot.g.dart';

/// ClinicAvailabilitySlot
///
/// Properties:
/// * [startAt] 
/// * [endAt] 
/// * [mode] 
/// * [remainingCapacity] 
/// * [slotLockToken] 
@BuiltValue()
abstract class ClinicAvailabilitySlot implements Built<ClinicAvailabilitySlot, ClinicAvailabilitySlotBuilder> {
  @BuiltValueField(wireName: r'start_at')
  DateTime? get startAt;

  @BuiltValueField(wireName: r'end_at')
  DateTime? get endAt;

  @BuiltValueField(wireName: r'mode')
  ClinicAvailabilitySlotModeEnum? get mode;
  // enum modeEnum {  in_person,  telehealth,  };

  @BuiltValueField(wireName: r'remaining_capacity')
  int? get remainingCapacity;

  @BuiltValueField(wireName: r'slot_lock_token')
  String? get slotLockToken;

  ClinicAvailabilitySlot._();

  factory ClinicAvailabilitySlot([void updates(ClinicAvailabilitySlotBuilder b)]) = _$ClinicAvailabilitySlot;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicAvailabilitySlotBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicAvailabilitySlot> get serializer => _$ClinicAvailabilitySlotSerializer();
}

class _$ClinicAvailabilitySlotSerializer implements PrimitiveSerializer<ClinicAvailabilitySlot> {
  @override
  final Iterable<Type> types = const [ClinicAvailabilitySlot, _$ClinicAvailabilitySlot];

  @override
  final String wireName = r'ClinicAvailabilitySlot';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicAvailabilitySlot object, {
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
        specifiedType: const FullType(ClinicAvailabilitySlotModeEnum),
      );
    }
    if (object.remainingCapacity != null) {
      yield r'remaining_capacity';
      yield serializers.serialize(
        object.remainingCapacity,
        specifiedType: const FullType(int),
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
    ClinicAvailabilitySlot object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicAvailabilitySlotBuilder result,
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
            specifiedType: const FullType(ClinicAvailabilitySlotModeEnum),
          ) as ClinicAvailabilitySlotModeEnum;
          result.mode = valueDes;
          break;
        case r'remaining_capacity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.remainingCapacity = valueDes;
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
  ClinicAvailabilitySlot deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicAvailabilitySlotBuilder();
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

class ClinicAvailabilitySlotModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'in_person')
  static const ClinicAvailabilitySlotModeEnum inPerson = _$clinicAvailabilitySlotModeEnum_inPerson;
  @BuiltValueEnumConst(wireName: r'telehealth')
  static const ClinicAvailabilitySlotModeEnum telehealth = _$clinicAvailabilitySlotModeEnum_telehealth;

  static Serializer<ClinicAvailabilitySlotModeEnum> get serializer => _$clinicAvailabilitySlotModeEnumSerializer;

  const ClinicAvailabilitySlotModeEnum._(String name): super(name);

  static BuiltSet<ClinicAvailabilitySlotModeEnum> get values => _$clinicAvailabilitySlotModeEnumValues;
  static ClinicAvailabilitySlotModeEnum valueOf(String name) => _$clinicAvailabilitySlotModeEnumValueOf(name);
}


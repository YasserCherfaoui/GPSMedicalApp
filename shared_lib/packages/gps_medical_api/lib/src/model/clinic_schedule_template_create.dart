//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_schedule_template_create.g.dart';

/// ClinicScheduleTemplateCreate
///
/// Properties:
/// * [serviceId] 
/// * [weekday] 
/// * [startTime] 
/// * [endTime] 
/// * [slotDurationMinutes] 
/// * [mode] 
/// * [capacity] 
@BuiltValue()
abstract class ClinicScheduleTemplateCreate implements Built<ClinicScheduleTemplateCreate, ClinicScheduleTemplateCreateBuilder> {
  @BuiltValueField(wireName: r'service_id')
  String? get serviceId;

  @BuiltValueField(wireName: r'weekday')
  int get weekday;

  @BuiltValueField(wireName: r'start_time')
  String get startTime;

  @BuiltValueField(wireName: r'end_time')
  String get endTime;

  @BuiltValueField(wireName: r'slot_duration_minutes')
  ClinicScheduleTemplateCreateSlotDurationMinutesEnum get slotDurationMinutes;
  // enum slotDurationMinutesEnum {  10,  15,  20,  30,  45,  60,  };

  @BuiltValueField(wireName: r'mode')
  ClinicScheduleTemplateCreateModeEnum get mode;
  // enum modeEnum {  in_person,  telehealth,  both,  };

  @BuiltValueField(wireName: r'capacity')
  int? get capacity;

  ClinicScheduleTemplateCreate._();

  factory ClinicScheduleTemplateCreate([void updates(ClinicScheduleTemplateCreateBuilder b)]) = _$ClinicScheduleTemplateCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicScheduleTemplateCreateBuilder b) => b
      ..capacity = 1;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicScheduleTemplateCreate> get serializer => _$ClinicScheduleTemplateCreateSerializer();
}

class _$ClinicScheduleTemplateCreateSerializer implements PrimitiveSerializer<ClinicScheduleTemplateCreate> {
  @override
  final Iterable<Type> types = const [ClinicScheduleTemplateCreate, _$ClinicScheduleTemplateCreate];

  @override
  final String wireName = r'ClinicScheduleTemplateCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicScheduleTemplateCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.serviceId != null) {
      yield r'service_id';
      yield serializers.serialize(
        object.serviceId,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'weekday';
    yield serializers.serialize(
      object.weekday,
      specifiedType: const FullType(int),
    );
    yield r'start_time';
    yield serializers.serialize(
      object.startTime,
      specifiedType: const FullType(String),
    );
    yield r'end_time';
    yield serializers.serialize(
      object.endTime,
      specifiedType: const FullType(String),
    );
    yield r'slot_duration_minutes';
    yield serializers.serialize(
      object.slotDurationMinutes,
      specifiedType: const FullType(ClinicScheduleTemplateCreateSlotDurationMinutesEnum),
    );
    yield r'mode';
    yield serializers.serialize(
      object.mode,
      specifiedType: const FullType(ClinicScheduleTemplateCreateModeEnum),
    );
    if (object.capacity != null) {
      yield r'capacity';
      yield serializers.serialize(
        object.capacity,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicScheduleTemplateCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicScheduleTemplateCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'service_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.serviceId = valueDes;
          break;
        case r'weekday':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.weekday = valueDes;
          break;
        case r'start_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.startTime = valueDes;
          break;
        case r'end_time':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.endTime = valueDes;
          break;
        case r'slot_duration_minutes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicScheduleTemplateCreateSlotDurationMinutesEnum),
          ) as ClinicScheduleTemplateCreateSlotDurationMinutesEnum;
          result.slotDurationMinutes = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicScheduleTemplateCreateModeEnum),
          ) as ClinicScheduleTemplateCreateModeEnum;
          result.mode = valueDes;
          break;
        case r'capacity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.capacity = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicScheduleTemplateCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicScheduleTemplateCreateBuilder();
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

class ClinicScheduleTemplateCreateSlotDurationMinutesEnum extends EnumClass {

  @BuiltValueEnumConst(wireNumber: 10)
  static const ClinicScheduleTemplateCreateSlotDurationMinutesEnum number10 = _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number10;
  @BuiltValueEnumConst(wireNumber: 15)
  static const ClinicScheduleTemplateCreateSlotDurationMinutesEnum number15 = _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number15;
  @BuiltValueEnumConst(wireNumber: 20)
  static const ClinicScheduleTemplateCreateSlotDurationMinutesEnum number20 = _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number20;
  @BuiltValueEnumConst(wireNumber: 30)
  static const ClinicScheduleTemplateCreateSlotDurationMinutesEnum number30 = _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number30;
  @BuiltValueEnumConst(wireNumber: 45)
  static const ClinicScheduleTemplateCreateSlotDurationMinutesEnum number45 = _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number45;
  @BuiltValueEnumConst(wireNumber: 60)
  static const ClinicScheduleTemplateCreateSlotDurationMinutesEnum number60 = _$clinicScheduleTemplateCreateSlotDurationMinutesEnum_number60;

  static Serializer<ClinicScheduleTemplateCreateSlotDurationMinutesEnum> get serializer => _$clinicScheduleTemplateCreateSlotDurationMinutesEnumSerializer;

  const ClinicScheduleTemplateCreateSlotDurationMinutesEnum._(String name): super(name);

  static BuiltSet<ClinicScheduleTemplateCreateSlotDurationMinutesEnum> get values => _$clinicScheduleTemplateCreateSlotDurationMinutesEnumValues;
  static ClinicScheduleTemplateCreateSlotDurationMinutesEnum valueOf(String name) => _$clinicScheduleTemplateCreateSlotDurationMinutesEnumValueOf(name);
}

class ClinicScheduleTemplateCreateModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'in_person')
  static const ClinicScheduleTemplateCreateModeEnum inPerson = _$clinicScheduleTemplateCreateModeEnum_inPerson;
  @BuiltValueEnumConst(wireName: r'telehealth')
  static const ClinicScheduleTemplateCreateModeEnum telehealth = _$clinicScheduleTemplateCreateModeEnum_telehealth;
  @BuiltValueEnumConst(wireName: r'both')
  static const ClinicScheduleTemplateCreateModeEnum both = _$clinicScheduleTemplateCreateModeEnum_both;

  static Serializer<ClinicScheduleTemplateCreateModeEnum> get serializer => _$clinicScheduleTemplateCreateModeEnumSerializer;

  const ClinicScheduleTemplateCreateModeEnum._(String name): super(name);

  static BuiltSet<ClinicScheduleTemplateCreateModeEnum> get values => _$clinicScheduleTemplateCreateModeEnumValues;
  static ClinicScheduleTemplateCreateModeEnum valueOf(String name) => _$clinicScheduleTemplateCreateModeEnumValueOf(name);
}


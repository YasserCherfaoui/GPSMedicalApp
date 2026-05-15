//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'schedule_template_create.g.dart';

/// ScheduleTemplateCreate
///
/// Properties:
/// * [weekday]
/// * [startTime]
/// * [endTime]
/// * [slotDurationMinutes]
/// * [mode]
@BuiltValue()
abstract class ScheduleTemplateCreate
    implements Built<ScheduleTemplateCreate, ScheduleTemplateCreateBuilder> {
  @BuiltValueField(wireName: r'weekday')
  int get weekday;

  @BuiltValueField(wireName: r'start_time')
  String get startTime;

  @BuiltValueField(wireName: r'end_time')
  String get endTime;

  @BuiltValueField(wireName: r'slot_duration_minutes')
  ScheduleTemplateCreateSlotDurationMinutesEnum get slotDurationMinutes;
  // enum slotDurationMinutesEnum {  10,  15,  20,  30,  45,  60,  };

  @BuiltValueField(wireName: r'mode')
  ScheduleTemplateCreateModeEnum get mode;
  // enum modeEnum {  in_person,  telehealth,  both,  };

  ScheduleTemplateCreate._();

  factory ScheduleTemplateCreate([
    void updates(ScheduleTemplateCreateBuilder b),
  ]) = _$ScheduleTemplateCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScheduleTemplateCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScheduleTemplateCreate> get serializer =>
      _$ScheduleTemplateCreateSerializer();
}

class _$ScheduleTemplateCreateSerializer
    implements PrimitiveSerializer<ScheduleTemplateCreate> {
  @override
  final Iterable<Type> types = const [
    ScheduleTemplateCreate,
    _$ScheduleTemplateCreate,
  ];

  @override
  final String wireName = r'ScheduleTemplateCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScheduleTemplateCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
      specifiedType: const FullType(
        ScheduleTemplateCreateSlotDurationMinutesEnum,
      ),
    );
    yield r'mode';
    yield serializers.serialize(
      object.mode,
      specifiedType: const FullType(ScheduleTemplateCreateModeEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ScheduleTemplateCreate object, {
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
    required ScheduleTemplateCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'weekday':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.weekday = valueDes;
          break;
        case r'start_time':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.startTime = valueDes;
          break;
        case r'end_time':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.endTime = valueDes;
          break;
        case r'slot_duration_minutes':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      ScheduleTemplateCreateSlotDurationMinutesEnum,
                    ),
                  )
                  as ScheduleTemplateCreateSlotDurationMinutesEnum;
          result.slotDurationMinutes = valueDes;
          break;
        case r'mode':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      ScheduleTemplateCreateModeEnum,
                    ),
                  )
                  as ScheduleTemplateCreateModeEnum;
          result.mode = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScheduleTemplateCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScheduleTemplateCreateBuilder();
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

class ScheduleTemplateCreateSlotDurationMinutesEnum extends EnumClass {
  @BuiltValueEnumConst(wireNumber: 10)
  static const ScheduleTemplateCreateSlotDurationMinutesEnum number10 =
      _$scheduleTemplateCreateSlotDurationMinutesEnum_number10;
  @BuiltValueEnumConst(wireNumber: 15)
  static const ScheduleTemplateCreateSlotDurationMinutesEnum number15 =
      _$scheduleTemplateCreateSlotDurationMinutesEnum_number15;
  @BuiltValueEnumConst(wireNumber: 20)
  static const ScheduleTemplateCreateSlotDurationMinutesEnum number20 =
      _$scheduleTemplateCreateSlotDurationMinutesEnum_number20;
  @BuiltValueEnumConst(wireNumber: 30)
  static const ScheduleTemplateCreateSlotDurationMinutesEnum number30 =
      _$scheduleTemplateCreateSlotDurationMinutesEnum_number30;
  @BuiltValueEnumConst(wireNumber: 45)
  static const ScheduleTemplateCreateSlotDurationMinutesEnum number45 =
      _$scheduleTemplateCreateSlotDurationMinutesEnum_number45;
  @BuiltValueEnumConst(wireNumber: 60)
  static const ScheduleTemplateCreateSlotDurationMinutesEnum number60 =
      _$scheduleTemplateCreateSlotDurationMinutesEnum_number60;

  static Serializer<ScheduleTemplateCreateSlotDurationMinutesEnum>
  get serializer => _$scheduleTemplateCreateSlotDurationMinutesEnumSerializer;

  const ScheduleTemplateCreateSlotDurationMinutesEnum._(String name)
    : super(name);

  static BuiltSet<ScheduleTemplateCreateSlotDurationMinutesEnum> get values =>
      _$scheduleTemplateCreateSlotDurationMinutesEnumValues;
  static ScheduleTemplateCreateSlotDurationMinutesEnum valueOf(String name) =>
      _$scheduleTemplateCreateSlotDurationMinutesEnumValueOf(name);
}

class ScheduleTemplateCreateModeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'in_person')
  static const ScheduleTemplateCreateModeEnum inPerson =
      _$scheduleTemplateCreateModeEnum_inPerson;
  @BuiltValueEnumConst(wireName: r'telehealth')
  static const ScheduleTemplateCreateModeEnum telehealth =
      _$scheduleTemplateCreateModeEnum_telehealth;
  @BuiltValueEnumConst(wireName: r'both')
  static const ScheduleTemplateCreateModeEnum both =
      _$scheduleTemplateCreateModeEnum_both;

  static Serializer<ScheduleTemplateCreateModeEnum> get serializer =>
      _$scheduleTemplateCreateModeEnumSerializer;

  const ScheduleTemplateCreateModeEnum._(String name) : super(name);

  static BuiltSet<ScheduleTemplateCreateModeEnum> get values =>
      _$scheduleTemplateCreateModeEnumValues;
  static ScheduleTemplateCreateModeEnum valueOf(String name) =>
      _$scheduleTemplateCreateModeEnumValueOf(name);
}

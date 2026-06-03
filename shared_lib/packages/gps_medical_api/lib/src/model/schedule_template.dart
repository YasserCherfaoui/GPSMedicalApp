//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'schedule_template.g.dart';

/// ScheduleTemplate
///
/// Properties:
/// * [id] 
/// * [weekday] - 0 = dimanche
/// * [startTime] 
/// * [endTime] 
/// * [slotDurationMinutes] 
/// * [mode] 
/// * [active] 
@BuiltValue()
abstract class ScheduleTemplate implements Built<ScheduleTemplate, ScheduleTemplateBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  /// 0 = dimanche
  @BuiltValueField(wireName: r'weekday')
  int? get weekday;

  @BuiltValueField(wireName: r'start_time')
  String? get startTime;

  @BuiltValueField(wireName: r'end_time')
  String? get endTime;

  @BuiltValueField(wireName: r'slot_duration_minutes')
  ScheduleTemplateSlotDurationMinutesEnum? get slotDurationMinutes;
  // enum slotDurationMinutesEnum {  10,  15,  20,  30,  45,  60,  };

  @BuiltValueField(wireName: r'mode')
  ScheduleTemplateModeEnum? get mode;
  // enum modeEnum {  in_person,  telehealth,  both,  };

  @BuiltValueField(wireName: r'active')
  bool? get active;

  ScheduleTemplate._();

  factory ScheduleTemplate([void updates(ScheduleTemplateBuilder b)]) = _$ScheduleTemplate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ScheduleTemplateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ScheduleTemplate> get serializer => _$ScheduleTemplateSerializer();
}

class _$ScheduleTemplateSerializer implements PrimitiveSerializer<ScheduleTemplate> {
  @override
  final Iterable<Type> types = const [ScheduleTemplate, _$ScheduleTemplate];

  @override
  final String wireName = r'ScheduleTemplate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ScheduleTemplate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.weekday != null) {
      yield r'weekday';
      yield serializers.serialize(
        object.weekday,
        specifiedType: const FullType(int),
      );
    }
    if (object.startTime != null) {
      yield r'start_time';
      yield serializers.serialize(
        object.startTime,
        specifiedType: const FullType(String),
      );
    }
    if (object.endTime != null) {
      yield r'end_time';
      yield serializers.serialize(
        object.endTime,
        specifiedType: const FullType(String),
      );
    }
    if (object.slotDurationMinutes != null) {
      yield r'slot_duration_minutes';
      yield serializers.serialize(
        object.slotDurationMinutes,
        specifiedType: const FullType(ScheduleTemplateSlotDurationMinutesEnum),
      );
    }
    if (object.mode != null) {
      yield r'mode';
      yield serializers.serialize(
        object.mode,
        specifiedType: const FullType(ScheduleTemplateModeEnum),
      );
    }
    if (object.active != null) {
      yield r'active';
      yield serializers.serialize(
        object.active,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ScheduleTemplate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ScheduleTemplateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
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
            specifiedType: const FullType(ScheduleTemplateSlotDurationMinutesEnum),
          ) as ScheduleTemplateSlotDurationMinutesEnum;
          result.slotDurationMinutes = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ScheduleTemplateModeEnum),
          ) as ScheduleTemplateModeEnum;
          result.mode = valueDes;
          break;
        case r'active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.active = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ScheduleTemplate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ScheduleTemplateBuilder();
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

class ScheduleTemplateSlotDurationMinutesEnum extends EnumClass {

  @BuiltValueEnumConst(wireNumber: 10)
  static const ScheduleTemplateSlotDurationMinutesEnum number10 = _$scheduleTemplateSlotDurationMinutesEnum_number10;
  @BuiltValueEnumConst(wireNumber: 15)
  static const ScheduleTemplateSlotDurationMinutesEnum number15 = _$scheduleTemplateSlotDurationMinutesEnum_number15;
  @BuiltValueEnumConst(wireNumber: 20)
  static const ScheduleTemplateSlotDurationMinutesEnum number20 = _$scheduleTemplateSlotDurationMinutesEnum_number20;
  @BuiltValueEnumConst(wireNumber: 30)
  static const ScheduleTemplateSlotDurationMinutesEnum number30 = _$scheduleTemplateSlotDurationMinutesEnum_number30;
  @BuiltValueEnumConst(wireNumber: 45)
  static const ScheduleTemplateSlotDurationMinutesEnum number45 = _$scheduleTemplateSlotDurationMinutesEnum_number45;
  @BuiltValueEnumConst(wireNumber: 60)
  static const ScheduleTemplateSlotDurationMinutesEnum number60 = _$scheduleTemplateSlotDurationMinutesEnum_number60;

  static Serializer<ScheduleTemplateSlotDurationMinutesEnum> get serializer => _$scheduleTemplateSlotDurationMinutesEnumSerializer;

  const ScheduleTemplateSlotDurationMinutesEnum._(String name): super(name);

  static BuiltSet<ScheduleTemplateSlotDurationMinutesEnum> get values => _$scheduleTemplateSlotDurationMinutesEnumValues;
  static ScheduleTemplateSlotDurationMinutesEnum valueOf(String name) => _$scheduleTemplateSlotDurationMinutesEnumValueOf(name);
}

class ScheduleTemplateModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'in_person')
  static const ScheduleTemplateModeEnum inPerson = _$scheduleTemplateModeEnum_inPerson;
  @BuiltValueEnumConst(wireName: r'telehealth')
  static const ScheduleTemplateModeEnum telehealth = _$scheduleTemplateModeEnum_telehealth;
  @BuiltValueEnumConst(wireName: r'both')
  static const ScheduleTemplateModeEnum both = _$scheduleTemplateModeEnum_both;

  static Serializer<ScheduleTemplateModeEnum> get serializer => _$scheduleTemplateModeEnumSerializer;

  const ScheduleTemplateModeEnum._(String name): super(name);

  static BuiltSet<ScheduleTemplateModeEnum> get values => _$scheduleTemplateModeEnumValues;
  static ScheduleTemplateModeEnum valueOf(String name) => _$scheduleTemplateModeEnumValueOf(name);
}


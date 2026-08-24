//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_schedule_template.g.dart';

/// ClinicScheduleTemplate
///
/// Properties:
/// * [id] 
/// * [serviceId] 
/// * [weekday] 
/// * [startTime] 
/// * [endTime] 
/// * [slotDurationMinutes] 
/// * [mode] 
/// * [capacity] 
/// * [active] 
@BuiltValue()
abstract class ClinicScheduleTemplate implements Built<ClinicScheduleTemplate, ClinicScheduleTemplateBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'service_id')
  String? get serviceId;

  @BuiltValueField(wireName: r'weekday')
  int? get weekday;

  @BuiltValueField(wireName: r'start_time')
  String? get startTime;

  @BuiltValueField(wireName: r'end_time')
  String? get endTime;

  @BuiltValueField(wireName: r'slot_duration_minutes')
  ClinicScheduleTemplateSlotDurationMinutesEnum? get slotDurationMinutes;
  // enum slotDurationMinutesEnum {  10,  15,  20,  30,  45,  60,  };

  @BuiltValueField(wireName: r'mode')
  ClinicScheduleTemplateModeEnum? get mode;
  // enum modeEnum {  in_person,  telehealth,  both,  };

  @BuiltValueField(wireName: r'capacity')
  int? get capacity;

  @BuiltValueField(wireName: r'active')
  bool? get active;

  ClinicScheduleTemplate._();

  factory ClinicScheduleTemplate([void updates(ClinicScheduleTemplateBuilder b)]) = _$ClinicScheduleTemplate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicScheduleTemplateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicScheduleTemplate> get serializer => _$ClinicScheduleTemplateSerializer();
}

class _$ClinicScheduleTemplateSerializer implements PrimitiveSerializer<ClinicScheduleTemplate> {
  @override
  final Iterable<Type> types = const [ClinicScheduleTemplate, _$ClinicScheduleTemplate];

  @override
  final String wireName = r'ClinicScheduleTemplate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicScheduleTemplate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.serviceId != null) {
      yield r'service_id';
      yield serializers.serialize(
        object.serviceId,
        specifiedType: const FullType.nullable(String),
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
        specifiedType: const FullType(ClinicScheduleTemplateSlotDurationMinutesEnum),
      );
    }
    if (object.mode != null) {
      yield r'mode';
      yield serializers.serialize(
        object.mode,
        specifiedType: const FullType(ClinicScheduleTemplateModeEnum),
      );
    }
    if (object.capacity != null) {
      yield r'capacity';
      yield serializers.serialize(
        object.capacity,
        specifiedType: const FullType(int),
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
    ClinicScheduleTemplate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicScheduleTemplateBuilder result,
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
            specifiedType: const FullType(ClinicScheduleTemplateSlotDurationMinutesEnum),
          ) as ClinicScheduleTemplateSlotDurationMinutesEnum;
          result.slotDurationMinutes = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicScheduleTemplateModeEnum),
          ) as ClinicScheduleTemplateModeEnum;
          result.mode = valueDes;
          break;
        case r'capacity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.capacity = valueDes;
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
  ClinicScheduleTemplate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicScheduleTemplateBuilder();
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

class ClinicScheduleTemplateSlotDurationMinutesEnum extends EnumClass {

  @BuiltValueEnumConst(wireNumber: 10)
  static const ClinicScheduleTemplateSlotDurationMinutesEnum number10 = _$clinicScheduleTemplateSlotDurationMinutesEnum_number10;
  @BuiltValueEnumConst(wireNumber: 15)
  static const ClinicScheduleTemplateSlotDurationMinutesEnum number15 = _$clinicScheduleTemplateSlotDurationMinutesEnum_number15;
  @BuiltValueEnumConst(wireNumber: 20)
  static const ClinicScheduleTemplateSlotDurationMinutesEnum number20 = _$clinicScheduleTemplateSlotDurationMinutesEnum_number20;
  @BuiltValueEnumConst(wireNumber: 30)
  static const ClinicScheduleTemplateSlotDurationMinutesEnum number30 = _$clinicScheduleTemplateSlotDurationMinutesEnum_number30;
  @BuiltValueEnumConst(wireNumber: 45)
  static const ClinicScheduleTemplateSlotDurationMinutesEnum number45 = _$clinicScheduleTemplateSlotDurationMinutesEnum_number45;
  @BuiltValueEnumConst(wireNumber: 60)
  static const ClinicScheduleTemplateSlotDurationMinutesEnum number60 = _$clinicScheduleTemplateSlotDurationMinutesEnum_number60;

  static Serializer<ClinicScheduleTemplateSlotDurationMinutesEnum> get serializer => _$clinicScheduleTemplateSlotDurationMinutesEnumSerializer;

  const ClinicScheduleTemplateSlotDurationMinutesEnum._(String name): super(name);

  static BuiltSet<ClinicScheduleTemplateSlotDurationMinutesEnum> get values => _$clinicScheduleTemplateSlotDurationMinutesEnumValues;
  static ClinicScheduleTemplateSlotDurationMinutesEnum valueOf(String name) => _$clinicScheduleTemplateSlotDurationMinutesEnumValueOf(name);
}

class ClinicScheduleTemplateModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'in_person')
  static const ClinicScheduleTemplateModeEnum inPerson = _$clinicScheduleTemplateModeEnum_inPerson;
  @BuiltValueEnumConst(wireName: r'telehealth')
  static const ClinicScheduleTemplateModeEnum telehealth = _$clinicScheduleTemplateModeEnum_telehealth;
  @BuiltValueEnumConst(wireName: r'both')
  static const ClinicScheduleTemplateModeEnum both = _$clinicScheduleTemplateModeEnum_both;

  static Serializer<ClinicScheduleTemplateModeEnum> get serializer => _$clinicScheduleTemplateModeEnumSerializer;

  const ClinicScheduleTemplateModeEnum._(String name): super(name);

  static BuiltSet<ClinicScheduleTemplateModeEnum> get values => _$clinicScheduleTemplateModeEnumValues;
  static ClinicScheduleTemplateModeEnum valueOf(String name) => _$clinicScheduleTemplateModeEnumValueOf(name);
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'appointment_create.g.dart';

/// AppointmentCreate
///
/// Properties:
/// * [origin] 
/// * [doctorId] 
/// * [clinicId] 
/// * [serviceId] 
/// * [dependentId] 
/// * [startAt] 
/// * [mode] 
/// * [reason] 
/// * [slotLockToken] - Jeton de verrou optimiste obtenu via /availability
@BuiltValue()
abstract class AppointmentCreate implements Built<AppointmentCreate, AppointmentCreateBuilder> {
  @BuiltValueField(wireName: r'origin')
  AppointmentCreateOriginEnum? get origin;
  // enum originEnum {  doctor_direct,  clinic_service,  };

  @BuiltValueField(wireName: r'doctor_id')
  String? get doctorId;

  @BuiltValueField(wireName: r'clinic_id')
  String? get clinicId;

  @BuiltValueField(wireName: r'service_id')
  String? get serviceId;

  @BuiltValueField(wireName: r'dependent_id')
  String? get dependentId;

  @BuiltValueField(wireName: r'start_at')
  DateTime get startAt;

  @BuiltValueField(wireName: r'mode')
  AppointmentCreateModeEnum get mode;
  // enum modeEnum {  in_person,  telehealth,  };

  @BuiltValueField(wireName: r'reason')
  String? get reason;

  /// Jeton de verrou optimiste obtenu via /availability
  @BuiltValueField(wireName: r'slot_lock_token')
  String? get slotLockToken;

  AppointmentCreate._();

  factory AppointmentCreate([void updates(AppointmentCreateBuilder b)]) = _$AppointmentCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AppointmentCreateBuilder b) =>
      b..origin = AppointmentCreateOriginEnum.doctorDirect;

  @BuiltValueSerializer(custom: true)
  static Serializer<AppointmentCreate> get serializer => _$AppointmentCreateSerializer();
}

class _$AppointmentCreateSerializer implements PrimitiveSerializer<AppointmentCreate> {
  @override
  final Iterable<Type> types = const [AppointmentCreate, _$AppointmentCreate];

  @override
  final String wireName = r'AppointmentCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AppointmentCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.origin != null) {
      yield r'origin';
      yield serializers.serialize(
        object.origin,
        specifiedType: const FullType(AppointmentCreateOriginEnum),
      );
    }
    if (object.doctorId != null) {
      yield r'doctor_id';
      yield serializers.serialize(
        object.doctorId,
        specifiedType: const FullType(String),
      );
    }
    if (object.clinicId != null) {
      yield r'clinic_id';
      yield serializers.serialize(
        object.clinicId,
        specifiedType: const FullType(String),
      );
    }
    if (object.serviceId != null) {
      yield r'service_id';
      yield serializers.serialize(
        object.serviceId,
        specifiedType: const FullType(String),
      );
    }
    if (object.dependentId != null) {
      yield r'dependent_id';
      yield serializers.serialize(
        object.dependentId,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'start_at';
    yield serializers.serialize(
      object.startAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'mode';
    yield serializers.serialize(
      object.mode,
      specifiedType: const FullType(AppointmentCreateModeEnum),
    );
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType(String),
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
    AppointmentCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AppointmentCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'origin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AppointmentCreateOriginEnum),
          ) as AppointmentCreateOriginEnum;
          result.origin = valueDes;
          break;
        case r'doctor_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.doctorId = valueDes;
          break;
        case r'clinic_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clinicId = valueDes;
          break;
        case r'service_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.serviceId = valueDes;
          break;
        case r'dependent_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dependentId = valueDes;
          break;
        case r'start_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startAt = valueDes;
          break;
        case r'mode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AppointmentCreateModeEnum),
          ) as AppointmentCreateModeEnum;
          result.mode = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reason = valueDes;
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
  AppointmentCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppointmentCreateBuilder();
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

class AppointmentCreateOriginEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'doctor_direct')
  static const AppointmentCreateOriginEnum doctorDirect = _$appointmentCreateOriginEnum_doctorDirect;
  @BuiltValueEnumConst(wireName: r'clinic_service')
  static const AppointmentCreateOriginEnum clinicService = _$appointmentCreateOriginEnum_clinicService;

  static Serializer<AppointmentCreateOriginEnum> get serializer => _$appointmentCreateOriginEnumSerializer;

  const AppointmentCreateOriginEnum._(String name): super(name);

  static BuiltSet<AppointmentCreateOriginEnum> get values => _$appointmentCreateOriginEnumValues;
  static AppointmentCreateOriginEnum valueOf(String name) => _$appointmentCreateOriginEnumValueOf(name);
}

class AppointmentCreateModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'in_person')
  static const AppointmentCreateModeEnum inPerson = _$appointmentCreateModeEnum_inPerson;
  @BuiltValueEnumConst(wireName: r'telehealth')
  static const AppointmentCreateModeEnum telehealth = _$appointmentCreateModeEnum_telehealth;

  static Serializer<AppointmentCreateModeEnum> get serializer => _$appointmentCreateModeEnumSerializer;

  const AppointmentCreateModeEnum._(String name): super(name);

  static BuiltSet<AppointmentCreateModeEnum> get values => _$appointmentCreateModeEnumValues;
  static AppointmentCreateModeEnum valueOf(String name) => _$appointmentCreateModeEnumValueOf(name);
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'appointment.g.dart';

/// Appointment
///
/// Properties:
/// * [id] 
/// * [patientId] 
/// * [dependentId] 
/// * [doctorId] 
/// * [startAt] 
/// * [endAt] 
/// * [mode] 
/// * [status] 
/// * [reason] 
/// * [feeDzd] 
/// * [paymentStatus] 
/// * [createdAt] 
/// * [updatedAt] 
@BuiltValue()
abstract class Appointment implements Built<Appointment, AppointmentBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'patient_id')
  String? get patientId;

  @BuiltValueField(wireName: r'dependent_id')
  String? get dependentId;

  @BuiltValueField(wireName: r'doctor_id')
  String? get doctorId;

  @BuiltValueField(wireName: r'start_at')
  DateTime? get startAt;

  @BuiltValueField(wireName: r'end_at')
  DateTime? get endAt;

  @BuiltValueField(wireName: r'mode')
  AppointmentModeEnum? get mode;
  // enum modeEnum {  in_person,  telehealth,  };

  @BuiltValueField(wireName: r'status')
  AppointmentStatusEnum? get status;
  // enum statusEnum {  pending,  confirmed,  cancelled,  completed,  no_show,  };

  @BuiltValueField(wireName: r'reason')
  String? get reason;

  @BuiltValueField(wireName: r'fee_dzd')
  int? get feeDzd;

  @BuiltValueField(wireName: r'payment_status')
  AppointmentPaymentStatusEnum? get paymentStatus;
  // enum paymentStatusEnum {  unpaid,  deposit_paid,  paid,  refunded,  };

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: r'updated_at')
  DateTime? get updatedAt;

  Appointment._();

  factory Appointment([void updates(AppointmentBuilder b)]) = _$Appointment;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AppointmentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Appointment> get serializer => _$AppointmentSerializer();
}

class _$AppointmentSerializer implements PrimitiveSerializer<Appointment> {
  @override
  final Iterable<Type> types = const [Appointment, _$Appointment];

  @override
  final String wireName = r'Appointment';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Appointment object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.patientId != null) {
      yield r'patient_id';
      yield serializers.serialize(
        object.patientId,
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
    if (object.doctorId != null) {
      yield r'doctor_id';
      yield serializers.serialize(
        object.doctorId,
        specifiedType: const FullType(String),
      );
    }
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
        specifiedType: const FullType(AppointmentModeEnum),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(AppointmentStatusEnum),
      );
    }
    if (object.reason != null) {
      yield r'reason';
      yield serializers.serialize(
        object.reason,
        specifiedType: const FullType(String),
      );
    }
    if (object.feeDzd != null) {
      yield r'fee_dzd';
      yield serializers.serialize(
        object.feeDzd,
        specifiedType: const FullType(int),
      );
    }
    if (object.paymentStatus != null) {
      yield r'payment_status';
      yield serializers.serialize(
        object.paymentStatus,
        specifiedType: const FullType(AppointmentPaymentStatusEnum),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.updatedAt != null) {
      yield r'updated_at';
      yield serializers.serialize(
        object.updatedAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Appointment object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AppointmentBuilder result,
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
        case r'patient_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.patientId = valueDes;
          break;
        case r'dependent_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.dependentId = valueDes;
          break;
        case r'doctor_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.doctorId = valueDes;
          break;
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
            specifiedType: const FullType(AppointmentModeEnum),
          ) as AppointmentModeEnum;
          result.mode = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AppointmentStatusEnum),
          ) as AppointmentStatusEnum;
          result.status = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.reason = valueDes;
          break;
        case r'fee_dzd':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.feeDzd = valueDes;
          break;
        case r'payment_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AppointmentPaymentStatusEnum),
          ) as AppointmentPaymentStatusEnum;
          result.paymentStatus = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Appointment deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AppointmentBuilder();
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

class AppointmentModeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'in_person')
  static const AppointmentModeEnum inPerson = _$appointmentModeEnum_inPerson;
  @BuiltValueEnumConst(wireName: r'telehealth')
  static const AppointmentModeEnum telehealth = _$appointmentModeEnum_telehealth;

  static Serializer<AppointmentModeEnum> get serializer => _$appointmentModeEnumSerializer;

  const AppointmentModeEnum._(String name): super(name);

  static BuiltSet<AppointmentModeEnum> get values => _$appointmentModeEnumValues;
  static AppointmentModeEnum valueOf(String name) => _$appointmentModeEnumValueOf(name);
}

class AppointmentStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const AppointmentStatusEnum pending = _$appointmentStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'confirmed')
  static const AppointmentStatusEnum confirmed = _$appointmentStatusEnum_confirmed;
  @BuiltValueEnumConst(wireName: r'cancelled')
  static const AppointmentStatusEnum cancelled = _$appointmentStatusEnum_cancelled;
  @BuiltValueEnumConst(wireName: r'completed')
  static const AppointmentStatusEnum completed = _$appointmentStatusEnum_completed;
  @BuiltValueEnumConst(wireName: r'no_show')
  static const AppointmentStatusEnum noShow = _$appointmentStatusEnum_noShow;

  static Serializer<AppointmentStatusEnum> get serializer => _$appointmentStatusEnumSerializer;

  const AppointmentStatusEnum._(String name): super(name);

  static BuiltSet<AppointmentStatusEnum> get values => _$appointmentStatusEnumValues;
  static AppointmentStatusEnum valueOf(String name) => _$appointmentStatusEnumValueOf(name);
}

class AppointmentPaymentStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'unpaid')
  static const AppointmentPaymentStatusEnum unpaid = _$appointmentPaymentStatusEnum_unpaid;
  @BuiltValueEnumConst(wireName: r'deposit_paid')
  static const AppointmentPaymentStatusEnum depositPaid = _$appointmentPaymentStatusEnum_depositPaid;
  @BuiltValueEnumConst(wireName: r'paid')
  static const AppointmentPaymentStatusEnum paid = _$appointmentPaymentStatusEnum_paid;
  @BuiltValueEnumConst(wireName: r'refunded')
  static const AppointmentPaymentStatusEnum refunded = _$appointmentPaymentStatusEnum_refunded;

  static Serializer<AppointmentPaymentStatusEnum> get serializer => _$appointmentPaymentStatusEnumSerializer;

  const AppointmentPaymentStatusEnum._(String name): super(name);

  static BuiltSet<AppointmentPaymentStatusEnum> get values => _$appointmentPaymentStatusEnumValues;
  static AppointmentPaymentStatusEnum valueOf(String name) => _$appointmentPaymentStatusEnumValueOf(name);
}


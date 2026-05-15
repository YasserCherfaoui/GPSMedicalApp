//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/user.dart';
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/date.dart';
import 'package:gps_medical_api/src/model/patient_all_of_insurance.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'patient.g.dart';

/// Patient
///
/// Properties:
/// * [id]
/// * [phone] - Numéro algérien au format E.164
/// * [email]
/// * [role]
/// * [fullName]
/// * [status]
/// * [createdAt]
/// * [birthDate]
/// * [gender]
/// * [bloodType]
/// * [address]
/// * [allergies]
/// * [chronicConditions]
/// * [insurance]
@BuiltValue()
abstract class Patient implements User, Built<Patient, PatientBuilder> {
  @BuiltValueField(wireName: r'allergies')
  BuiltList<String>? get allergies;

  @BuiltValueField(wireName: r'insurance')
  PatientAllOfInsurance? get insurance;

  @BuiltValueField(wireName: r'address')
  Address? get address;

  @BuiltValueField(wireName: r'gender')
  PatientGenderEnum? get gender;
  // enum genderEnum {  male,  female,  other,  };

  @BuiltValueField(wireName: r'blood_type')
  PatientBloodTypeEnum? get bloodType;
  // enum bloodTypeEnum {  A+,  A-,  B+,  B-,  AB+,  AB-,  O+,  O-,  };

  @BuiltValueField(wireName: r'birth_date')
  Date? get birthDate;

  @BuiltValueField(wireName: r'chronic_conditions')
  BuiltList<String>? get chronicConditions;

  Patient._();

  factory Patient([void updates(PatientBuilder b)]) = _$Patient;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PatientBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Patient> get serializer => _$PatientSerializer();
}

class _$PatientSerializer implements PrimitiveSerializer<Patient> {
  @override
  final Iterable<Type> types = const [Patient, _$Patient];

  @override
  final String wireName = r'Patient';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Patient object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.allergies != null) {
      yield r'allergies';
      yield serializers.serialize(
        object.allergies,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.insurance != null) {
      yield r'insurance';
      yield serializers.serialize(
        object.insurance,
        specifiedType: const FullType(PatientAllOfInsurance),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(Address),
      );
    }
    if (object.role != null) {
      yield r'role';
      yield serializers.serialize(
        object.role,
        specifiedType: const FullType(UserRoleEnum),
      );
    }
    if (object.gender != null) {
      yield r'gender';
      yield serializers.serialize(
        object.gender,
        specifiedType: const FullType(PatientGenderEnum),
      );
    }
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(String),
      );
    }
    if (object.bloodType != null) {
      yield r'blood_type';
      yield serializers.serialize(
        object.bloodType,
        specifiedType: const FullType(PatientBloodTypeEnum),
      );
    }
    if (object.birthDate != null) {
      yield r'birth_date';
      yield serializers.serialize(
        object.birthDate,
        specifiedType: const FullType(Date),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
        specifiedType: const FullType(String),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.chronicConditions != null) {
      yield r'chronic_conditions';
      yield serializers.serialize(
        object.chronicConditions,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(UserStatusEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Patient object, {
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
    required PatientBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'allergies':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.allergies.replace(valueDes);
          break;
        case r'insurance':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(PatientAllOfInsurance),
                  )
                  as PatientAllOfInsurance;
          result.insurance.replace(valueDes);
          break;
        case r'address':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Address),
                  )
                  as Address;
          result.address.replace(valueDes);
          break;
        case r'role':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(UserRoleEnum),
                  )
                  as UserRoleEnum;
          result.role = valueDes;
          break;
        case r'gender':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(PatientGenderEnum),
                  )
                  as PatientGenderEnum;
          result.gender = valueDes;
          break;
        case r'full_name':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.fullName = valueDes;
          break;
        case r'blood_type':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(PatientBloodTypeEnum),
                  )
                  as PatientBloodTypeEnum;
          result.bloodType = valueDes;
          break;
        case r'birth_date':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Date),
                  )
                  as Date;
          result.birthDate = valueDes;
          break;
        case r'created_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.createdAt = valueDes;
          break;
        case r'phone':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.phone = valueDes;
          break;
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        case r'chronic_conditions':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.chronicConditions.replace(valueDes);
          break;
        case r'email':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.email = valueDes;
          break;
        case r'status':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(UserStatusEnum),
                  )
                  as UserStatusEnum;
          result.status = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Patient deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PatientBuilder();
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

class PatientRoleEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'patient')
  static const PatientRoleEnum patient = _$patientRoleEnum_patient;
  @BuiltValueEnumConst(wireName: r'specialist')
  static const PatientRoleEnum specialist = _$patientRoleEnum_specialist;
  @BuiltValueEnumConst(wireName: r'concierge')
  static const PatientRoleEnum concierge = _$patientRoleEnum_concierge;
  @BuiltValueEnumConst(wireName: r'admin')
  static const PatientRoleEnum admin = _$patientRoleEnum_admin;
  @BuiltValueEnumConst(wireName: r'moderator')
  static const PatientRoleEnum moderator = _$patientRoleEnum_moderator;

  static Serializer<PatientRoleEnum> get serializer =>
      _$patientRoleEnumSerializer;

  const PatientRoleEnum._(String name) : super(name);

  static BuiltSet<PatientRoleEnum> get values => _$patientRoleEnumValues;
  static PatientRoleEnum valueOf(String name) => _$patientRoleEnumValueOf(name);
}

class PatientStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'pending_verification')
  static const PatientStatusEnum pendingVerification =
      _$patientStatusEnum_pendingVerification;
  @BuiltValueEnumConst(wireName: r'active')
  static const PatientStatusEnum active = _$patientStatusEnum_active;
  @BuiltValueEnumConst(wireName: r'suspended')
  static const PatientStatusEnum suspended = _$patientStatusEnum_suspended;
  @BuiltValueEnumConst(wireName: r'deleted')
  static const PatientStatusEnum deleted = _$patientStatusEnum_deleted;

  static Serializer<PatientStatusEnum> get serializer =>
      _$patientStatusEnumSerializer;

  const PatientStatusEnum._(String name) : super(name);

  static BuiltSet<PatientStatusEnum> get values => _$patientStatusEnumValues;
  static PatientStatusEnum valueOf(String name) =>
      _$patientStatusEnumValueOf(name);
}

class PatientGenderEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'male')
  static const PatientGenderEnum male = _$patientGenderEnum_male;
  @BuiltValueEnumConst(wireName: r'female')
  static const PatientGenderEnum female = _$patientGenderEnum_female;
  @BuiltValueEnumConst(wireName: r'other')
  static const PatientGenderEnum other = _$patientGenderEnum_other;

  static Serializer<PatientGenderEnum> get serializer =>
      _$patientGenderEnumSerializer;

  const PatientGenderEnum._(String name) : super(name);

  static BuiltSet<PatientGenderEnum> get values => _$patientGenderEnumValues;
  static PatientGenderEnum valueOf(String name) =>
      _$patientGenderEnumValueOf(name);
}

class PatientBloodTypeEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'A+')
  static const PatientBloodTypeEnum aPlus = _$patientBloodTypeEnum_aPlus;
  @BuiltValueEnumConst(wireName: r'A-')
  static const PatientBloodTypeEnum A_ = _$patientBloodTypeEnum_A_;
  @BuiltValueEnumConst(wireName: r'B+')
  static const PatientBloodTypeEnum bPlus = _$patientBloodTypeEnum_bPlus;
  @BuiltValueEnumConst(wireName: r'B-')
  static const PatientBloodTypeEnum B_ = _$patientBloodTypeEnum_B_;
  @BuiltValueEnumConst(wireName: r'AB+')
  static const PatientBloodTypeEnum aBPlus = _$patientBloodTypeEnum_aBPlus;
  @BuiltValueEnumConst(wireName: r'AB-')
  static const PatientBloodTypeEnum AB_ = _$patientBloodTypeEnum_AB_;
  @BuiltValueEnumConst(wireName: r'O+')
  static const PatientBloodTypeEnum oPlus = _$patientBloodTypeEnum_oPlus;
  @BuiltValueEnumConst(wireName: r'O-')
  static const PatientBloodTypeEnum O_ = _$patientBloodTypeEnum_O_;

  static Serializer<PatientBloodTypeEnum> get serializer =>
      _$patientBloodTypeEnumSerializer;

  const PatientBloodTypeEnum._(String name) : super(name);

  static BuiltSet<PatientBloodTypeEnum> get values =>
      _$patientBloodTypeEnumValues;
  static PatientBloodTypeEnum valueOf(String name) =>
      _$patientBloodTypeEnumValueOf(name);
}

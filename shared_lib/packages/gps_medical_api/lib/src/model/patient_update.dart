//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'patient_update.g.dart';

/// PatientUpdate
///
/// Properties:
/// * [fullName] 
/// * [email] 
/// * [birthDate] 
/// * [gender] 
/// * [bloodType] 
/// * [address] 
/// * [allergies] 
/// * [chronicConditions] 
@BuiltValue()
abstract class PatientUpdate implements Built<PatientUpdate, PatientUpdateBuilder> {
  @BuiltValueField(wireName: r'full_name')
  String? get fullName;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'birth_date')
  Date? get birthDate;

  @BuiltValueField(wireName: r'gender')
  PatientUpdateGenderEnum? get gender;
  // enum genderEnum {  male,  female,  other,  };

  @BuiltValueField(wireName: r'blood_type')
  PatientUpdateBloodTypeEnum? get bloodType;
  // enum bloodTypeEnum {  A+,  A-,  B+,  B-,  AB+,  AB-,  O+,  O-,  };

  @BuiltValueField(wireName: r'address')
  Address? get address;

  @BuiltValueField(wireName: r'allergies')
  BuiltList<String>? get allergies;

  @BuiltValueField(wireName: r'chronic_conditions')
  BuiltList<String>? get chronicConditions;

  PatientUpdate._();

  factory PatientUpdate([void updates(PatientUpdateBuilder b)]) = _$PatientUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PatientUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PatientUpdate> get serializer => _$PatientUpdateSerializer();
}

class _$PatientUpdateSerializer implements PrimitiveSerializer<PatientUpdate> {
  @override
  final Iterable<Type> types = const [PatientUpdate, _$PatientUpdate];

  @override
  final String wireName = r'PatientUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PatientUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.birthDate != null) {
      yield r'birth_date';
      yield serializers.serialize(
        object.birthDate,
        specifiedType: const FullType(Date),
      );
    }
    if (object.gender != null) {
      yield r'gender';
      yield serializers.serialize(
        object.gender,
        specifiedType: const FullType(PatientUpdateGenderEnum),
      );
    }
    if (object.bloodType != null) {
      yield r'blood_type';
      yield serializers.serialize(
        object.bloodType,
        specifiedType: const FullType(PatientUpdateBloodTypeEnum),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(Address),
      );
    }
    if (object.allergies != null) {
      yield r'allergies';
      yield serializers.serialize(
        object.allergies,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
    if (object.chronicConditions != null) {
      yield r'chronic_conditions';
      yield serializers.serialize(
        object.chronicConditions,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PatientUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PatientUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'birth_date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.birthDate = valueDes;
          break;
        case r'gender':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PatientUpdateGenderEnum),
          ) as PatientUpdateGenderEnum;
          result.gender = valueDes;
          break;
        case r'blood_type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PatientUpdateBloodTypeEnum),
          ) as PatientUpdateBloodTypeEnum;
          result.bloodType = valueDes;
          break;
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Address),
          ) as Address;
          result.address.replace(valueDes);
          break;
        case r'allergies':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.allergies.replace(valueDes);
          break;
        case r'chronic_conditions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(String)]),
          ) as BuiltList<String>;
          result.chronicConditions.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PatientUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PatientUpdateBuilder();
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

class PatientUpdateGenderEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'male')
  static const PatientUpdateGenderEnum male = _$patientUpdateGenderEnum_male;
  @BuiltValueEnumConst(wireName: r'female')
  static const PatientUpdateGenderEnum female = _$patientUpdateGenderEnum_female;
  @BuiltValueEnumConst(wireName: r'other')
  static const PatientUpdateGenderEnum other = _$patientUpdateGenderEnum_other;

  static Serializer<PatientUpdateGenderEnum> get serializer => _$patientUpdateGenderEnumSerializer;

  const PatientUpdateGenderEnum._(String name): super(name);

  static BuiltSet<PatientUpdateGenderEnum> get values => _$patientUpdateGenderEnumValues;
  static PatientUpdateGenderEnum valueOf(String name) => _$patientUpdateGenderEnumValueOf(name);
}

class PatientUpdateBloodTypeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'A+')
  static const PatientUpdateBloodTypeEnum aPlus = _$patientUpdateBloodTypeEnum_aPlus;
  @BuiltValueEnumConst(wireName: r'A-')
  static const PatientUpdateBloodTypeEnum A_ = _$patientUpdateBloodTypeEnum_A_;
  @BuiltValueEnumConst(wireName: r'B+')
  static const PatientUpdateBloodTypeEnum bPlus = _$patientUpdateBloodTypeEnum_bPlus;
  @BuiltValueEnumConst(wireName: r'B-')
  static const PatientUpdateBloodTypeEnum B_ = _$patientUpdateBloodTypeEnum_B_;
  @BuiltValueEnumConst(wireName: r'AB+')
  static const PatientUpdateBloodTypeEnum aBPlus = _$patientUpdateBloodTypeEnum_aBPlus;
  @BuiltValueEnumConst(wireName: r'AB-')
  static const PatientUpdateBloodTypeEnum AB_ = _$patientUpdateBloodTypeEnum_AB_;
  @BuiltValueEnumConst(wireName: r'O+')
  static const PatientUpdateBloodTypeEnum oPlus = _$patientUpdateBloodTypeEnum_oPlus;
  @BuiltValueEnumConst(wireName: r'O-')
  static const PatientUpdateBloodTypeEnum O_ = _$patientUpdateBloodTypeEnum_O_;

  static Serializer<PatientUpdateBloodTypeEnum> get serializer => _$patientUpdateBloodTypeEnumSerializer;

  const PatientUpdateBloodTypeEnum._(String name): super(name);

  static BuiltSet<PatientUpdateBloodTypeEnum> get values => _$patientUpdateBloodTypeEnumValues;
  static PatientUpdateBloodTypeEnum valueOf(String name) => _$patientUpdateBloodTypeEnumValueOf(name);
}


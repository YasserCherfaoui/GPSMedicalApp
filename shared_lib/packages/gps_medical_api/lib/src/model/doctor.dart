//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/specialty.dart';
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'doctor.g.dart';

/// Doctor
///
/// Properties:
/// * [id]
/// * [fullName]
/// * [title]
/// * [gender]
/// * [photoUrl]
/// * [bio]
/// * [specialties]
/// * [languages]
/// * [consultationFeeDzd]
/// * [acceptsCnas]
/// * [acceptsCasnos]
/// * [offersTelehealth]
/// * [practiceAddress]
/// * [ratingAverage]
/// * [ratingCount]
/// * [verified]
@BuiltValue(instantiable: false)
abstract class Doctor {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'full_name')
  String? get fullName;

  @BuiltValueField(wireName: r'title')
  String? get title;

  @BuiltValueField(wireName: r'gender')
  DoctorGenderEnum? get gender;
  // enum genderEnum {  male,  female,  };

  @BuiltValueField(wireName: r'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: r'bio')
  String? get bio;

  @BuiltValueField(wireName: r'specialties')
  BuiltList<Specialty>? get specialties;

  @BuiltValueField(wireName: r'languages')
  BuiltList<DoctorLanguagesEnum>? get languages;
  // enum languagesEnum {  ar,  fr,  en,  ber,  };

  @BuiltValueField(wireName: r'consultation_fee_dzd')
  int? get consultationFeeDzd;

  @BuiltValueField(wireName: r'accepts_cnas')
  bool? get acceptsCnas;

  @BuiltValueField(wireName: r'accepts_casnos')
  bool? get acceptsCasnos;

  @BuiltValueField(wireName: r'offers_telehealth')
  bool? get offersTelehealth;

  @BuiltValueField(wireName: r'practice_address')
  Address? get practiceAddress;

  @BuiltValueField(wireName: r'rating_average')
  double? get ratingAverage;

  @BuiltValueField(wireName: r'rating_count')
  int? get ratingCount;

  @BuiltValueField(wireName: r'verified')
  bool? get verified;

  @BuiltValueSerializer(custom: true)
  static Serializer<Doctor> get serializer => _$DoctorSerializer();
}

class _$DoctorSerializer implements PrimitiveSerializer<Doctor> {
  @override
  final Iterable<Type> types = const [Doctor];

  @override
  final String wireName = r'Doctor';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Doctor object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
        specifiedType: const FullType(String),
      );
    }
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.gender != null) {
      yield r'gender';
      yield serializers.serialize(
        object.gender,
        specifiedType: const FullType(DoctorGenderEnum),
      );
    }
    if (object.photoUrl != null) {
      yield r'photo_url';
      yield serializers.serialize(
        object.photoUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.bio != null) {
      yield r'bio';
      yield serializers.serialize(
        object.bio,
        specifiedType: const FullType(String),
      );
    }
    if (object.specialties != null) {
      yield r'specialties';
      yield serializers.serialize(
        object.specialties,
        specifiedType: const FullType(BuiltList, [FullType(Specialty)]),
      );
    }
    if (object.languages != null) {
      yield r'languages';
      yield serializers.serialize(
        object.languages,
        specifiedType: const FullType(BuiltList, [
          FullType(DoctorLanguagesEnum),
        ]),
      );
    }
    if (object.consultationFeeDzd != null) {
      yield r'consultation_fee_dzd';
      yield serializers.serialize(
        object.consultationFeeDzd,
        specifiedType: const FullType(int),
      );
    }
    if (object.acceptsCnas != null) {
      yield r'accepts_cnas';
      yield serializers.serialize(
        object.acceptsCnas,
        specifiedType: const FullType(bool),
      );
    }
    if (object.acceptsCasnos != null) {
      yield r'accepts_casnos';
      yield serializers.serialize(
        object.acceptsCasnos,
        specifiedType: const FullType(bool),
      );
    }
    if (object.offersTelehealth != null) {
      yield r'offers_telehealth';
      yield serializers.serialize(
        object.offersTelehealth,
        specifiedType: const FullType(bool),
      );
    }
    if (object.practiceAddress != null) {
      yield r'practice_address';
      yield serializers.serialize(
        object.practiceAddress,
        specifiedType: const FullType(Address),
      );
    }
    if (object.ratingAverage != null) {
      yield r'rating_average';
      yield serializers.serialize(
        object.ratingAverage,
        specifiedType: const FullType(double),
      );
    }
    if (object.ratingCount != null) {
      yield r'rating_count';
      yield serializers.serialize(
        object.ratingCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.verified != null) {
      yield r'verified';
      yield serializers.serialize(
        object.verified,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Doctor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(
      serializers,
      object,
      specifiedType: specifiedType,
    ).toList();
  }

  @override
  Doctor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($Doctor))
        as $Doctor;
  }
}

/// a concrete implementation of [Doctor], since [Doctor] is not instantiable
@BuiltValue(instantiable: true)
abstract class $Doctor implements Doctor, Built<$Doctor, $DoctorBuilder> {
  $Doctor._();

  factory $Doctor([void Function($DoctorBuilder)? updates]) = _$$Doctor;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($DoctorBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$Doctor> get serializer => _$$DoctorSerializer();
}

class _$$DoctorSerializer implements PrimitiveSerializer<$Doctor> {
  @override
  final Iterable<Type> types = const [$Doctor, _$$Doctor];

  @override
  final String wireName = r'$Doctor';

  @override
  Object serialize(
    Serializers serializers,
    $Doctor object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(Doctor))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DoctorBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
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
        case r'title':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.title = valueDes;
          break;
        case r'gender':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DoctorGenderEnum),
                  )
                  as DoctorGenderEnum;
          result.gender = valueDes;
          break;
        case r'photo_url':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.photoUrl = valueDes;
          break;
        case r'bio':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.bio = valueDes;
          break;
        case r'specialties':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(Specialty),
                    ]),
                  )
                  as BuiltList<Specialty>;
          result.specialties.replace(valueDes);
          break;
        case r'languages':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(DoctorLanguagesEnum),
                    ]),
                  )
                  as BuiltList<DoctorLanguagesEnum>;
          result.languages.replace(valueDes);
          break;
        case r'consultation_fee_dzd':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.consultationFeeDzd = valueDes;
          break;
        case r'accepts_cnas':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.acceptsCnas = valueDes;
          break;
        case r'accepts_casnos':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.acceptsCasnos = valueDes;
          break;
        case r'offers_telehealth':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.offersTelehealth = valueDes;
          break;
        case r'practice_address':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Address),
                  )
                  as Address;
          result.practiceAddress.replace(valueDes);
          break;
        case r'rating_average':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double;
          result.ratingAverage = valueDes;
          break;
        case r'rating_count':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.ratingCount = valueDes;
          break;
        case r'verified':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.verified = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $Doctor deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $DoctorBuilder();
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

class DoctorGenderEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'male')
  static const DoctorGenderEnum male = _$doctorGenderEnum_male;
  @BuiltValueEnumConst(wireName: r'female')
  static const DoctorGenderEnum female = _$doctorGenderEnum_female;

  static Serializer<DoctorGenderEnum> get serializer =>
      _$doctorGenderEnumSerializer;

  const DoctorGenderEnum._(String name) : super(name);

  static BuiltSet<DoctorGenderEnum> get values => _$doctorGenderEnumValues;
  static DoctorGenderEnum valueOf(String name) =>
      _$doctorGenderEnumValueOf(name);
}

class DoctorLanguagesEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'ar')
  static const DoctorLanguagesEnum ar = _$doctorLanguagesEnum_ar;
  @BuiltValueEnumConst(wireName: r'fr')
  static const DoctorLanguagesEnum fr = _$doctorLanguagesEnum_fr;
  @BuiltValueEnumConst(wireName: r'en')
  static const DoctorLanguagesEnum en = _$doctorLanguagesEnum_en;
  @BuiltValueEnumConst(wireName: r'ber')
  static const DoctorLanguagesEnum ber = _$doctorLanguagesEnum_ber;

  static Serializer<DoctorLanguagesEnum> get serializer =>
      _$doctorLanguagesEnumSerializer;

  const DoctorLanguagesEnum._(String name) : super(name);

  static BuiltSet<DoctorLanguagesEnum> get values =>
      _$doctorLanguagesEnumValues;
  static DoctorLanguagesEnum valueOf(String name) =>
      _$doctorLanguagesEnumValueOf(name);
}

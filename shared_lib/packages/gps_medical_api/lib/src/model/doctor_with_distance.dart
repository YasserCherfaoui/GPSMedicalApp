//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/specialty.dart';
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/doctor.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'doctor_with_distance.g.dart';

/// DoctorWithDistance
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
/// * [distanceKm]
@BuiltValue()
abstract class DoctorWithDistance
    implements Doctor, Built<DoctorWithDistance, DoctorWithDistanceBuilder> {
  @BuiltValueField(wireName: r'distance_km')
  double? get distanceKm;

  DoctorWithDistance._();

  factory DoctorWithDistance([void updates(DoctorWithDistanceBuilder b)]) =
      _$DoctorWithDistance;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DoctorWithDistanceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DoctorWithDistance> get serializer =>
      _$DoctorWithDistanceSerializer();
}

class _$DoctorWithDistanceSerializer
    implements PrimitiveSerializer<DoctorWithDistance> {
  @override
  final Iterable<Type> types = const [DoctorWithDistance, _$DoctorWithDistance];

  @override
  final String wireName = r'DoctorWithDistance';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DoctorWithDistance object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.practiceAddress != null) {
      yield r'practice_address';
      yield serializers.serialize(
        object.practiceAddress,
        specifiedType: const FullType(Address),
      );
    }
    if (object.acceptsCasnos != null) {
      yield r'accepts_casnos';
      yield serializers.serialize(
        object.acceptsCasnos,
        specifiedType: const FullType(bool),
      );
    }
    if (object.gender != null) {
      yield r'gender';
      yield serializers.serialize(
        object.gender,
        specifiedType: const FullType(DoctorGenderEnum),
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
    if (object.offersTelehealth != null) {
      yield r'offers_telehealth';
      yield serializers.serialize(
        object.offersTelehealth,
        specifiedType: const FullType(bool),
      );
    }
    if (object.verified != null) {
      yield r'verified';
      yield serializers.serialize(
        object.verified,
        specifiedType: const FullType(bool),
      );
    }
    if (object.distanceKm != null) {
      yield r'distance_km';
      yield serializers.serialize(
        object.distanceKm,
        specifiedType: const FullType(double),
      );
    }
    if (object.fullName != null) {
      yield r'full_name';
      yield serializers.serialize(
        object.fullName,
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
    if (object.title != null) {
      yield r'title';
      yield serializers.serialize(
        object.title,
        specifiedType: const FullType(String),
      );
    }
    if (object.ratingCount != null) {
      yield r'rating_count';
      yield serializers.serialize(
        object.ratingCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.photoUrl != null) {
      yield r'photo_url';
      yield serializers.serialize(
        object.photoUrl,
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
    if (object.acceptsCnas != null) {
      yield r'accepts_cnas';
      yield serializers.serialize(
        object.acceptsCnas,
        specifiedType: const FullType(bool),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.ratingAverage != null) {
      yield r'rating_average';
      yield serializers.serialize(
        object.ratingAverage,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DoctorWithDistance object, {
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
    required DoctorWithDistanceBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'practice_address':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Address),
                  )
                  as Address;
          result.practiceAddress.replace(valueDes);
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
        case r'gender':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DoctorGenderEnum),
                  )
                  as DoctorGenderEnum;
          result.gender = valueDes;
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
        case r'offers_telehealth':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.offersTelehealth = valueDes;
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
        case r'distance_km':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double;
          result.distanceKm = valueDes;
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
        case r'bio':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.bio = valueDes;
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
        case r'rating_count':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.ratingCount = valueDes;
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
        case r'accepts_cnas':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.acceptsCnas = valueDes;
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
        case r'rating_average':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double;
          result.ratingAverage = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DoctorWithDistance deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DoctorWithDistanceBuilder();
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

class DoctorWithDistanceGenderEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'male')
  static const DoctorWithDistanceGenderEnum male =
      _$doctorWithDistanceGenderEnum_male;
  @BuiltValueEnumConst(wireName: r'female')
  static const DoctorWithDistanceGenderEnum female =
      _$doctorWithDistanceGenderEnum_female;

  static Serializer<DoctorWithDistanceGenderEnum> get serializer =>
      _$doctorWithDistanceGenderEnumSerializer;

  const DoctorWithDistanceGenderEnum._(String name) : super(name);

  static BuiltSet<DoctorWithDistanceGenderEnum> get values =>
      _$doctorWithDistanceGenderEnumValues;
  static DoctorWithDistanceGenderEnum valueOf(String name) =>
      _$doctorWithDistanceGenderEnumValueOf(name);
}

class DoctorWithDistanceLanguagesEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'ar')
  static const DoctorWithDistanceLanguagesEnum ar =
      _$doctorWithDistanceLanguagesEnum_ar;
  @BuiltValueEnumConst(wireName: r'fr')
  static const DoctorWithDistanceLanguagesEnum fr =
      _$doctorWithDistanceLanguagesEnum_fr;
  @BuiltValueEnumConst(wireName: r'en')
  static const DoctorWithDistanceLanguagesEnum en =
      _$doctorWithDistanceLanguagesEnum_en;
  @BuiltValueEnumConst(wireName: r'ber')
  static const DoctorWithDistanceLanguagesEnum ber =
      _$doctorWithDistanceLanguagesEnum_ber;

  static Serializer<DoctorWithDistanceLanguagesEnum> get serializer =>
      _$doctorWithDistanceLanguagesEnumSerializer;

  const DoctorWithDistanceLanguagesEnum._(String name) : super(name);

  static BuiltSet<DoctorWithDistanceLanguagesEnum> get values =>
      _$doctorWithDistanceLanguagesEnumValues;
  static DoctorWithDistanceLanguagesEnum valueOf(String name) =>
      _$doctorWithDistanceLanguagesEnumValueOf(name);
}

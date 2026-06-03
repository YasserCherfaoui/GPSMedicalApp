//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/specialty.dart';
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/credential.dart';
import 'package:gps_medical_api/src/model/doctor.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'doctor_private.g.dart';

/// DoctorPrivate
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
/// * [phone] - Numéro algérien au format E.164
/// * [email] 
/// * [councilNumber] - N° au Conseil de l'Ordre
/// * [verificationStatus] 
/// * [credentials] 
/// * [confirmationPolicy] 
/// * [bookingWindowDays] 
@BuiltValue()
abstract class DoctorPrivate implements Doctor, Built<DoctorPrivate, DoctorPrivateBuilder> {
  @BuiltValueField(wireName: r'booking_window_days')
  int? get bookingWindowDays;

  /// Numéro algérien au format E.164
  @BuiltValueField(wireName: r'phone')
  String? get phone;

  @BuiltValueField(wireName: r'verification_status')
  DoctorPrivateVerificationStatusEnum? get verificationStatus;
  // enum verificationStatusEnum {  pending,  in_review,  approved,  rejected,  };

  @BuiltValueField(wireName: r'credentials')
  BuiltList<Credential>? get credentials;

  @BuiltValueField(wireName: r'confirmation_policy')
  DoctorPrivateConfirmationPolicyEnum? get confirmationPolicy;
  // enum confirmationPolicyEnum {  auto,  manual,  };

  /// N° au Conseil de l'Ordre
  @BuiltValueField(wireName: r'council_number')
  String? get councilNumber;

  @BuiltValueField(wireName: r'email')
  String? get email;

  DoctorPrivate._();

  factory DoctorPrivate([void updates(DoctorPrivateBuilder b)]) = _$DoctorPrivate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DoctorPrivateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DoctorPrivate> get serializer => _$DoctorPrivateSerializer();
}

class _$DoctorPrivateSerializer implements PrimitiveSerializer<DoctorPrivate> {
  @override
  final Iterable<Type> types = const [DoctorPrivate, _$DoctorPrivate];

  @override
  final String wireName = r'DoctorPrivate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DoctorPrivate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.bookingWindowDays != null) {
      yield r'booking_window_days';
      yield serializers.serialize(
        object.bookingWindowDays,
        specifiedType: const FullType(int),
      );
    }
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
        specifiedType: const FullType(BuiltList, [FullType(DoctorLanguagesEnum)]),
      );
    }
    if (object.verificationStatus != null) {
      yield r'verification_status';
      yield serializers.serialize(
        object.verificationStatus,
        specifiedType: const FullType(DoctorPrivateVerificationStatusEnum),
      );
    }
    if (object.credentials != null) {
      yield r'credentials';
      yield serializers.serialize(
        object.credentials,
        specifiedType: const FullType(BuiltList, [FullType(Credential)]),
      );
    }
    if (object.confirmationPolicy != null) {
      yield r'confirmation_policy';
      yield serializers.serialize(
        object.confirmationPolicy,
        specifiedType: const FullType(DoctorPrivateConfirmationPolicyEnum),
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
    if (object.councilNumber != null) {
      yield r'council_number';
      yield serializers.serialize(
        object.councilNumber,
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
    DoctorPrivate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DoctorPrivateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'booking_window_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.bookingWindowDays = valueDes;
          break;
        case r'practice_address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Address),
          ) as Address;
          result.practiceAddress.replace(valueDes);
          break;
        case r'accepts_casnos':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.acceptsCasnos = valueDes;
          break;
        case r'gender':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DoctorGenderEnum),
          ) as DoctorGenderEnum;
          result.gender = valueDes;
          break;
        case r'languages':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(DoctorLanguagesEnum)]),
          ) as BuiltList<DoctorLanguagesEnum>;
          result.languages.replace(valueDes);
          break;
        case r'verification_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DoctorPrivateVerificationStatusEnum),
          ) as DoctorPrivateVerificationStatusEnum;
          result.verificationStatus = valueDes;
          break;
        case r'credentials':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Credential)]),
          ) as BuiltList<Credential>;
          result.credentials.replace(valueDes);
          break;
        case r'confirmation_policy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DoctorPrivateConfirmationPolicyEnum),
          ) as DoctorPrivateConfirmationPolicyEnum;
          result.confirmationPolicy = valueDes;
          break;
        case r'consultation_fee_dzd':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.consultationFeeDzd = valueDes;
          break;
        case r'offers_telehealth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.offersTelehealth = valueDes;
          break;
        case r'verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.verified = valueDes;
          break;
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'bio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.bio = valueDes;
          break;
        case r'title':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.title = valueDes;
          break;
        case r'rating_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ratingCount = valueDes;
          break;
        case r'photo_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.photoUrl = valueDes;
          break;
        case r'specialties':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Specialty)]),
          ) as BuiltList<Specialty>;
          result.specialties.replace(valueDes);
          break;
        case r'accepts_cnas':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.acceptsCnas = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'council_number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.councilNumber = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'rating_average':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
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
  DoctorPrivate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DoctorPrivateBuilder();
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

class DoctorPrivateGenderEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'male')
  static const DoctorPrivateGenderEnum male = _$doctorPrivateGenderEnum_male;
  @BuiltValueEnumConst(wireName: r'female')
  static const DoctorPrivateGenderEnum female = _$doctorPrivateGenderEnum_female;

  static Serializer<DoctorPrivateGenderEnum> get serializer => _$doctorPrivateGenderEnumSerializer;

  const DoctorPrivateGenderEnum._(String name): super(name);

  static BuiltSet<DoctorPrivateGenderEnum> get values => _$doctorPrivateGenderEnumValues;
  static DoctorPrivateGenderEnum valueOf(String name) => _$doctorPrivateGenderEnumValueOf(name);
}

class DoctorPrivateLanguagesEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'ar')
  static const DoctorPrivateLanguagesEnum ar = _$doctorPrivateLanguagesEnum_ar;
  @BuiltValueEnumConst(wireName: r'fr')
  static const DoctorPrivateLanguagesEnum fr = _$doctorPrivateLanguagesEnum_fr;
  @BuiltValueEnumConst(wireName: r'en')
  static const DoctorPrivateLanguagesEnum en = _$doctorPrivateLanguagesEnum_en;
  @BuiltValueEnumConst(wireName: r'ber')
  static const DoctorPrivateLanguagesEnum ber = _$doctorPrivateLanguagesEnum_ber;

  static Serializer<DoctorPrivateLanguagesEnum> get serializer => _$doctorPrivateLanguagesEnumSerializer;

  const DoctorPrivateLanguagesEnum._(String name): super(name);

  static BuiltSet<DoctorPrivateLanguagesEnum> get values => _$doctorPrivateLanguagesEnumValues;
  static DoctorPrivateLanguagesEnum valueOf(String name) => _$doctorPrivateLanguagesEnumValueOf(name);
}

class DoctorPrivateVerificationStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const DoctorPrivateVerificationStatusEnum pending = _$doctorPrivateVerificationStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'in_review')
  static const DoctorPrivateVerificationStatusEnum inReview = _$doctorPrivateVerificationStatusEnum_inReview;
  @BuiltValueEnumConst(wireName: r'approved')
  static const DoctorPrivateVerificationStatusEnum approved = _$doctorPrivateVerificationStatusEnum_approved;
  @BuiltValueEnumConst(wireName: r'rejected')
  static const DoctorPrivateVerificationStatusEnum rejected = _$doctorPrivateVerificationStatusEnum_rejected;

  static Serializer<DoctorPrivateVerificationStatusEnum> get serializer => _$doctorPrivateVerificationStatusEnumSerializer;

  const DoctorPrivateVerificationStatusEnum._(String name): super(name);

  static BuiltSet<DoctorPrivateVerificationStatusEnum> get values => _$doctorPrivateVerificationStatusEnumValues;
  static DoctorPrivateVerificationStatusEnum valueOf(String name) => _$doctorPrivateVerificationStatusEnumValueOf(name);
}

class DoctorPrivateConfirmationPolicyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'auto')
  static const DoctorPrivateConfirmationPolicyEnum auto = _$doctorPrivateConfirmationPolicyEnum_auto;
  @BuiltValueEnumConst(wireName: r'manual')
  static const DoctorPrivateConfirmationPolicyEnum manual = _$doctorPrivateConfirmationPolicyEnum_manual;

  static Serializer<DoctorPrivateConfirmationPolicyEnum> get serializer => _$doctorPrivateConfirmationPolicyEnumSerializer;

  const DoctorPrivateConfirmationPolicyEnum._(String name): super(name);

  static BuiltSet<DoctorPrivateConfirmationPolicyEnum> get values => _$doctorPrivateConfirmationPolicyEnumValues;
  static DoctorPrivateConfirmationPolicyEnum valueOf(String name) => _$doctorPrivateConfirmationPolicyEnumValueOf(name);
}


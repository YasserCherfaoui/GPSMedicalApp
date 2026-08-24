//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/clinic_credential.dart';
import 'package:gps_medical_api/src/model/clinic_service_teaser.dart';
import 'package:gps_medical_api/src/model/clinic_status.dart';
import 'package:gps_medical_api/src/model/clinic_verification_status.dart';
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/clinic.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_private.g.dart';

/// ClinicPrivate
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [description] 
/// * [address] 
/// * [countryCode] - ISO 3166-1 alpha-2. DZ, TN, et codes Schengen-UE. Activation `verified=true` hors DZ bloquée jusqu'à G-3. 
/// * [verified] 
/// * [ratingAverage] 
/// * [ratingCount] 
/// * [offersTelehealth] 
/// * [serviceTeasers] 
/// * [ownerUserId] 
/// * [legalName] 
/// * [registreCommerce] 
/// * [agrementSante] 
/// * [status] 
/// * [verificationStatus] 
/// * [verificationComment] 
/// * [confirmationPolicy] 
/// * [bookingWindowDays] 
/// * [credentials] 
/// * [email] 
@BuiltValue()
abstract class ClinicPrivate implements Clinic, Built<ClinicPrivate, ClinicPrivateBuilder> {
  @BuiltValueField(wireName: r'legal_name')
  String? get legalName;

  @BuiltValueField(wireName: r'registre_commerce')
  String? get registreCommerce;

  @BuiltValueField(wireName: r'booking_window_days')
  int? get bookingWindowDays;

  @BuiltValueField(wireName: r'agrement_sante')
  String? get agrementSante;

  @BuiltValueField(wireName: r'verification_status')
  ClinicVerificationStatus? get verificationStatus;
  // enum verificationStatusEnum {  pending,  in_review,  approved,  approved_pending_activation,  rejected,  };

  @BuiltValueField(wireName: r'confirmation_policy')
  ClinicPrivateConfirmationPolicyEnum? get confirmationPolicy;
  // enum confirmationPolicyEnum {  auto,  manual,  };

  @BuiltValueField(wireName: r'credentials')
  BuiltList<ClinicCredential>? get credentials;

  @BuiltValueField(wireName: r'owner_user_id')
  String? get ownerUserId;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'status')
  ClinicStatus? get status;
  // enum statusEnum {  pending,  active,  suspended,  rejected,  };

  @BuiltValueField(wireName: r'verification_comment')
  String? get verificationComment;

  ClinicPrivate._();

  factory ClinicPrivate([void updates(ClinicPrivateBuilder b)]) = _$ClinicPrivate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicPrivateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicPrivate> get serializer => _$ClinicPrivateSerializer();
}

class _$ClinicPrivateSerializer implements PrimitiveSerializer<ClinicPrivate> {
  @override
  final Iterable<Type> types = const [ClinicPrivate, _$ClinicPrivate];

  @override
  final String wireName = r'ClinicPrivate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicPrivate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.bookingWindowDays != null) {
      yield r'booking_window_days';
      yield serializers.serialize(
        object.bookingWindowDays,
        specifiedType: const FullType(int),
      );
    }
    if (object.address != null) {
      yield r'address';
      yield serializers.serialize(
        object.address,
        specifiedType: const FullType(Address),
      );
    }
    if (object.verificationStatus != null) {
      yield r'verification_status';
      yield serializers.serialize(
        object.verificationStatus,
        specifiedType: const FullType(ClinicVerificationStatus),
      );
    }
    if (object.confirmationPolicy != null) {
      yield r'confirmation_policy';
      yield serializers.serialize(
        object.confirmationPolicy,
        specifiedType: const FullType(ClinicPrivateConfirmationPolicyEnum),
      );
    }
    if (object.credentials != null) {
      yield r'credentials';
      yield serializers.serialize(
        object.credentials,
        specifiedType: const FullType(BuiltList, [FullType(ClinicCredential)]),
      );
    }
    if (object.verified != null) {
      yield r'verified';
      yield serializers.serialize(
        object.verified,
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
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
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
    if (object.legalName != null) {
      yield r'legal_name';
      yield serializers.serialize(
        object.legalName,
        specifiedType: const FullType(String),
      );
    }
    if (object.registreCommerce != null) {
      yield r'registre_commerce';
      yield serializers.serialize(
        object.registreCommerce,
        specifiedType: const FullType(String),
      );
    }
    if (object.agrementSante != null) {
      yield r'agrement_sante';
      yield serializers.serialize(
        object.agrementSante,
        specifiedType: const FullType(String),
      );
    }
    if (object.countryCode != null) {
      yield r'country_code';
      yield serializers.serialize(
        object.countryCode,
        specifiedType: const FullType(String),
      );
    }
    if (object.ownerUserId != null) {
      yield r'owner_user_id';
      yield serializers.serialize(
        object.ownerUserId,
        specifiedType: const FullType(String),
      );
    }
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.serviceTeasers != null) {
      yield r'service_teasers';
      yield serializers.serialize(
        object.serviceTeasers,
        specifiedType: const FullType(BuiltList, [FullType(ClinicServiceTeaser)]),
      );
    }
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
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
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ClinicStatus),
      );
    }
    if (object.verificationComment != null) {
      yield r'verification_comment';
      yield serializers.serialize(
        object.verificationComment,
        specifiedType: const FullType.nullable(String),
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
    ClinicPrivate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicPrivateBuilder result,
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
        case r'address':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Address),
          ) as Address;
          result.address.replace(valueDes);
          break;
        case r'verification_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicVerificationStatus),
          ) as ClinicVerificationStatus;
          result.verificationStatus = valueDes;
          break;
        case r'confirmation_policy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicPrivateConfirmationPolicyEnum),
          ) as ClinicPrivateConfirmationPolicyEnum;
          result.confirmationPolicy = valueDes;
          break;
        case r'credentials':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicCredential)]),
          ) as BuiltList<ClinicCredential>;
          result.credentials.replace(valueDes);
          break;
        case r'verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.verified = valueDes;
          break;
        case r'offers_telehealth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.offersTelehealth = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'rating_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ratingCount = valueDes;
          break;
        case r'legal_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.legalName = valueDes;
          break;
        case r'registre_commerce':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.registreCommerce = valueDes;
          break;
        case r'agrement_sante':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.agrementSante = valueDes;
          break;
        case r'country_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.countryCode = valueDes;
          break;
        case r'owner_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.ownerUserId = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'service_teasers':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicServiceTeaser)]),
          ) as BuiltList<ClinicServiceTeaser>;
          result.serviceTeasers.replace(valueDes);
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicStatus),
          ) as ClinicStatus;
          result.status = valueDes;
          break;
        case r'verification_comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.verificationComment = valueDes;
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
  ClinicPrivate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicPrivateBuilder();
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

class ClinicPrivateConfirmationPolicyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'auto')
  static const ClinicPrivateConfirmationPolicyEnum auto = _$clinicPrivateConfirmationPolicyEnum_auto;
  @BuiltValueEnumConst(wireName: r'manual')
  static const ClinicPrivateConfirmationPolicyEnum manual = _$clinicPrivateConfirmationPolicyEnum_manual;

  static Serializer<ClinicPrivateConfirmationPolicyEnum> get serializer => _$clinicPrivateConfirmationPolicyEnumSerializer;

  const ClinicPrivateConfirmationPolicyEnum._(String name): super(name);

  static BuiltSet<ClinicPrivateConfirmationPolicyEnum> get values => _$clinicPrivateConfirmationPolicyEnumValues;
  static ClinicPrivateConfirmationPolicyEnum valueOf(String name) => _$clinicPrivateConfirmationPolicyEnumValueOf(name);
}


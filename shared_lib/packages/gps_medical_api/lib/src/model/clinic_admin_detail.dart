//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/clinic_credential.dart';
import 'package:gps_medical_api/src/model/clinic_service_teaser.dart';
import 'package:gps_medical_api/src/model/clinic_status.dart';
import 'package:gps_medical_api/src/model/clinic_roster_member_summary.dart';
import 'package:gps_medical_api/src/model/clinic_verification_status.dart';
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/clinic_under_staffed_advisory.dart';
import 'package:gps_medical_api/src/model/clinic_donated_blocks_summary.dart';
import 'package:gps_medical_api/src/model/clinic_capacity_vs_donated_hours.dart';
import 'package:gps_medical_api/src/model/clinic_private.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_admin_detail.g.dart';

/// ClinicAdminDetail
///
/// Properties:
/// * [id] 
/// * [name] 
/// * [description] 
/// * [address] 
/// * [countryCode] - ISO 3166-1 alpha-2. DZ, TN, et codes UE-27. G-3 cleared (Amendment 2): approve active DZ + UE ; TN reste `approved_pending_activation` (G-2). 
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
/// * [underStaffed] - Présent sur les réponses admin — `true` si au moins un créneau de capacité est sous-couvert par les blocs donnés du roster. 
/// * [members] 
/// * [donatedBlocksSummary] 
/// * [capacityVsDonatedHours] 
/// * [underStaffedAdvisory] 
/// * [ownerIsSeededStub] - `true` si le propriétaire a `password_hash=SEEDED_NO_LOGIN` (profil OSM non revendiqué — hotfix 3.6). 
@BuiltValue()
abstract class ClinicAdminDetail implements ClinicPrivate, Built<ClinicAdminDetail, ClinicAdminDetailBuilder> {
  @BuiltValueField(wireName: r'donated_blocks_summary')
  ClinicDonatedBlocksSummary? get donatedBlocksSummary;

  @BuiltValueField(wireName: r'members')
  BuiltList<ClinicRosterMemberSummary>? get members;

  /// `true` si le propriétaire a `password_hash=SEEDED_NO_LOGIN` (profil OSM non revendiqué — hotfix 3.6). 
  @BuiltValueField(wireName: r'owner_is_seeded_stub')
  bool? get ownerIsSeededStub;

  @BuiltValueField(wireName: r'under_staffed_advisory')
  ClinicUnderStaffedAdvisory? get underStaffedAdvisory;

  @BuiltValueField(wireName: r'capacity_vs_donated_hours')
  ClinicCapacityVsDonatedHours? get capacityVsDonatedHours;

  ClinicAdminDetail._();

  factory ClinicAdminDetail([void updates(ClinicAdminDetailBuilder b)]) = _$ClinicAdminDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicAdminDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicAdminDetail> get serializer => _$ClinicAdminDetailSerializer();
}

class _$ClinicAdminDetailSerializer implements PrimitiveSerializer<ClinicAdminDetail> {
  @override
  final Iterable<Type> types = const [ClinicAdminDetail, _$ClinicAdminDetail];

  @override
  final String wireName = r'ClinicAdminDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicAdminDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    if (object.underStaffed != null) {
      yield r'under_staffed';
      yield serializers.serialize(
        object.underStaffed,
        specifiedType: const FullType.nullable(bool),
      );
    }
    if (object.donatedBlocksSummary != null) {
      yield r'donated_blocks_summary';
      yield serializers.serialize(
        object.donatedBlocksSummary,
        specifiedType: const FullType(ClinicDonatedBlocksSummary),
      );
    }
    if (object.legalName != null) {
      yield r'legal_name';
      yield serializers.serialize(
        object.legalName,
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
    if (object.members != null) {
      yield r'members';
      yield serializers.serialize(
        object.members,
        specifiedType: const FullType(BuiltList, [FullType(ClinicRosterMemberSummary)]),
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
    if (object.underStaffedAdvisory != null) {
      yield r'under_staffed_advisory';
      yield serializers.serialize(
        object.underStaffedAdvisory,
        specifiedType: const FullType(ClinicUnderStaffedAdvisory),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
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
    if (object.verified != null) {
      yield r'verified';
      yield serializers.serialize(
        object.verified,
        specifiedType: const FullType(bool),
      );
    }
    if (object.ownerIsSeededStub != null) {
      yield r'owner_is_seeded_stub';
      yield serializers.serialize(
        object.ownerIsSeededStub,
        specifiedType: const FullType(bool),
      );
    }
    if (object.ratingCount != null) {
      yield r'rating_count';
      yield serializers.serialize(
        object.ratingCount,
        specifiedType: const FullType(int),
      );
    }
    if (object.registreCommerce != null) {
      yield r'registre_commerce';
      yield serializers.serialize(
        object.registreCommerce,
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
    if (object.ownerUserId != null) {
      yield r'owner_user_id';
      yield serializers.serialize(
        object.ownerUserId,
        specifiedType: const FullType(String),
      );
    }
    if (object.capacityVsDonatedHours != null) {
      yield r'capacity_vs_donated_hours';
      yield serializers.serialize(
        object.capacityVsDonatedHours,
        specifiedType: const FullType(ClinicCapacityVsDonatedHours),
      );
    }
    if (object.ratingAverage != null) {
      yield r'rating_average';
      yield serializers.serialize(
        object.ratingAverage,
        specifiedType: const FullType(double),
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
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicAdminDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicAdminDetailBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
        case r'under_staffed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(bool),
          ) as bool?;
          if (valueDes == null) continue;
          result.underStaffed = valueDes;
          break;
        case r'donated_blocks_summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicDonatedBlocksSummary),
          ) as ClinicDonatedBlocksSummary;
          result.donatedBlocksSummary.replace(valueDes);
          break;
        case r'legal_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.legalName = valueDes;
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
        case r'members':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ClinicRosterMemberSummary)]),
          ) as BuiltList<ClinicRosterMemberSummary>;
          result.members.replace(valueDes);
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
        case r'under_staffed_advisory':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicUnderStaffedAdvisory),
          ) as ClinicUnderStaffedAdvisory;
          result.underStaffedAdvisory.replace(valueDes);
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
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
        case r'verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.verified = valueDes;
          break;
        case r'owner_is_seeded_stub':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.ownerIsSeededStub = valueDes;
          break;
        case r'rating_count':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.ratingCount = valueDes;
          break;
        case r'registre_commerce':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.registreCommerce = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'owner_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.ownerUserId = valueDes;
          break;
        case r'capacity_vs_donated_hours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicCapacityVsDonatedHours),
          ) as ClinicCapacityVsDonatedHours;
          result.capacityVsDonatedHours.replace(valueDes);
          break;
        case r'rating_average':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.ratingAverage = valueDes;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicAdminDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicAdminDetailBuilder();
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

class ClinicAdminDetailConfirmationPolicyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'auto')
  static const ClinicAdminDetailConfirmationPolicyEnum auto = _$clinicAdminDetailConfirmationPolicyEnum_auto;
  @BuiltValueEnumConst(wireName: r'manual')
  static const ClinicAdminDetailConfirmationPolicyEnum manual = _$clinicAdminDetailConfirmationPolicyEnum_manual;

  static Serializer<ClinicAdminDetailConfirmationPolicyEnum> get serializer => _$clinicAdminDetailConfirmationPolicyEnumSerializer;

  const ClinicAdminDetailConfirmationPolicyEnum._(String name): super(name);

  static BuiltSet<ClinicAdminDetailConfirmationPolicyEnum> get values => _$clinicAdminDetailConfirmationPolicyEnumValues;
  static ClinicAdminDetailConfirmationPolicyEnum valueOf(String name) => _$clinicAdminDetailConfirmationPolicyEnumValueOf(name);
}


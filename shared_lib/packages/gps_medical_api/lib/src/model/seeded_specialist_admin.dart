//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/country_code.dart';
import 'package:gps_medical_api/src/model/seeded_specialist_claim_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'seeded_specialist_admin.g.dart';

/// SeededSpecialistAdmin
///
/// Properties:
/// * [specialistId] 
/// * [userId] 
/// * [fullName] 
/// * [specialtyCode] 
/// * [wilayaCode] 
/// * [wilayaName] 
/// * [country] 
/// * [claimStatus] 
/// * [verificationStatus] 
/// * [verified] 
/// * [source_] 
/// * [sourceAttribution] 
/// * [createdAt] 
@BuiltValue()
abstract class SeededSpecialistAdmin implements Built<SeededSpecialistAdmin, SeededSpecialistAdminBuilder> {
  @BuiltValueField(wireName: r'specialist_id')
  String get specialistId;

  @BuiltValueField(wireName: r'user_id')
  String get userId;

  @BuiltValueField(wireName: r'full_name')
  String get fullName;

  @BuiltValueField(wireName: r'specialty_code')
  String? get specialtyCode;

  @BuiltValueField(wireName: r'wilaya_code')
  String? get wilayaCode;

  @BuiltValueField(wireName: r'wilaya_name')
  String? get wilayaName;

  @BuiltValueField(wireName: r'country')
  CountryCode? get country;
  // enum countryEnum {  DZ,  TN,  AT,  BE,  BG,  HR,  CY,  CZ,  DK,  EE,  FI,  FR,  DE,  GR,  HU,  IE,  IT,  LV,  LT,  LU,  MT,  NL,  PL,  PT,  RO,  SK,  SI,  ES,  SE,  };

  @BuiltValueField(wireName: r'claim_status')
  SeededSpecialistClaimStatus get claimStatus;
  // enum claimStatusEnum {  unclaimed,  claim_in_review,  claimed,  };

  @BuiltValueField(wireName: r'verification_status')
  String? get verificationStatus;

  @BuiltValueField(wireName: r'verified')
  bool get verified;

  @BuiltValueField(wireName: r'source')
  SeededSpecialistAdminSource_Enum get source_;
  // enum source_Enum {  osm,  };

  @BuiltValueField(wireName: r'source_attribution')
  String? get sourceAttribution;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  SeededSpecialistAdmin._();

  factory SeededSpecialistAdmin([void updates(SeededSpecialistAdminBuilder b)]) = _$SeededSpecialistAdmin;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SeededSpecialistAdminBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SeededSpecialistAdmin> get serializer => _$SeededSpecialistAdminSerializer();
}

class _$SeededSpecialistAdminSerializer implements PrimitiveSerializer<SeededSpecialistAdmin> {
  @override
  final Iterable<Type> types = const [SeededSpecialistAdmin, _$SeededSpecialistAdmin];

  @override
  final String wireName = r'SeededSpecialistAdmin';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SeededSpecialistAdmin object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'specialist_id';
    yield serializers.serialize(
      object.specialistId,
      specifiedType: const FullType(String),
    );
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'full_name';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    if (object.specialtyCode != null) {
      yield r'specialty_code';
      yield serializers.serialize(
        object.specialtyCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.wilayaCode != null) {
      yield r'wilaya_code';
      yield serializers.serialize(
        object.wilayaCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.wilayaName != null) {
      yield r'wilaya_name';
      yield serializers.serialize(
        object.wilayaName,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.country != null) {
      yield r'country';
      yield serializers.serialize(
        object.country,
        specifiedType: const FullType(CountryCode),
      );
    }
    yield r'claim_status';
    yield serializers.serialize(
      object.claimStatus,
      specifiedType: const FullType(SeededSpecialistClaimStatus),
    );
    if (object.verificationStatus != null) {
      yield r'verification_status';
      yield serializers.serialize(
        object.verificationStatus,
        specifiedType: const FullType(String),
      );
    }
    yield r'verified';
    yield serializers.serialize(
      object.verified,
      specifiedType: const FullType(bool),
    );
    yield r'source';
    yield serializers.serialize(
      object.source_,
      specifiedType: const FullType(SeededSpecialistAdminSource_Enum),
    );
    if (object.sourceAttribution != null) {
      yield r'source_attribution';
      yield serializers.serialize(
        object.sourceAttribution,
        specifiedType: const FullType(String),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SeededSpecialistAdmin object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SeededSpecialistAdminBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'specialist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.specialistId = valueDes;
          break;
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'specialty_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.specialtyCode = valueDes;
          break;
        case r'wilaya_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.wilayaCode = valueDes;
          break;
        case r'wilaya_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.wilayaName = valueDes;
          break;
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CountryCode),
          ) as CountryCode;
          result.country = valueDes;
          break;
        case r'claim_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SeededSpecialistClaimStatus),
          ) as SeededSpecialistClaimStatus;
          result.claimStatus = valueDes;
          break;
        case r'verification_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.verificationStatus = valueDes;
          break;
        case r'verified':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.verified = valueDes;
          break;
        case r'source':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SeededSpecialistAdminSource_Enum),
          ) as SeededSpecialistAdminSource_Enum;
          result.source_ = valueDes;
          break;
        case r'source_attribution':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.sourceAttribution = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SeededSpecialistAdmin deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SeededSpecialistAdminBuilder();
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

class SeededSpecialistAdminSource_Enum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'osm')
  static const SeededSpecialistAdminSource_Enum osm = _$seededSpecialistAdminSourceEnum_osm;

  static Serializer<SeededSpecialistAdminSource_Enum> get serializer => _$seededSpecialistAdminSourceEnumSerializer;

  const SeededSpecialistAdminSource_Enum._(String name): super(name);

  static BuiltSet<SeededSpecialistAdminSource_Enum> get values => _$seededSpecialistAdminSourceEnumValues;
  static SeededSpecialistAdminSource_Enum valueOf(String name) => _$seededSpecialistAdminSourceEnumValueOf(name);
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/country_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_request.g.dart';

/// RegisterRequest
///
/// Properties:
/// * [country] - Pays du compte. Obligatoire. Immuable après OTP. 
/// * [phone] - Numéro mobile au format E.164 — Algérie (`+213[5-7]########`) ou Tunisie (`+216[2459]#######`). Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (`DZ` ↔ `+213`, `TN` ↔ `+216`) ; sinon `422 phone_country_mismatch`. 
/// * [nin] - Obligatoire si `country=DZ` (`422 nin_required` si absent). Doit être absent si `country=TN` (`422 nin_not_applicable` sinon). 
/// * [password] 
/// * [role] - `specialist` + `country=TN` → `422 country_not_supported_for_role`. 
/// * [fullName] 
/// * [email] 
/// * [consentDataProcessing] - Consentement obligatoire au traitement des données personnelles (termes légaux du pays).
/// * [consentHealthData] - Consentement obligatoire au traitement des données de santé.
/// * [consentAnpdpTerms] - Acceptation des conditions légales applicables au pays de l'utilisateur (libellé historique `anpdp_terms` — rename cosmétique différé). 
/// * [consentMarketing] - Optionnel — communications marketing (révocable sans suspension de compte).
@BuiltValue()
abstract class RegisterRequest implements Built<RegisterRequest, RegisterRequestBuilder> {
  /// Pays du compte. Obligatoire. Immuable après OTP. 
  @BuiltValueField(wireName: r'country')
  CountryCode get country;
  // enum countryEnum {  DZ,  TN,  };

  /// Numéro mobile au format E.164 — Algérie (`+213[5-7]########`) ou Tunisie (`+216[2459]#######`). Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (`DZ` ↔ `+213`, `TN` ↔ `+216`) ; sinon `422 phone_country_mismatch`. 
  @BuiltValueField(wireName: r'phone')
  String get phone;

  /// Obligatoire si `country=DZ` (`422 nin_required` si absent). Doit être absent si `country=TN` (`422 nin_not_applicable` sinon). 
  @BuiltValueField(wireName: r'nin')
  String? get nin;

  @BuiltValueField(wireName: r'password')
  String get password;

  /// `specialist` + `country=TN` → `422 country_not_supported_for_role`. 
  @BuiltValueField(wireName: r'role')
  RegisterRequestRoleEnum get role;
  // enum roleEnum {  patient,  specialist,  };

  @BuiltValueField(wireName: r'full_name')
  String get fullName;

  @BuiltValueField(wireName: r'email')
  String? get email;

  /// Consentement obligatoire au traitement des données personnelles (termes légaux du pays).
  @BuiltValueField(wireName: r'consent_data_processing')
  bool get consentDataProcessing;

  /// Consentement obligatoire au traitement des données de santé.
  @BuiltValueField(wireName: r'consent_health_data')
  bool get consentHealthData;

  /// Acceptation des conditions légales applicables au pays de l'utilisateur (libellé historique `anpdp_terms` — rename cosmétique différé). 
  @BuiltValueField(wireName: r'consent_anpdp_terms')
  bool get consentAnpdpTerms;

  /// Optionnel — communications marketing (révocable sans suspension de compte).
  @BuiltValueField(wireName: r'consent_marketing')
  bool? get consentMarketing;

  RegisterRequest._();

  factory RegisterRequest([void updates(RegisterRequestBuilder b)]) = _$RegisterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterRequest> get serializer => _$RegisterRequestSerializer();
}

class _$RegisterRequestSerializer implements PrimitiveSerializer<RegisterRequest> {
  @override
  final Iterable<Type> types = const [RegisterRequest, _$RegisterRequest];

  @override
  final String wireName = r'RegisterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'country';
    yield serializers.serialize(
      object.country,
      specifiedType: const FullType(CountryCode),
    );
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
    if (object.nin != null) {
      yield r'nin';
      yield serializers.serialize(
        object.nin,
        specifiedType: const FullType(String),
      );
    }
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
    yield r'role';
    yield serializers.serialize(
      object.role,
      specifiedType: const FullType(RegisterRequestRoleEnum),
    );
    yield r'full_name';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    yield r'consent_data_processing';
    yield serializers.serialize(
      object.consentDataProcessing,
      specifiedType: const FullType(bool),
    );
    yield r'consent_health_data';
    yield serializers.serialize(
      object.consentHealthData,
      specifiedType: const FullType(bool),
    );
    yield r'consent_anpdp_terms';
    yield serializers.serialize(
      object.consentAnpdpTerms,
      specifiedType: const FullType(bool),
    );
    if (object.consentMarketing != null) {
      yield r'consent_marketing';
      yield serializers.serialize(
        object.consentMarketing,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CountryCode),
          ) as CountryCode;
          result.country = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'nin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nin = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        case r'role':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RegisterRequestRoleEnum),
          ) as RegisterRequestRoleEnum;
          result.role = valueDes;
          break;
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
        case r'consent_data_processing':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.consentDataProcessing = valueDes;
          break;
        case r'consent_health_data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.consentHealthData = valueDes;
          break;
        case r'consent_anpdp_terms':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.consentAnpdpTerms = valueDes;
          break;
        case r'consent_marketing':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.consentMarketing = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterRequestBuilder();
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

class RegisterRequestRoleEnum extends EnumClass {

  /// `specialist` + `country=TN` → `422 country_not_supported_for_role`. 
  @BuiltValueEnumConst(wireName: r'patient')
  static const RegisterRequestRoleEnum patient = _$registerRequestRoleEnum_patient;
  /// `specialist` + `country=TN` → `422 country_not_supported_for_role`. 
  @BuiltValueEnumConst(wireName: r'specialist')
  static const RegisterRequestRoleEnum specialist = _$registerRequestRoleEnum_specialist;

  static Serializer<RegisterRequestRoleEnum> get serializer => _$registerRequestRoleEnumSerializer;

  const RegisterRequestRoleEnum._(String name): super(name);

  static BuiltSet<RegisterRequestRoleEnum> get values => _$registerRequestRoleEnumValues;
  static RegisterRequestRoleEnum valueOf(String name) => _$registerRequestRoleEnumValueOf(name);
}


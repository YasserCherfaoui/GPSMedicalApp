//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_request.g.dart';

/// RegisterRequest
///
/// Properties:
/// * [phone] - Numéro algérien au format E.164
/// * [nin] - Numéro d'Identification National (NIN) algérien — 18 chiffres, institué par le décret exécutif n° 10-210 (2010) et reconduit par le décret de 2023. La structure officielle des 18 chiffres est :  | Positions | Lg | Signification | |---|---|---| | 1 | 1 | Sexe (`1` = homme, `2` = femme) | | 2 | 1 | Code mention (naissance régulière, transcription, naturalisation, …) | | 3–5 | 3 | Trois derniers chiffres de l'année d'inscription au registre | | 6–9 | 4 | Code commune (ou pays, pour les naissances à l'étranger) | | 10–14 | 5 | Numéro d'acte de naissance | | 15–16 | 2 | Numéro de série du registre pour l'année | | 17–18 | 2 | Clé de contrôle |  Le format est validé côté serveur (longueur, chiffres uniquement, sexe, année d'inscription résolvable en `19xx`/`20xx`, code commune non nul, pas de chiffre répété). La clé de contrôle n'est **pas** vérifiée localement : l'algorithme officiel est de la responsabilité de l'API gouvernementale.  La vérification auprès de l'API gouvernementale est *best-effort* : en cas d'indisponibilité, l'inscription est acceptée et le compte reste avec `nin_verification_status = pending` jusqu'à validation ultérieure (voir ADR 0005).
/// * [password]
/// * [role]
/// * [fullName]
/// * [email]
/// * [consentDataProcessing] - Consentement obligatoire au traitement des données personnelles (ANPDP).
/// * [consentHealthData] - Consentement obligatoire au traitement des données de santé.
/// * [consentAnpdpTerms] - Acceptation des conditions légales / politique ANPDP.
/// * [consentMarketing] - Optionnel — communications marketing (révocable sans suspension de compte).
@BuiltValue()
abstract class RegisterRequest
    implements Built<RegisterRequest, RegisterRequestBuilder> {
  /// Numéro algérien au format E.164
  @BuiltValueField(wireName: r'phone')
  String get phone;

  /// Numéro d'Identification National (NIN) algérien — 18 chiffres, institué par le décret exécutif n° 10-210 (2010) et reconduit par le décret de 2023. La structure officielle des 18 chiffres est :  | Positions | Lg | Signification | |---|---|---| | 1 | 1 | Sexe (`1` = homme, `2` = femme) | | 2 | 1 | Code mention (naissance régulière, transcription, naturalisation, …) | | 3–5 | 3 | Trois derniers chiffres de l'année d'inscription au registre | | 6–9 | 4 | Code commune (ou pays, pour les naissances à l'étranger) | | 10–14 | 5 | Numéro d'acte de naissance | | 15–16 | 2 | Numéro de série du registre pour l'année | | 17–18 | 2 | Clé de contrôle |  Le format est validé côté serveur (longueur, chiffres uniquement, sexe, année d'inscription résolvable en `19xx`/`20xx`, code commune non nul, pas de chiffre répété). La clé de contrôle n'est **pas** vérifiée localement : l'algorithme officiel est de la responsabilité de l'API gouvernementale.  La vérification auprès de l'API gouvernementale est *best-effort* : en cas d'indisponibilité, l'inscription est acceptée et le compte reste avec `nin_verification_status = pending` jusqu'à validation ultérieure (voir ADR 0005).
  @BuiltValueField(wireName: r'nin')
  String get nin;

  @BuiltValueField(wireName: r'password')
  String get password;

  @BuiltValueField(wireName: r'role')
  RegisterRequestRoleEnum get role;
  // enum roleEnum {  patient,  specialist,  };

  @BuiltValueField(wireName: r'full_name')
  String get fullName;

  @BuiltValueField(wireName: r'email')
  String? get email;

  /// Consentement obligatoire au traitement des données personnelles (ANPDP).
  @BuiltValueField(wireName: r'consent_data_processing')
  bool get consentDataProcessing;

  /// Consentement obligatoire au traitement des données de santé.
  @BuiltValueField(wireName: r'consent_health_data')
  bool get consentHealthData;

  /// Acceptation des conditions légales / politique ANPDP.
  @BuiltValueField(wireName: r'consent_anpdp_terms')
  bool get consentAnpdpTerms;

  /// Optionnel — communications marketing (révocable sans suspension de compte).
  @BuiltValueField(wireName: r'consent_marketing')
  bool? get consentMarketing;

  RegisterRequest._();

  factory RegisterRequest([void updates(RegisterRequestBuilder b)]) =
      _$RegisterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterRequest> get serializer =>
      _$RegisterRequestSerializer();
}

class _$RegisterRequestSerializer
    implements PrimitiveSerializer<RegisterRequest> {
  @override
  final Iterable<Type> types = const [RegisterRequest, _$RegisterRequest];

  @override
  final String wireName = r'RegisterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
    yield r'nin';
    yield serializers.serialize(
      object.nin,
      specifiedType: const FullType(String),
    );
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
    required RegisterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phone':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.phone = valueDes;
          break;
        case r'nin':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.nin = valueDes;
          break;
        case r'password':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.password = valueDes;
          break;
        case r'role':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(RegisterRequestRoleEnum),
                  )
                  as RegisterRequestRoleEnum;
          result.role = valueDes;
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
        case r'email':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.email = valueDes;
          break;
        case r'consent_data_processing':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.consentDataProcessing = valueDes;
          break;
        case r'consent_health_data':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.consentHealthData = valueDes;
          break;
        case r'consent_anpdp_terms':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.consentAnpdpTerms = valueDes;
          break;
        case r'consent_marketing':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
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
  @BuiltValueEnumConst(wireName: r'patient')
  static const RegisterRequestRoleEnum patient =
      _$registerRequestRoleEnum_patient;
  @BuiltValueEnumConst(wireName: r'specialist')
  static const RegisterRequestRoleEnum specialist =
      _$registerRequestRoleEnum_specialist;

  static Serializer<RegisterRequestRoleEnum> get serializer =>
      _$registerRequestRoleEnumSerializer;

  const RegisterRequestRoleEnum._(String name) : super(name);

  static BuiltSet<RegisterRequestRoleEnum> get values =>
      _$registerRequestRoleEnumValues;
  static RegisterRequestRoleEnum valueOf(String name) =>
      _$registerRequestRoleEnumValueOf(name);
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/country_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'check_nin_request.g.dart';

/// CheckNinRequest
///
/// Properties:
/// * [nin] - **Deprecated (v1.2.8).** Conservé pour lectures historiques uniquement. La collecte NIN est retirée — le serveur ignore `nin` à l'inscription.  Numéro d'Identification National (NIN) algérien — 18 chiffres, institué par le décret exécutif n° 10-210 (2010) et reconduit par le décret de 2023. La structure officielle des 18 chiffres est :  | Positions | Lg | Signification | |---|---|---| | 1 | 1 | Sexe (`1` = homme, `2` = femme) | | 2 | 1 | Code mention (naissance régulière, transcription, naturalisation, …) | | 3–5 | 3 | Trois derniers chiffres de l'année d'inscription au registre | | 6–9 | 4 | Code commune (ou pays, pour les naissances à l'étranger) | | 10–14 | 5 | Numéro d'acte de naissance | | 15–16 | 2 | Numéro de série du registre pour l'année | | 17–18 | 2 | Clé de contrôle |  Le format était validé côté serveur ; la vérification gouvernementale *best-effort* (ADR 0005) est désactivée opérationnellement (ADR 0026). 
/// * [country] - Ignoré (v1.2.8). L'endpoint `check-nin` est un no-op `204`. 
@BuiltValue()
abstract class CheckNinRequest implements Built<CheckNinRequest, CheckNinRequestBuilder> {
  /// **Deprecated (v1.2.8).** Conservé pour lectures historiques uniquement. La collecte NIN est retirée — le serveur ignore `nin` à l'inscription.  Numéro d'Identification National (NIN) algérien — 18 chiffres, institué par le décret exécutif n° 10-210 (2010) et reconduit par le décret de 2023. La structure officielle des 18 chiffres est :  | Positions | Lg | Signification | |---|---|---| | 1 | 1 | Sexe (`1` = homme, `2` = femme) | | 2 | 1 | Code mention (naissance régulière, transcription, naturalisation, …) | | 3–5 | 3 | Trois derniers chiffres de l'année d'inscription au registre | | 6–9 | 4 | Code commune (ou pays, pour les naissances à l'étranger) | | 10–14 | 5 | Numéro d'acte de naissance | | 15–16 | 2 | Numéro de série du registre pour l'année | | 17–18 | 2 | Clé de contrôle |  Le format était validé côté serveur ; la vérification gouvernementale *best-effort* (ADR 0005) est désactivée opérationnellement (ADR 0026). 
  @Deprecated('nin has been deprecated')
  @BuiltValueField(wireName: r'nin')
  String get nin;

  /// Ignoré (v1.2.8). L'endpoint `check-nin` est un no-op `204`. 
  @BuiltValueField(wireName: r'country')
  CountryCode? get country;
  // enum countryEnum {  DZ,  TN,  AT,  BE,  BG,  HR,  CY,  CZ,  DK,  EE,  FI,  FR,  DE,  GR,  HU,  IE,  IT,  LV,  LT,  LU,  MT,  NL,  PL,  PT,  RO,  SK,  SI,  ES,  SE,  };

  CheckNinRequest._();

  factory CheckNinRequest([void updates(CheckNinRequestBuilder b)]) = _$CheckNinRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckNinRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckNinRequest> get serializer => _$CheckNinRequestSerializer();
}

class _$CheckNinRequestSerializer implements PrimitiveSerializer<CheckNinRequest> {
  @override
  final Iterable<Type> types = const [CheckNinRequest, _$CheckNinRequest];

  @override
  final String wireName = r'CheckNinRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckNinRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'nin';
    yield serializers.serialize(
      object.nin,
      specifiedType: const FullType(String),
    );
    if (object.country != null) {
      yield r'country';
      yield serializers.serialize(
        object.country,
        specifiedType: const FullType(CountryCode),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckNinRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckNinRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'nin':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.nin = valueDes;
          break;
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CountryCode),
          ) as CountryCode;
          result.country = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  CheckNinRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckNinRequestBuilder();
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


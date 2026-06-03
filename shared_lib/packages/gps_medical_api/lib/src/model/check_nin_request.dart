//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'check_nin_request.g.dart';

/// CheckNinRequest
///
/// Properties:
/// * [nin] - Numéro d'Identification National (NIN) algérien — 18 chiffres, institué par le décret exécutif n° 10-210 (2010) et reconduit par le décret de 2023. La structure officielle des 18 chiffres est :  | Positions | Lg | Signification | |---|---|---| | 1 | 1 | Sexe (`1` = homme, `2` = femme) | | 2 | 1 | Code mention (naissance régulière, transcription, naturalisation, …) | | 3–5 | 3 | Trois derniers chiffres de l'année d'inscription au registre | | 6–9 | 4 | Code commune (ou pays, pour les naissances à l'étranger) | | 10–14 | 5 | Numéro d'acte de naissance | | 15–16 | 2 | Numéro de série du registre pour l'année | | 17–18 | 2 | Clé de contrôle |  Le format est validé côté serveur (longueur, chiffres uniquement, sexe, année d'inscription résolvable en `19xx`/`20xx`, code commune non nul, pas de chiffre répété). La clé de contrôle n'est **pas** vérifiée localement : l'algorithme officiel est de la responsabilité de l'API gouvernementale.  La vérification auprès de l'API gouvernementale est *best-effort* : en cas d'indisponibilité, l'inscription est acceptée et le compte reste avec `nin_verification_status = pending` jusqu'à validation ultérieure (voir ADR 0005). 
@BuiltValue()
abstract class CheckNinRequest implements Built<CheckNinRequest, CheckNinRequestBuilder> {
  /// Numéro d'Identification National (NIN) algérien — 18 chiffres, institué par le décret exécutif n° 10-210 (2010) et reconduit par le décret de 2023. La structure officielle des 18 chiffres est :  | Positions | Lg | Signification | |---|---|---| | 1 | 1 | Sexe (`1` = homme, `2` = femme) | | 2 | 1 | Code mention (naissance régulière, transcription, naturalisation, …) | | 3–5 | 3 | Trois derniers chiffres de l'année d'inscription au registre | | 6–9 | 4 | Code commune (ou pays, pour les naissances à l'étranger) | | 10–14 | 5 | Numéro d'acte de naissance | | 15–16 | 2 | Numéro de série du registre pour l'année | | 17–18 | 2 | Clé de contrôle |  Le format est validé côté serveur (longueur, chiffres uniquement, sexe, année d'inscription résolvable en `19xx`/`20xx`, code commune non nul, pas de chiffre répété). La clé de contrôle n'est **pas** vérifiée localement : l'algorithme officiel est de la responsabilité de l'API gouvernementale.  La vérification auprès de l'API gouvernementale est *best-effort* : en cas d'indisponibilité, l'inscription est acceptée et le compte reste avec `nin_verification_status = pending` jusqu'à validation ultérieure (voir ADR 0005). 
  @BuiltValueField(wireName: r'nin')
  String get nin;

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


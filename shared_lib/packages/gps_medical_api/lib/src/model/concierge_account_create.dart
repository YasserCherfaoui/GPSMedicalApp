//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/country_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'concierge_account_create.g.dart';

/// ConciergeAccountCreate
///
/// Properties:
/// * [phone] - Numéro mobile au format E.164. Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (validation libphonenumber pour les 29 `CountryCode`) ; sinon `422 phone_country_mismatch`. 
/// * [email] 
/// * [fullName] 
/// * [country] 
/// * [password] 
@BuiltValue()
abstract class ConciergeAccountCreate implements Built<ConciergeAccountCreate, ConciergeAccountCreateBuilder> {
  /// Numéro mobile au format E.164. Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (validation libphonenumber pour les 29 `CountryCode`) ; sinon `422 phone_country_mismatch`. 
  @BuiltValueField(wireName: r'phone')
  String get phone;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'full_name')
  String get fullName;

  @BuiltValueField(wireName: r'country')
  CountryCode get country;
  // enum countryEnum {  DZ,  TN,  AT,  BE,  BG,  HR,  CY,  CZ,  DK,  EE,  FI,  FR,  DE,  GR,  HU,  IE,  IT,  LV,  LT,  LU,  MT,  NL,  PL,  PT,  RO,  SK,  SI,  ES,  SE,  };

  @BuiltValueField(wireName: r'password')
  String get password;

  ConciergeAccountCreate._();

  factory ConciergeAccountCreate([void updates(ConciergeAccountCreateBuilder b)]) = _$ConciergeAccountCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConciergeAccountCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConciergeAccountCreate> get serializer => _$ConciergeAccountCreateSerializer();
}

class _$ConciergeAccountCreateSerializer implements PrimitiveSerializer<ConciergeAccountCreate> {
  @override
  final Iterable<Type> types = const [ConciergeAccountCreate, _$ConciergeAccountCreate];

  @override
  final String wireName = r'ConciergeAccountCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConciergeAccountCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    yield r'full_name';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    yield r'country';
    yield serializers.serialize(
      object.country,
      specifiedType: const FullType(CountryCode),
    );
    yield r'password';
    yield serializers.serialize(
      object.password,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConciergeAccountCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConciergeAccountCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'country':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CountryCode),
          ) as CountryCode;
          result.country = valueDes;
          break;
        case r'password':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.password = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConciergeAccountCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConciergeAccountCreateBuilder();
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


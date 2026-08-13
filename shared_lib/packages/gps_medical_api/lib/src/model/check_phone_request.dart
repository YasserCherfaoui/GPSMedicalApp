//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/country_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'check_phone_request.g.dart';

/// CheckPhoneRequest
///
/// Properties:
/// * [phone] - Numéro mobile au format E.164 — Algérie (`+213[5-7]########`) ou Tunisie (`+216[2459]#######`). Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (`DZ` ↔ `+213`, `TN` ↔ `+216`) ; sinon `422 phone_country_mismatch`. 
/// * [country] - Doit correspondre à l'indicatif du `phone` (`DZ`↔`+213`, `TN`↔`+216`) — sinon `422 phone_country_mismatch`. 
@BuiltValue()
abstract class CheckPhoneRequest implements Built<CheckPhoneRequest, CheckPhoneRequestBuilder> {
  /// Numéro mobile au format E.164 — Algérie (`+213[5-7]########`) ou Tunisie (`+216[2459]#######`). Lors de l'inscription / check-phone, l'indicatif doit correspondre au `country` déclaré (`DZ` ↔ `+213`, `TN` ↔ `+216`) ; sinon `422 phone_country_mismatch`. 
  @BuiltValueField(wireName: r'phone')
  String get phone;

  /// Doit correspondre à l'indicatif du `phone` (`DZ`↔`+213`, `TN`↔`+216`) — sinon `422 phone_country_mismatch`. 
  @BuiltValueField(wireName: r'country')
  CountryCode get country;
  // enum countryEnum {  DZ,  TN,  };

  CheckPhoneRequest._();

  factory CheckPhoneRequest([void updates(CheckPhoneRequestBuilder b)]) = _$CheckPhoneRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CheckPhoneRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CheckPhoneRequest> get serializer => _$CheckPhoneRequestSerializer();
}

class _$CheckPhoneRequestSerializer implements PrimitiveSerializer<CheckPhoneRequest> {
  @override
  final Iterable<Type> types = const [CheckPhoneRequest, _$CheckPhoneRequest];

  @override
  final String wireName = r'CheckPhoneRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CheckPhoneRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
    yield r'country';
    yield serializers.serialize(
      object.country,
      specifiedType: const FullType(CountryCode),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    CheckPhoneRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CheckPhoneRequestBuilder result,
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
  CheckPhoneRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CheckPhoneRequestBuilder();
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


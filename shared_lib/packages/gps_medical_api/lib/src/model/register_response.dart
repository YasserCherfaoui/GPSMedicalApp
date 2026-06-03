//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'register_response.g.dart';

/// RegisterResponse
///
/// Properties:
/// * [userId] 
/// * [otpExpiresAt] 
/// * [ninVerificationStatus] - État courant de la vérification du NIN. `pending` si l'API gouvernementale est désactivée, indisponible ou n'a pas encore répondu ; `verified` si confirmée ; `failed` si l'API a répondu avec un rejet explicite (l'inscription a quand même abouti et le compte sera revu manuellement). 
@BuiltValue()
abstract class RegisterResponse implements Built<RegisterResponse, RegisterResponseBuilder> {
  @BuiltValueField(wireName: r'user_id')
  String get userId;

  @BuiltValueField(wireName: r'otp_expires_at')
  DateTime get otpExpiresAt;

  /// État courant de la vérification du NIN. `pending` si l'API gouvernementale est désactivée, indisponible ou n'a pas encore répondu ; `verified` si confirmée ; `failed` si l'API a répondu avec un rejet explicite (l'inscription a quand même abouti et le compte sera revu manuellement). 
  @BuiltValueField(wireName: r'nin_verification_status')
  RegisterResponseNinVerificationStatusEnum get ninVerificationStatus;
  // enum ninVerificationStatusEnum {  pending,  verified,  failed,  not_required,  };

  RegisterResponse._();

  factory RegisterResponse([void updates(RegisterResponseBuilder b)]) = _$RegisterResponse;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RegisterResponseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RegisterResponse> get serializer => _$RegisterResponseSerializer();
}

class _$RegisterResponseSerializer implements PrimitiveSerializer<RegisterResponse> {
  @override
  final Iterable<Type> types = const [RegisterResponse, _$RegisterResponse];

  @override
  final String wireName = r'RegisterResponse';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RegisterResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'user_id';
    yield serializers.serialize(
      object.userId,
      specifiedType: const FullType(String),
    );
    yield r'otp_expires_at';
    yield serializers.serialize(
      object.otpExpiresAt,
      specifiedType: const FullType(DateTime),
    );
    yield r'nin_verification_status';
    yield serializers.serialize(
      object.ninVerificationStatus,
      specifiedType: const FullType(RegisterResponseNinVerificationStatusEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RegisterResponse object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RegisterResponseBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.userId = valueDes;
          break;
        case r'otp_expires_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.otpExpiresAt = valueDes;
          break;
        case r'nin_verification_status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RegisterResponseNinVerificationStatusEnum),
          ) as RegisterResponseNinVerificationStatusEnum;
          result.ninVerificationStatus = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RegisterResponse deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RegisterResponseBuilder();
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

class RegisterResponseNinVerificationStatusEnum extends EnumClass {

  /// État courant de la vérification du NIN. `pending` si l'API gouvernementale est désactivée, indisponible ou n'a pas encore répondu ; `verified` si confirmée ; `failed` si l'API a répondu avec un rejet explicite (l'inscription a quand même abouti et le compte sera revu manuellement). 
  @BuiltValueEnumConst(wireName: r'pending')
  static const RegisterResponseNinVerificationStatusEnum pending = _$registerResponseNinVerificationStatusEnum_pending;
  /// État courant de la vérification du NIN. `pending` si l'API gouvernementale est désactivée, indisponible ou n'a pas encore répondu ; `verified` si confirmée ; `failed` si l'API a répondu avec un rejet explicite (l'inscription a quand même abouti et le compte sera revu manuellement). 
  @BuiltValueEnumConst(wireName: r'verified')
  static const RegisterResponseNinVerificationStatusEnum verified = _$registerResponseNinVerificationStatusEnum_verified;
  /// État courant de la vérification du NIN. `pending` si l'API gouvernementale est désactivée, indisponible ou n'a pas encore répondu ; `verified` si confirmée ; `failed` si l'API a répondu avec un rejet explicite (l'inscription a quand même abouti et le compte sera revu manuellement). 
  @BuiltValueEnumConst(wireName: r'failed')
  static const RegisterResponseNinVerificationStatusEnum failed = _$registerResponseNinVerificationStatusEnum_failed;
  /// État courant de la vérification du NIN. `pending` si l'API gouvernementale est désactivée, indisponible ou n'a pas encore répondu ; `verified` si confirmée ; `failed` si l'API a répondu avec un rejet explicite (l'inscription a quand même abouti et le compte sera revu manuellement). 
  @BuiltValueEnumConst(wireName: r'not_required')
  static const RegisterResponseNinVerificationStatusEnum notRequired = _$registerResponseNinVerificationStatusEnum_notRequired;

  static Serializer<RegisterResponseNinVerificationStatusEnum> get serializer => _$registerResponseNinVerificationStatusEnumSerializer;

  const RegisterResponseNinVerificationStatusEnum._(String name): super(name);

  static BuiltSet<RegisterResponseNinVerificationStatusEnum> get values => _$registerResponseNinVerificationStatusEnumValues;
  static RegisterResponseNinVerificationStatusEnum valueOf(String name) => _$registerResponseNinVerificationStatusEnumValueOf(name);
}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'jwks_keys_inner.g.dart';

/// JWKSKeysInner
///
/// Properties:
/// * [kty]
/// * [use]
/// * [alg]
/// * [kid]
/// * [n] - Modulus RSA (base64url)
/// * [e] - Exposant RSA (base64url)
@BuiltValue()
abstract class JWKSKeysInner
    implements Built<JWKSKeysInner, JWKSKeysInnerBuilder> {
  @BuiltValueField(wireName: r'kty')
  String get kty;

  @BuiltValueField(wireName: r'use')
  String get use;

  @BuiltValueField(wireName: r'alg')
  String get alg;

  @BuiltValueField(wireName: r'kid')
  String get kid;

  /// Modulus RSA (base64url)
  @BuiltValueField(wireName: r'n')
  String get n;

  /// Exposant RSA (base64url)
  @BuiltValueField(wireName: r'e')
  String get e;

  JWKSKeysInner._();

  factory JWKSKeysInner([void updates(JWKSKeysInnerBuilder b)]) =
      _$JWKSKeysInner;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JWKSKeysInnerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JWKSKeysInner> get serializer =>
      _$JWKSKeysInnerSerializer();
}

class _$JWKSKeysInnerSerializer implements PrimitiveSerializer<JWKSKeysInner> {
  @override
  final Iterable<Type> types = const [JWKSKeysInner, _$JWKSKeysInner];

  @override
  final String wireName = r'JWKSKeysInner';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JWKSKeysInner object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'kty';
    yield serializers.serialize(
      object.kty,
      specifiedType: const FullType(String),
    );
    yield r'use';
    yield serializers.serialize(
      object.use,
      specifiedType: const FullType(String),
    );
    yield r'alg';
    yield serializers.serialize(
      object.alg,
      specifiedType: const FullType(String),
    );
    yield r'kid';
    yield serializers.serialize(
      object.kid,
      specifiedType: const FullType(String),
    );
    yield r'n';
    yield serializers.serialize(
      object.n,
      specifiedType: const FullType(String),
    );
    yield r'e';
    yield serializers.serialize(
      object.e,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    JWKSKeysInner object, {
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
    required JWKSKeysInnerBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'kty':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.kty = valueDes;
          break;
        case r'use':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.use = valueDes;
          break;
        case r'alg':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.alg = valueDes;
          break;
        case r'kid':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.kid = valueDes;
          break;
        case r'n':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.n = valueDes;
          break;
        case r'e':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.e = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JWKSKeysInner deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JWKSKeysInnerBuilder();
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

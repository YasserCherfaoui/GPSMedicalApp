//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/jwks_keys_inner.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'jwks.g.dart';

/// JWKS
///
/// Properties:
/// * [keys] 
@BuiltValue()
abstract class JWKS implements Built<JWKS, JWKSBuilder> {
  @BuiltValueField(wireName: r'keys')
  BuiltList<JWKSKeysInner> get keys;

  JWKS._();

  factory JWKS([void updates(JWKSBuilder b)]) = _$JWKS;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(JWKSBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<JWKS> get serializer => _$JWKSSerializer();
}

class _$JWKSSerializer implements PrimitiveSerializer<JWKS> {
  @override
  final Iterable<Type> types = const [JWKS, _$JWKS];

  @override
  final String wireName = r'JWKS';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    JWKS object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'keys';
    yield serializers.serialize(
      object.keys,
      specifiedType: const FullType(BuiltList, [FullType(JWKSKeysInner)]),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    JWKS object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required JWKSBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'keys':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(JWKSKeysInner)]),
          ) as BuiltList<JWKSKeysInner>;
          result.keys.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  JWKS deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = JWKSBuilder();
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


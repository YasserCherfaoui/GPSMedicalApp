//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'turn_credentials.g.dart';

/// TurnCredentials
///
/// Properties:
/// * [username]
/// * [credential]
/// * [ttlSeconds]
/// * [urls]
@BuiltValue()
abstract class TurnCredentials
    implements Built<TurnCredentials, TurnCredentialsBuilder> {
  @BuiltValueField(wireName: r'username')
  String? get username;

  @BuiltValueField(wireName: r'credential')
  String? get credential;

  @BuiltValueField(wireName: r'ttl_seconds')
  int? get ttlSeconds;

  @BuiltValueField(wireName: r'urls')
  BuiltList<String>? get urls;

  TurnCredentials._();

  factory TurnCredentials([void updates(TurnCredentialsBuilder b)]) =
      _$TurnCredentials;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TurnCredentialsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TurnCredentials> get serializer =>
      _$TurnCredentialsSerializer();
}

class _$TurnCredentialsSerializer
    implements PrimitiveSerializer<TurnCredentials> {
  @override
  final Iterable<Type> types = const [TurnCredentials, _$TurnCredentials];

  @override
  final String wireName = r'TurnCredentials';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TurnCredentials object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.username != null) {
      yield r'username';
      yield serializers.serialize(
        object.username,
        specifiedType: const FullType(String),
      );
    }
    if (object.credential != null) {
      yield r'credential';
      yield serializers.serialize(
        object.credential,
        specifiedType: const FullType(String),
      );
    }
    if (object.ttlSeconds != null) {
      yield r'ttl_seconds';
      yield serializers.serialize(
        object.ttlSeconds,
        specifiedType: const FullType(int),
      );
    }
    if (object.urls != null) {
      yield r'urls';
      yield serializers.serialize(
        object.urls,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TurnCredentials object, {
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
    required TurnCredentialsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'username':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.username = valueDes;
          break;
        case r'credential':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.credential = valueDes;
          break;
        case r'ttl_seconds':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.ttlSeconds = valueDes;
          break;
        case r'urls':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.urls.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TurnCredentials deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TurnCredentialsBuilder();
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

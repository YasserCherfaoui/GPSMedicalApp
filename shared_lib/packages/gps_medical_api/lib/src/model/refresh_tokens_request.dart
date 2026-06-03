//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'refresh_tokens_request.g.dart';

/// RefreshTokensRequest
///
/// Properties:
/// * [refreshToken] 
@BuiltValue()
abstract class RefreshTokensRequest implements Built<RefreshTokensRequest, RefreshTokensRequestBuilder> {
  @BuiltValueField(wireName: r'refresh_token')
  String get refreshToken;

  RefreshTokensRequest._();

  factory RefreshTokensRequest([void updates(RefreshTokensRequestBuilder b)]) = _$RefreshTokensRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RefreshTokensRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RefreshTokensRequest> get serializer => _$RefreshTokensRequestSerializer();
}

class _$RefreshTokensRequestSerializer implements PrimitiveSerializer<RefreshTokensRequest> {
  @override
  final Iterable<Type> types = const [RefreshTokensRequest, _$RefreshTokensRequest];

  @override
  final String wireName = r'RefreshTokensRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RefreshTokensRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'refresh_token';
    yield serializers.serialize(
      object.refreshToken,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    RefreshTokensRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RefreshTokensRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'refresh_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.refreshToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RefreshTokensRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RefreshTokensRequestBuilder();
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


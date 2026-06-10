//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'confirm_payment_intent_request.g.dart';

/// ConfirmPaymentIntentRequest
///
/// Properties:
/// * [gatewayToken] 
@BuiltValue()
abstract class ConfirmPaymentIntentRequest implements Built<ConfirmPaymentIntentRequest, ConfirmPaymentIntentRequestBuilder> {
  @BuiltValueField(wireName: r'gateway_token')
  String get gatewayToken;

  ConfirmPaymentIntentRequest._();

  factory ConfirmPaymentIntentRequest([void updates(ConfirmPaymentIntentRequestBuilder b)]) = _$ConfirmPaymentIntentRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConfirmPaymentIntentRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConfirmPaymentIntentRequest> get serializer => _$ConfirmPaymentIntentRequestSerializer();
}

class _$ConfirmPaymentIntentRequestSerializer implements PrimitiveSerializer<ConfirmPaymentIntentRequest> {
  @override
  final Iterable<Type> types = const [ConfirmPaymentIntentRequest, _$ConfirmPaymentIntentRequest];

  @override
  final String wireName = r'ConfirmPaymentIntentRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConfirmPaymentIntentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'gateway_token';
    yield serializers.serialize(
      object.gatewayToken,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConfirmPaymentIntentRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConfirmPaymentIntentRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'gateway_token':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.gatewayToken = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConfirmPaymentIntentRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConfirmPaymentIntentRequestBuilder();
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


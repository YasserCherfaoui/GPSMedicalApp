//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payments_intents_intent_id_confirm_post_request.g.dart';

/// PaymentsIntentsIntentIdConfirmPostRequest
///
/// Properties:
/// * [gatewayToken]
@BuiltValue()
abstract class PaymentsIntentsIntentIdConfirmPostRequest
    implements
        Built<
          PaymentsIntentsIntentIdConfirmPostRequest,
          PaymentsIntentsIntentIdConfirmPostRequestBuilder
        > {
  @BuiltValueField(wireName: r'gateway_token')
  String get gatewayToken;

  PaymentsIntentsIntentIdConfirmPostRequest._();

  factory PaymentsIntentsIntentIdConfirmPostRequest([
    void updates(PaymentsIntentsIntentIdConfirmPostRequestBuilder b),
  ]) = _$PaymentsIntentsIntentIdConfirmPostRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentsIntentsIntentIdConfirmPostRequestBuilder b) =>
      b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentsIntentsIntentIdConfirmPostRequest> get serializer =>
      _$PaymentsIntentsIntentIdConfirmPostRequestSerializer();
}

class _$PaymentsIntentsIntentIdConfirmPostRequestSerializer
    implements PrimitiveSerializer<PaymentsIntentsIntentIdConfirmPostRequest> {
  @override
  final Iterable<Type> types = const [
    PaymentsIntentsIntentIdConfirmPostRequest,
    _$PaymentsIntentsIntentIdConfirmPostRequest,
  ];

  @override
  final String wireName = r'PaymentsIntentsIntentIdConfirmPostRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentsIntentsIntentIdConfirmPostRequest object, {
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
    PaymentsIntentsIntentIdConfirmPostRequest object, {
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
    required PaymentsIntentsIntentIdConfirmPostRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'gateway_token':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
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
  PaymentsIntentsIntentIdConfirmPostRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentsIntentsIntentIdConfirmPostRequestBuilder();
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

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'resend_otp_request.g.dart';

/// ResendOtpRequest
///
/// Properties:
/// * [phone] - Numéro algérien au format E.164
@BuiltValue()
abstract class ResendOtpRequest
    implements Built<ResendOtpRequest, ResendOtpRequestBuilder> {
  /// Numéro algérien au format E.164
  @BuiltValueField(wireName: r'phone')
  String get phone;

  ResendOtpRequest._();

  factory ResendOtpRequest([void updates(ResendOtpRequestBuilder b)]) =
      _$ResendOtpRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ResendOtpRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ResendOtpRequest> get serializer =>
      _$ResendOtpRequestSerializer();
}

class _$ResendOtpRequestSerializer
    implements PrimitiveSerializer<ResendOtpRequest> {
  @override
  final Iterable<Type> types = const [ResendOtpRequest, _$ResendOtpRequest];

  @override
  final String wireName = r'ResendOtpRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ResendOtpRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'phone';
    yield serializers.serialize(
      object.phone,
      specifiedType: const FullType(String),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ResendOtpRequest object, {
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
    required ResendOtpRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'phone':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.phone = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ResendOtpRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ResendOtpRequestBuilder();
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

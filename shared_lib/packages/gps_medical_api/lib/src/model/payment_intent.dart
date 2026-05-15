//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_intent.g.dart';

/// PaymentIntent
///
/// Properties:
/// * [id]
/// * [purpose]
/// * [appointmentId]
/// * [amountDzd]
/// * [provider]
/// * [status]
/// * [clientSecret] - Secret transmis au SDK gateway
/// * [redirectUrl]
/// * [createdAt]
@BuiltValue()
abstract class PaymentIntent
    implements Built<PaymentIntent, PaymentIntentBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'purpose')
  String? get purpose;

  @BuiltValueField(wireName: r'appointment_id')
  String? get appointmentId;

  @BuiltValueField(wireName: r'amount_dzd')
  int? get amountDzd;

  @BuiltValueField(wireName: r'provider')
  String? get provider;

  @BuiltValueField(wireName: r'status')
  PaymentIntentStatusEnum? get status;
  // enum statusEnum {  created,  requires_action,  processing,  succeeded,  failed,  cancelled,  };

  /// Secret transmis au SDK gateway
  @BuiltValueField(wireName: r'client_secret')
  String? get clientSecret;

  @BuiltValueField(wireName: r'redirect_url')
  String? get redirectUrl;

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  PaymentIntent._();

  factory PaymentIntent([void updates(PaymentIntentBuilder b)]) =
      _$PaymentIntent;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentIntentBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentIntent> get serializer =>
      _$PaymentIntentSerializer();
}

class _$PaymentIntentSerializer implements PrimitiveSerializer<PaymentIntent> {
  @override
  final Iterable<Type> types = const [PaymentIntent, _$PaymentIntent];

  @override
  final String wireName = r'PaymentIntent';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentIntent object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.purpose != null) {
      yield r'purpose';
      yield serializers.serialize(
        object.purpose,
        specifiedType: const FullType(String),
      );
    }
    if (object.appointmentId != null) {
      yield r'appointment_id';
      yield serializers.serialize(
        object.appointmentId,
        specifiedType: const FullType(String),
      );
    }
    if (object.amountDzd != null) {
      yield r'amount_dzd';
      yield serializers.serialize(
        object.amountDzd,
        specifiedType: const FullType(int),
      );
    }
    if (object.provider != null) {
      yield r'provider';
      yield serializers.serialize(
        object.provider,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(PaymentIntentStatusEnum),
      );
    }
    if (object.clientSecret != null) {
      yield r'client_secret';
      yield serializers.serialize(
        object.clientSecret,
        specifiedType: const FullType(String),
      );
    }
    if (object.redirectUrl != null) {
      yield r'redirect_url';
      yield serializers.serialize(
        object.redirectUrl,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.createdAt != null) {
      yield r'created_at';
      yield serializers.serialize(
        object.createdAt,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaymentIntent object, {
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
    required PaymentIntentBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.id = valueDes;
          break;
        case r'purpose':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.purpose = valueDes;
          break;
        case r'appointment_id':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.appointmentId = valueDes;
          break;
        case r'amount_dzd':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.amountDzd = valueDes;
          break;
        case r'provider':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.provider = valueDes;
          break;
        case r'status':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(PaymentIntentStatusEnum),
                  )
                  as PaymentIntentStatusEnum;
          result.status = valueDes;
          break;
        case r'client_secret':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.clientSecret = valueDes;
          break;
        case r'redirect_url':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType.nullable(String),
                  )
                  as String?;
          if (valueDes == null) continue;
          result.redirectUrl = valueDes;
          break;
        case r'created_at':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(DateTime),
                  )
                  as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaymentIntent deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentIntentBuilder();
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

class PaymentIntentStatusEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'created')
  static const PaymentIntentStatusEnum created =
      _$paymentIntentStatusEnum_created;
  @BuiltValueEnumConst(wireName: r'requires_action')
  static const PaymentIntentStatusEnum requiresAction =
      _$paymentIntentStatusEnum_requiresAction;
  @BuiltValueEnumConst(wireName: r'processing')
  static const PaymentIntentStatusEnum processing =
      _$paymentIntentStatusEnum_processing;
  @BuiltValueEnumConst(wireName: r'succeeded')
  static const PaymentIntentStatusEnum succeeded =
      _$paymentIntentStatusEnum_succeeded;
  @BuiltValueEnumConst(wireName: r'failed')
  static const PaymentIntentStatusEnum failed =
      _$paymentIntentStatusEnum_failed;
  @BuiltValueEnumConst(wireName: r'cancelled')
  static const PaymentIntentStatusEnum cancelled =
      _$paymentIntentStatusEnum_cancelled;

  static Serializer<PaymentIntentStatusEnum> get serializer =>
      _$paymentIntentStatusEnumSerializer;

  const PaymentIntentStatusEnum._(String name) : super(name);

  static BuiltSet<PaymentIntentStatusEnum> get values =>
      _$paymentIntentStatusEnumValues;
  static PaymentIntentStatusEnum valueOf(String name) =>
      _$paymentIntentStatusEnumValueOf(name);
}

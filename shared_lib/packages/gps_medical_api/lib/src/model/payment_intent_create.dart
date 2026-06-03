//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_intent_create.g.dart';

/// PaymentIntentCreate
///
/// Properties:
/// * [purpose] 
/// * [appointmentId] 
/// * [amountDzd] 
/// * [provider] 
/// * [returnUrl] 
@BuiltValue()
abstract class PaymentIntentCreate implements Built<PaymentIntentCreate, PaymentIntentCreateBuilder> {
  @BuiltValueField(wireName: r'purpose')
  PaymentIntentCreatePurposeEnum get purpose;
  // enum purposeEnum {  appointment_deposit,  teleconsultation,  full_consultation,  };

  @BuiltValueField(wireName: r'appointment_id')
  String? get appointmentId;

  @BuiltValueField(wireName: r'amount_dzd')
  int get amountDzd;

  @BuiltValueField(wireName: r'provider')
  PaymentIntentCreateProviderEnum get provider;
  // enum providerEnum {  satim,  edahabia,  cib,  };

  @BuiltValueField(wireName: r'return_url')
  String? get returnUrl;

  PaymentIntentCreate._();

  factory PaymentIntentCreate([void updates(PaymentIntentCreateBuilder b)]) = _$PaymentIntentCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentIntentCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentIntentCreate> get serializer => _$PaymentIntentCreateSerializer();
}

class _$PaymentIntentCreateSerializer implements PrimitiveSerializer<PaymentIntentCreate> {
  @override
  final Iterable<Type> types = const [PaymentIntentCreate, _$PaymentIntentCreate];

  @override
  final String wireName = r'PaymentIntentCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentIntentCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'purpose';
    yield serializers.serialize(
      object.purpose,
      specifiedType: const FullType(PaymentIntentCreatePurposeEnum),
    );
    if (object.appointmentId != null) {
      yield r'appointment_id';
      yield serializers.serialize(
        object.appointmentId,
        specifiedType: const FullType(String),
      );
    }
    yield r'amount_dzd';
    yield serializers.serialize(
      object.amountDzd,
      specifiedType: const FullType(int),
    );
    yield r'provider';
    yield serializers.serialize(
      object.provider,
      specifiedType: const FullType(PaymentIntentCreateProviderEnum),
    );
    if (object.returnUrl != null) {
      yield r'return_url';
      yield serializers.serialize(
        object.returnUrl,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaymentIntentCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaymentIntentCreateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'purpose':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentIntentCreatePurposeEnum),
          ) as PaymentIntentCreatePurposeEnum;
          result.purpose = valueDes;
          break;
        case r'appointment_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.appointmentId = valueDes;
          break;
        case r'amount_dzd':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.amountDzd = valueDes;
          break;
        case r'provider':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentIntentCreateProviderEnum),
          ) as PaymentIntentCreateProviderEnum;
          result.provider = valueDes;
          break;
        case r'return_url':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.returnUrl = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PaymentIntentCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentIntentCreateBuilder();
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

class PaymentIntentCreatePurposeEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'appointment_deposit')
  static const PaymentIntentCreatePurposeEnum appointmentDeposit = _$paymentIntentCreatePurposeEnum_appointmentDeposit;
  @BuiltValueEnumConst(wireName: r'teleconsultation')
  static const PaymentIntentCreatePurposeEnum teleconsultation = _$paymentIntentCreatePurposeEnum_teleconsultation;
  @BuiltValueEnumConst(wireName: r'full_consultation')
  static const PaymentIntentCreatePurposeEnum fullConsultation = _$paymentIntentCreatePurposeEnum_fullConsultation;

  static Serializer<PaymentIntentCreatePurposeEnum> get serializer => _$paymentIntentCreatePurposeEnumSerializer;

  const PaymentIntentCreatePurposeEnum._(String name): super(name);

  static BuiltSet<PaymentIntentCreatePurposeEnum> get values => _$paymentIntentCreatePurposeEnumValues;
  static PaymentIntentCreatePurposeEnum valueOf(String name) => _$paymentIntentCreatePurposeEnumValueOf(name);
}

class PaymentIntentCreateProviderEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'satim')
  static const PaymentIntentCreateProviderEnum satim = _$paymentIntentCreateProviderEnum_satim;
  @BuiltValueEnumConst(wireName: r'edahabia')
  static const PaymentIntentCreateProviderEnum edahabia = _$paymentIntentCreateProviderEnum_edahabia;
  @BuiltValueEnumConst(wireName: r'cib')
  static const PaymentIntentCreateProviderEnum cib = _$paymentIntentCreateProviderEnum_cib;

  static Serializer<PaymentIntentCreateProviderEnum> get serializer => _$paymentIntentCreateProviderEnumSerializer;

  const PaymentIntentCreateProviderEnum._(String name): super(name);

  static BuiltSet<PaymentIntentCreateProviderEnum> get values => _$paymentIntentCreateProviderEnumValues;
  static PaymentIntentCreateProviderEnum valueOf(String name) => _$paymentIntentCreateProviderEnumValueOf(name);
}


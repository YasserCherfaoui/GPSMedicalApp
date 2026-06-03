//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'refund_request.g.dart';

/// RefundRequest
///
/// Properties:
/// * [paymentIntentId] 
/// * [amountDzd] - Si absent, remboursement total
/// * [reason] 
/// * [comment] 
@BuiltValue()
abstract class RefundRequest implements Built<RefundRequest, RefundRequestBuilder> {
  @BuiltValueField(wireName: r'payment_intent_id')
  String get paymentIntentId;

  /// Si absent, remboursement total
  @BuiltValueField(wireName: r'amount_dzd')
  int? get amountDzd;

  @BuiltValueField(wireName: r'reason')
  RefundRequestReasonEnum get reason;
  // enum reasonEnum {  appointment_cancelled,  doctor_no_show,  duplicate,  other,  };

  @BuiltValueField(wireName: r'comment')
  String? get comment;

  RefundRequest._();

  factory RefundRequest([void updates(RefundRequestBuilder b)]) = _$RefundRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RefundRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RefundRequest> get serializer => _$RefundRequestSerializer();
}

class _$RefundRequestSerializer implements PrimitiveSerializer<RefundRequest> {
  @override
  final Iterable<Type> types = const [RefundRequest, _$RefundRequest];

  @override
  final String wireName = r'RefundRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RefundRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'payment_intent_id';
    yield serializers.serialize(
      object.paymentIntentId,
      specifiedType: const FullType(String),
    );
    if (object.amountDzd != null) {
      yield r'amount_dzd';
      yield serializers.serialize(
        object.amountDzd,
        specifiedType: const FullType(int),
      );
    }
    yield r'reason';
    yield serializers.serialize(
      object.reason,
      specifiedType: const FullType(RefundRequestReasonEnum),
    );
    if (object.comment != null) {
      yield r'comment';
      yield serializers.serialize(
        object.comment,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RefundRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RefundRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'payment_intent_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.paymentIntentId = valueDes;
          break;
        case r'amount_dzd':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.amountDzd = valueDes;
          break;
        case r'reason':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RefundRequestReasonEnum),
          ) as RefundRequestReasonEnum;
          result.reason = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RefundRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RefundRequestBuilder();
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

class RefundRequestReasonEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'appointment_cancelled')
  static const RefundRequestReasonEnum appointmentCancelled = _$refundRequestReasonEnum_appointmentCancelled;
  @BuiltValueEnumConst(wireName: r'doctor_no_show')
  static const RefundRequestReasonEnum doctorNoShow = _$refundRequestReasonEnum_doctorNoShow;
  @BuiltValueEnumConst(wireName: r'duplicate')
  static const RefundRequestReasonEnum duplicate = _$refundRequestReasonEnum_duplicate;
  @BuiltValueEnumConst(wireName: r'other')
  static const RefundRequestReasonEnum other = _$refundRequestReasonEnum_other;

  static Serializer<RefundRequestReasonEnum> get serializer => _$refundRequestReasonEnumSerializer;

  const RefundRequestReasonEnum._(String name): super(name);

  static BuiltSet<RefundRequestReasonEnum> get values => _$refundRequestReasonEnumValues;
  static RefundRequestReasonEnum valueOf(String name) => _$refundRequestReasonEnumValueOf(name);
}


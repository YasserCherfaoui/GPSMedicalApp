//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'refund.g.dart';

/// Refund
///
/// Properties:
/// * [id] 
/// * [paymentIntentId] 
/// * [amountDzd] 
/// * [status] 
/// * [createdAt] 
@BuiltValue()
abstract class Refund implements Built<Refund, RefundBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'payment_intent_id')
  String? get paymentIntentId;

  @BuiltValueField(wireName: r'amount_dzd')
  int? get amountDzd;

  @BuiltValueField(wireName: r'status')
  RefundStatusEnum? get status;
  // enum statusEnum {  pending,  succeeded,  failed,  };

  @BuiltValueField(wireName: r'created_at')
  DateTime? get createdAt;

  Refund._();

  factory Refund([void updates(RefundBuilder b)]) = _$Refund;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RefundBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Refund> get serializer => _$RefundSerializer();
}

class _$RefundSerializer implements PrimitiveSerializer<Refund> {
  @override
  final Iterable<Type> types = const [Refund, _$Refund];

  @override
  final String wireName = r'Refund';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Refund object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.paymentIntentId != null) {
      yield r'payment_intent_id';
      yield serializers.serialize(
        object.paymentIntentId,
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
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(RefundStatusEnum),
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
    Refund object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RefundBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
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
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(RefundStatusEnum),
          ) as RefundStatusEnum;
          result.status = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
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
  Refund deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RefundBuilder();
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

class RefundStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'pending')
  static const RefundStatusEnum pending = _$refundStatusEnum_pending;
  @BuiltValueEnumConst(wireName: r'succeeded')
  static const RefundStatusEnum succeeded = _$refundStatusEnum_succeeded;
  @BuiltValueEnumConst(wireName: r'failed')
  static const RefundStatusEnum failed = _$refundStatusEnum_failed;

  static Serializer<RefundStatusEnum> get serializer => _$refundStatusEnumSerializer;

  const RefundStatusEnum._(String name): super(name);

  static BuiltSet<RefundStatusEnum> get values => _$refundStatusEnumValues;
  static RefundStatusEnum valueOf(String name) => _$refundStatusEnumValueOf(name);
}


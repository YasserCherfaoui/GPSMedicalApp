//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/currency_code.dart';
import 'package:gps_medical_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_earnings.g.dart';

/// ClinicEarnings
///
/// Properties:
/// * [from] 
/// * [to] 
/// * [completedSessions] 
/// * [amountPayable] 
/// * [currency] 
/// * [note] - Banner copy — aucun paiement réel en phase pilote
@BuiltValue()
abstract class ClinicEarnings implements Built<ClinicEarnings, ClinicEarningsBuilder> {
  @BuiltValueField(wireName: r'from')
  Date? get from;

  @BuiltValueField(wireName: r'to')
  Date? get to;

  @BuiltValueField(wireName: r'completed_sessions')
  int? get completedSessions;

  @BuiltValueField(wireName: r'amount_payable')
  int? get amountPayable;

  @BuiltValueField(wireName: r'currency')
  CurrencyCode? get currency;
  // enum currencyEnum {  DZD,  TND,  EUR,  };

  /// Banner copy — aucun paiement réel en phase pilote
  @BuiltValueField(wireName: r'note')
  String? get note;

  ClinicEarnings._();

  factory ClinicEarnings([void updates(ClinicEarningsBuilder b)]) = _$ClinicEarnings;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicEarningsBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicEarnings> get serializer => _$ClinicEarningsSerializer();
}

class _$ClinicEarningsSerializer implements PrimitiveSerializer<ClinicEarnings> {
  @override
  final Iterable<Type> types = const [ClinicEarnings, _$ClinicEarnings];

  @override
  final String wireName = r'ClinicEarnings';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicEarnings object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.from != null) {
      yield r'from';
      yield serializers.serialize(
        object.from,
        specifiedType: const FullType(Date),
      );
    }
    if (object.to != null) {
      yield r'to';
      yield serializers.serialize(
        object.to,
        specifiedType: const FullType(Date),
      );
    }
    if (object.completedSessions != null) {
      yield r'completed_sessions';
      yield serializers.serialize(
        object.completedSessions,
        specifiedType: const FullType(int),
      );
    }
    if (object.amountPayable != null) {
      yield r'amount_payable';
      yield serializers.serialize(
        object.amountPayable,
        specifiedType: const FullType(int),
      );
    }
    if (object.currency != null) {
      yield r'currency';
      yield serializers.serialize(
        object.currency,
        specifiedType: const FullType(CurrencyCode),
      );
    }
    if (object.note != null) {
      yield r'note';
      yield serializers.serialize(
        object.note,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicEarnings object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicEarningsBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'from':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.from = valueDes;
          break;
        case r'to':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.to = valueDes;
          break;
        case r'completed_sessions':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.completedSessions = valueDes;
          break;
        case r'amount_payable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.amountPayable = valueDes;
          break;
        case r'currency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CurrencyCode),
          ) as CurrencyCode;
          result.currency = valueDes;
          break;
        case r'note':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.note = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicEarnings deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicEarningsBuilder();
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


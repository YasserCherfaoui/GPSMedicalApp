//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/currency_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_service_update.g.dart';

/// ClinicServiceUpdate
///
/// Properties:
/// * [name] 
/// * [description] 
/// * [durationMinutes] 
/// * [priceAmount] 
/// * [currency] 
/// * [offersTelehealth] 
/// * [acceptsCnas] 
/// * [acceptsCasnos] 
/// * [active] 
@BuiltValue()
abstract class ClinicServiceUpdate implements Built<ClinicServiceUpdate, ClinicServiceUpdateBuilder> {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'duration_minutes')
  ClinicServiceUpdateDurationMinutesEnum? get durationMinutes;
  // enum durationMinutesEnum {  10,  15,  20,  30,  45,  60,  };

  @BuiltValueField(wireName: r'price_amount')
  int? get priceAmount;

  @BuiltValueField(wireName: r'currency')
  CurrencyCode? get currency;
  // enum currencyEnum {  DZD,  TND,  EUR,  };

  @BuiltValueField(wireName: r'offers_telehealth')
  bool? get offersTelehealth;

  @BuiltValueField(wireName: r'accepts_cnas')
  bool? get acceptsCnas;

  @BuiltValueField(wireName: r'accepts_casnos')
  bool? get acceptsCasnos;

  @BuiltValueField(wireName: r'active')
  bool? get active;

  ClinicServiceUpdate._();

  factory ClinicServiceUpdate([void updates(ClinicServiceUpdateBuilder b)]) = _$ClinicServiceUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicServiceUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicServiceUpdate> get serializer => _$ClinicServiceUpdateSerializer();
}

class _$ClinicServiceUpdateSerializer implements PrimitiveSerializer<ClinicServiceUpdate> {
  @override
  final Iterable<Type> types = const [ClinicServiceUpdate, _$ClinicServiceUpdate];

  @override
  final String wireName = r'ClinicServiceUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicServiceUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    if (object.durationMinutes != null) {
      yield r'duration_minutes';
      yield serializers.serialize(
        object.durationMinutes,
        specifiedType: const FullType(ClinicServiceUpdateDurationMinutesEnum),
      );
    }
    if (object.priceAmount != null) {
      yield r'price_amount';
      yield serializers.serialize(
        object.priceAmount,
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
    if (object.offersTelehealth != null) {
      yield r'offers_telehealth';
      yield serializers.serialize(
        object.offersTelehealth,
        specifiedType: const FullType(bool),
      );
    }
    if (object.acceptsCnas != null) {
      yield r'accepts_cnas';
      yield serializers.serialize(
        object.acceptsCnas,
        specifiedType: const FullType(bool),
      );
    }
    if (object.acceptsCasnos != null) {
      yield r'accepts_casnos';
      yield serializers.serialize(
        object.acceptsCasnos,
        specifiedType: const FullType(bool),
      );
    }
    if (object.active != null) {
      yield r'active';
      yield serializers.serialize(
        object.active,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicServiceUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicServiceUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'duration_minutes':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicServiceUpdateDurationMinutesEnum),
          ) as ClinicServiceUpdateDurationMinutesEnum;
          result.durationMinutes = valueDes;
          break;
        case r'price_amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.priceAmount = valueDes;
          break;
        case r'currency':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CurrencyCode),
          ) as CurrencyCode;
          result.currency = valueDes;
          break;
        case r'offers_telehealth':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.offersTelehealth = valueDes;
          break;
        case r'accepts_cnas':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.acceptsCnas = valueDes;
          break;
        case r'accepts_casnos':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.acceptsCasnos = valueDes;
          break;
        case r'active':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.active = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicServiceUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicServiceUpdateBuilder();
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

class ClinicServiceUpdateDurationMinutesEnum extends EnumClass {

  @BuiltValueEnumConst(wireNumber: 10)
  static const ClinicServiceUpdateDurationMinutesEnum number10 = _$clinicServiceUpdateDurationMinutesEnum_number10;
  @BuiltValueEnumConst(wireNumber: 15)
  static const ClinicServiceUpdateDurationMinutesEnum number15 = _$clinicServiceUpdateDurationMinutesEnum_number15;
  @BuiltValueEnumConst(wireNumber: 20)
  static const ClinicServiceUpdateDurationMinutesEnum number20 = _$clinicServiceUpdateDurationMinutesEnum_number20;
  @BuiltValueEnumConst(wireNumber: 30)
  static const ClinicServiceUpdateDurationMinutesEnum number30 = _$clinicServiceUpdateDurationMinutesEnum_number30;
  @BuiltValueEnumConst(wireNumber: 45)
  static const ClinicServiceUpdateDurationMinutesEnum number45 = _$clinicServiceUpdateDurationMinutesEnum_number45;
  @BuiltValueEnumConst(wireNumber: 60)
  static const ClinicServiceUpdateDurationMinutesEnum number60 = _$clinicServiceUpdateDurationMinutesEnum_number60;

  static Serializer<ClinicServiceUpdateDurationMinutesEnum> get serializer => _$clinicServiceUpdateDurationMinutesEnumSerializer;

  const ClinicServiceUpdateDurationMinutesEnum._(String name): super(name);

  static BuiltSet<ClinicServiceUpdateDurationMinutesEnum> get values => _$clinicServiceUpdateDurationMinutesEnumValues;
  static ClinicServiceUpdateDurationMinutesEnum valueOf(String name) => _$clinicServiceUpdateDurationMinutesEnumValueOf(name);
}


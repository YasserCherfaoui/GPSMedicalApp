//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/currency_code.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_service_create.g.dart';

/// ClinicServiceCreate
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
@BuiltValue()
abstract class ClinicServiceCreate implements Built<ClinicServiceCreate, ClinicServiceCreateBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'duration_minutes')
  ClinicServiceCreateDurationMinutesEnum get durationMinutes;
  // enum durationMinutesEnum {  10,  15,  20,  30,  45,  60,  };

  @BuiltValueField(wireName: r'price_amount')
  int get priceAmount;

  @BuiltValueField(wireName: r'currency')
  CurrencyCode get currency;
  // enum currencyEnum {  DZD,  TND,  EUR,  };

  @BuiltValueField(wireName: r'offers_telehealth')
  bool? get offersTelehealth;

  @BuiltValueField(wireName: r'accepts_cnas')
  bool? get acceptsCnas;

  @BuiltValueField(wireName: r'accepts_casnos')
  bool? get acceptsCasnos;

  ClinicServiceCreate._();

  factory ClinicServiceCreate([void updates(ClinicServiceCreateBuilder b)]) = _$ClinicServiceCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicServiceCreateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicServiceCreate> get serializer => _$ClinicServiceCreateSerializer();
}

class _$ClinicServiceCreateSerializer implements PrimitiveSerializer<ClinicServiceCreate> {
  @override
  final Iterable<Type> types = const [ClinicServiceCreate, _$ClinicServiceCreate];

  @override
  final String wireName = r'ClinicServiceCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicServiceCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType(String),
      );
    }
    yield r'duration_minutes';
    yield serializers.serialize(
      object.durationMinutes,
      specifiedType: const FullType(ClinicServiceCreateDurationMinutesEnum),
    );
    yield r'price_amount';
    yield serializers.serialize(
      object.priceAmount,
      specifiedType: const FullType(int),
    );
    yield r'currency';
    yield serializers.serialize(
      object.currency,
      specifiedType: const FullType(CurrencyCode),
    );
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
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicServiceCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicServiceCreateBuilder result,
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
            specifiedType: const FullType(ClinicServiceCreateDurationMinutesEnum),
          ) as ClinicServiceCreateDurationMinutesEnum;
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
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicServiceCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicServiceCreateBuilder();
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

class ClinicServiceCreateDurationMinutesEnum extends EnumClass {

  @BuiltValueEnumConst(wireNumber: 10)
  static const ClinicServiceCreateDurationMinutesEnum number10 = _$clinicServiceCreateDurationMinutesEnum_number10;
  @BuiltValueEnumConst(wireNumber: 15)
  static const ClinicServiceCreateDurationMinutesEnum number15 = _$clinicServiceCreateDurationMinutesEnum_number15;
  @BuiltValueEnumConst(wireNumber: 20)
  static const ClinicServiceCreateDurationMinutesEnum number20 = _$clinicServiceCreateDurationMinutesEnum_number20;
  @BuiltValueEnumConst(wireNumber: 30)
  static const ClinicServiceCreateDurationMinutesEnum number30 = _$clinicServiceCreateDurationMinutesEnum_number30;
  @BuiltValueEnumConst(wireNumber: 45)
  static const ClinicServiceCreateDurationMinutesEnum number45 = _$clinicServiceCreateDurationMinutesEnum_number45;
  @BuiltValueEnumConst(wireNumber: 60)
  static const ClinicServiceCreateDurationMinutesEnum number60 = _$clinicServiceCreateDurationMinutesEnum_number60;

  static Serializer<ClinicServiceCreateDurationMinutesEnum> get serializer => _$clinicServiceCreateDurationMinutesEnumSerializer;

  const ClinicServiceCreateDurationMinutesEnum._(String name): super(name);

  static BuiltSet<ClinicServiceCreateDurationMinutesEnum> get values => _$clinicServiceCreateDurationMinutesEnumValues;
  static ClinicServiceCreateDurationMinutesEnum valueOf(String name) => _$clinicServiceCreateDurationMinutesEnumValueOf(name);
}


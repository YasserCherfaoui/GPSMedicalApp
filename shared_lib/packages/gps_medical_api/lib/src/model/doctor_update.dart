//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/address.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'doctor_update.g.dart';

/// DoctorUpdate
///
/// Properties:
/// * [bio]
/// * [photoUrl]
/// * [languages]
/// * [consultationFeeDzd]
/// * [acceptsCnas]
/// * [acceptsCasnos]
/// * [offersTelehealth]
/// * [practiceAddress]
/// * [confirmationPolicy]
/// * [bookingWindowDays]
/// * [specialtyIds]
@BuiltValue()
abstract class DoctorUpdate
    implements Built<DoctorUpdate, DoctorUpdateBuilder> {
  @BuiltValueField(wireName: r'bio')
  String? get bio;

  @BuiltValueField(wireName: r'photo_url')
  String? get photoUrl;

  @BuiltValueField(wireName: r'languages')
  BuiltList<DoctorUpdateLanguagesEnum>? get languages;
  // enum languagesEnum {  ar,  fr,  en,  ber,  };

  @BuiltValueField(wireName: r'consultation_fee_dzd')
  int? get consultationFeeDzd;

  @BuiltValueField(wireName: r'accepts_cnas')
  bool? get acceptsCnas;

  @BuiltValueField(wireName: r'accepts_casnos')
  bool? get acceptsCasnos;

  @BuiltValueField(wireName: r'offers_telehealth')
  bool? get offersTelehealth;

  @BuiltValueField(wireName: r'practice_address')
  Address? get practiceAddress;

  @BuiltValueField(wireName: r'confirmation_policy')
  DoctorUpdateConfirmationPolicyEnum? get confirmationPolicy;
  // enum confirmationPolicyEnum {  auto,  manual,  };

  @BuiltValueField(wireName: r'booking_window_days')
  int? get bookingWindowDays;

  @BuiltValueField(wireName: r'specialty_ids')
  BuiltList<String>? get specialtyIds;

  DoctorUpdate._();

  factory DoctorUpdate([void updates(DoctorUpdateBuilder b)]) = _$DoctorUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DoctorUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DoctorUpdate> get serializer => _$DoctorUpdateSerializer();
}

class _$DoctorUpdateSerializer implements PrimitiveSerializer<DoctorUpdate> {
  @override
  final Iterable<Type> types = const [DoctorUpdate, _$DoctorUpdate];

  @override
  final String wireName = r'DoctorUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DoctorUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.bio != null) {
      yield r'bio';
      yield serializers.serialize(
        object.bio,
        specifiedType: const FullType(String),
      );
    }
    if (object.photoUrl != null) {
      yield r'photo_url';
      yield serializers.serialize(
        object.photoUrl,
        specifiedType: const FullType(String),
      );
    }
    if (object.languages != null) {
      yield r'languages';
      yield serializers.serialize(
        object.languages,
        specifiedType: const FullType(BuiltList, [
          FullType(DoctorUpdateLanguagesEnum),
        ]),
      );
    }
    if (object.consultationFeeDzd != null) {
      yield r'consultation_fee_dzd';
      yield serializers.serialize(
        object.consultationFeeDzd,
        specifiedType: const FullType(int),
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
    if (object.offersTelehealth != null) {
      yield r'offers_telehealth';
      yield serializers.serialize(
        object.offersTelehealth,
        specifiedType: const FullType(bool),
      );
    }
    if (object.practiceAddress != null) {
      yield r'practice_address';
      yield serializers.serialize(
        object.practiceAddress,
        specifiedType: const FullType(Address),
      );
    }
    if (object.confirmationPolicy != null) {
      yield r'confirmation_policy';
      yield serializers.serialize(
        object.confirmationPolicy,
        specifiedType: const FullType(DoctorUpdateConfirmationPolicyEnum),
      );
    }
    if (object.bookingWindowDays != null) {
      yield r'booking_window_days';
      yield serializers.serialize(
        object.bookingWindowDays,
        specifiedType: const FullType(int),
      );
    }
    if (object.specialtyIds != null) {
      yield r'specialty_ids';
      yield serializers.serialize(
        object.specialtyIds,
        specifiedType: const FullType(BuiltList, [FullType(String)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DoctorUpdate object, {
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
    required DoctorUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'bio':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.bio = valueDes;
          break;
        case r'photo_url':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.photoUrl = valueDes;
          break;
        case r'languages':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(DoctorUpdateLanguagesEnum),
                    ]),
                  )
                  as BuiltList<DoctorUpdateLanguagesEnum>;
          result.languages.replace(valueDes);
          break;
        case r'consultation_fee_dzd':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.consultationFeeDzd = valueDes;
          break;
        case r'accepts_cnas':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.acceptsCnas = valueDes;
          break;
        case r'accepts_casnos':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.acceptsCasnos = valueDes;
          break;
        case r'offers_telehealth':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(bool),
                  )
                  as bool;
          result.offersTelehealth = valueDes;
          break;
        case r'practice_address':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Address),
                  )
                  as Address;
          result.practiceAddress.replace(valueDes);
          break;
        case r'confirmation_policy':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(
                      DoctorUpdateConfirmationPolicyEnum,
                    ),
                  )
                  as DoctorUpdateConfirmationPolicyEnum;
          result.confirmationPolicy = valueDes;
          break;
        case r'booking_window_days':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.bookingWindowDays = valueDes;
          break;
        case r'specialty_ids':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(String),
                    ]),
                  )
                  as BuiltList<String>;
          result.specialtyIds.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DoctorUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DoctorUpdateBuilder();
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

class DoctorUpdateLanguagesEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'ar')
  static const DoctorUpdateLanguagesEnum ar = _$doctorUpdateLanguagesEnum_ar;
  @BuiltValueEnumConst(wireName: r'fr')
  static const DoctorUpdateLanguagesEnum fr = _$doctorUpdateLanguagesEnum_fr;
  @BuiltValueEnumConst(wireName: r'en')
  static const DoctorUpdateLanguagesEnum en = _$doctorUpdateLanguagesEnum_en;
  @BuiltValueEnumConst(wireName: r'ber')
  static const DoctorUpdateLanguagesEnum ber = _$doctorUpdateLanguagesEnum_ber;

  static Serializer<DoctorUpdateLanguagesEnum> get serializer =>
      _$doctorUpdateLanguagesEnumSerializer;

  const DoctorUpdateLanguagesEnum._(String name) : super(name);

  static BuiltSet<DoctorUpdateLanguagesEnum> get values =>
      _$doctorUpdateLanguagesEnumValues;
  static DoctorUpdateLanguagesEnum valueOf(String name) =>
      _$doctorUpdateLanguagesEnumValueOf(name);
}

class DoctorUpdateConfirmationPolicyEnum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'auto')
  static const DoctorUpdateConfirmationPolicyEnum auto =
      _$doctorUpdateConfirmationPolicyEnum_auto;
  @BuiltValueEnumConst(wireName: r'manual')
  static const DoctorUpdateConfirmationPolicyEnum manual =
      _$doctorUpdateConfirmationPolicyEnum_manual;

  static Serializer<DoctorUpdateConfirmationPolicyEnum> get serializer =>
      _$doctorUpdateConfirmationPolicyEnumSerializer;

  const DoctorUpdateConfirmationPolicyEnum._(String name) : super(name);

  static BuiltSet<DoctorUpdateConfirmationPolicyEnum> get values =>
      _$doctorUpdateConfirmationPolicyEnumValues;
  static DoctorUpdateConfirmationPolicyEnum valueOf(String name) =>
      _$doctorUpdateConfirmationPolicyEnumValueOf(name);
}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_update.g.dart';

/// ClinicUpdate
///
/// Properties:
/// * [name] 
/// * [legalName] 
/// * [description] 
/// * [addressLine1] 
/// * [addressLine2] 
/// * [communeId] 
/// * [latitude] 
/// * [longitude] 
/// * [email] 
/// * [registreCommerce] 
/// * [agrementSante] 
/// * [confirmationPolicy] 
/// * [bookingWindowDays] 
@BuiltValue(instantiable: false)
abstract class ClinicUpdate  {
  @BuiltValueField(wireName: r'name')
  String? get name;

  @BuiltValueField(wireName: r'legal_name')
  String? get legalName;

  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'address_line1')
  String? get addressLine1;

  @BuiltValueField(wireName: r'address_line2')
  String? get addressLine2;

  @BuiltValueField(wireName: r'commune_id')
  String? get communeId;

  @BuiltValueField(wireName: r'latitude')
  double? get latitude;

  @BuiltValueField(wireName: r'longitude')
  double? get longitude;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'registre_commerce')
  String? get registreCommerce;

  @BuiltValueField(wireName: r'agrement_sante')
  String? get agrementSante;

  @BuiltValueField(wireName: r'confirmation_policy')
  ClinicUpdateConfirmationPolicyEnum? get confirmationPolicy;
  // enum confirmationPolicyEnum {  auto,  manual,  };

  @BuiltValueField(wireName: r'booking_window_days')
  int? get bookingWindowDays;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicUpdate> get serializer => _$ClinicUpdateSerializer();
}

class _$ClinicUpdateSerializer implements PrimitiveSerializer<ClinicUpdate> {
  @override
  final Iterable<Type> types = const [ClinicUpdate];

  @override
  final String wireName = r'ClinicUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType: const FullType(String),
      );
    }
    if (object.legalName != null) {
      yield r'legal_name';
      yield serializers.serialize(
        object.legalName,
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
    if (object.addressLine1 != null) {
      yield r'address_line1';
      yield serializers.serialize(
        object.addressLine1,
        specifiedType: const FullType(String),
      );
    }
    if (object.addressLine2 != null) {
      yield r'address_line2';
      yield serializers.serialize(
        object.addressLine2,
        specifiedType: const FullType(String),
      );
    }
    if (object.communeId != null) {
      yield r'commune_id';
      yield serializers.serialize(
        object.communeId,
        specifiedType: const FullType(String),
      );
    }
    if (object.latitude != null) {
      yield r'latitude';
      yield serializers.serialize(
        object.latitude,
        specifiedType: const FullType(double),
      );
    }
    if (object.longitude != null) {
      yield r'longitude';
      yield serializers.serialize(
        object.longitude,
        specifiedType: const FullType(double),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.registreCommerce != null) {
      yield r'registre_commerce';
      yield serializers.serialize(
        object.registreCommerce,
        specifiedType: const FullType(String),
      );
    }
    if (object.agrementSante != null) {
      yield r'agrement_sante';
      yield serializers.serialize(
        object.agrementSante,
        specifiedType: const FullType(String),
      );
    }
    if (object.confirmationPolicy != null) {
      yield r'confirmation_policy';
      yield serializers.serialize(
        object.confirmationPolicy,
        specifiedType: const FullType(ClinicUpdateConfirmationPolicyEnum),
      );
    }
    if (object.bookingWindowDays != null) {
      yield r'booking_window_days';
      yield serializers.serialize(
        object.bookingWindowDays,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  @override
  ClinicUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized, specifiedType: FullType($ClinicUpdate)) as $ClinicUpdate;
  }
}

/// a concrete implementation of [ClinicUpdate], since [ClinicUpdate] is not instantiable
@BuiltValue(instantiable: true)
abstract class $ClinicUpdate implements ClinicUpdate, Built<$ClinicUpdate, $ClinicUpdateBuilder> {
  $ClinicUpdate._();

  factory $ClinicUpdate([void Function($ClinicUpdateBuilder)? updates]) = _$$ClinicUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ClinicUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$ClinicUpdate> get serializer => _$$ClinicUpdateSerializer();
}

class _$$ClinicUpdateSerializer implements PrimitiveSerializer<$ClinicUpdate> {
  @override
  final Iterable<Type> types = const [$ClinicUpdate, _$$ClinicUpdate];

  @override
  final String wireName = r'$ClinicUpdate';

  @override
  Object serialize(
    Serializers serializers,
    $ClinicUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(ClinicUpdate))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicUpdateBuilder result,
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
        case r'legal_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.legalName = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'address_line1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.addressLine1 = valueDes;
          break;
        case r'address_line2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.addressLine2 = valueDes;
          break;
        case r'commune_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.communeId = valueDes;
          break;
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.latitude = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.longitude = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'registre_commerce':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.registreCommerce = valueDes;
          break;
        case r'agrement_sante':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.agrementSante = valueDes;
          break;
        case r'confirmation_policy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicUpdateConfirmationPolicyEnum),
          ) as ClinicUpdateConfirmationPolicyEnum;
          result.confirmationPolicy = valueDes;
          break;
        case r'booking_window_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.bookingWindowDays = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $ClinicUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $ClinicUpdateBuilder();
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

class ClinicUpdateConfirmationPolicyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'auto')
  static const ClinicUpdateConfirmationPolicyEnum auto = _$clinicUpdateConfirmationPolicyEnum_auto;
  @BuiltValueEnumConst(wireName: r'manual')
  static const ClinicUpdateConfirmationPolicyEnum manual = _$clinicUpdateConfirmationPolicyEnum_manual;

  static Serializer<ClinicUpdateConfirmationPolicyEnum> get serializer => _$clinicUpdateConfirmationPolicyEnumSerializer;

  const ClinicUpdateConfirmationPolicyEnum._(String name): super(name);

  static BuiltSet<ClinicUpdateConfirmationPolicyEnum> get values => _$clinicUpdateConfirmationPolicyEnumValues;
  static ClinicUpdateConfirmationPolicyEnum valueOf(String name) => _$clinicUpdateConfirmationPolicyEnumValueOf(name);
}


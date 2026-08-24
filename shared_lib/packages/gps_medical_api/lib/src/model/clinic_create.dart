//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_create.g.dart';

/// ClinicCreate
///
/// Properties:
/// * [name] 
/// * [legalName] 
/// * [description] 
/// * [countryCode] - ISO 3166-1 alpha-2. DZ, TN, et codes Schengen-UE. Activation `verified=true` hors DZ bloquée jusqu'à G-3. 
/// * [wilayaCode] 
/// * [communeId] 
/// * [addressLine1] 
/// * [addressLine2] 
/// * [latitude] 
/// * [longitude] 
/// * [email] 
/// * [registreCommerce] 
/// * [agrementSante] 
/// * [confirmationPolicy] 
@BuiltValue()
abstract class ClinicCreate implements Built<ClinicCreate, ClinicCreateBuilder> {
  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'legal_name')
  String? get legalName;

  @BuiltValueField(wireName: r'description')
  String? get description;

  /// ISO 3166-1 alpha-2. DZ, TN, et codes Schengen-UE. Activation `verified=true` hors DZ bloquée jusqu'à G-3. 
  @BuiltValueField(wireName: r'country_code')
  String get countryCode;

  @BuiltValueField(wireName: r'wilaya_code')
  String get wilayaCode;

  @BuiltValueField(wireName: r'commune_id')
  String? get communeId;

  @BuiltValueField(wireName: r'address_line1')
  String get addressLine1;

  @BuiltValueField(wireName: r'address_line2')
  String? get addressLine2;

  @BuiltValueField(wireName: r'latitude')
  double get latitude;

  @BuiltValueField(wireName: r'longitude')
  double get longitude;

  @BuiltValueField(wireName: r'email')
  String? get email;

  @BuiltValueField(wireName: r'registre_commerce')
  String? get registreCommerce;

  @BuiltValueField(wireName: r'agrement_sante')
  String? get agrementSante;

  @BuiltValueField(wireName: r'confirmation_policy')
  ClinicCreateConfirmationPolicyEnum? get confirmationPolicy;
  // enum confirmationPolicyEnum {  auto,  manual,  };

  ClinicCreate._();

  factory ClinicCreate([void updates(ClinicCreateBuilder b)]) = _$ClinicCreate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicCreateBuilder b) => b
      ..confirmationPolicy = ClinicCreateConfirmationPolicyEnum.valueOf('manual');

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicCreate> get serializer => _$ClinicCreateSerializer();
}

class _$ClinicCreateSerializer implements PrimitiveSerializer<ClinicCreate> {
  @override
  final Iterable<Type> types = const [ClinicCreate, _$ClinicCreate];

  @override
  final String wireName = r'ClinicCreate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
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
    yield r'country_code';
    yield serializers.serialize(
      object.countryCode,
      specifiedType: const FullType(String),
    );
    yield r'wilaya_code';
    yield serializers.serialize(
      object.wilayaCode,
      specifiedType: const FullType(String),
    );
    if (object.communeId != null) {
      yield r'commune_id';
      yield serializers.serialize(
        object.communeId,
        specifiedType: const FullType(String),
      );
    }
    yield r'address_line1';
    yield serializers.serialize(
      object.addressLine1,
      specifiedType: const FullType(String),
    );
    if (object.addressLine2 != null) {
      yield r'address_line2';
      yield serializers.serialize(
        object.addressLine2,
        specifiedType: const FullType(String),
      );
    }
    yield r'latitude';
    yield serializers.serialize(
      object.latitude,
      specifiedType: const FullType(double),
    );
    yield r'longitude';
    yield serializers.serialize(
      object.longitude,
      specifiedType: const FullType(double),
    );
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
        specifiedType: const FullType(ClinicCreateConfirmationPolicyEnum),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicCreate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicCreateBuilder result,
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
        case r'country_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.countryCode = valueDes;
          break;
        case r'wilaya_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.wilayaCode = valueDes;
          break;
        case r'commune_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.communeId = valueDes;
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
            specifiedType: const FullType(ClinicCreateConfirmationPolicyEnum),
          ) as ClinicCreateConfirmationPolicyEnum;
          result.confirmationPolicy = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicCreate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicCreateBuilder();
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

class ClinicCreateConfirmationPolicyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'auto')
  static const ClinicCreateConfirmationPolicyEnum auto = _$clinicCreateConfirmationPolicyEnum_auto;
  @BuiltValueEnumConst(wireName: r'manual')
  static const ClinicCreateConfirmationPolicyEnum manual = _$clinicCreateConfirmationPolicyEnum_manual;

  static Serializer<ClinicCreateConfirmationPolicyEnum> get serializer => _$clinicCreateConfirmationPolicyEnumSerializer;

  const ClinicCreateConfirmationPolicyEnum._(String name): super(name);

  static BuiltSet<ClinicCreateConfirmationPolicyEnum> get values => _$clinicCreateConfirmationPolicyEnumValues;
  static ClinicCreateConfirmationPolicyEnum valueOf(String name) => _$clinicCreateConfirmationPolicyEnumValueOf(name);
}


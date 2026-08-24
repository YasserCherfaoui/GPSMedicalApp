//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/clinic_status.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/clinic_update.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_admin_update.g.dart';

/// ClinicAdminUpdate
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
/// * [status] 
@BuiltValue()
abstract class ClinicAdminUpdate implements ClinicUpdate, Built<ClinicAdminUpdate, ClinicAdminUpdateBuilder> {
  @BuiltValueField(wireName: r'status')
  ClinicStatus? get status;
  // enum statusEnum {  pending,  active,  suspended,  rejected,  };

  ClinicAdminUpdate._();

  factory ClinicAdminUpdate([void updates(ClinicAdminUpdateBuilder b)]) = _$ClinicAdminUpdate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicAdminUpdateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicAdminUpdate> get serializer => _$ClinicAdminUpdateSerializer();
}

class _$ClinicAdminUpdateSerializer implements PrimitiveSerializer<ClinicAdminUpdate> {
  @override
  final Iterable<Type> types = const [ClinicAdminUpdate, _$ClinicAdminUpdate];

  @override
  final String wireName = r'ClinicAdminUpdate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicAdminUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.bookingWindowDays != null) {
      yield r'booking_window_days';
      yield serializers.serialize(
        object.bookingWindowDays,
        specifiedType: const FullType(int),
      );
    }
    if (object.confirmationPolicy != null) {
      yield r'confirmation_policy';
      yield serializers.serialize(
        object.confirmationPolicy,
        specifiedType: const FullType(ClinicUpdateConfirmationPolicyEnum),
      );
    }
    if (object.latitude != null) {
      yield r'latitude';
      yield serializers.serialize(
        object.latitude,
        specifiedType: const FullType(double),
      );
    }
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
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
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
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
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ClinicStatus),
      );
    }
    if (object.longitude != null) {
      yield r'longitude';
      yield serializers.serialize(
        object.longitude,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicAdminUpdate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicAdminUpdateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'booking_window_days':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.bookingWindowDays = valueDes;
          break;
        case r'confirmation_policy':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicUpdateConfirmationPolicyEnum),
          ) as ClinicUpdateConfirmationPolicyEnum;
          result.confirmationPolicy = valueDes;
          break;
        case r'latitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.latitude = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'legal_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.legalName = valueDes;
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
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
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
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicStatus),
          ) as ClinicStatus;
          result.status = valueDes;
          break;
        case r'longitude':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.longitude = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicAdminUpdate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicAdminUpdateBuilder();
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

class ClinicAdminUpdateConfirmationPolicyEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'auto')
  static const ClinicAdminUpdateConfirmationPolicyEnum auto = _$clinicAdminUpdateConfirmationPolicyEnum_auto;
  @BuiltValueEnumConst(wireName: r'manual')
  static const ClinicAdminUpdateConfirmationPolicyEnum manual = _$clinicAdminUpdateConfirmationPolicyEnum_manual;

  static Serializer<ClinicAdminUpdateConfirmationPolicyEnum> get serializer => _$clinicAdminUpdateConfirmationPolicyEnumSerializer;

  const ClinicAdminUpdateConfirmationPolicyEnum._(String name): super(name);

  static BuiltSet<ClinicAdminUpdateConfirmationPolicyEnum> get values => _$clinicAdminUpdateConfirmationPolicyEnumValues;
  static ClinicAdminUpdateConfirmationPolicyEnum valueOf(String name) => _$clinicAdminUpdateConfirmationPolicyEnumValueOf(name);
}


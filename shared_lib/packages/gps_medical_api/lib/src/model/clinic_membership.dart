//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/clinic_membership_status.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_membership.g.dart';

/// ClinicMembership
///
/// Properties:
/// * [id] 
/// * [clinicId] 
/// * [specialistId] 
/// * [clinicName] 
/// * [specialistName] 
/// * [status] 
/// * [visibleOnProfile] 
/// * [isPrimary] 
/// * [invitedAt] 
/// * [acceptedAt] 
/// * [detachRequestedAt] 
/// * [detachedAt] 
@BuiltValue()
abstract class ClinicMembership implements Built<ClinicMembership, ClinicMembershipBuilder> {
  @BuiltValueField(wireName: r'id')
  String? get id;

  @BuiltValueField(wireName: r'clinic_id')
  String? get clinicId;

  @BuiltValueField(wireName: r'specialist_id')
  String? get specialistId;

  @BuiltValueField(wireName: r'clinic_name')
  String? get clinicName;

  @BuiltValueField(wireName: r'specialist_name')
  String? get specialistName;

  @BuiltValueField(wireName: r'status')
  ClinicMembershipStatus? get status;
  // enum statusEnum {  invited,  active,  detach_requested,  detached,  refused,  };

  @BuiltValueField(wireName: r'visible_on_profile')
  bool? get visibleOnProfile;

  @BuiltValueField(wireName: r'is_primary')
  bool? get isPrimary;

  @BuiltValueField(wireName: r'invited_at')
  DateTime? get invitedAt;

  @BuiltValueField(wireName: r'accepted_at')
  DateTime? get acceptedAt;

  @BuiltValueField(wireName: r'detach_requested_at')
  DateTime? get detachRequestedAt;

  @BuiltValueField(wireName: r'detached_at')
  DateTime? get detachedAt;

  ClinicMembership._();

  factory ClinicMembership([void updates(ClinicMembershipBuilder b)]) = _$ClinicMembership;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicMembershipBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicMembership> get serializer => _$ClinicMembershipSerializer();
}

class _$ClinicMembershipSerializer implements PrimitiveSerializer<ClinicMembership> {
  @override
  final Iterable<Type> types = const [ClinicMembership, _$ClinicMembership];

  @override
  final String wireName = r'ClinicMembership';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicMembership object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(String),
      );
    }
    if (object.clinicId != null) {
      yield r'clinic_id';
      yield serializers.serialize(
        object.clinicId,
        specifiedType: const FullType(String),
      );
    }
    if (object.specialistId != null) {
      yield r'specialist_id';
      yield serializers.serialize(
        object.specialistId,
        specifiedType: const FullType(String),
      );
    }
    if (object.clinicName != null) {
      yield r'clinic_name';
      yield serializers.serialize(
        object.clinicName,
        specifiedType: const FullType(String),
      );
    }
    if (object.specialistName != null) {
      yield r'specialist_name';
      yield serializers.serialize(
        object.specialistName,
        specifiedType: const FullType(String),
      );
    }
    if (object.status != null) {
      yield r'status';
      yield serializers.serialize(
        object.status,
        specifiedType: const FullType(ClinicMembershipStatus),
      );
    }
    if (object.visibleOnProfile != null) {
      yield r'visible_on_profile';
      yield serializers.serialize(
        object.visibleOnProfile,
        specifiedType: const FullType(bool),
      );
    }
    if (object.isPrimary != null) {
      yield r'is_primary';
      yield serializers.serialize(
        object.isPrimary,
        specifiedType: const FullType(bool),
      );
    }
    if (object.invitedAt != null) {
      yield r'invited_at';
      yield serializers.serialize(
        object.invitedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.acceptedAt != null) {
      yield r'accepted_at';
      yield serializers.serialize(
        object.acceptedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.detachRequestedAt != null) {
      yield r'detach_requested_at';
      yield serializers.serialize(
        object.detachRequestedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
    if (object.detachedAt != null) {
      yield r'detached_at';
      yield serializers.serialize(
        object.detachedAt,
        specifiedType: const FullType.nullable(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicMembership object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicMembershipBuilder result,
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
        case r'clinic_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clinicId = valueDes;
          break;
        case r'specialist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.specialistId = valueDes;
          break;
        case r'clinic_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.clinicName = valueDes;
          break;
        case r'specialist_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.specialistName = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicMembershipStatus),
          ) as ClinicMembershipStatus;
          result.status = valueDes;
          break;
        case r'visible_on_profile':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.visibleOnProfile = valueDes;
          break;
        case r'is_primary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isPrimary = valueDes;
          break;
        case r'invited_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.invitedAt = valueDes;
          break;
        case r'accepted_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.acceptedAt = valueDes;
          break;
        case r'detach_requested_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.detachRequestedAt = valueDes;
          break;
        case r'detached_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(DateTime),
          ) as DateTime?;
          if (valueDes == null) continue;
          result.detachedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicMembership deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicMembershipBuilder();
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


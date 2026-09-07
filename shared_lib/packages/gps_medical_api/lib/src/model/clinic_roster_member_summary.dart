//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_roster_member_summary.g.dart';

/// ClinicRosterMemberSummary
///
/// Properties:
/// * [specialistId] 
/// * [fullName] 
/// * [specialtyCode] 
/// * [status] 
/// * [isSeededStub] - Spécialiste encore sur stub OSM (`SEEDED_NO_LOGIN`).
@BuiltValue()
abstract class ClinicRosterMemberSummary implements Built<ClinicRosterMemberSummary, ClinicRosterMemberSummaryBuilder> {
  @BuiltValueField(wireName: r'specialist_id')
  String get specialistId;

  @BuiltValueField(wireName: r'full_name')
  String get fullName;

  @BuiltValueField(wireName: r'specialty_code')
  String? get specialtyCode;

  @BuiltValueField(wireName: r'status')
  ClinicRosterMemberSummaryStatusEnum get status;
  // enum statusEnum {  active,  invited,  detach_requested,  detached,  refused,  };

  /// Spécialiste encore sur stub OSM (`SEEDED_NO_LOGIN`).
  @BuiltValueField(wireName: r'is_seeded_stub')
  bool? get isSeededStub;

  ClinicRosterMemberSummary._();

  factory ClinicRosterMemberSummary([void updates(ClinicRosterMemberSummaryBuilder b)]) = _$ClinicRosterMemberSummary;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicRosterMemberSummaryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicRosterMemberSummary> get serializer => _$ClinicRosterMemberSummarySerializer();
}

class _$ClinicRosterMemberSummarySerializer implements PrimitiveSerializer<ClinicRosterMemberSummary> {
  @override
  final Iterable<Type> types = const [ClinicRosterMemberSummary, _$ClinicRosterMemberSummary];

  @override
  final String wireName = r'ClinicRosterMemberSummary';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicRosterMemberSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'specialist_id';
    yield serializers.serialize(
      object.specialistId,
      specifiedType: const FullType(String),
    );
    yield r'full_name';
    yield serializers.serialize(
      object.fullName,
      specifiedType: const FullType(String),
    );
    if (object.specialtyCode != null) {
      yield r'specialty_code';
      yield serializers.serialize(
        object.specialtyCode,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ClinicRosterMemberSummaryStatusEnum),
    );
    if (object.isSeededStub != null) {
      yield r'is_seeded_stub';
      yield serializers.serialize(
        object.isSeededStub,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicRosterMemberSummary object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicRosterMemberSummaryBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'specialist_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.specialistId = valueDes;
          break;
        case r'full_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.fullName = valueDes;
          break;
        case r'specialty_code':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.specialtyCode = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ClinicRosterMemberSummaryStatusEnum),
          ) as ClinicRosterMemberSummaryStatusEnum;
          result.status = valueDes;
          break;
        case r'is_seeded_stub':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.isSeededStub = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicRosterMemberSummary deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicRosterMemberSummaryBuilder();
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

class ClinicRosterMemberSummaryStatusEnum extends EnumClass {

  @BuiltValueEnumConst(wireName: r'active')
  static const ClinicRosterMemberSummaryStatusEnum active = _$clinicRosterMemberSummaryStatusEnum_active;
  @BuiltValueEnumConst(wireName: r'invited')
  static const ClinicRosterMemberSummaryStatusEnum invited = _$clinicRosterMemberSummaryStatusEnum_invited;
  @BuiltValueEnumConst(wireName: r'detach_requested')
  static const ClinicRosterMemberSummaryStatusEnum detachRequested = _$clinicRosterMemberSummaryStatusEnum_detachRequested;
  @BuiltValueEnumConst(wireName: r'detached')
  static const ClinicRosterMemberSummaryStatusEnum detached = _$clinicRosterMemberSummaryStatusEnum_detached;
  @BuiltValueEnumConst(wireName: r'refused')
  static const ClinicRosterMemberSummaryStatusEnum refused = _$clinicRosterMemberSummaryStatusEnum_refused;

  static Serializer<ClinicRosterMemberSummaryStatusEnum> get serializer => _$clinicRosterMemberSummaryStatusEnumSerializer;

  const ClinicRosterMemberSummaryStatusEnum._(String name): super(name);

  static BuiltSet<ClinicRosterMemberSummaryStatusEnum> get values => _$clinicRosterMemberSummaryStatusEnumValues;
  static ClinicRosterMemberSummaryStatusEnum valueOf(String name) => _$clinicRosterMemberSummaryStatusEnumValueOf(name);
}


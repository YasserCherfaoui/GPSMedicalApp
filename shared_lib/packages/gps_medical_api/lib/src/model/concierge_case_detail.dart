//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/concierge_upcoming_appointment.dart';
import 'package:built_collection/built_collection.dart';
import 'package:gps_medical_api/src/model/concierge_case.dart';
import 'package:gps_medical_api/src/model/concierge_case_status.dart';
import 'package:gps_medical_api/src/model/concierge_patient_summary.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'concierge_case_detail.g.dart';

/// ConciergeCaseDetail
///
/// Properties:
/// * [id] 
/// * [patient] 
/// * [conciergeUserId] 
/// * [conciergeName] 
/// * [threadId] 
/// * [status] 
/// * [note] 
/// * [createdAt] 
/// * [updatedAt] 
/// * [upcomingAppointments] 
@BuiltValue()
abstract class ConciergeCaseDetail implements ConciergeCase, Built<ConciergeCaseDetail, ConciergeCaseDetailBuilder> {
  @BuiltValueField(wireName: r'upcoming_appointments')
  BuiltList<ConciergeUpcomingAppointment>? get upcomingAppointments;

  ConciergeCaseDetail._();

  factory ConciergeCaseDetail([void updates(ConciergeCaseDetailBuilder b)]) = _$ConciergeCaseDetail;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ConciergeCaseDetailBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ConciergeCaseDetail> get serializer => _$ConciergeCaseDetailSerializer();
}

class _$ConciergeCaseDetailSerializer implements PrimitiveSerializer<ConciergeCaseDetail> {
  @override
  final Iterable<Type> types = const [ConciergeCaseDetail, _$ConciergeCaseDetail];

  @override
  final String wireName = r'ConciergeCaseDetail';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ConciergeCaseDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'thread_id';
    yield serializers.serialize(
      object.threadId,
      specifiedType: const FullType(String),
    );
    if (object.note != null) {
      yield r'note';
      yield serializers.serialize(
        object.note,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
    if (object.upcomingAppointments != null) {
      yield r'upcoming_appointments';
      yield serializers.serialize(
        object.upcomingAppointments,
        specifiedType: const FullType(BuiltList, [FullType(ConciergeUpcomingAppointment)]),
      );
    }
    yield r'patient';
    yield serializers.serialize(
      object.patient,
      specifiedType: const FullType(ConciergePatientSummary),
    );
    yield r'concierge_user_id';
    yield serializers.serialize(
      object.conciergeUserId,
      specifiedType: const FullType(String),
    );
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(String),
    );
    if (object.conciergeName != null) {
      yield r'concierge_name';
      yield serializers.serialize(
        object.conciergeName,
        specifiedType: const FullType.nullable(String),
      );
    }
    yield r'status';
    yield serializers.serialize(
      object.status,
      specifiedType: const FullType(ConciergeCaseStatus),
    );
    yield r'updated_at';
    yield serializers.serialize(
      object.updatedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    ConciergeCaseDetail object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ConciergeCaseDetailBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'thread_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.threadId = valueDes;
          break;
        case r'note':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.note = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        case r'upcoming_appointments':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(ConciergeUpcomingAppointment)]),
          ) as BuiltList<ConciergeUpcomingAppointment>;
          result.upcomingAppointments.replace(valueDes);
          break;
        case r'patient':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConciergePatientSummary),
          ) as ConciergePatientSummary;
          result.patient.replace(valueDes);
          break;
        case r'concierge_user_id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.conciergeUserId = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.id = valueDes;
          break;
        case r'concierge_name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.conciergeName = valueDes;
          break;
        case r'status':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ConciergeCaseStatus),
          ) as ConciergeCaseStatus;
          result.status = valueDes;
          break;
        case r'updated_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.updatedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ConciergeCaseDetail deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ConciergeCaseDetailBuilder();
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


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'admin_overview.g.dart';

/// AdminOverview
///
/// Properties:
/// * [usersTotal]
/// * [patientsActive]
/// * [doctorsActive]
/// * [doctorsPendingVerification]
/// * [appointmentsLast30d]
/// * [gmvDzdLast30d]
/// * [avgAppointmentsPerActiveUser]
@BuiltValue()
abstract class AdminOverview
    implements Built<AdminOverview, AdminOverviewBuilder> {
  @BuiltValueField(wireName: r'users_total')
  int? get usersTotal;

  @BuiltValueField(wireName: r'patients_active')
  int? get patientsActive;

  @BuiltValueField(wireName: r'doctors_active')
  int? get doctorsActive;

  @BuiltValueField(wireName: r'doctors_pending_verification')
  int? get doctorsPendingVerification;

  @BuiltValueField(wireName: r'appointments_last_30d')
  int? get appointmentsLast30d;

  @BuiltValueField(wireName: r'gmv_dzd_last_30d')
  int? get gmvDzdLast30d;

  @BuiltValueField(wireName: r'avg_appointments_per_active_user')
  double? get avgAppointmentsPerActiveUser;

  AdminOverview._();

  factory AdminOverview([void updates(AdminOverviewBuilder b)]) =
      _$AdminOverview;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AdminOverviewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AdminOverview> get serializer =>
      _$AdminOverviewSerializer();
}

class _$AdminOverviewSerializer implements PrimitiveSerializer<AdminOverview> {
  @override
  final Iterable<Type> types = const [AdminOverview, _$AdminOverview];

  @override
  final String wireName = r'AdminOverview';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AdminOverview object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.usersTotal != null) {
      yield r'users_total';
      yield serializers.serialize(
        object.usersTotal,
        specifiedType: const FullType(int),
      );
    }
    if (object.patientsActive != null) {
      yield r'patients_active';
      yield serializers.serialize(
        object.patientsActive,
        specifiedType: const FullType(int),
      );
    }
    if (object.doctorsActive != null) {
      yield r'doctors_active';
      yield serializers.serialize(
        object.doctorsActive,
        specifiedType: const FullType(int),
      );
    }
    if (object.doctorsPendingVerification != null) {
      yield r'doctors_pending_verification';
      yield serializers.serialize(
        object.doctorsPendingVerification,
        specifiedType: const FullType(int),
      );
    }
    if (object.appointmentsLast30d != null) {
      yield r'appointments_last_30d';
      yield serializers.serialize(
        object.appointmentsLast30d,
        specifiedType: const FullType(int),
      );
    }
    if (object.gmvDzdLast30d != null) {
      yield r'gmv_dzd_last_30d';
      yield serializers.serialize(
        object.gmvDzdLast30d,
        specifiedType: const FullType(int),
      );
    }
    if (object.avgAppointmentsPerActiveUser != null) {
      yield r'avg_appointments_per_active_user';
      yield serializers.serialize(
        object.avgAppointmentsPerActiveUser,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AdminOverview object, {
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
    required AdminOverviewBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'users_total':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.usersTotal = valueDes;
          break;
        case r'patients_active':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.patientsActive = valueDes;
          break;
        case r'doctors_active':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.doctorsActive = valueDes;
          break;
        case r'doctors_pending_verification':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.doctorsPendingVerification = valueDes;
          break;
        case r'appointments_last_30d':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.appointmentsLast30d = valueDes;
          break;
        case r'gmv_dzd_last_30d':
          final valueDes =
              serializers.deserialize(value, specifiedType: const FullType(int))
                  as int;
          result.gmvDzdLast30d = valueDes;
          break;
        case r'avg_appointments_per_active_user':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(double),
                  )
                  as double;
          result.avgAppointmentsPerActiveUser = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AdminOverview deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AdminOverviewBuilder();
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

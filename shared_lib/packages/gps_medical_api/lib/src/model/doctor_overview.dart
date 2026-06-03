//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'doctor_overview.g.dart';

/// DoctorOverview
///
/// Properties:
/// * [appointmentsTotal] 
/// * [appointmentsCompleted] 
/// * [appointmentsCancelled] 
/// * [noShowRate] 
/// * [revenueDzd] 
/// * [newPatients] 
/// * [averageRating] 
@BuiltValue()
abstract class DoctorOverview implements Built<DoctorOverview, DoctorOverviewBuilder> {
  @BuiltValueField(wireName: r'appointments_total')
  int? get appointmentsTotal;

  @BuiltValueField(wireName: r'appointments_completed')
  int? get appointmentsCompleted;

  @BuiltValueField(wireName: r'appointments_cancelled')
  int? get appointmentsCancelled;

  @BuiltValueField(wireName: r'no_show_rate')
  double? get noShowRate;

  @BuiltValueField(wireName: r'revenue_dzd')
  int? get revenueDzd;

  @BuiltValueField(wireName: r'new_patients')
  int? get newPatients;

  @BuiltValueField(wireName: r'average_rating')
  double? get averageRating;

  DoctorOverview._();

  factory DoctorOverview([void updates(DoctorOverviewBuilder b)]) = _$DoctorOverview;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DoctorOverviewBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DoctorOverview> get serializer => _$DoctorOverviewSerializer();
}

class _$DoctorOverviewSerializer implements PrimitiveSerializer<DoctorOverview> {
  @override
  final Iterable<Type> types = const [DoctorOverview, _$DoctorOverview];

  @override
  final String wireName = r'DoctorOverview';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DoctorOverview object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.appointmentsTotal != null) {
      yield r'appointments_total';
      yield serializers.serialize(
        object.appointmentsTotal,
        specifiedType: const FullType(int),
      );
    }
    if (object.appointmentsCompleted != null) {
      yield r'appointments_completed';
      yield serializers.serialize(
        object.appointmentsCompleted,
        specifiedType: const FullType(int),
      );
    }
    if (object.appointmentsCancelled != null) {
      yield r'appointments_cancelled';
      yield serializers.serialize(
        object.appointmentsCancelled,
        specifiedType: const FullType(int),
      );
    }
    if (object.noShowRate != null) {
      yield r'no_show_rate';
      yield serializers.serialize(
        object.noShowRate,
        specifiedType: const FullType(double),
      );
    }
    if (object.revenueDzd != null) {
      yield r'revenue_dzd';
      yield serializers.serialize(
        object.revenueDzd,
        specifiedType: const FullType(int),
      );
    }
    if (object.newPatients != null) {
      yield r'new_patients';
      yield serializers.serialize(
        object.newPatients,
        specifiedType: const FullType(int),
      );
    }
    if (object.averageRating != null) {
      yield r'average_rating';
      yield serializers.serialize(
        object.averageRating,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DoctorOverview object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required DoctorOverviewBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'appointments_total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.appointmentsTotal = valueDes;
          break;
        case r'appointments_completed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.appointmentsCompleted = valueDes;
          break;
        case r'appointments_cancelled':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.appointmentsCancelled = valueDes;
          break;
        case r'no_show_rate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.noShowRate = valueDes;
          break;
        case r'revenue_dzd':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.revenueDzd = valueDes;
          break;
        case r'new_patients':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.newPatients = valueDes;
          break;
        case r'average_rating':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.averageRating = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  DoctorOverview deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DoctorOverviewBuilder();
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


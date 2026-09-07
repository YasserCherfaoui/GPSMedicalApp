//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_capacity_vs_donated_hours.g.dart';

/// ClinicCapacityVsDonatedHours
///
/// Properties:
/// * [capacityHoursWeekly] 
/// * [donatedHoursWeekly] 
/// * [coverageRatio] - donated / capacity ; null si capacity=0
@BuiltValue()
abstract class ClinicCapacityVsDonatedHours implements Built<ClinicCapacityVsDonatedHours, ClinicCapacityVsDonatedHoursBuilder> {
  @BuiltValueField(wireName: r'capacity_hours_weekly')
  double get capacityHoursWeekly;

  @BuiltValueField(wireName: r'donated_hours_weekly')
  double get donatedHoursWeekly;

  /// donated / capacity ; null si capacity=0
  @BuiltValueField(wireName: r'coverage_ratio')
  double? get coverageRatio;

  ClinicCapacityVsDonatedHours._();

  factory ClinicCapacityVsDonatedHours([void updates(ClinicCapacityVsDonatedHoursBuilder b)]) = _$ClinicCapacityVsDonatedHours;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicCapacityVsDonatedHoursBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicCapacityVsDonatedHours> get serializer => _$ClinicCapacityVsDonatedHoursSerializer();
}

class _$ClinicCapacityVsDonatedHoursSerializer implements PrimitiveSerializer<ClinicCapacityVsDonatedHours> {
  @override
  final Iterable<Type> types = const [ClinicCapacityVsDonatedHours, _$ClinicCapacityVsDonatedHours];

  @override
  final String wireName = r'ClinicCapacityVsDonatedHours';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicCapacityVsDonatedHours object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'capacity_hours_weekly';
    yield serializers.serialize(
      object.capacityHoursWeekly,
      specifiedType: const FullType(double),
    );
    yield r'donated_hours_weekly';
    yield serializers.serialize(
      object.donatedHoursWeekly,
      specifiedType: const FullType(double),
    );
    if (object.coverageRatio != null) {
      yield r'coverage_ratio';
      yield serializers.serialize(
        object.coverageRatio,
        specifiedType: const FullType.nullable(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicCapacityVsDonatedHours object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicCapacityVsDonatedHoursBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'capacity_hours_weekly':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.capacityHoursWeekly = valueDes;
          break;
        case r'donated_hours_weekly':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.donatedHoursWeekly = valueDes;
          break;
        case r'coverage_ratio':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(double),
          ) as double?;
          if (valueDes == null) continue;
          result.coverageRatio = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicCapacityVsDonatedHours deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicCapacityVsDonatedHoursBuilder();
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


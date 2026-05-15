//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/time_series_point.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'time_series.g.dart';

/// TimeSeries
///
/// Properties:
/// * [metric]
/// * [granularity]
/// * [points]
@BuiltValue()
abstract class TimeSeries implements Built<TimeSeries, TimeSeriesBuilder> {
  @BuiltValueField(wireName: r'metric')
  String? get metric;

  @BuiltValueField(wireName: r'granularity')
  String? get granularity;

  @BuiltValueField(wireName: r'points')
  BuiltList<TimeSeriesPoint>? get points;

  TimeSeries._();

  factory TimeSeries([void updates(TimeSeriesBuilder b)]) = _$TimeSeries;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TimeSeriesBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TimeSeries> get serializer => _$TimeSeriesSerializer();
}

class _$TimeSeriesSerializer implements PrimitiveSerializer<TimeSeries> {
  @override
  final Iterable<Type> types = const [TimeSeries, _$TimeSeries];

  @override
  final String wireName = r'TimeSeries';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TimeSeries object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.metric != null) {
      yield r'metric';
      yield serializers.serialize(
        object.metric,
        specifiedType: const FullType(String),
      );
    }
    if (object.granularity != null) {
      yield r'granularity';
      yield serializers.serialize(
        object.granularity,
        specifiedType: const FullType(String),
      );
    }
    if (object.points != null) {
      yield r'points';
      yield serializers.serialize(
        object.points,
        specifiedType: const FullType(BuiltList, [FullType(TimeSeriesPoint)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TimeSeries object, {
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
    required TimeSeriesBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'metric':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.metric = valueDes;
          break;
        case r'granularity':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )
                  as String;
          result.granularity = valueDes;
          break;
        case r'points':
          final valueDes =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(BuiltList, [
                      FullType(TimeSeriesPoint),
                    ]),
                  )
                  as BuiltList<TimeSeriesPoint>;
          result.points.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TimeSeries deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TimeSeriesBuilder();
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

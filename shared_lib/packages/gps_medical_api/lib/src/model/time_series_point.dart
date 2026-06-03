//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'time_series_point.g.dart';

/// TimeSeriesPoint
///
/// Properties:
/// * [bucket] 
/// * [value] 
@BuiltValue()
abstract class TimeSeriesPoint implements Built<TimeSeriesPoint, TimeSeriesPointBuilder> {
  @BuiltValueField(wireName: r'bucket')
  DateTime? get bucket;

  @BuiltValueField(wireName: r'value')
  num? get value;

  TimeSeriesPoint._();

  factory TimeSeriesPoint([void updates(TimeSeriesPointBuilder b)]) = _$TimeSeriesPoint;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TimeSeriesPointBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TimeSeriesPoint> get serializer => _$TimeSeriesPointSerializer();
}

class _$TimeSeriesPointSerializer implements PrimitiveSerializer<TimeSeriesPoint> {
  @override
  final Iterable<Type> types = const [TimeSeriesPoint, _$TimeSeriesPoint];

  @override
  final String wireName = r'TimeSeriesPoint';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TimeSeriesPoint object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.bucket != null) {
      yield r'bucket';
      yield serializers.serialize(
        object.bucket,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TimeSeriesPoint object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TimeSeriesPointBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'bucket':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.bucket = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TimeSeriesPoint deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TimeSeriesPointBuilder();
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


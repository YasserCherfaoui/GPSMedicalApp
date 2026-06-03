//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'funnel.g.dart';

/// Funnel
///
/// Properties:
/// * [searches] 
/// * [doctorViews] 
/// * [bookingStarted] 
/// * [bookingCompleted] 
/// * [consultationsCompleted] 
@BuiltValue()
abstract class Funnel implements Built<Funnel, FunnelBuilder> {
  @BuiltValueField(wireName: r'searches')
  int? get searches;

  @BuiltValueField(wireName: r'doctor_views')
  int? get doctorViews;

  @BuiltValueField(wireName: r'booking_started')
  int? get bookingStarted;

  @BuiltValueField(wireName: r'booking_completed')
  int? get bookingCompleted;

  @BuiltValueField(wireName: r'consultations_completed')
  int? get consultationsCompleted;

  Funnel._();

  factory Funnel([void updates(FunnelBuilder b)]) = _$Funnel;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FunnelBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Funnel> get serializer => _$FunnelSerializer();
}

class _$FunnelSerializer implements PrimitiveSerializer<Funnel> {
  @override
  final Iterable<Type> types = const [Funnel, _$Funnel];

  @override
  final String wireName = r'Funnel';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Funnel object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.searches != null) {
      yield r'searches';
      yield serializers.serialize(
        object.searches,
        specifiedType: const FullType(int),
      );
    }
    if (object.doctorViews != null) {
      yield r'doctor_views';
      yield serializers.serialize(
        object.doctorViews,
        specifiedType: const FullType(int),
      );
    }
    if (object.bookingStarted != null) {
      yield r'booking_started';
      yield serializers.serialize(
        object.bookingStarted,
        specifiedType: const FullType(int),
      );
    }
    if (object.bookingCompleted != null) {
      yield r'booking_completed';
      yield serializers.serialize(
        object.bookingCompleted,
        specifiedType: const FullType(int),
      );
    }
    if (object.consultationsCompleted != null) {
      yield r'consultations_completed';
      yield serializers.serialize(
        object.consultationsCompleted,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Funnel object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FunnelBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'searches':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.searches = valueDes;
          break;
        case r'doctor_views':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.doctorViews = valueDes;
          break;
        case r'booking_started':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.bookingStarted = valueDes;
          break;
        case r'booking_completed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.bookingCompleted = valueDes;
          break;
        case r'consultations_completed':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.consultationsCompleted = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Funnel deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FunnelBuilder();
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


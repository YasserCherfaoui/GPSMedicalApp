//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'clinic_understaffed_shortfall.g.dart';

/// ClinicUnderstaffedShortfall
///
/// Properties:
/// * [capacity] 
/// * [donatedConcurrent] 
/// * [message] 
@BuiltValue()
abstract class ClinicUnderstaffedShortfall implements Built<ClinicUnderstaffedShortfall, ClinicUnderstaffedShortfallBuilder> {
  @BuiltValueField(wireName: r'capacity')
  int? get capacity;

  @BuiltValueField(wireName: r'donated_concurrent')
  int? get donatedConcurrent;

  @BuiltValueField(wireName: r'message')
  String? get message;

  ClinicUnderstaffedShortfall._();

  factory ClinicUnderstaffedShortfall([void updates(ClinicUnderstaffedShortfallBuilder b)]) = _$ClinicUnderstaffedShortfall;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ClinicUnderstaffedShortfallBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ClinicUnderstaffedShortfall> get serializer => _$ClinicUnderstaffedShortfallSerializer();
}

class _$ClinicUnderstaffedShortfallSerializer implements PrimitiveSerializer<ClinicUnderstaffedShortfall> {
  @override
  final Iterable<Type> types = const [ClinicUnderstaffedShortfall, _$ClinicUnderstaffedShortfall];

  @override
  final String wireName = r'ClinicUnderstaffedShortfall';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ClinicUnderstaffedShortfall object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.capacity != null) {
      yield r'capacity';
      yield serializers.serialize(
        object.capacity,
        specifiedType: const FullType(int),
      );
    }
    if (object.donatedConcurrent != null) {
      yield r'donated_concurrent';
      yield serializers.serialize(
        object.donatedConcurrent,
        specifiedType: const FullType(int),
      );
    }
    if (object.message != null) {
      yield r'message';
      yield serializers.serialize(
        object.message,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ClinicUnderstaffedShortfall object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ClinicUnderstaffedShortfallBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'capacity':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.capacity = valueDes;
          break;
        case r'donated_concurrent':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.donatedConcurrent = valueDes;
          break;
        case r'message':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.message = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ClinicUnderstaffedShortfall deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ClinicUnderstaffedShortfallBuilder();
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


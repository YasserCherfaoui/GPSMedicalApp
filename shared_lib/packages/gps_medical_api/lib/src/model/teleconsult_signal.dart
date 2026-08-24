//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:gps_medical_api/src/model/teleconsult_signal_type.dart';
import 'package:gps_medical_api/src/model/teleconsult_ice_candidate.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsult_signal.g.dart';

/// TeleconsultSignal
///
/// Properties:
/// * [seq] 
/// * [type] 
/// * [sdp] 
/// * [candidate] 
/// * [createdAt] 
@BuiltValue()
abstract class TeleconsultSignal implements Built<TeleconsultSignal, TeleconsultSignalBuilder> {
  @BuiltValueField(wireName: r'seq')
  int get seq;

  @BuiltValueField(wireName: r'type')
  TeleconsultSignalType get type;
  // enum typeEnum {  offer,  answer,  ice_candidate,  hangup,  };

  @BuiltValueField(wireName: r'sdp')
  String? get sdp;

  @BuiltValueField(wireName: r'candidate')
  TeleconsultIceCandidate? get candidate;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  TeleconsultSignal._();

  factory TeleconsultSignal([void updates(TeleconsultSignalBuilder b)]) = _$TeleconsultSignal;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleconsultSignalBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleconsultSignal> get serializer => _$TeleconsultSignalSerializer();
}

class _$TeleconsultSignalSerializer implements PrimitiveSerializer<TeleconsultSignal> {
  @override
  final Iterable<Type> types = const [TeleconsultSignal, _$TeleconsultSignal];

  @override
  final String wireName = r'TeleconsultSignal';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleconsultSignal object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'seq';
    yield serializers.serialize(
      object.seq,
      specifiedType: const FullType(int),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(TeleconsultSignalType),
    );
    if (object.sdp != null) {
      yield r'sdp';
      yield serializers.serialize(
        object.sdp,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.candidate != null) {
      yield r'candidate';
      yield serializers.serialize(
        object.candidate,
        specifiedType: const FullType.nullable(TeleconsultIceCandidate),
      );
    }
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultSignal object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleconsultSignalBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'seq':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.seq = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TeleconsultSignalType),
          ) as TeleconsultSignalType;
          result.type = valueDes;
          break;
        case r'sdp':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sdp = valueDes;
          break;
        case r'candidate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(TeleconsultIceCandidate),
          ) as TeleconsultIceCandidate?;
          if (valueDes == null) continue;
          result.candidate.replace(valueDes);
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TeleconsultSignal deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleconsultSignalBuilder();
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


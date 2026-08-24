//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'teleconsult_ice_candidate.g.dart';

/// TeleconsultIceCandidate
///
/// Properties:
/// * [candidate] 
/// * [sdpMid] 
/// * [sdpMlineIndex] 
@BuiltValue()
abstract class TeleconsultIceCandidate implements Built<TeleconsultIceCandidate, TeleconsultIceCandidateBuilder> {
  @BuiltValueField(wireName: r'candidate')
  String? get candidate;

  @BuiltValueField(wireName: r'sdp_mid')
  String? get sdpMid;

  @BuiltValueField(wireName: r'sdp_mline_index')
  int? get sdpMlineIndex;

  TeleconsultIceCandidate._();

  factory TeleconsultIceCandidate([void updates(TeleconsultIceCandidateBuilder b)]) = _$TeleconsultIceCandidate;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TeleconsultIceCandidateBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TeleconsultIceCandidate> get serializer => _$TeleconsultIceCandidateSerializer();
}

class _$TeleconsultIceCandidateSerializer implements PrimitiveSerializer<TeleconsultIceCandidate> {
  @override
  final Iterable<Type> types = const [TeleconsultIceCandidate, _$TeleconsultIceCandidate];

  @override
  final String wireName = r'TeleconsultIceCandidate';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TeleconsultIceCandidate object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.candidate != null) {
      yield r'candidate';
      yield serializers.serialize(
        object.candidate,
        specifiedType: const FullType(String),
      );
    }
    if (object.sdpMid != null) {
      yield r'sdp_mid';
      yield serializers.serialize(
        object.sdpMid,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.sdpMlineIndex != null) {
      yield r'sdp_mline_index';
      yield serializers.serialize(
        object.sdpMlineIndex,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TeleconsultIceCandidate object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object, specifiedType: specifiedType).toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TeleconsultIceCandidateBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'candidate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.candidate = valueDes;
          break;
        case r'sdp_mid':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.sdpMid = valueDes;
          break;
        case r'sdp_mline_index':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.sdpMlineIndex = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TeleconsultIceCandidate deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TeleconsultIceCandidateBuilder();
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


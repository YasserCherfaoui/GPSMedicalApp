// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_doctor_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VerifyDoctorRequestDecisionEnum
_$verifyDoctorRequestDecisionEnum_approved =
    const VerifyDoctorRequestDecisionEnum._('approved');
const VerifyDoctorRequestDecisionEnum
_$verifyDoctorRequestDecisionEnum_rejected =
    const VerifyDoctorRequestDecisionEnum._('rejected');
const VerifyDoctorRequestDecisionEnum
_$verifyDoctorRequestDecisionEnum_moreInfo =
    const VerifyDoctorRequestDecisionEnum._('moreInfo');

VerifyDoctorRequestDecisionEnum _$verifyDoctorRequestDecisionEnumValueOf(
  String name,
) {
  switch (name) {
    case 'approved':
      return _$verifyDoctorRequestDecisionEnum_approved;
    case 'rejected':
      return _$verifyDoctorRequestDecisionEnum_rejected;
    case 'moreInfo':
      return _$verifyDoctorRequestDecisionEnum_moreInfo;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<VerifyDoctorRequestDecisionEnum>
_$verifyDoctorRequestDecisionEnumValues =
    BuiltSet<VerifyDoctorRequestDecisionEnum>(
      const <VerifyDoctorRequestDecisionEnum>[
        _$verifyDoctorRequestDecisionEnum_approved,
        _$verifyDoctorRequestDecisionEnum_rejected,
        _$verifyDoctorRequestDecisionEnum_moreInfo,
      ],
    );

Serializer<VerifyDoctorRequestDecisionEnum>
_$verifyDoctorRequestDecisionEnumSerializer =
    _$VerifyDoctorRequestDecisionEnumSerializer();

class _$VerifyDoctorRequestDecisionEnumSerializer
    implements PrimitiveSerializer<VerifyDoctorRequestDecisionEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'approved': 'approved',
    'rejected': 'rejected',
    'moreInfo': 'more_info',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'approved': 'approved',
    'rejected': 'rejected',
    'more_info': 'moreInfo',
  };

  @override
  final Iterable<Type> types = const <Type>[VerifyDoctorRequestDecisionEnum];
  @override
  final String wireName = 'VerifyDoctorRequestDecisionEnum';

  @override
  Object serialize(
    Serializers serializers,
    VerifyDoctorRequestDecisionEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  VerifyDoctorRequestDecisionEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => VerifyDoctorRequestDecisionEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$VerifyDoctorRequest extends VerifyDoctorRequest {
  @override
  final VerifyDoctorRequestDecisionEnum decision;
  @override
  final String? comment;

  factory _$VerifyDoctorRequest([
    void Function(VerifyDoctorRequestBuilder)? updates,
  ]) => (VerifyDoctorRequestBuilder()..update(updates))._build();

  _$VerifyDoctorRequest._({required this.decision, this.comment}) : super._();
  @override
  VerifyDoctorRequest rebuild(
    void Function(VerifyDoctorRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  VerifyDoctorRequestBuilder toBuilder() =>
      VerifyDoctorRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyDoctorRequest &&
        decision == other.decision &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, decision.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'VerifyDoctorRequest')
          ..add('decision', decision)
          ..add('comment', comment))
        .toString();
  }
}

class VerifyDoctorRequestBuilder
    implements Builder<VerifyDoctorRequest, VerifyDoctorRequestBuilder> {
  _$VerifyDoctorRequest? _$v;

  VerifyDoctorRequestDecisionEnum? _decision;
  VerifyDoctorRequestDecisionEnum? get decision => _$this._decision;
  set decision(VerifyDoctorRequestDecisionEnum? decision) =>
      _$this._decision = decision;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  VerifyDoctorRequestBuilder() {
    VerifyDoctorRequest._defaults(this);
  }

  VerifyDoctorRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _decision = $v.decision;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyDoctorRequest other) {
    _$v = other as _$VerifyDoctorRequest;
  }

  @override
  void update(void Function(VerifyDoctorRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyDoctorRequest build() => _build();

  _$VerifyDoctorRequest _build() {
    final _$result =
        _$v ??
        _$VerifyDoctorRequest._(
          decision: BuiltValueNullFieldError.checkNotNull(
            decision,
            r'VerifyDoctorRequest',
            'decision',
          ),
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

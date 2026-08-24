// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_clinic_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const VerifyClinicRequestDecisionEnum
_$verifyClinicRequestDecisionEnum_approved =
    const VerifyClinicRequestDecisionEnum._('approved');
const VerifyClinicRequestDecisionEnum
_$verifyClinicRequestDecisionEnum_rejected =
    const VerifyClinicRequestDecisionEnum._('rejected');
const VerifyClinicRequestDecisionEnum
_$verifyClinicRequestDecisionEnum_moreInfo =
    const VerifyClinicRequestDecisionEnum._('moreInfo');

VerifyClinicRequestDecisionEnum _$verifyClinicRequestDecisionEnumValueOf(
  String name,
) {
  switch (name) {
    case 'approved':
      return _$verifyClinicRequestDecisionEnum_approved;
    case 'rejected':
      return _$verifyClinicRequestDecisionEnum_rejected;
    case 'moreInfo':
      return _$verifyClinicRequestDecisionEnum_moreInfo;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<VerifyClinicRequestDecisionEnum>
_$verifyClinicRequestDecisionEnumValues =
    BuiltSet<VerifyClinicRequestDecisionEnum>(
      const <VerifyClinicRequestDecisionEnum>[
        _$verifyClinicRequestDecisionEnum_approved,
        _$verifyClinicRequestDecisionEnum_rejected,
        _$verifyClinicRequestDecisionEnum_moreInfo,
      ],
    );

Serializer<VerifyClinicRequestDecisionEnum>
_$verifyClinicRequestDecisionEnumSerializer =
    _$VerifyClinicRequestDecisionEnumSerializer();

class _$VerifyClinicRequestDecisionEnumSerializer
    implements PrimitiveSerializer<VerifyClinicRequestDecisionEnum> {
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
  final Iterable<Type> types = const <Type>[VerifyClinicRequestDecisionEnum];
  @override
  final String wireName = 'VerifyClinicRequestDecisionEnum';

  @override
  Object serialize(
    Serializers serializers,
    VerifyClinicRequestDecisionEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  VerifyClinicRequestDecisionEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => VerifyClinicRequestDecisionEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$VerifyClinicRequest extends VerifyClinicRequest {
  @override
  final VerifyClinicRequestDecisionEnum decision;
  @override
  final String? comment;

  factory _$VerifyClinicRequest([
    void Function(VerifyClinicRequestBuilder)? updates,
  ]) => (VerifyClinicRequestBuilder()..update(updates))._build();

  _$VerifyClinicRequest._({required this.decision, this.comment}) : super._();
  @override
  VerifyClinicRequest rebuild(
    void Function(VerifyClinicRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  VerifyClinicRequestBuilder toBuilder() =>
      VerifyClinicRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is VerifyClinicRequest &&
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
    return (newBuiltValueToStringHelper(r'VerifyClinicRequest')
          ..add('decision', decision)
          ..add('comment', comment))
        .toString();
  }
}

class VerifyClinicRequestBuilder
    implements Builder<VerifyClinicRequest, VerifyClinicRequestBuilder> {
  _$VerifyClinicRequest? _$v;

  VerifyClinicRequestDecisionEnum? _decision;
  VerifyClinicRequestDecisionEnum? get decision => _$this._decision;
  set decision(VerifyClinicRequestDecisionEnum? decision) =>
      _$this._decision = decision;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  VerifyClinicRequestBuilder() {
    VerifyClinicRequest._defaults(this);
  }

  VerifyClinicRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _decision = $v.decision;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(VerifyClinicRequest other) {
    _$v = other as _$VerifyClinicRequest;
  }

  @override
  void update(void Function(VerifyClinicRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  VerifyClinicRequest build() => _build();

  _$VerifyClinicRequest _build() {
    final _$result =
        _$v ??
        _$VerifyClinicRequest._(
          decision: BuiltValueNullFieldError.checkNotNull(
            decision,
            r'VerifyClinicRequest',
            'decision',
          ),
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

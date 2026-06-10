// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_review_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ReportReviewRequestReasonEnum _$reportReviewRequestReasonEnum_spam =
    const ReportReviewRequestReasonEnum._('spam');
const ReportReviewRequestReasonEnum _$reportReviewRequestReasonEnum_insult =
    const ReportReviewRequestReasonEnum._('insult');
const ReportReviewRequestReasonEnum _$reportReviewRequestReasonEnum_defamation =
    const ReportReviewRequestReasonEnum._('defamation');
const ReportReviewRequestReasonEnum _$reportReviewRequestReasonEnum_offTopic =
    const ReportReviewRequestReasonEnum._('offTopic');
const ReportReviewRequestReasonEnum _$reportReviewRequestReasonEnum_other =
    const ReportReviewRequestReasonEnum._('other');

ReportReviewRequestReasonEnum _$reportReviewRequestReasonEnumValueOf(
  String name,
) {
  switch (name) {
    case 'spam':
      return _$reportReviewRequestReasonEnum_spam;
    case 'insult':
      return _$reportReviewRequestReasonEnum_insult;
    case 'defamation':
      return _$reportReviewRequestReasonEnum_defamation;
    case 'offTopic':
      return _$reportReviewRequestReasonEnum_offTopic;
    case 'other':
      return _$reportReviewRequestReasonEnum_other;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ReportReviewRequestReasonEnum>
_$reportReviewRequestReasonEnumValues = BuiltSet<ReportReviewRequestReasonEnum>(
  const <ReportReviewRequestReasonEnum>[
    _$reportReviewRequestReasonEnum_spam,
    _$reportReviewRequestReasonEnum_insult,
    _$reportReviewRequestReasonEnum_defamation,
    _$reportReviewRequestReasonEnum_offTopic,
    _$reportReviewRequestReasonEnum_other,
  ],
);

Serializer<ReportReviewRequestReasonEnum>
_$reportReviewRequestReasonEnumSerializer =
    _$ReportReviewRequestReasonEnumSerializer();

class _$ReportReviewRequestReasonEnumSerializer
    implements PrimitiveSerializer<ReportReviewRequestReasonEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'spam': 'spam',
    'insult': 'insult',
    'defamation': 'defamation',
    'offTopic': 'off_topic',
    'other': 'other',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'spam': 'spam',
    'insult': 'insult',
    'defamation': 'defamation',
    'off_topic': 'offTopic',
    'other': 'other',
  };

  @override
  final Iterable<Type> types = const <Type>[ReportReviewRequestReasonEnum];
  @override
  final String wireName = 'ReportReviewRequestReasonEnum';

  @override
  Object serialize(
    Serializers serializers,
    ReportReviewRequestReasonEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ReportReviewRequestReasonEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ReportReviewRequestReasonEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ReportReviewRequest extends ReportReviewRequest {
  @override
  final ReportReviewRequestReasonEnum reason;
  @override
  final String? comment;

  factory _$ReportReviewRequest([
    void Function(ReportReviewRequestBuilder)? updates,
  ]) => (ReportReviewRequestBuilder()..update(updates))._build();

  _$ReportReviewRequest._({required this.reason, this.comment}) : super._();
  @override
  ReportReviewRequest rebuild(
    void Function(ReportReviewRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ReportReviewRequestBuilder toBuilder() =>
      ReportReviewRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportReviewRequest &&
        reason == other.reason &&
        comment == other.comment;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, reason.hashCode);
    _$hash = $jc(_$hash, comment.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportReviewRequest')
          ..add('reason', reason)
          ..add('comment', comment))
        .toString();
  }
}

class ReportReviewRequestBuilder
    implements Builder<ReportReviewRequest, ReportReviewRequestBuilder> {
  _$ReportReviewRequest? _$v;

  ReportReviewRequestReasonEnum? _reason;
  ReportReviewRequestReasonEnum? get reason => _$this._reason;
  set reason(ReportReviewRequestReasonEnum? reason) => _$this._reason = reason;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  ReportReviewRequestBuilder() {
    ReportReviewRequest._defaults(this);
  }

  ReportReviewRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _reason = $v.reason;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportReviewRequest other) {
    _$v = other as _$ReportReviewRequest;
  }

  @override
  void update(void Function(ReportReviewRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportReviewRequest build() => _build();

  _$ReportReviewRequest _build() {
    final _$result =
        _$v ??
        _$ReportReviewRequest._(
          reason: BuiltValueNullFieldError.checkNotNull(
            reason,
            r'ReportReviewRequest',
            'reason',
          ),
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

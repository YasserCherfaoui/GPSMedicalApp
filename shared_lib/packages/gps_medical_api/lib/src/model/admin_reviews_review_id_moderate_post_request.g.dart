// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_reviews_review_id_moderate_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AdminReviewsReviewIdModeratePostRequestDecisionEnum
_$adminReviewsReviewIdModeratePostRequestDecisionEnum_approve =
    const AdminReviewsReviewIdModeratePostRequestDecisionEnum._('approve');
const AdminReviewsReviewIdModeratePostRequestDecisionEnum
_$adminReviewsReviewIdModeratePostRequestDecisionEnum_hide_ =
    const AdminReviewsReviewIdModeratePostRequestDecisionEnum._('hide_');
const AdminReviewsReviewIdModeratePostRequestDecisionEnum
_$adminReviewsReviewIdModeratePostRequestDecisionEnum_delete =
    const AdminReviewsReviewIdModeratePostRequestDecisionEnum._('delete');

AdminReviewsReviewIdModeratePostRequestDecisionEnum
_$adminReviewsReviewIdModeratePostRequestDecisionEnumValueOf(String name) {
  switch (name) {
    case 'approve':
      return _$adminReviewsReviewIdModeratePostRequestDecisionEnum_approve;
    case 'hide_':
      return _$adminReviewsReviewIdModeratePostRequestDecisionEnum_hide_;
    case 'delete':
      return _$adminReviewsReviewIdModeratePostRequestDecisionEnum_delete;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdminReviewsReviewIdModeratePostRequestDecisionEnum>
_$adminReviewsReviewIdModeratePostRequestDecisionEnumValues =
    BuiltSet<AdminReviewsReviewIdModeratePostRequestDecisionEnum>(
      const <AdminReviewsReviewIdModeratePostRequestDecisionEnum>[
        _$adminReviewsReviewIdModeratePostRequestDecisionEnum_approve,
        _$adminReviewsReviewIdModeratePostRequestDecisionEnum_hide_,
        _$adminReviewsReviewIdModeratePostRequestDecisionEnum_delete,
      ],
    );

Serializer<AdminReviewsReviewIdModeratePostRequestDecisionEnum>
_$adminReviewsReviewIdModeratePostRequestDecisionEnumSerializer =
    _$AdminReviewsReviewIdModeratePostRequestDecisionEnumSerializer();

class _$AdminReviewsReviewIdModeratePostRequestDecisionEnumSerializer
    implements
        PrimitiveSerializer<
          AdminReviewsReviewIdModeratePostRequestDecisionEnum
        > {
  static const Map<String, Object> _toWire = const <String, Object>{
    'approve': 'approve',
    'hide_': 'hide',
    'delete': 'delete',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'approve': 'approve',
    'hide': 'hide_',
    'delete': 'delete',
  };

  @override
  final Iterable<Type> types = const <Type>[
    AdminReviewsReviewIdModeratePostRequestDecisionEnum,
  ];
  @override
  final String wireName = 'AdminReviewsReviewIdModeratePostRequestDecisionEnum';

  @override
  Object serialize(
    Serializers serializers,
    AdminReviewsReviewIdModeratePostRequestDecisionEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AdminReviewsReviewIdModeratePostRequestDecisionEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AdminReviewsReviewIdModeratePostRequestDecisionEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$AdminReviewsReviewIdModeratePostRequest
    extends AdminReviewsReviewIdModeratePostRequest {
  @override
  final AdminReviewsReviewIdModeratePostRequestDecisionEnum decision;
  @override
  final String? comment;

  factory _$AdminReviewsReviewIdModeratePostRequest([
    void Function(AdminReviewsReviewIdModeratePostRequestBuilder)? updates,
  ]) => (AdminReviewsReviewIdModeratePostRequestBuilder()..update(updates))
      ._build();

  _$AdminReviewsReviewIdModeratePostRequest._({
    required this.decision,
    this.comment,
  }) : super._();
  @override
  AdminReviewsReviewIdModeratePostRequest rebuild(
    void Function(AdminReviewsReviewIdModeratePostRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  AdminReviewsReviewIdModeratePostRequestBuilder toBuilder() =>
      AdminReviewsReviewIdModeratePostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminReviewsReviewIdModeratePostRequest &&
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
    return (newBuiltValueToStringHelper(
            r'AdminReviewsReviewIdModeratePostRequest',
          )
          ..add('decision', decision)
          ..add('comment', comment))
        .toString();
  }
}

class AdminReviewsReviewIdModeratePostRequestBuilder
    implements
        Builder<
          AdminReviewsReviewIdModeratePostRequest,
          AdminReviewsReviewIdModeratePostRequestBuilder
        > {
  _$AdminReviewsReviewIdModeratePostRequest? _$v;

  AdminReviewsReviewIdModeratePostRequestDecisionEnum? _decision;
  AdminReviewsReviewIdModeratePostRequestDecisionEnum? get decision =>
      _$this._decision;
  set decision(AdminReviewsReviewIdModeratePostRequestDecisionEnum? decision) =>
      _$this._decision = decision;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  AdminReviewsReviewIdModeratePostRequestBuilder() {
    AdminReviewsReviewIdModeratePostRequest._defaults(this);
  }

  AdminReviewsReviewIdModeratePostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _decision = $v.decision;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminReviewsReviewIdModeratePostRequest other) {
    _$v = other as _$AdminReviewsReviewIdModeratePostRequest;
  }

  @override
  void update(
    void Function(AdminReviewsReviewIdModeratePostRequestBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  AdminReviewsReviewIdModeratePostRequest build() => _build();

  _$AdminReviewsReviewIdModeratePostRequest _build() {
    final _$result =
        _$v ??
        _$AdminReviewsReviewIdModeratePostRequest._(
          decision: BuiltValueNullFieldError.checkNotNull(
            decision,
            r'AdminReviewsReviewIdModeratePostRequest',
            'decision',
          ),
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

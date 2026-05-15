// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_doctors_doctor_id_verify_post_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum
_$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_approved =
    const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum._('approved');
const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum
_$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_rejected =
    const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum._('rejected');
const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum
_$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_moreInfo =
    const AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum._('moreInfo');

AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum
_$adminDoctorsDoctorIdVerifyPostRequestDecisionEnumValueOf(String name) {
  switch (name) {
    case 'approved':
      return _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_approved;
    case 'rejected':
      return _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_rejected;
    case 'moreInfo':
      return _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_moreInfo;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum>
_$adminDoctorsDoctorIdVerifyPostRequestDecisionEnumValues =
    BuiltSet<AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum>(
      const <AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum>[
        _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_approved,
        _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_rejected,
        _$adminDoctorsDoctorIdVerifyPostRequestDecisionEnum_moreInfo,
      ],
    );

Serializer<AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum>
_$adminDoctorsDoctorIdVerifyPostRequestDecisionEnumSerializer =
    _$AdminDoctorsDoctorIdVerifyPostRequestDecisionEnumSerializer();

class _$AdminDoctorsDoctorIdVerifyPostRequestDecisionEnumSerializer
    implements
        PrimitiveSerializer<AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum> {
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
  final Iterable<Type> types = const <Type>[
    AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum,
  ];
  @override
  final String wireName = 'AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum';

  @override
  Object serialize(
    Serializers serializers,
    AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$AdminDoctorsDoctorIdVerifyPostRequest
    extends AdminDoctorsDoctorIdVerifyPostRequest {
  @override
  final AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum decision;
  @override
  final String? comment;

  factory _$AdminDoctorsDoctorIdVerifyPostRequest([
    void Function(AdminDoctorsDoctorIdVerifyPostRequestBuilder)? updates,
  ]) => (AdminDoctorsDoctorIdVerifyPostRequestBuilder()..update(updates))
      ._build();

  _$AdminDoctorsDoctorIdVerifyPostRequest._({
    required this.decision,
    this.comment,
  }) : super._();
  @override
  AdminDoctorsDoctorIdVerifyPostRequest rebuild(
    void Function(AdminDoctorsDoctorIdVerifyPostRequestBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  AdminDoctorsDoctorIdVerifyPostRequestBuilder toBuilder() =>
      AdminDoctorsDoctorIdVerifyPostRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AdminDoctorsDoctorIdVerifyPostRequest &&
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
            r'AdminDoctorsDoctorIdVerifyPostRequest',
          )
          ..add('decision', decision)
          ..add('comment', comment))
        .toString();
  }
}

class AdminDoctorsDoctorIdVerifyPostRequestBuilder
    implements
        Builder<
          AdminDoctorsDoctorIdVerifyPostRequest,
          AdminDoctorsDoctorIdVerifyPostRequestBuilder
        > {
  _$AdminDoctorsDoctorIdVerifyPostRequest? _$v;

  AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum? _decision;
  AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum? get decision =>
      _$this._decision;
  set decision(AdminDoctorsDoctorIdVerifyPostRequestDecisionEnum? decision) =>
      _$this._decision = decision;

  String? _comment;
  String? get comment => _$this._comment;
  set comment(String? comment) => _$this._comment = comment;

  AdminDoctorsDoctorIdVerifyPostRequestBuilder() {
    AdminDoctorsDoctorIdVerifyPostRequest._defaults(this);
  }

  AdminDoctorsDoctorIdVerifyPostRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _decision = $v.decision;
      _comment = $v.comment;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AdminDoctorsDoctorIdVerifyPostRequest other) {
    _$v = other as _$AdminDoctorsDoctorIdVerifyPostRequest;
  }

  @override
  void update(
    void Function(AdminDoctorsDoctorIdVerifyPostRequestBuilder)? updates,
  ) {
    if (updates != null) updates(this);
  }

  @override
  AdminDoctorsDoctorIdVerifyPostRequest build() => _build();

  _$AdminDoctorsDoctorIdVerifyPostRequest _build() {
    final _$result =
        _$v ??
        _$AdminDoctorsDoctorIdVerifyPostRequest._(
          decision: BuiltValueNullFieldError.checkNotNull(
            decision,
            r'AdminDoctorsDoctorIdVerifyPostRequest',
            'decision',
          ),
          comment: comment,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

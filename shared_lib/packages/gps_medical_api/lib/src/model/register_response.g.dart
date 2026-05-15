// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RegisterResponseNinVerificationStatusEnum
_$registerResponseNinVerificationStatusEnum_pending =
    const RegisterResponseNinVerificationStatusEnum._('pending');
const RegisterResponseNinVerificationStatusEnum
_$registerResponseNinVerificationStatusEnum_verified =
    const RegisterResponseNinVerificationStatusEnum._('verified');
const RegisterResponseNinVerificationStatusEnum
_$registerResponseNinVerificationStatusEnum_failed =
    const RegisterResponseNinVerificationStatusEnum._('failed');
const RegisterResponseNinVerificationStatusEnum
_$registerResponseNinVerificationStatusEnum_notRequired =
    const RegisterResponseNinVerificationStatusEnum._('notRequired');

RegisterResponseNinVerificationStatusEnum
_$registerResponseNinVerificationStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$registerResponseNinVerificationStatusEnum_pending;
    case 'verified':
      return _$registerResponseNinVerificationStatusEnum_verified;
    case 'failed':
      return _$registerResponseNinVerificationStatusEnum_failed;
    case 'notRequired':
      return _$registerResponseNinVerificationStatusEnum_notRequired;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<RegisterResponseNinVerificationStatusEnum>
_$registerResponseNinVerificationStatusEnumValues =
    BuiltSet<RegisterResponseNinVerificationStatusEnum>(
      const <RegisterResponseNinVerificationStatusEnum>[
        _$registerResponseNinVerificationStatusEnum_pending,
        _$registerResponseNinVerificationStatusEnum_verified,
        _$registerResponseNinVerificationStatusEnum_failed,
        _$registerResponseNinVerificationStatusEnum_notRequired,
      ],
    );

Serializer<RegisterResponseNinVerificationStatusEnum>
_$registerResponseNinVerificationStatusEnumSerializer =
    _$RegisterResponseNinVerificationStatusEnumSerializer();

class _$RegisterResponseNinVerificationStatusEnumSerializer
    implements PrimitiveSerializer<RegisterResponseNinVerificationStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'verified': 'verified',
    'failed': 'failed',
    'notRequired': 'not_required',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'verified': 'verified',
    'failed': 'failed',
    'not_required': 'notRequired',
  };

  @override
  final Iterable<Type> types = const <Type>[
    RegisterResponseNinVerificationStatusEnum,
  ];
  @override
  final String wireName = 'RegisterResponseNinVerificationStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    RegisterResponseNinVerificationStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  RegisterResponseNinVerificationStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => RegisterResponseNinVerificationStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$RegisterResponse extends RegisterResponse {
  @override
  final String userId;
  @override
  final DateTime otpExpiresAt;
  @override
  final RegisterResponseNinVerificationStatusEnum ninVerificationStatus;

  factory _$RegisterResponse([
    void Function(RegisterResponseBuilder)? updates,
  ]) => (RegisterResponseBuilder()..update(updates))._build();

  _$RegisterResponse._({
    required this.userId,
    required this.otpExpiresAt,
    required this.ninVerificationStatus,
  }) : super._();
  @override
  RegisterResponse rebuild(void Function(RegisterResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterResponseBuilder toBuilder() =>
      RegisterResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterResponse &&
        userId == other.userId &&
        otpExpiresAt == other.otpExpiresAt &&
        ninVerificationStatus == other.ninVerificationStatus;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, otpExpiresAt.hashCode);
    _$hash = $jc(_$hash, ninVerificationStatus.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterResponse')
          ..add('userId', userId)
          ..add('otpExpiresAt', otpExpiresAt)
          ..add('ninVerificationStatus', ninVerificationStatus))
        .toString();
  }
}

class RegisterResponseBuilder
    implements Builder<RegisterResponse, RegisterResponseBuilder> {
  _$RegisterResponse? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  DateTime? _otpExpiresAt;
  DateTime? get otpExpiresAt => _$this._otpExpiresAt;
  set otpExpiresAt(DateTime? otpExpiresAt) =>
      _$this._otpExpiresAt = otpExpiresAt;

  RegisterResponseNinVerificationStatusEnum? _ninVerificationStatus;
  RegisterResponseNinVerificationStatusEnum? get ninVerificationStatus =>
      _$this._ninVerificationStatus;
  set ninVerificationStatus(
    RegisterResponseNinVerificationStatusEnum? ninVerificationStatus,
  ) => _$this._ninVerificationStatus = ninVerificationStatus;

  RegisterResponseBuilder() {
    RegisterResponse._defaults(this);
  }

  RegisterResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _otpExpiresAt = $v.otpExpiresAt;
      _ninVerificationStatus = $v.ninVerificationStatus;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterResponse other) {
    _$v = other as _$RegisterResponse;
  }

  @override
  void update(void Function(RegisterResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterResponse build() => _build();

  _$RegisterResponse _build() {
    final _$result =
        _$v ??
        _$RegisterResponse._(
          userId: BuiltValueNullFieldError.checkNotNull(
            userId,
            r'RegisterResponse',
            'userId',
          ),
          otpExpiresAt: BuiltValueNullFieldError.checkNotNull(
            otpExpiresAt,
            r'RegisterResponse',
            'otpExpiresAt',
          ),
          ninVerificationStatus: BuiltValueNullFieldError.checkNotNull(
            ninVerificationStatus,
            r'RegisterResponse',
            'ninVerificationStatus',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

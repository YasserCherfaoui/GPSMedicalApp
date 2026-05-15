// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const RegisterRequestRoleEnum _$registerRequestRoleEnum_patient =
    const RegisterRequestRoleEnum._('patient');
const RegisterRequestRoleEnum _$registerRequestRoleEnum_specialist =
    const RegisterRequestRoleEnum._('specialist');

RegisterRequestRoleEnum _$registerRequestRoleEnumValueOf(String name) {
  switch (name) {
    case 'patient':
      return _$registerRequestRoleEnum_patient;
    case 'specialist':
      return _$registerRequestRoleEnum_specialist;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<RegisterRequestRoleEnum> _$registerRequestRoleEnumValues =
    BuiltSet<RegisterRequestRoleEnum>(const <RegisterRequestRoleEnum>[
      _$registerRequestRoleEnum_patient,
      _$registerRequestRoleEnum_specialist,
    ]);

Serializer<RegisterRequestRoleEnum> _$registerRequestRoleEnumSerializer =
    _$RegisterRequestRoleEnumSerializer();

class _$RegisterRequestRoleEnumSerializer
    implements PrimitiveSerializer<RegisterRequestRoleEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'patient': 'patient',
    'specialist': 'specialist',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'patient': 'patient',
    'specialist': 'specialist',
  };

  @override
  final Iterable<Type> types = const <Type>[RegisterRequestRoleEnum];
  @override
  final String wireName = 'RegisterRequestRoleEnum';

  @override
  Object serialize(
    Serializers serializers,
    RegisterRequestRoleEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  RegisterRequestRoleEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => RegisterRequestRoleEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$RegisterRequest extends RegisterRequest {
  @override
  final String phone;
  @override
  final String nin;
  @override
  final String password;
  @override
  final RegisterRequestRoleEnum role;
  @override
  final String fullName;
  @override
  final String? email;
  @override
  final bool consentDataProcessing;
  @override
  final bool consentHealthData;
  @override
  final bool consentAnpdpTerms;
  @override
  final bool? consentMarketing;

  factory _$RegisterRequest([void Function(RegisterRequestBuilder)? updates]) =>
      (RegisterRequestBuilder()..update(updates))._build();

  _$RegisterRequest._({
    required this.phone,
    required this.nin,
    required this.password,
    required this.role,
    required this.fullName,
    this.email,
    required this.consentDataProcessing,
    required this.consentHealthData,
    required this.consentAnpdpTerms,
    this.consentMarketing,
  }) : super._();
  @override
  RegisterRequest rebuild(void Function(RegisterRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RegisterRequestBuilder toBuilder() => RegisterRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RegisterRequest &&
        phone == other.phone &&
        nin == other.nin &&
        password == other.password &&
        role == other.role &&
        fullName == other.fullName &&
        email == other.email &&
        consentDataProcessing == other.consentDataProcessing &&
        consentHealthData == other.consentHealthData &&
        consentAnpdpTerms == other.consentAnpdpTerms &&
        consentMarketing == other.consentMarketing;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, nin.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, fullName.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, consentDataProcessing.hashCode);
    _$hash = $jc(_$hash, consentHealthData.hashCode);
    _$hash = $jc(_$hash, consentAnpdpTerms.hashCode);
    _$hash = $jc(_$hash, consentMarketing.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RegisterRequest')
          ..add('phone', phone)
          ..add('nin', nin)
          ..add('password', password)
          ..add('role', role)
          ..add('fullName', fullName)
          ..add('email', email)
          ..add('consentDataProcessing', consentDataProcessing)
          ..add('consentHealthData', consentHealthData)
          ..add('consentAnpdpTerms', consentAnpdpTerms)
          ..add('consentMarketing', consentMarketing))
        .toString();
  }
}

class RegisterRequestBuilder
    implements Builder<RegisterRequest, RegisterRequestBuilder> {
  _$RegisterRequest? _$v;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  String? _nin;
  String? get nin => _$this._nin;
  set nin(String? nin) => _$this._nin = nin;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  RegisterRequestRoleEnum? _role;
  RegisterRequestRoleEnum? get role => _$this._role;
  set role(RegisterRequestRoleEnum? role) => _$this._role = role;

  String? _fullName;
  String? get fullName => _$this._fullName;
  set fullName(String? fullName) => _$this._fullName = fullName;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  bool? _consentDataProcessing;
  bool? get consentDataProcessing => _$this._consentDataProcessing;
  set consentDataProcessing(bool? consentDataProcessing) =>
      _$this._consentDataProcessing = consentDataProcessing;

  bool? _consentHealthData;
  bool? get consentHealthData => _$this._consentHealthData;
  set consentHealthData(bool? consentHealthData) =>
      _$this._consentHealthData = consentHealthData;

  bool? _consentAnpdpTerms;
  bool? get consentAnpdpTerms => _$this._consentAnpdpTerms;
  set consentAnpdpTerms(bool? consentAnpdpTerms) =>
      _$this._consentAnpdpTerms = consentAnpdpTerms;

  bool? _consentMarketing;
  bool? get consentMarketing => _$this._consentMarketing;
  set consentMarketing(bool? consentMarketing) =>
      _$this._consentMarketing = consentMarketing;

  RegisterRequestBuilder() {
    RegisterRequest._defaults(this);
  }

  RegisterRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _phone = $v.phone;
      _nin = $v.nin;
      _password = $v.password;
      _role = $v.role;
      _fullName = $v.fullName;
      _email = $v.email;
      _consentDataProcessing = $v.consentDataProcessing;
      _consentHealthData = $v.consentHealthData;
      _consentAnpdpTerms = $v.consentAnpdpTerms;
      _consentMarketing = $v.consentMarketing;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RegisterRequest other) {
    _$v = other as _$RegisterRequest;
  }

  @override
  void update(void Function(RegisterRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RegisterRequest build() => _build();

  _$RegisterRequest _build() {
    final _$result =
        _$v ??
        _$RegisterRequest._(
          phone: BuiltValueNullFieldError.checkNotNull(
            phone,
            r'RegisterRequest',
            'phone',
          ),
          nin: BuiltValueNullFieldError.checkNotNull(
            nin,
            r'RegisterRequest',
            'nin',
          ),
          password: BuiltValueNullFieldError.checkNotNull(
            password,
            r'RegisterRequest',
            'password',
          ),
          role: BuiltValueNullFieldError.checkNotNull(
            role,
            r'RegisterRequest',
            'role',
          ),
          fullName: BuiltValueNullFieldError.checkNotNull(
            fullName,
            r'RegisterRequest',
            'fullName',
          ),
          email: email,
          consentDataProcessing: BuiltValueNullFieldError.checkNotNull(
            consentDataProcessing,
            r'RegisterRequest',
            'consentDataProcessing',
          ),
          consentHealthData: BuiltValueNullFieldError.checkNotNull(
            consentHealthData,
            r'RegisterRequest',
            'consentHealthData',
          ),
          consentAnpdpTerms: BuiltValueNullFieldError.checkNotNull(
            consentAnpdpTerms,
            r'RegisterRequest',
            'consentAnpdpTerms',
          ),
          consentMarketing: consentMarketing,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

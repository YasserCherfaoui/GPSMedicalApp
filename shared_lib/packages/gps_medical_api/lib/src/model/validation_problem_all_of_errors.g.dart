// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_problem_all_of_errors.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ValidationProblemAllOfErrors extends ValidationProblemAllOfErrors {
  @override
  final String? field;
  @override
  final String? message;
  @override
  final String? code;

  factory _$ValidationProblemAllOfErrors([
    void Function(ValidationProblemAllOfErrorsBuilder)? updates,
  ]) => (ValidationProblemAllOfErrorsBuilder()..update(updates))._build();

  _$ValidationProblemAllOfErrors._({this.field, this.message, this.code})
    : super._();
  @override
  ValidationProblemAllOfErrors rebuild(
    void Function(ValidationProblemAllOfErrorsBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ValidationProblemAllOfErrorsBuilder toBuilder() =>
      ValidationProblemAllOfErrorsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValidationProblemAllOfErrors &&
        field == other.field &&
        message == other.message &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, field.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValidationProblemAllOfErrors')
          ..add('field', field)
          ..add('message', message)
          ..add('code', code))
        .toString();
  }
}

class ValidationProblemAllOfErrorsBuilder
    implements
        Builder<
          ValidationProblemAllOfErrors,
          ValidationProblemAllOfErrorsBuilder
        > {
  _$ValidationProblemAllOfErrors? _$v;

  String? _field;
  String? get field => _$this._field;
  set field(String? field) => _$this._field = field;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _code;
  String? get code => _$this._code;
  set code(String? code) => _$this._code = code;

  ValidationProblemAllOfErrorsBuilder() {
    ValidationProblemAllOfErrors._defaults(this);
  }

  ValidationProblemAllOfErrorsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _field = $v.field;
      _message = $v.message;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ValidationProblemAllOfErrors other) {
    _$v = other as _$ValidationProblemAllOfErrors;
  }

  @override
  void update(void Function(ValidationProblemAllOfErrorsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValidationProblemAllOfErrors build() => _build();

  _$ValidationProblemAllOfErrors _build() {
    final _$result =
        _$v ??
        _$ValidationProblemAllOfErrors._(
          field: field,
          message: message,
          code: code,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

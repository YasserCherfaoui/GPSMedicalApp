// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validation_problem.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ValidationProblem extends ValidationProblem {
  @override
  final BuiltList<ValidationProblemAllOfErrors>? errors;
  @override
  final String type;
  @override
  final String title;
  @override
  final int status;
  @override
  final String? detail;
  @override
  final String? instance;
  @override
  final String? code;

  factory _$ValidationProblem([
    void Function(ValidationProblemBuilder)? updates,
  ]) => (ValidationProblemBuilder()..update(updates))._build();

  _$ValidationProblem._({
    this.errors,
    required this.type,
    required this.title,
    required this.status,
    this.detail,
    this.instance,
    this.code,
  }) : super._();
  @override
  ValidationProblem rebuild(void Function(ValidationProblemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ValidationProblemBuilder toBuilder() =>
      ValidationProblemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ValidationProblem &&
        errors == other.errors &&
        type == other.type &&
        title == other.title &&
        status == other.status &&
        detail == other.detail &&
        instance == other.instance &&
        code == other.code;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, errors.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, title.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, detail.hashCode);
    _$hash = $jc(_$hash, instance.hashCode);
    _$hash = $jc(_$hash, code.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ValidationProblem')
          ..add('errors', errors)
          ..add('type', type)
          ..add('title', title)
          ..add('status', status)
          ..add('detail', detail)
          ..add('instance', instance)
          ..add('code', code))
        .toString();
  }
}

class ValidationProblemBuilder
    implements
        Builder<ValidationProblem, ValidationProblemBuilder>,
        ProblemBuilder {
  _$ValidationProblem? _$v;

  ListBuilder<ValidationProblemAllOfErrors>? _errors;
  ListBuilder<ValidationProblemAllOfErrors> get errors =>
      _$this._errors ??= ListBuilder<ValidationProblemAllOfErrors>();
  set errors(covariant ListBuilder<ValidationProblemAllOfErrors>? errors) =>
      _$this._errors = errors;

  String? _type;
  String? get type => _$this._type;
  set type(covariant String? type) => _$this._type = type;

  String? _title;
  String? get title => _$this._title;
  set title(covariant String? title) => _$this._title = title;

  int? _status;
  int? get status => _$this._status;
  set status(covariant int? status) => _$this._status = status;

  String? _detail;
  String? get detail => _$this._detail;
  set detail(covariant String? detail) => _$this._detail = detail;

  String? _instance;
  String? get instance => _$this._instance;
  set instance(covariant String? instance) => _$this._instance = instance;

  String? _code;
  String? get code => _$this._code;
  set code(covariant String? code) => _$this._code = code;

  ValidationProblemBuilder() {
    ValidationProblem._defaults(this);
  }

  ValidationProblemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _errors = $v.errors?.toBuilder();
      _type = $v.type;
      _title = $v.title;
      _status = $v.status;
      _detail = $v.detail;
      _instance = $v.instance;
      _code = $v.code;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant ValidationProblem other) {
    _$v = other as _$ValidationProblem;
  }

  @override
  void update(void Function(ValidationProblemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ValidationProblem build() => _build();

  _$ValidationProblem _build() {
    _$ValidationProblem _$result;
    try {
      _$result =
          _$v ??
          _$ValidationProblem._(
            errors: _errors?.build(),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'ValidationProblem',
              'type',
            ),
            title: BuiltValueNullFieldError.checkNotNull(
              title,
              r'ValidationProblem',
              'title',
            ),
            status: BuiltValueNullFieldError.checkNotNull(
              status,
              r'ValidationProblem',
              'status',
            ),
            detail: detail,
            instance: instance,
            code: code,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'errors';
        _errors?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ValidationProblem',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

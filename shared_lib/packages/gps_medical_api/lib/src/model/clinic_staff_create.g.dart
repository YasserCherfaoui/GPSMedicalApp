// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_staff_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicStaffCreate extends ClinicStaffCreate {
  @override
  final String userId;

  factory _$ClinicStaffCreate([
    void Function(ClinicStaffCreateBuilder)? updates,
  ]) => (ClinicStaffCreateBuilder()..update(updates))._build();

  _$ClinicStaffCreate._({required this.userId}) : super._();
  @override
  ClinicStaffCreate rebuild(void Function(ClinicStaffCreateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ClinicStaffCreateBuilder toBuilder() =>
      ClinicStaffCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicStaffCreate && userId == other.userId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'ClinicStaffCreate',
    )..add('userId', userId)).toString();
  }
}

class ClinicStaffCreateBuilder
    implements Builder<ClinicStaffCreate, ClinicStaffCreateBuilder> {
  _$ClinicStaffCreate? _$v;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ClinicStaffCreateBuilder() {
    ClinicStaffCreate._defaults(this);
  }

  ClinicStaffCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _userId = $v.userId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicStaffCreate other) {
    _$v = other as _$ClinicStaffCreate;
  }

  @override
  void update(void Function(ClinicStaffCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicStaffCreate build() => _build();

  _$ClinicStaffCreate _build() {
    final _$result =
        _$v ??
        _$ClinicStaffCreate._(
          userId: BuiltValueNullFieldError.checkNotNull(
            userId,
            r'ClinicStaffCreate',
            'userId',
          ),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clinic_understaffed_shortfall.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ClinicUnderstaffedShortfall extends ClinicUnderstaffedShortfall {
  @override
  final int? capacity;
  @override
  final int? donatedConcurrent;
  @override
  final String? message;

  factory _$ClinicUnderstaffedShortfall([
    void Function(ClinicUnderstaffedShortfallBuilder)? updates,
  ]) => (ClinicUnderstaffedShortfallBuilder()..update(updates))._build();

  _$ClinicUnderstaffedShortfall._({
    this.capacity,
    this.donatedConcurrent,
    this.message,
  }) : super._();
  @override
  ClinicUnderstaffedShortfall rebuild(
    void Function(ClinicUnderstaffedShortfallBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ClinicUnderstaffedShortfallBuilder toBuilder() =>
      ClinicUnderstaffedShortfallBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ClinicUnderstaffedShortfall &&
        capacity == other.capacity &&
        donatedConcurrent == other.donatedConcurrent &&
        message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, capacity.hashCode);
    _$hash = $jc(_$hash, donatedConcurrent.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ClinicUnderstaffedShortfall')
          ..add('capacity', capacity)
          ..add('donatedConcurrent', donatedConcurrent)
          ..add('message', message))
        .toString();
  }
}

class ClinicUnderstaffedShortfallBuilder
    implements
        Builder<
          ClinicUnderstaffedShortfall,
          ClinicUnderstaffedShortfallBuilder
        > {
  _$ClinicUnderstaffedShortfall? _$v;

  int? _capacity;
  int? get capacity => _$this._capacity;
  set capacity(int? capacity) => _$this._capacity = capacity;

  int? _donatedConcurrent;
  int? get donatedConcurrent => _$this._donatedConcurrent;
  set donatedConcurrent(int? donatedConcurrent) =>
      _$this._donatedConcurrent = donatedConcurrent;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  ClinicUnderstaffedShortfallBuilder() {
    ClinicUnderstaffedShortfall._defaults(this);
  }

  ClinicUnderstaffedShortfallBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _capacity = $v.capacity;
      _donatedConcurrent = $v.donatedConcurrent;
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ClinicUnderstaffedShortfall other) {
    _$v = other as _$ClinicUnderstaffedShortfall;
  }

  @override
  void update(void Function(ClinicUnderstaffedShortfallBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ClinicUnderstaffedShortfall build() => _build();

  _$ClinicUnderstaffedShortfall _build() {
    final _$result =
        _$v ??
        _$ClinicUnderstaffedShortfall._(
          capacity: capacity,
          donatedConcurrent: donatedConcurrent,
          message: message,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

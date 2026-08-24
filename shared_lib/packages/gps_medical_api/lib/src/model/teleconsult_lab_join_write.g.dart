// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsult_lab_join_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TeleconsultLabJoinWrite extends TeleconsultLabJoinWrite {
  @override
  final String? peerId;

  factory _$TeleconsultLabJoinWrite([
    void Function(TeleconsultLabJoinWriteBuilder)? updates,
  ]) => (TeleconsultLabJoinWriteBuilder()..update(updates))._build();

  _$TeleconsultLabJoinWrite._({this.peerId}) : super._();
  @override
  TeleconsultLabJoinWrite rebuild(
    void Function(TeleconsultLabJoinWriteBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  TeleconsultLabJoinWriteBuilder toBuilder() =>
      TeleconsultLabJoinWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleconsultLabJoinWrite && peerId == other.peerId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, peerId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(
      r'TeleconsultLabJoinWrite',
    )..add('peerId', peerId)).toString();
  }
}

class TeleconsultLabJoinWriteBuilder
    implements
        Builder<TeleconsultLabJoinWrite, TeleconsultLabJoinWriteBuilder> {
  _$TeleconsultLabJoinWrite? _$v;

  String? _peerId;
  String? get peerId => _$this._peerId;
  set peerId(String? peerId) => _$this._peerId = peerId;

  TeleconsultLabJoinWriteBuilder() {
    TeleconsultLabJoinWrite._defaults(this);
  }

  TeleconsultLabJoinWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _peerId = $v.peerId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleconsultLabJoinWrite other) {
    _$v = other as _$TeleconsultLabJoinWrite;
  }

  @override
  void update(void Function(TeleconsultLabJoinWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeleconsultLabJoinWrite build() => _build();

  _$TeleconsultLabJoinWrite _build() {
    final _$result = _$v ?? _$TeleconsultLabJoinWrite._(peerId: peerId);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

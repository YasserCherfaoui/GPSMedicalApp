// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_case_patch.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConciergeCasePatch extends ConciergeCasePatch {
  @override
  final ConciergeCaseStatus? status;
  @override
  final String? note;
  @override
  final String? conciergeUserId;

  factory _$ConciergeCasePatch([
    void Function(ConciergeCasePatchBuilder)? updates,
  ]) => (ConciergeCasePatchBuilder()..update(updates))._build();

  _$ConciergeCasePatch._({this.status, this.note, this.conciergeUserId})
    : super._();
  @override
  ConciergeCasePatch rebuild(
    void Function(ConciergeCasePatchBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConciergeCasePatchBuilder toBuilder() =>
      ConciergeCasePatchBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConciergeCasePatch &&
        status == other.status &&
        note == other.note &&
        conciergeUserId == other.conciergeUserId;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jc(_$hash, conciergeUserId.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConciergeCasePatch')
          ..add('status', status)
          ..add('note', note)
          ..add('conciergeUserId', conciergeUserId))
        .toString();
  }
}

class ConciergeCasePatchBuilder
    implements Builder<ConciergeCasePatch, ConciergeCasePatchBuilder> {
  _$ConciergeCasePatch? _$v;

  ConciergeCaseStatus? _status;
  ConciergeCaseStatus? get status => _$this._status;
  set status(ConciergeCaseStatus? status) => _$this._status = status;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  String? _conciergeUserId;
  String? get conciergeUserId => _$this._conciergeUserId;
  set conciergeUserId(String? conciergeUserId) =>
      _$this._conciergeUserId = conciergeUserId;

  ConciergeCasePatchBuilder() {
    ConciergeCasePatch._defaults(this);
  }

  ConciergeCasePatchBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _status = $v.status;
      _note = $v.note;
      _conciergeUserId = $v.conciergeUserId;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConciergeCasePatch other) {
    _$v = other as _$ConciergeCasePatch;
  }

  @override
  void update(void Function(ConciergeCasePatchBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConciergeCasePatch build() => _build();

  _$ConciergeCasePatch _build() {
    final _$result =
        _$v ??
        _$ConciergeCasePatch._(
          status: status,
          note: note,
          conciergeUserId: conciergeUserId,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

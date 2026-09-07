// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_case_create.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConciergeCaseCreate extends ConciergeCaseCreate {
  @override
  final String patientUserId;
  @override
  final String? conciergeUserId;
  @override
  final String? note;

  factory _$ConciergeCaseCreate([
    void Function(ConciergeCaseCreateBuilder)? updates,
  ]) => (ConciergeCaseCreateBuilder()..update(updates))._build();

  _$ConciergeCaseCreate._({
    required this.patientUserId,
    this.conciergeUserId,
    this.note,
  }) : super._();
  @override
  ConciergeCaseCreate rebuild(
    void Function(ConciergeCaseCreateBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConciergeCaseCreateBuilder toBuilder() =>
      ConciergeCaseCreateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConciergeCaseCreate &&
        patientUserId == other.patientUserId &&
        conciergeUserId == other.conciergeUserId &&
        note == other.note;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, patientUserId.hashCode);
    _$hash = $jc(_$hash, conciergeUserId.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConciergeCaseCreate')
          ..add('patientUserId', patientUserId)
          ..add('conciergeUserId', conciergeUserId)
          ..add('note', note))
        .toString();
  }
}

class ConciergeCaseCreateBuilder
    implements Builder<ConciergeCaseCreate, ConciergeCaseCreateBuilder> {
  _$ConciergeCaseCreate? _$v;

  String? _patientUserId;
  String? get patientUserId => _$this._patientUserId;
  set patientUserId(String? patientUserId) =>
      _$this._patientUserId = patientUserId;

  String? _conciergeUserId;
  String? get conciergeUserId => _$this._conciergeUserId;
  set conciergeUserId(String? conciergeUserId) =>
      _$this._conciergeUserId = conciergeUserId;

  String? _note;
  String? get note => _$this._note;
  set note(String? note) => _$this._note = note;

  ConciergeCaseCreateBuilder() {
    ConciergeCaseCreate._defaults(this);
  }

  ConciergeCaseCreateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _patientUserId = $v.patientUserId;
      _conciergeUserId = $v.conciergeUserId;
      _note = $v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConciergeCaseCreate other) {
    _$v = other as _$ConciergeCaseCreate;
  }

  @override
  void update(void Function(ConciergeCaseCreateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConciergeCaseCreate build() => _build();

  _$ConciergeCaseCreate _build() {
    final _$result =
        _$v ??
        _$ConciergeCaseCreate._(
          patientUserId: BuiltValueNullFieldError.checkNotNull(
            patientUserId,
            r'ConciergeCaseCreate',
            'patientUserId',
          ),
          conciergeUserId: conciergeUserId,
          note: note,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

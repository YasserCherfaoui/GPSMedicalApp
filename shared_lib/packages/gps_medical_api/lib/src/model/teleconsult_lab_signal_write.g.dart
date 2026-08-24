// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsult_lab_signal_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TeleconsultLabSignalWrite extends TeleconsultLabSignalWrite {
  @override
  final String peerId;
  @override
  final TeleconsultSignalType type;
  @override
  final String? sdp;
  @override
  final TeleconsultIceCandidate? candidate;

  factory _$TeleconsultLabSignalWrite([
    void Function(TeleconsultLabSignalWriteBuilder)? updates,
  ]) => (TeleconsultLabSignalWriteBuilder()..update(updates))._build();

  _$TeleconsultLabSignalWrite._({
    required this.peerId,
    required this.type,
    this.sdp,
    this.candidate,
  }) : super._();
  @override
  TeleconsultLabSignalWrite rebuild(
    void Function(TeleconsultLabSignalWriteBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  TeleconsultLabSignalWriteBuilder toBuilder() =>
      TeleconsultLabSignalWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleconsultLabSignalWrite &&
        peerId == other.peerId &&
        type == other.type &&
        sdp == other.sdp &&
        candidate == other.candidate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, peerId.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, sdp.hashCode);
    _$hash = $jc(_$hash, candidate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TeleconsultLabSignalWrite')
          ..add('peerId', peerId)
          ..add('type', type)
          ..add('sdp', sdp)
          ..add('candidate', candidate))
        .toString();
  }
}

class TeleconsultLabSignalWriteBuilder
    implements
        Builder<TeleconsultLabSignalWrite, TeleconsultLabSignalWriteBuilder> {
  _$TeleconsultLabSignalWrite? _$v;

  String? _peerId;
  String? get peerId => _$this._peerId;
  set peerId(String? peerId) => _$this._peerId = peerId;

  TeleconsultSignalType? _type;
  TeleconsultSignalType? get type => _$this._type;
  set type(TeleconsultSignalType? type) => _$this._type = type;

  String? _sdp;
  String? get sdp => _$this._sdp;
  set sdp(String? sdp) => _$this._sdp = sdp;

  TeleconsultIceCandidateBuilder? _candidate;
  TeleconsultIceCandidateBuilder get candidate =>
      _$this._candidate ??= TeleconsultIceCandidateBuilder();
  set candidate(TeleconsultIceCandidateBuilder? candidate) =>
      _$this._candidate = candidate;

  TeleconsultLabSignalWriteBuilder() {
    TeleconsultLabSignalWrite._defaults(this);
  }

  TeleconsultLabSignalWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _peerId = $v.peerId;
      _type = $v.type;
      _sdp = $v.sdp;
      _candidate = $v.candidate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleconsultLabSignalWrite other) {
    _$v = other as _$TeleconsultLabSignalWrite;
  }

  @override
  void update(void Function(TeleconsultLabSignalWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeleconsultLabSignalWrite build() => _build();

  _$TeleconsultLabSignalWrite _build() {
    _$TeleconsultLabSignalWrite _$result;
    try {
      _$result =
          _$v ??
          _$TeleconsultLabSignalWrite._(
            peerId: BuiltValueNullFieldError.checkNotNull(
              peerId,
              r'TeleconsultLabSignalWrite',
              'peerId',
            ),
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'TeleconsultLabSignalWrite',
              'type',
            ),
            sdp: sdp,
            candidate: _candidate?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'candidate';
        _candidate?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'TeleconsultLabSignalWrite',
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

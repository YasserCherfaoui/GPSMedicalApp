// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teleconsult_signal_write.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$TeleconsultSignalWrite extends TeleconsultSignalWrite {
  @override
  final TeleconsultSignalType type;
  @override
  final String? sdp;
  @override
  final TeleconsultIceCandidate? candidate;

  factory _$TeleconsultSignalWrite([
    void Function(TeleconsultSignalWriteBuilder)? updates,
  ]) => (TeleconsultSignalWriteBuilder()..update(updates))._build();

  _$TeleconsultSignalWrite._({required this.type, this.sdp, this.candidate})
    : super._();
  @override
  TeleconsultSignalWrite rebuild(
    void Function(TeleconsultSignalWriteBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  TeleconsultSignalWriteBuilder toBuilder() =>
      TeleconsultSignalWriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TeleconsultSignalWrite &&
        type == other.type &&
        sdp == other.sdp &&
        candidate == other.candidate;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jc(_$hash, sdp.hashCode);
    _$hash = $jc(_$hash, candidate.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TeleconsultSignalWrite')
          ..add('type', type)
          ..add('sdp', sdp)
          ..add('candidate', candidate))
        .toString();
  }
}

class TeleconsultSignalWriteBuilder
    implements Builder<TeleconsultSignalWrite, TeleconsultSignalWriteBuilder> {
  _$TeleconsultSignalWrite? _$v;

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

  TeleconsultSignalWriteBuilder() {
    TeleconsultSignalWrite._defaults(this);
  }

  TeleconsultSignalWriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _type = $v.type;
      _sdp = $v.sdp;
      _candidate = $v.candidate?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TeleconsultSignalWrite other) {
    _$v = other as _$TeleconsultSignalWrite;
  }

  @override
  void update(void Function(TeleconsultSignalWriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TeleconsultSignalWrite build() => _build();

  _$TeleconsultSignalWrite _build() {
    _$TeleconsultSignalWrite _$result;
    try {
      _$result =
          _$v ??
          _$TeleconsultSignalWrite._(
            type: BuiltValueNullFieldError.checkNotNull(
              type,
              r'TeleconsultSignalWrite',
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
          r'TeleconsultSignalWrite',
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

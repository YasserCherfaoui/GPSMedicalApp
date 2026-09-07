// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concierge_case.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

abstract mixin class ConciergeCaseBuilder {
  void replace(ConciergeCase other);
  void update(void Function(ConciergeCaseBuilder) updates);
  String? get id;
  set id(String? id);

  ConciergePatientSummaryBuilder get patient;
  set patient(ConciergePatientSummaryBuilder? patient);

  String? get conciergeUserId;
  set conciergeUserId(String? conciergeUserId);

  String? get conciergeName;
  set conciergeName(String? conciergeName);

  String? get threadId;
  set threadId(String? threadId);

  ConciergeCaseStatus? get status;
  set status(ConciergeCaseStatus? status);

  String? get note;
  set note(String? note);

  DateTime? get createdAt;
  set createdAt(DateTime? createdAt);

  DateTime? get updatedAt;
  set updatedAt(DateTime? updatedAt);
}

class _$$ConciergeCase extends $ConciergeCase {
  @override
  final String id;
  @override
  final ConciergePatientSummary patient;
  @override
  final String conciergeUserId;
  @override
  final String? conciergeName;
  @override
  final String threadId;
  @override
  final ConciergeCaseStatus status;
  @override
  final String? note;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$$ConciergeCase([void Function($ConciergeCaseBuilder)? updates]) =>
      ($ConciergeCaseBuilder()..update(updates))._build();

  _$$ConciergeCase._({
    required this.id,
    required this.patient,
    required this.conciergeUserId,
    this.conciergeName,
    required this.threadId,
    required this.status,
    this.note,
    required this.createdAt,
    required this.updatedAt,
  }) : super._();
  @override
  $ConciergeCase rebuild(void Function($ConciergeCaseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  $ConciergeCaseBuilder toBuilder() => $ConciergeCaseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is $ConciergeCase &&
        id == other.id &&
        patient == other.patient &&
        conciergeUserId == other.conciergeUserId &&
        conciergeName == other.conciergeName &&
        threadId == other.threadId &&
        status == other.status &&
        note == other.note &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, patient.hashCode);
    _$hash = $jc(_$hash, conciergeUserId.hashCode);
    _$hash = $jc(_$hash, conciergeName.hashCode);
    _$hash = $jc(_$hash, threadId.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, note.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'$ConciergeCase')
          ..add('id', id)
          ..add('patient', patient)
          ..add('conciergeUserId', conciergeUserId)
          ..add('conciergeName', conciergeName)
          ..add('threadId', threadId)
          ..add('status', status)
          ..add('note', note)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class $ConciergeCaseBuilder
    implements
        Builder<$ConciergeCase, $ConciergeCaseBuilder>,
        ConciergeCaseBuilder {
  _$$ConciergeCase? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(covariant String? id) => _$this._id = id;

  ConciergePatientSummaryBuilder? _patient;
  ConciergePatientSummaryBuilder get patient =>
      _$this._patient ??= ConciergePatientSummaryBuilder();
  set patient(covariant ConciergePatientSummaryBuilder? patient) =>
      _$this._patient = patient;

  String? _conciergeUserId;
  String? get conciergeUserId => _$this._conciergeUserId;
  set conciergeUserId(covariant String? conciergeUserId) =>
      _$this._conciergeUserId = conciergeUserId;

  String? _conciergeName;
  String? get conciergeName => _$this._conciergeName;
  set conciergeName(covariant String? conciergeName) =>
      _$this._conciergeName = conciergeName;

  String? _threadId;
  String? get threadId => _$this._threadId;
  set threadId(covariant String? threadId) => _$this._threadId = threadId;

  ConciergeCaseStatus? _status;
  ConciergeCaseStatus? get status => _$this._status;
  set status(covariant ConciergeCaseStatus? status) => _$this._status = status;

  String? _note;
  String? get note => _$this._note;
  set note(covariant String? note) => _$this._note = note;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(covariant DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(covariant DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  $ConciergeCaseBuilder() {
    $ConciergeCase._defaults(this);
  }

  $ConciergeCaseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _patient = $v.patient.toBuilder();
      _conciergeUserId = $v.conciergeUserId;
      _conciergeName = $v.conciergeName;
      _threadId = $v.threadId;
      _status = $v.status;
      _note = $v.note;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(covariant $ConciergeCase other) {
    _$v = other as _$$ConciergeCase;
  }

  @override
  void update(void Function($ConciergeCaseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  $ConciergeCase build() => _build();

  _$$ConciergeCase _build() {
    _$$ConciergeCase _$result;
    try {
      _$result =
          _$v ??
          _$$ConciergeCase._(
            id: BuiltValueNullFieldError.checkNotNull(
              id,
              r'$ConciergeCase',
              'id',
            ),
            patient: patient.build(),
            conciergeUserId: BuiltValueNullFieldError.checkNotNull(
              conciergeUserId,
              r'$ConciergeCase',
              'conciergeUserId',
            ),
            conciergeName: conciergeName,
            threadId: BuiltValueNullFieldError.checkNotNull(
              threadId,
              r'$ConciergeCase',
              'threadId',
            ),
            status: BuiltValueNullFieldError.checkNotNull(
              status,
              r'$ConciergeCase',
              'status',
            ),
            note: note,
            createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt,
              r'$ConciergeCase',
              'createdAt',
            ),
            updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt,
              r'$ConciergeCase',
              'updatedAt',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'patient';
        patient.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'$ConciergeCase',
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

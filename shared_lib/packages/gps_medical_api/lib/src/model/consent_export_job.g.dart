// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_export_job.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const ConsentExportJobStatusEnum _$consentExportJobStatusEnum_pending =
    const ConsentExportJobStatusEnum._('pending');
const ConsentExportJobStatusEnum _$consentExportJobStatusEnum_processing =
    const ConsentExportJobStatusEnum._('processing');
const ConsentExportJobStatusEnum _$consentExportJobStatusEnum_completed =
    const ConsentExportJobStatusEnum._('completed');
const ConsentExportJobStatusEnum _$consentExportJobStatusEnum_failed =
    const ConsentExportJobStatusEnum._('failed');

ConsentExportJobStatusEnum _$consentExportJobStatusEnumValueOf(String name) {
  switch (name) {
    case 'pending':
      return _$consentExportJobStatusEnum_pending;
    case 'processing':
      return _$consentExportJobStatusEnum_processing;
    case 'completed':
      return _$consentExportJobStatusEnum_completed;
    case 'failed':
      return _$consentExportJobStatusEnum_failed;
    default:
      throw ArgumentError(name);
  }
}

final BuiltSet<ConsentExportJobStatusEnum> _$consentExportJobStatusEnumValues =
    BuiltSet<ConsentExportJobStatusEnum>(const <ConsentExportJobStatusEnum>[
      _$consentExportJobStatusEnum_pending,
      _$consentExportJobStatusEnum_processing,
      _$consentExportJobStatusEnum_completed,
      _$consentExportJobStatusEnum_failed,
    ]);

Serializer<ConsentExportJobStatusEnum> _$consentExportJobStatusEnumSerializer =
    _$ConsentExportJobStatusEnumSerializer();

class _$ConsentExportJobStatusEnumSerializer
    implements PrimitiveSerializer<ConsentExportJobStatusEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'pending': 'pending',
    'processing': 'processing',
    'completed': 'completed',
    'failed': 'failed',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'pending': 'pending',
    'processing': 'processing',
    'completed': 'completed',
    'failed': 'failed',
  };

  @override
  final Iterable<Type> types = const <Type>[ConsentExportJobStatusEnum];
  @override
  final String wireName = 'ConsentExportJobStatusEnum';

  @override
  Object serialize(
    Serializers serializers,
    ConsentExportJobStatusEnum object, {
    FullType specifiedType = FullType.unspecified,
  }) => _toWire[object.name] ?? object.name;

  @override
  ConsentExportJobStatusEnum deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) => ConsentExportJobStatusEnum.valueOf(
    _fromWire[serialized] ?? (serialized is String ? serialized : ''),
  );
}

class _$ConsentExportJob extends ConsentExportJob {
  @override
  final String id;
  @override
  final ConsentExportJobStatusEnum status;
  @override
  final ConsentExportFilters filters;
  @override
  final String? exportId;
  @override
  final int? grantCount;
  @override
  final String? errorMessage;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;

  factory _$ConsentExportJob([
    void Function(ConsentExportJobBuilder)? updates,
  ]) => (ConsentExportJobBuilder()..update(updates))._build();

  _$ConsentExportJob._({
    required this.id,
    required this.status,
    required this.filters,
    this.exportId,
    this.grantCount,
    this.errorMessage,
    required this.createdAt,
    this.completedAt,
  }) : super._();
  @override
  ConsentExportJob rebuild(void Function(ConsentExportJobBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsentExportJobBuilder toBuilder() =>
      ConsentExportJobBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsentExportJob &&
        id == other.id &&
        status == other.status &&
        filters == other.filters &&
        exportId == other.exportId &&
        grantCount == other.grantCount &&
        errorMessage == other.errorMessage &&
        createdAt == other.createdAt &&
        completedAt == other.completedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, status.hashCode);
    _$hash = $jc(_$hash, filters.hashCode);
    _$hash = $jc(_$hash, exportId.hashCode);
    _$hash = $jc(_$hash, grantCount.hashCode);
    _$hash = $jc(_$hash, errorMessage.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, completedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsentExportJob')
          ..add('id', id)
          ..add('status', status)
          ..add('filters', filters)
          ..add('exportId', exportId)
          ..add('grantCount', grantCount)
          ..add('errorMessage', errorMessage)
          ..add('createdAt', createdAt)
          ..add('completedAt', completedAt))
        .toString();
  }
}

class ConsentExportJobBuilder
    implements Builder<ConsentExportJob, ConsentExportJobBuilder> {
  _$ConsentExportJob? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  ConsentExportJobStatusEnum? _status;
  ConsentExportJobStatusEnum? get status => _$this._status;
  set status(ConsentExportJobStatusEnum? status) => _$this._status = status;

  ConsentExportFiltersBuilder? _filters;
  ConsentExportFiltersBuilder get filters =>
      _$this._filters ??= ConsentExportFiltersBuilder();
  set filters(ConsentExportFiltersBuilder? filters) =>
      _$this._filters = filters;

  String? _exportId;
  String? get exportId => _$this._exportId;
  set exportId(String? exportId) => _$this._exportId = exportId;

  int? _grantCount;
  int? get grantCount => _$this._grantCount;
  set grantCount(int? grantCount) => _$this._grantCount = grantCount;

  String? _errorMessage;
  String? get errorMessage => _$this._errorMessage;
  set errorMessage(String? errorMessage) => _$this._errorMessage = errorMessage;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _completedAt;
  DateTime? get completedAt => _$this._completedAt;
  set completedAt(DateTime? completedAt) => _$this._completedAt = completedAt;

  ConsentExportJobBuilder() {
    ConsentExportJob._defaults(this);
  }

  ConsentExportJobBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _status = $v.status;
      _filters = $v.filters.toBuilder();
      _exportId = $v.exportId;
      _grantCount = $v.grantCount;
      _errorMessage = $v.errorMessage;
      _createdAt = $v.createdAt;
      _completedAt = $v.completedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsentExportJob other) {
    _$v = other as _$ConsentExportJob;
  }

  @override
  void update(void Function(ConsentExportJobBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsentExportJob build() => _build();

  _$ConsentExportJob _build() {
    _$ConsentExportJob _$result;
    try {
      _$result =
          _$v ??
          _$ConsentExportJob._(
            id: BuiltValueNullFieldError.checkNotNull(
              id,
              r'ConsentExportJob',
              'id',
            ),
            status: BuiltValueNullFieldError.checkNotNull(
              status,
              r'ConsentExportJob',
              'status',
            ),
            filters: filters.build(),
            exportId: exportId,
            grantCount: grantCount,
            errorMessage: errorMessage,
            createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt,
              r'ConsentExportJob',
              'createdAt',
            ),
            completedAt: completedAt,
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filters';
        filters.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ConsentExportJob',
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

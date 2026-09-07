// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consent_export_bundle.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ConsentExportBundle extends ConsentExportBundle {
  @override
  final String exportId;
  @override
  final DateTime generatedAt;
  @override
  final String? userId;
  @override
  final ConsentExportFilters filters;
  @override
  final BuiltList<ConsentGrant> grants;
  @override
  final String signature;
  @override
  final ConsentExportVerification verification;

  factory _$ConsentExportBundle([
    void Function(ConsentExportBundleBuilder)? updates,
  ]) => (ConsentExportBundleBuilder()..update(updates))._build();

  _$ConsentExportBundle._({
    required this.exportId,
    required this.generatedAt,
    this.userId,
    required this.filters,
    required this.grants,
    required this.signature,
    required this.verification,
  }) : super._();
  @override
  ConsentExportBundle rebuild(
    void Function(ConsentExportBundleBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  ConsentExportBundleBuilder toBuilder() =>
      ConsentExportBundleBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsentExportBundle &&
        exportId == other.exportId &&
        generatedAt == other.generatedAt &&
        userId == other.userId &&
        filters == other.filters &&
        grants == other.grants &&
        signature == other.signature &&
        verification == other.verification;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, exportId.hashCode);
    _$hash = $jc(_$hash, generatedAt.hashCode);
    _$hash = $jc(_$hash, userId.hashCode);
    _$hash = $jc(_$hash, filters.hashCode);
    _$hash = $jc(_$hash, grants.hashCode);
    _$hash = $jc(_$hash, signature.hashCode);
    _$hash = $jc(_$hash, verification.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConsentExportBundle')
          ..add('exportId', exportId)
          ..add('generatedAt', generatedAt)
          ..add('userId', userId)
          ..add('filters', filters)
          ..add('grants', grants)
          ..add('signature', signature)
          ..add('verification', verification))
        .toString();
  }
}

class ConsentExportBundleBuilder
    implements Builder<ConsentExportBundle, ConsentExportBundleBuilder> {
  _$ConsentExportBundle? _$v;

  String? _exportId;
  String? get exportId => _$this._exportId;
  set exportId(String? exportId) => _$this._exportId = exportId;

  DateTime? _generatedAt;
  DateTime? get generatedAt => _$this._generatedAt;
  set generatedAt(DateTime? generatedAt) => _$this._generatedAt = generatedAt;

  String? _userId;
  String? get userId => _$this._userId;
  set userId(String? userId) => _$this._userId = userId;

  ConsentExportFiltersBuilder? _filters;
  ConsentExportFiltersBuilder get filters =>
      _$this._filters ??= ConsentExportFiltersBuilder();
  set filters(ConsentExportFiltersBuilder? filters) =>
      _$this._filters = filters;

  ListBuilder<ConsentGrant>? _grants;
  ListBuilder<ConsentGrant> get grants =>
      _$this._grants ??= ListBuilder<ConsentGrant>();
  set grants(ListBuilder<ConsentGrant>? grants) => _$this._grants = grants;

  String? _signature;
  String? get signature => _$this._signature;
  set signature(String? signature) => _$this._signature = signature;

  ConsentExportVerificationBuilder? _verification;
  ConsentExportVerificationBuilder get verification =>
      _$this._verification ??= ConsentExportVerificationBuilder();
  set verification(ConsentExportVerificationBuilder? verification) =>
      _$this._verification = verification;

  ConsentExportBundleBuilder() {
    ConsentExportBundle._defaults(this);
  }

  ConsentExportBundleBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _exportId = $v.exportId;
      _generatedAt = $v.generatedAt;
      _userId = $v.userId;
      _filters = $v.filters.toBuilder();
      _grants = $v.grants.toBuilder();
      _signature = $v.signature;
      _verification = $v.verification.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsentExportBundle other) {
    _$v = other as _$ConsentExportBundle;
  }

  @override
  void update(void Function(ConsentExportBundleBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ConsentExportBundle build() => _build();

  _$ConsentExportBundle _build() {
    _$ConsentExportBundle _$result;
    try {
      _$result =
          _$v ??
          _$ConsentExportBundle._(
            exportId: BuiltValueNullFieldError.checkNotNull(
              exportId,
              r'ConsentExportBundle',
              'exportId',
            ),
            generatedAt: BuiltValueNullFieldError.checkNotNull(
              generatedAt,
              r'ConsentExportBundle',
              'generatedAt',
            ),
            userId: userId,
            filters: filters.build(),
            grants: grants.build(),
            signature: BuiltValueNullFieldError.checkNotNull(
              signature,
              r'ConsentExportBundle',
              'signature',
            ),
            verification: verification.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'filters';
        filters.build();
        _$failedField = 'grants';
        grants.build();

        _$failedField = 'verification';
        verification.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'ConsentExportBundle',
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

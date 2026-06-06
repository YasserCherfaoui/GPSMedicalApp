// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_search.provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchSuggestionsHash() => r'16c803bb0579df9a8f8c9406bd108d6d6794332b';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [searchSuggestions].
@ProviderFor(searchSuggestions)
const searchSuggestionsProvider = SearchSuggestionsFamily();

/// See also [searchSuggestions].
class SearchSuggestionsFamily
    extends Family<AsyncValue<SearchSuggestGet200Response?>> {
  /// See also [searchSuggestions].
  const SearchSuggestionsFamily();

  /// See also [searchSuggestions].
  SearchSuggestionsProvider call(String query) {
    return SearchSuggestionsProvider(query);
  }

  @override
  SearchSuggestionsProvider getProviderOverride(
    covariant SearchSuggestionsProvider provider,
  ) {
    return call(provider.query);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'searchSuggestionsProvider';
}

/// See also [searchSuggestions].
class SearchSuggestionsProvider
    extends AutoDisposeFutureProvider<SearchSuggestGet200Response?> {
  /// See also [searchSuggestions].
  SearchSuggestionsProvider(String query)
    : this._internal(
        (ref) => searchSuggestions(ref as SearchSuggestionsRef, query),
        from: searchSuggestionsProvider,
        name: r'searchSuggestionsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$searchSuggestionsHash,
        dependencies: SearchSuggestionsFamily._dependencies,
        allTransitiveDependencies:
            SearchSuggestionsFamily._allTransitiveDependencies,
        query: query,
      );

  SearchSuggestionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.query,
  }) : super.internal();

  final String query;

  @override
  Override overrideWith(
    FutureOr<SearchSuggestGet200Response?> Function(
      SearchSuggestionsRef provider,
    )
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchSuggestionsProvider._internal(
        (ref) => create(ref as SearchSuggestionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        query: query,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SearchSuggestGet200Response?>
  createElement() {
    return _SearchSuggestionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchSuggestionsProvider && other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SearchSuggestionsRef
    on AutoDisposeFutureProviderRef<SearchSuggestGet200Response?> {
  /// The parameter `query` of this provider.
  String get query;
}

class _SearchSuggestionsProviderElement
    extends AutoDisposeFutureProviderElement<SearchSuggestGet200Response?>
    with SearchSuggestionsRef {
  _SearchSuggestionsProviderElement(super.provider);

  @override
  String get query => (origin as SearchSuggestionsProvider).query;
}

String _$searchFiltersNotifierHash() =>
    r'b842cbf341c7cea8241d251e1e5d7bd6d3bf32f9';

/// See also [SearchFiltersNotifier].
@ProviderFor(SearchFiltersNotifier)
final searchFiltersNotifierProvider =
    NotifierProvider<SearchFiltersNotifier, SearchFilters>.internal(
      SearchFiltersNotifier.new,
      name: r'searchFiltersNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchFiltersNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchFiltersNotifier = Notifier<SearchFilters>;
String _$doctorSearchHash() => r'265e3552c970a4a25a72014573c69133f329fa3c';

/// See also [DoctorSearch].
@ProviderFor(DoctorSearch)
final doctorSearchProvider =
    AutoDisposeAsyncNotifierProvider<DoctorSearch, SearchResultState>.internal(
      DoctorSearch.new,
      name: r'doctorSearchProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$doctorSearchHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$DoctorSearch = AutoDisposeAsyncNotifier<SearchResultState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

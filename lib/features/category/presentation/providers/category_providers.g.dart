// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 대분류 목록. 카테고리 탭은 루트 탭의 `IndexedStack` 안에서 살아 있으므로 한 번만 받는다.

@ProviderFor(categoryCatalog)
const categoryCatalogProvider = CategoryCatalogProvider._();

/// 대분류 목록. 카테고리 탭은 루트 탭의 `IndexedStack` 안에서 살아 있으므로 한 번만 받는다.

final class CategoryCatalogProvider
    extends
        $FunctionalProvider<
          AsyncValue<CategoryCatalog>,
          CategoryCatalog,
          FutureOr<CategoryCatalog>
        >
    with $FutureModifier<CategoryCatalog>, $FutureProvider<CategoryCatalog> {
  /// 대분류 목록. 카테고리 탭은 루트 탭의 `IndexedStack` 안에서 살아 있으므로 한 번만 받는다.
  const CategoryCatalogProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'categoryCatalogProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryCatalogHash();

  @$internal
  @override
  $FutureProviderElement<CategoryCatalog> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CategoryCatalog> create(Ref ref) {
    return categoryCatalog(ref);
  }
}

String _$categoryCatalogHash() => r'45add3b6bb4aed5b8d7829e1df64b59b4227858f';

/// 대분류 [categoryId]·하위 분류 [subcategory]의 본문. null이면 하위 분류 "전체".
///
/// 선택마다 별도 provider라, 이전 선택의 늦은 응답이 새 선택을 덮지 않는다.

@ProviderFor(categoryFeed)
const categoryFeedProvider = CategoryFeedFamily._();

/// 대분류 [categoryId]·하위 분류 [subcategory]의 본문. null이면 하위 분류 "전체".
///
/// 선택마다 별도 provider라, 이전 선택의 늦은 응답이 새 선택을 덮지 않는다.

final class CategoryFeedProvider
    extends
        $FunctionalProvider<
          AsyncValue<CategoryFeed>,
          CategoryFeed,
          FutureOr<CategoryFeed>
        >
    with $FutureModifier<CategoryFeed>, $FutureProvider<CategoryFeed> {
  /// 대분류 [categoryId]·하위 분류 [subcategory]의 본문. null이면 하위 분류 "전체".
  ///
  /// 선택마다 별도 provider라, 이전 선택의 늦은 응답이 새 선택을 덮지 않는다.
  const CategoryFeedProvider._({
    required CategoryFeedFamily super.from,
    required ({String categoryId, String? subcategory}) super.argument,
  }) : super(
         retry: _noRetry,
         name: r'categoryFeedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$categoryFeedHash();

  @override
  String toString() {
    return r'categoryFeedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<CategoryFeed> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<CategoryFeed> create(Ref ref) {
    final argument =
        this.argument as ({String categoryId, String? subcategory});
    return categoryFeed(
      ref,
      categoryId: argument.categoryId,
      subcategory: argument.subcategory,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CategoryFeedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$categoryFeedHash() => r'3a4c1952aa35ee7175048d52df11e2eaed6619b3';

/// 대분류 [categoryId]·하위 분류 [subcategory]의 본문. null이면 하위 분류 "전체".
///
/// 선택마다 별도 provider라, 이전 선택의 늦은 응답이 새 선택을 덮지 않는다.

final class CategoryFeedFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<CategoryFeed>,
          ({String categoryId, String? subcategory})
        > {
  const CategoryFeedFamily._()
    : super(
        retry: _noRetry,
        name: r'categoryFeedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 대분류 [categoryId]·하위 분류 [subcategory]의 본문. null이면 하위 분류 "전체".
  ///
  /// 선택마다 별도 provider라, 이전 선택의 늦은 응답이 새 선택을 덮지 않는다.

  CategoryFeedProvider call({
    required String categoryId,
    String? subcategory,
  }) => CategoryFeedProvider._(
    argument: (categoryId: categoryId, subcategory: subcategory),
    from: this,
  );

  @override
  String toString() => r'categoryFeedProvider';
}

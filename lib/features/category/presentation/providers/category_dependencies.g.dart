// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 카테고리 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoCategoryRepository`를 remote 구현으로 바꾼다.
/// 테스트에서는 `categoryRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.

@ProviderFor(categoryRepository)
const categoryRepositoryProvider = CategoryRepositoryProvider._();

/// 카테고리 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoCategoryRepository`를 remote 구현으로 바꾼다.
/// 테스트에서는 `categoryRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.

final class CategoryRepositoryProvider
    extends
        $FunctionalProvider<
          CategoryRepository,
          CategoryRepository,
          CategoryRepository
        >
    with $Provider<CategoryRepository> {
  /// 카테고리 feature 의존성 조립. 이 파일만 data 구현을 import한다.
  ///
  /// API가 준비되면 여기서 `DemoCategoryRepository`를 remote 구현으로 바꾼다.
  /// 테스트에서는 `categoryRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.
  const CategoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<CategoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CategoryRepository create(Ref ref) {
    return categoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoryRepository>(value),
    );
  }
}

String _$categoryRepositoryHash() =>
    r'6c2b7fa8400684ded3511150affff5fe2d7112fa';

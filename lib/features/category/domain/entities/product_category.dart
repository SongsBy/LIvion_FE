import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_category.freezed.dart';

/// 상품 대분류 ("푸드", "뷰티" ...). 카테고리 화면 상단 아이콘 한 칸.
@freezed
abstract class ProductCategory with _$ProductCategory {
  const factory ProductCategory({
    required String id,
    required String name,

    /// 원형 아이콘 그림. 에셋 경로 또는 URL. null이면 [mark] 글자를 쓴다.
    String? icon,

    /// 그림이 없을 때 원 안에 쓰는 글자 ("ALL").
    String? mark,

    /// 하위 분류 칩. 첫 항목이 "전체"다.
    @Default(<String>['전체']) List<String> subcategories,
  }) = _ProductCategory;
}

/// 카테고리 화면 진입 시 한 번 받는 대분류 목록.
@freezed
abstract class CategoryCatalog with _$CategoryCatalog {
  const factory CategoryCatalog({
    required List<ProductCategory> categories,

    /// 처음 선택된 대분류 id. 목록에 없으면 첫 항목을 쓴다.
    required String initialCategoryId,
  }) = _CategoryCatalog;
}

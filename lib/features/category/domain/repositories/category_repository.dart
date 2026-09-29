import '../entities/category_feed.dart';
import '../entities/product_category.dart';

/// 카테고리 화면 데이터 계약.
///
/// 지금은 데모 구현만 있고, API가 확정되면 data/에 remote 구현을 추가해
/// `category_dependencies.dart`에서만 교체한다.
abstract interface class CategoryRepository {
  Future<CategoryCatalog> fetchCatalog();

  /// [subcategory]가 null이면 하위 분류 "전체".
  Future<CategoryFeed> fetchFeed({
    required String categoryId,
    String? subcategory,
  });
}

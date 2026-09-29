import '../../domain/entities/category_feed.dart';
import '../../domain/entities/product_category.dart';
import '../../domain/repositories/category_repository.dart';
import '../demo/category_demo_data.dart';

/// 데모 발표용 [CategoryRepository]. 네트워크 없이 Figma 데이터를 돌려준다.
///
/// API 연동 시 remote 구현으로 교체하며, DTO → entity 변환과 Failure 매핑은
/// 그 구현이 담당한다.
final class DemoCategoryRepository implements CategoryRepository {
  const DemoCategoryRepository({
    this.latency = const Duration(milliseconds: 300),
  });

  final Duration latency;

  @override
  Future<CategoryCatalog> fetchCatalog() async {
    await _wait();
    return CategoryDemoData.catalog;
  }

  @override
  Future<CategoryFeed> fetchFeed({
    required String categoryId,
    String? subcategory,
  }) async {
    await _wait();
    if (categoryId != CategoryDemoData.foodId &&
        categoryId != CategoryDemoData.allId) {
      return const CategoryFeed();
    }
    const feed = CategoryDemoData.food;
    if (subcategory == null) return feed;

    bool matches(LiveSummary live) =>
        CategoryDemoData.subcategoryOf[live.id] == subcategory;
    return feed.copyWith(
      bestLives: feed.bestLives.where(matches).toList(),
      lives: feed.lives.where(matches).toList(),
    );
  }

  Future<void> _wait() async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
  }
}

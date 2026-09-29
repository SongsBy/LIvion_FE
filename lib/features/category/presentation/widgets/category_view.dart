import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/home/presentation/widgets/home_footer.dart';

import '../../domain/entities/category_feed.dart';
import '../../domain/entities/product_category.dart';
import '../providers/category_providers.dart';
import 'category_feed_sections.dart';
import 'category_icon_row.dart';

/// 대분류 목록을 받은 뒤의 카테고리 화면 (Figma node 37:7032).
///
/// 검색창 · 대분류 아이콘 · 하위 분류 칩은 늘 보이고, 그 아래 본문만
/// 선택에 따라 [categoryFeedProvider]로 다시 조회한다. 선택 값은 이 화면만의
/// 일시적 UI 상태라 로컬 state로 둔다.
class CategoryView extends ConsumerStatefulWidget {
  const CategoryView({
    super.key,
    required this.catalog,
    this.onSearch,
    this.onLiveTap,
    this.onSellerTap,
    this.onMore,
  });

  final CategoryCatalog catalog;
  final VoidCallback? onSearch;
  final ValueChanged<LiveSummary>? onLiveTap;
  final ValueChanged<CategorySeller>? onSellerTap;
  final VoidCallback? onMore;

  static const searchPlaceholder = '상품, 판매자, 채널 검색';

  @override
  ConsumerState<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends ConsumerState<CategoryView> {
  late ProductCategory _category = _initialCategory();
  late String _subcategory = _category.subcategories.first;
  CategoryLiveTab _tab = CategoryLiveTab.live;

  ProductCategory _initialCategory() {
    final categories = widget.catalog.categories;
    return categories.firstWhere(
      (c) => c.id == widget.catalog.initialCategoryId,
      orElse: () => categories.first,
    );
  }

  @override
  void didUpdateWidget(covariant CategoryView oldWidget) {
    super.didUpdateWidget(oldWidget);
    final latest = widget.catalog.categories
        .where((c) => c.id == _category.id)
        .firstOrNull;
    _category = latest ?? _initialCategory();
    if (!_category.subcategories.contains(_subcategory)) {
      _subcategory = _category.subcategories.first;
    }
  }

  void _selectCategory(ProductCategory category) {
    if (category.id == _category.id) return;
    setState(() {
      _category = category;
      _subcategory = category.subcategories.first;
      _tab = CategoryLiveTab.live;
    });
  }

  /// 하위 분류 "전체"(첫 칩)는 필터 없음(null)으로 조회한다.
  CategoryFeedProvider get _feedProvider => categoryFeedProvider(
    categoryId: _category.id,
    subcategory: _subcategory == _category.subcategories.first
        ? null
        : _subcategory,
  );

  @override
  Widget build(BuildContext context) {
    final feed = ref.watch(_feedProvider);
    return RefreshIndicator(
      color: AppColors.mainOrange,
      onRefresh: () => ref.refresh(_feedProvider.future),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(height: AppSpacing.s16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            child: AppSearchBar(
              placeholder: CategoryView.searchPlaceholder,
              onTap: widget.onSearch,
            ),
          ),
          const SizedBox(height: AppSpacing.s16),
          CategoryIconRow(
            categories: widget.catalog.categories,
            selectedId: _category.id,
            onChanged: _selectCategory,
          ),
          const SizedBox(height: AppSpacing.s20),
          AppChoiceChips(
            options: _category.subcategories,
            selected: _subcategory,
            onChanged: (s) => setState(() => _subcategory = s),
          ),
          feed.when(
            loading: () => const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.s56),
              child: AppLoadingView(),
            ),
            error: (_, _) => Padding(
              padding: const EdgeInsets.symmetric(vertical: AppSpacing.s40),
              child: AppErrorView(
                message: '카테고리 정보를 불러오지 못했어요.\n잠시 후 다시 시도해 주세요.',
                onRetry: () => ref.invalidate(_feedProvider),
              ),
            ),
            data: (data) => CategoryFeedSections(
              categoryName: _category.name,
              feed: data,
              tab: _tab,
              onTabChanged: (t) => setState(() => _tab = t),
              onLiveTap: widget.onLiveTap,
              onSellerTap: widget.onSellerTap,
              onMore: widget.onMore,
            ),
          ),
          const SizedBox(height: AppSpacing.s56),
          const HomeFooter(),
        ],
      ),
    );
  }
}

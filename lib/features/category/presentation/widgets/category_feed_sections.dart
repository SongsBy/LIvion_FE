import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/home/presentation/widgets/live_card_row.dart';

import '../../domain/entities/category_feed.dart';

/// "전체 보기"의 방송 상태 탭.
enum CategoryLiveTab {
  live('라이브', '진행 중인 라이브가 없어요.'),
  scheduled('예정 라이브', '예정된 라이브가 없어요.'),
  past('지난 방송', '지난 방송이 없어요.');

  const CategoryLiveTab(this.label, this.emptyMessage);

  final String label;
  final String emptyMessage;

  static CategoryLiveTab fromLabel(String label) =>
      values.firstWhere((t) => t.label == label);
}

/// 카테고리 본문: BEST 라이브 · 인기 판매자 · 전체 보기 (Figma node 37:7104 ~ 37:7290).
///
/// 비어 있는 섹션은 통째로 뺀다. 모든 섹션이 비면 안내 문구만 보인다.
class CategoryFeedSections extends StatelessWidget {
  const CategoryFeedSections({
    super.key,
    required this.categoryName,
    required this.feed,
    required this.tab,
    required this.onTabChanged,
    this.onLiveTap,
    this.onSellerTap,
    this.onMore,
  });

  /// 섹션 제목 앞 오렌지 강조 ("푸드").
  final String categoryName;
  final CategoryFeed feed;
  final CategoryLiveTab tab;
  final ValueChanged<CategoryLiveTab> onTabChanged;
  final ValueChanged<LiveSummary>? onLiveTap;
  final ValueChanged<CategorySeller>? onSellerTap;
  final VoidCallback? onMore;

  /// 섹션 제목(AppSectionHeader)은 터치 영역 때문에 글자보다 13씩 크다.
  /// Figma 간격(32 / 16)에서 그만큼 빼서 실제 여백을 맞춘다.
  static const double _gapBeforeHeader =
      AppSpacing.s32 - AppSectionHeader.touchInset;
  static const double _gapAfterHeader =
      AppSpacing.s16 - AppSectionHeader.touchInset;

  /// Figma: 마지막 그리드 행과 더보기 사이 58.
  static const double _gapBeforeMore = 58;

  List<LiveSummary> get _tabLives => switch (tab) {
    CategoryLiveTab.live => feed.lives,
    CategoryLiveTab.scheduled => feed.scheduledLives,
    CategoryLiveTab.past => feed.pastLives,
  };

  bool get _isEmpty =>
      feed.bestLives.isEmpty &&
      feed.popularSellers.isEmpty &&
      feed.lives.isEmpty &&
      feed.scheduledLives.isEmpty &&
      feed.pastLives.isEmpty;

  @override
  Widget build(BuildContext context) {
    if (_isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.s40),
        child: AppEmptyView(message: '$categoryName 카테고리에 진행 중인 라이브가 없어요.'),
      );
    }

    final lives = _tabLives;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (feed.bestLives.isNotEmpty) ...[
          const SizedBox(height: _gapBeforeHeader),
          AppSectionHeader(title: 'BEST 라이브', accent: categoryName),
          const SizedBox(height: _gapAfterHeader),
          LiveCardRow(lives: feed.bestLives, onTap: onLiveTap),
          const _SectionDivider(),
        ],
        if (feed.popularSellers.isNotEmpty) ...[
          const SizedBox(height: _gapBeforeHeader),
          AppSectionHeader(title: '인기 판매자', accent: categoryName),
          const SizedBox(height: _gapAfterHeader),
          AppLiveAvatarList(
            items: [
              for (final s in feed.popularSellers)
                AppLiveAvatarItem(
                  name: s.name,
                  image: resolveAppImageOrNull(s.avatar),
                  isLive: s.isLive,
                ),
            ],
            onTap: onSellerTap == null
                ? null
                : (i) => onSellerTap!(feed.popularSellers[i]),
          ),
          const _SectionDivider(),
        ],
        const SizedBox(height: _gapBeforeHeader),
        AppSectionHeader(title: '전체 보기', accent: categoryName),
        const SizedBox(height: _gapAfterHeader),
        AppChoiceChips(
          options: [for (final t in CategoryLiveTab.values) t.label],
          selected: tab.label,
          onChanged: (label) => onTabChanged(CategoryLiveTab.fromLabel(label)),
        ),
        const SizedBox(height: AppSpacing.s16),
        if (lives.isEmpty)
          AppEmptyView(message: tab.emptyMessage)
        else ...[
          LiveGrid(lives: lives, onTap: onLiveTap),
          const SizedBox(height: _gapBeforeMore),
          Center(child: AppButton.more(onPressed: onMore)),
        ],
      ],
    );
  }
}

/// 섹션 끝: 32 ↓ 좌우 16 들여 쓴 1px 선.
class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: AppSpacing.s32,
        left: AppSpacing.s16,
        right: AppSpacing.s16,
      ),
      child: AppDivider(),
    );
  }
}

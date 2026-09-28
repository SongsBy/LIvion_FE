import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/followed_seller.dart';
import '../../domain/entities/home_feed.dart';
import '../../domain/entities/live_summary.dart';
import '../../domain/entities/scheduled_live.dart';
import 'all_live_section.dart';
import 'followed_seller_row.dart';
import 'home_footer.dart';
import 'live_card_row.dart';
import 'official_live_section.dart';
import 'trust_banner_list.dart';

/// 조회가 끝난 [HomeFeed]를 Figma 메인 화면(node 26:1043) 순서로 그린다.
///
/// 상단 카테고리 탭과 전체 라이브 칩 선택은 이 화면만의 일시적 UI 상태라
/// 로컬 state로 둔다. 서버 필터 조회가 붙으면 notifier로 옮긴다.
class HomeFeedView extends StatefulWidget {
  const HomeFeedView({
    super.key,
    required this.feed,
    required this.onRefresh,
    this.onLiveTap,
    this.onScheduleTap,
    this.onSellerTap,
    this.onSeeAll,
  });

  final HomeFeed feed;
  final Future<void> Function() onRefresh;
  final ValueChanged<LiveSummary>? onLiveTap;
  final ValueChanged<ScheduledLive>? onScheduleTap;
  final ValueChanged<FollowedSeller>? onSellerTap;

  /// "전체 보기" 탭. 어떤 섹션인지 [HomeSection]으로 알린다.
  final ValueChanged<HomeSection>? onSeeAll;

  static const topTabs = ['추천', '공식방송', '마감 임박', '생활용품', '리퍼브', '이월'];

  @override
  State<HomeFeedView> createState() => _HomeFeedViewState();
}

/// "전체 보기"가 있는 섹션.
enum HomeSection { followedSellers, trending, closingSoon, allLives }

class _HomeFeedViewState extends State<HomeFeedView> {
  int _topTab = 0;
  late String _liveCategory = widget.feed.liveCategories.first;

  /// 섹션 제목(AppSectionHeader)은 터치 영역 때문에 글자보다 13씩 크다.
  /// Figma 간격(32 / 24 / 16)에서 그만큼 빼서 실제 여백을 맞춘다.
  static const double _gapBeforeHeader =
      AppSpacing.s32 - AppSectionHeader.touchInset;
  static const double _gapAfterTabs =
      AppSpacing.s24 - AppSectionHeader.touchInset;
  static const double _gapAfterHeader =
      AppSpacing.s16 - AppSectionHeader.touchInset;

  @override
  void didUpdateWidget(covariant HomeFeedView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!widget.feed.liveCategories.contains(_liveCategory)) {
      _liveCategory = widget.feed.liveCategories.first;
    }
  }

  List<LiveSummary> get _filteredLives {
    final all = widget.feed.lives;
    if (_liveCategory == widget.feed.liveCategories.first) return all;
    return all.where((l) => l.category == _liveCategory).toList();
  }

  @override
  Widget build(BuildContext context) {
    final feed = widget.feed;
    return RefreshIndicator(
      color: AppColors.mainOrange,
      onRefresh: widget.onRefresh,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          AppCategoryTabBar(
            labels: HomeFeedView.topTabs,
            selectedIndex: _topTab,
            onChanged: (i) => setState(() => _topTab = i),
            showDividers: true,
            padding: const EdgeInsets.only(
              left: AppSpacing.s16,
              right: AppSpacing.s16,
              top: AppSpacing.s10,
            ),
          ),
          const SizedBox(height: _gapAfterTabs),
          const AppSectionHeader(title: 'Livion 공식 방송'),
          const SizedBox(height: _gapAfterHeader),
          OfficialLiveSection(
            live: feed.officialLive,
            schedule: feed.schedule,
            onLiveTap: () => widget.onLiveTap?.call(feed.officialLive),
            onScheduleTap: widget.onScheduleTap,
          ),
          const _SectionDivider(),
          AppSectionHeader(
            title: '팔로우한 판매자',
            actionLabel: '전체 보기',
            onAction: () => widget.onSeeAll?.call(HomeSection.followedSellers),
          ),
          const SizedBox(height: _gapAfterHeader),
          FollowedSellerRow(
            sellers: feed.followedSellers,
            onTap: widget.onSellerTap,
          ),
          const _SectionDivider(),
          AppSectionHeader(
            title: '라이브',
            accent: '인기 급상승',
            actionLabel: '전체 보기',
            onAction: () => widget.onSeeAll?.call(HomeSection.trending),
          ),
          const SizedBox(height: _gapAfterHeader),
          LiveCardRow(lives: feed.trendingLives, onTap: widget.onLiveTap),
          const _SectionDivider(),
          AppSectionHeader(
            title: '라이브',
            accent: '마감 D-7',
            actionLabel: '전체 보기',
            onAction: () => widget.onSeeAll?.call(HomeSection.closingSoon),
          ),
          const SizedBox(height: _gapAfterHeader),
          LiveCardRow(lives: feed.closingSoonLives, onTap: widget.onLiveTap),
          const _SectionDivider(),
          AllLiveSection(
            lives: _filteredLives,
            totalCount: feed.totalLiveCount,
            categories: feed.liveCategories,
            selectedCategory: _liveCategory,
            onCategoryChanged: (c) => setState(() => _liveCategory = c),
            onSeeAll: () => widget.onSeeAll?.call(HomeSection.allLives),
            onLiveTap: widget.onLiveTap,
            onMore: () => widget.onSeeAll?.call(HomeSection.allLives),
          ),
          const SizedBox(height: AppSpacing.s32),
          const _Divider(),
          const SizedBox(height: AppSpacing.s32),
          const TrustBannerList(),
          const SizedBox(height: AppSpacing.s56),
          const HomeFooter(),
        ],
      ),
    );
  }
}

/// 섹션 사이: 32 ↓ 선 ↓ (32 - 헤더 터치 여백).
class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: AppSpacing.s32),
        _Divider(),
        SizedBox(height: _HomeFeedViewState._gapBeforeHeader),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  const _Divider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: AppBorderWidth.thin,
      thickness: AppBorderWidth.thin,
      indent: AppSpacing.s16,
      endIndent: AppSpacing.s16,
      color: AppColors.borderDefault,
    );
  }
}

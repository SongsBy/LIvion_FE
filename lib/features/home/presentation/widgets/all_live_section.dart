import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_summary.dart';
import 'live_card_row.dart';

/// "전체 라이브 24": 카테고리 칩 + 2열 카드 그리드 + 더보기.
///
/// 필터는 화면에서 관리하고 여기서는 이미 걸러진 [lives]만 받는다.
class AllLiveSection extends StatelessWidget {
  const AllLiveSection({
    super.key,
    required this.lives,
    required this.totalCount,
    required this.categories,
    required this.selectedCategory,
    required this.onCategoryChanged,
    this.onSeeAll,
    this.onLiveTap,
    this.onMore,
  });

  final List<LiveSummary> lives;
  final int totalCount;
  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onCategoryChanged;
  final VoidCallback? onSeeAll;
  final ValueChanged<LiveSummary>? onLiveTap;
  final VoidCallback? onMore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppSectionHeader(
          title: '전체 라이브',
          accent: '$totalCount',
          accentLeading: false,
          actionLabel: '전체 보기',
          onAction: onSeeAll,
        ),
        const SizedBox(height: AppSpacing.s16 - AppSectionHeader.touchInset),
        AppChoiceChips(
          options: categories,
          selected: selectedCategory,
          onChanged: onCategoryChanged,
        ),
        const SizedBox(height: AppSpacing.s16),
        if (lives.isEmpty)
          const AppEmptyView(message: '해당 카테고리에 진행 중인 라이브가 없어요.')
        else ...[
          LiveGrid(lives: lives, onTap: onLiveTap),
          const SizedBox(height: AppSpacing.s24),
          Center(child: AppButton.more(onPressed: onMore)),
        ],
      ],
    );
  }
}

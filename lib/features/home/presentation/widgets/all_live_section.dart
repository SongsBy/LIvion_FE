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

  static const int _columns = 2;

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
        LiveCategoryChips(
          categories: categories,
          selected: selectedCategory,
          onChanged: onCategoryChanged,
        ),
        const SizedBox(height: AppSpacing.s16),
        if (lives.isEmpty)
          const AppEmptyView(message: '해당 카테고리에 진행 중인 라이브가 없어요.')
        else ...[
          _LiveGrid(lives: lives, onTap: onLiveTap),
          const SizedBox(height: AppSpacing.s24),
          Center(child: AppButton.more(onPressed: onMore)),
        ],
      ],
    );
  }
}

/// 알약 칩. 선택은 오렌지 채움, 나머지는 외곽선.
class LiveCategoryChips extends StatelessWidget {
  const LiveCategoryChips({
    super.key,
    required this.categories,
    required this.selected,
    required this.onChanged,
  });

  final List<String> categories;
  final String selected;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Row(
        children: [
          for (var i = 0; i < categories.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.s6),
            Semantics(
              selected: categories[i] == selected,
              child: categories[i] == selected
                  ? AppButton.primary(
                      label: categories[i],
                      onPressed: () => onChanged(categories[i]),
                    )
                  : AppButton.outline(
                      label: categories[i],
                      onPressed: () => onChanged(categories[i]),
                    ),
            ),
          ],
        ],
      ),
    );
  }
}

class _LiveGrid extends StatelessWidget {
  const _LiveGrid({required this.lives, required this.onTap});

  final List<LiveSummary> lives;
  final ValueChanged<LiveSummary>? onTap;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (
      var start = 0;
      start < lives.length;
      start += AllLiveSection._columns
    ) {
      final rowItems = lives.skip(start).take(AllLiveSection._columns).toList();
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var c = 0; c < AllLiveSection._columns; c++) ...[
              if (c > 0) const SizedBox(width: AppSpacing.s12),
              Expanded(
                child: c < rowItems.length
                    ? LiveSummaryCard(
                        live: rowItems[c],
                        width: double.infinity,
                        onTap: onTap == null ? null : () => onTap!(rowItems[c]),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ],
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Column(
        children: [
          for (var i = 0; i < rows.length; i++) ...[
            if (i > 0) const SizedBox(height: AppSpacing.s24),
            rows[i],
          ],
        ],
      ),
    );
  }
}

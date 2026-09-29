import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_summary.dart';
import 'live_summary_ui.dart';

/// 라이브 카드(160) 가로 목록. 높이는 카드 내용에 맞춰 잡힌다.
class LiveCardRow extends StatelessWidget {
  const LiveCardRow({super.key, required this.lives, this.onTap});

  final List<LiveSummary> lives;
  final ValueChanged<LiveSummary>? onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (var i = 0; i < lives.length; i++) ...[
            if (i > 0) const SizedBox(width: AppSpacing.s12),
            LiveSummaryCard(
              live: lives[i],
              onTap: onTap == null ? null : () => onTap!(lives[i]),
            ),
          ],
        ],
      ),
    );
  }
}

/// [LiveSummary] 하나를 디자인 시스템 [LiveCard]로 그린다.
class LiveSummaryCard extends StatelessWidget {
  const LiveSummaryCard({
    super.key,
    required this.live,
    this.width = LiveCard.defaultWidth,
    this.onTap,
  });

  final LiveSummary live;
  final double width;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return LiveCard(
      sellerName: live.sellerName,
      title: live.title,
      viewers: live.viewersLabel,
      tags: live.tags,
      product: live.productLine,
      thumbnail: resolveAppImageOrNull(live.thumbnail),
      avatar: resolveAppImageOrNull(live.sellerAvatar),
      brandAvatar: live.isOfficial,
      width: width,
      showBookmark: live.isBookmarked,
      onTap: onTap,
    );
  }
}

/// 라이브 카드 2열 그리드. 행 사이 24, 열 사이 12. 마지막 행이 한 칸이면 오른쪽은 비운다.
class LiveGrid extends StatelessWidget {
  const LiveGrid({super.key, required this.lives, this.onTap});

  final List<LiveSummary> lives;
  final ValueChanged<LiveSummary>? onTap;

  static const int _columns = 2;

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var start = 0; start < lives.length; start += _columns) {
      final rowItems = lives.skip(start).take(_columns).toList();
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var c = 0; c < _columns; c++) ...[
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

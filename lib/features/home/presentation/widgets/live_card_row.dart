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
      width: width,
      showBookmark: live.isBookmarked,
      onTap: onTap,
    );
  }
}

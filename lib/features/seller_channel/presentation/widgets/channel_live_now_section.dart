import 'package:flutter/material.dart';

import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_channel.dart';
import 'seller_channel_ui.dart';

/// 지금 방송 중: "● LIVE 👁 1,204 · 입찰현황 14" + 경매 상품 카드 가로 목록.
class ChannelLiveNowSection extends StatelessWidget {
  const ChannelLiveNowSection({
    super.key,
    required this.live,
    required this.onOpenLive,
  });

  final SellerLiveNow live;
  final ValueChanged<String> onOpenLive;

  /// Figma 상품 카드 폭.
  static const double _cardWidth = 329;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
          child: Row(
            children: [
              const AppBadge.live(),
              const SizedBox(width: AppSpacing.s4),
              AppBadge.viewers(formatThousands(live.viewerCount)),
              const Spacer(),
              Text(
                '입찰현황 ${formatThousands(live.bidCount)}',
                style: AppTextStyles.pretendardCaption1Medium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          // 카드 그림자가 잘리지 않게 위아래로 조금 띄운다.
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.s16,
            vertical: AppSpacing.s2,
          ),
          child: Row(
            children: [
              for (var i = 0; i < live.products.length; i++) ...[
                if (i > 0) const SizedBox(width: AppSpacing.s8),
                SizedBox(
                  width: _cardWidth,
                  child: live.products[i].toCard(
                    onTap: () => onOpenLive(live.liveId),
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

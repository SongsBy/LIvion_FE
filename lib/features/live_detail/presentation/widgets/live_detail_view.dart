import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import 'live_activity_pill.dart';
import 'live_auction_carousel.dart';
import 'live_bid_action_bar.dart';
import 'live_broadcast_backdrop.dart';
import 'live_chat_overlay.dart';
import 'live_detail_ui.dart';
import 'live_top_bar.dart';

/// 조회가 끝난 [LiveDetail]을 Figma 라이브 디테일(node 26:238) 배치로 그린다.
///
/// 방송 화면이 전체를 덮고 그 위에 상단 줄 · 제목 · 채팅 · 활동 알약 ·
/// 상품 카드 · 입찰 줄이 겹친다. 상태는 갖지 않고 동작은 콜백으로 알린다.
class LiveDetailView extends StatelessWidget {
  const LiveDetailView({
    super.key,
    required this.detail,
    this.onBack,
    this.onFollowTap,
    this.onShare,
    this.onMore,
    this.onMinimize,
    this.onOpenActivity,
    this.onAuctionItemTap,
    this.onBid,
    this.onBidOptions,
  });

  final LiveDetail detail;
  final VoidCallback? onBack;
  final VoidCallback? onFollowTap;
  final VoidCallback? onShare;
  final VoidCallback? onMore;
  final VoidCallback? onMinimize;

  /// "채팅 · 입찰현황" 알약. 채팅·입찰 패널 화면이 붙으면 그 화면을 연다.
  final VoidCallback? onOpenActivity;
  final ValueChanged<LiveAuctionItem>? onAuctionItemTap;
  final ValueChanged<LiveAuctionItem>? onBid;
  final VoidCallback? onBidOptions;

  /// 제목 시작 x (Figma 36, 판매자 묶음과 같은 선).
  static const double _titleLeft = 36;

  @override
  Widget build(BuildContext context) {
    final current = detail.currentAuctionItem;
    return Stack(
      fit: StackFit.expand,
      children: [
        LiveBroadcastBackdrop(
          image: resolveAppImageOrNull(detail.broadcastImage),
        ),
        SafeArea(
          minimum: const EdgeInsets.only(bottom: AppSpacing.s20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SafeArea 바로 아래에 붙인다. 상단 바가 없는 전체 화면이라
              // 상태 바 아래 첫 줄이 판매자 정보다.
              LiveTopBar(
                seller: detail.seller,
                onBack: onBack,
                onFollowTap: onFollowTap,
                onShare: onShare,
                onMore: onMore,
                onMinimize: onMinimize,
              ),
              const SizedBox(height: AppSpacing.s10),
              _TitleRow(title: detail.title, viewersLabel: detail.viewersLabel),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppSpacing.s16),
                    // 남은 높이가 채팅 창(4줄)보다 작으면 그만큼만 쓴다.
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: LiveChatOverlay.height,
                      ),
                      child: LiveChatOverlay(messages: detail.recentChats),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.s24),
              Center(
                child: LiveActivityPill(
                  chatCountLabel: detail.chatCountLabel,
                  bidCountLabel: detail.bidCountLabel,
                  onTap: onOpenActivity,
                ),
              ),
              const SizedBox(height: AppSpacing.s12),
              LiveAuctionCarousel(
                items: detail.auctionItems,
                onItemTap: onAuctionItemTap,
              ),
              const SizedBox(height: AppSpacing.s12),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
                child: LiveBidActionBar(
                  item: current,
                  paymentNotice: detail.paymentNotice,
                  onBid: current == null || onBid == null
                      ? null
                      : () => onBid!(current),
                  onOptions: onBidOptions,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// 방송 제목(흰 16, 한 줄) + LIVE·시청자 뱃지.
class _TitleRow extends StatelessWidget {
  const _TitleRow({required this.title, required this.viewersLabel});

  final String title;
  final String viewersLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: LiveDetailView._titleLeft,
        right: AppSpacing.s20,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppTextStyles.pretendardBody1.copyWith(
                color: AppColors.textInverse,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: AppSpacing.s16),
          const AppBadge.live(),
          const SizedBox(width: AppSpacing.s4),
          AppBadge.viewers(viewersLabel),
        ],
      ),
    );
  }
}

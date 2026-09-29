import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/auction_detail.dart';
import '../../domain/entities/live_detail.dart';
import 'auction_item_header.dart';
import 'live_bid_action_bar.dart';
import 'live_bid_status_sections.dart';
import 'live_detail_ui.dart';

/// 조회가 끝난 [AuctionDetail]을 Figma 경매 상세(node 37:6134) 배치로 그린다.
///
/// 흰 상품 영역 아래 회색 바탕에 입찰 현황이 이어지고 함께 스크롤된다.
/// 아래 입찰 줄은 [AuctionBidBar]로 따로 두어 화면이 Scaffold 아래에 고정한다.
class AuctionDetailView extends StatelessWidget {
  const AuctionDetailView({
    super.key,
    required this.detail,
    required this.now,
    this.onChangeAutoBid,
  });

  final AuctionDetail detail;

  /// 순위의 "13초전" 기준 시각.
  final DateTime now;
  final VoidCallback? onChangeAutoBid;

  @override
  Widget build(BuildContext context) {
    final status = detail.bidStatus;
    // extendBody로 입찰 줄 높이가 아래 여백에 들어 있다.
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: bottomInset + AppSpacing.s20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AuctionItemHeader(seller: detail.seller, item: detail.item),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.s16,
              AppSpacing.s20,
              AppSpacing.s16,
              0,
            ),
            child: status == null
                ? const AppEmptyView(message: '아직 입찰이 시작되지 않았어요.')
                : LiveBidStatusSections(
                    status: status,
                    now: now,
                    trendCaption: status.marketReferenceLabel,
                    onChangeAutoBid: onChangeAutoBid,
                  ),
          ),
        ],
      ),
    );
  }
}

/// 경매 상세 아래 고정 입찰 줄: [AppFrostedBar] 위에 [LiveBidActionBar].
class AuctionBidBar extends StatelessWidget {
  const AuctionBidBar({
    super.key,
    required this.item,
    this.paymentNotice,
    this.isSubmitting = false,
    this.onBid,
    this.onOptions,
  });

  final LiveAuctionItem item;
  final String? paymentNotice;

  /// 입찰 요청 중이면 CTA가 로딩으로 바뀌고 다시 누를 수 없다.
  final bool isSubmitting;
  final VoidCallback? onBid;
  final VoidCallback? onOptions;

  @override
  Widget build(BuildContext context) {
    return AppFrostedBar(
      child: LiveBidActionBar(
        item: item,
        paymentNotice: paymentNotice,
        noticeColor: AppColors.textSecondary,
        noticeGap: AppSpacing.s20,
        isSubmitting: isSubmitting,
        onBid: onBid,
        onOptions: onOptions,
      ),
    );
  }
}

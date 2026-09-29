import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import 'live_detail_ui.dart';

/// 하단 입찰 줄: "8,400원에 입찰" CTA + "…" 옵션 + 결제 안내 문구.
///
/// [item]이 없으면 CTA는 비활성이다. 입찰 자체는 서버 멱등성 계약이 필요한
/// mutation이라 여기서는 [onBid]로 알리기만 한다.
///
/// [noticeColor]는 안내 문구 색이다. 영상 위(어두운 배경)는 placeholder,
/// 채팅·입찰현황 패널·경매 상세(밝은 배경)는 secondary를 쓴다.
/// [noticeGap]은 버튼 줄과 안내 문구 사이 간격이다 (경매 상세는 20).
class LiveBidActionBar extends StatelessWidget {
  const LiveBidActionBar({
    super.key,
    required this.item,
    this.paymentNotice,
    this.noticeColor = AppColors.textPlaceholder,
    this.noticeGap = AppSpacing.s12,
    this.isSubmitting = false,
    this.onBid,
    this.onOptions,
  });

  final LiveAuctionItem? item;
  final String? paymentNotice;
  final Color noticeColor;
  final double noticeGap;

  /// 입찰 요청 중. CTA가 로딩으로 바뀌고 중복 탭을 막는다.
  final bool isSubmitting;
  final VoidCallback? onBid;
  final VoidCallback? onOptions;

  @override
  Widget build(BuildContext context) {
    final current = item;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: AppButton.cta(
                label: current?.bidCtaLabel ?? '입찰',
                onPressed: current == null ? null : onBid,
                isLoading: isSubmitting,
              ),
            ),
            const SizedBox(width: AppSpacing.s6),
            AppIconButton.boxed(
              icon: AppIcons.dotsHorizontal,
              onPressed: onOptions,
              semanticLabel: '입찰 옵션',
            ),
          ],
        ),
        if (paymentNotice != null) ...[
          SizedBox(height: noticeGap),
          Text(
            paymentNotice!,
            style: AppTextStyles.pretendardCaption1MediumRelaxed.copyWith(
              color: noticeColor,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
    );
  }
}

import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import 'live_bid_status_sections.dart';

/// 채팅·입찰현황 패널의 "입찰현황" 탭 (Figma 26:551).
///
/// [LiveBidStatusSections](현재 입찰가 · 추이 · 순위)가 스크롤되고,
/// 그 아래 "경매 상세 보기" 어두운 알약이 고정된다. [status]가 없으면 빈 안내다.
class LiveBidStatusPage extends StatelessWidget {
  const LiveBidStatusPage({
    super.key,
    required this.status,
    this.now,
    this.onOpenAuctionDetail,
    this.onChangeAutoBid,
  });

  final LiveBidStatus? status;

  /// "13초전" 계산 기준. null이면 그리는 시각. 테스트에서 고정한다.
  final DateTime? now;
  final VoidCallback? onOpenAuctionDetail;
  final VoidCallback? onChangeAutoBid;

  /// 스크롤 영역 아래쪽 페이드 길이 (Figma 그라데이션의 절반 정도).
  static const double _fadeExtent = AppSpacing.s24;

  @override
  Widget build(BuildContext context) {
    final current = status;
    return Column(
      children: [
        Expanded(
          child: current == null
              ? const AppEmptyView(message: '진행 중인 입찰이 없어요.')
              : AppEdgeFade(
                  edge: AppFadeEdge.bottom,
                  extent: _fadeExtent,
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.s16,
                      AppSpacing.s20,
                      AppSpacing.s16,
                      AppSpacing.s24,
                    ),
                    child: LiveBidStatusSections(
                      status: current,
                      now: now ?? DateTime.now(),
                      onChangeAutoBid: onChangeAutoBid,
                    ),
                  ),
                ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.s16,
            AppSpacing.s8,
            AppSpacing.s16,
            AppSpacing.s12,
          ),
          child: _AuctionDetailButton(onTap: onOpenAuctionDetail),
        ),
      ],
    );
  }
}

/// 어두운 알약 "경매 상세 보기  가격 추이 · 검수 리포트 · 입찰 이력  >".
class _AuctionDetailButton extends StatelessWidget {
  const _AuctionDetailButton({required this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: '경매 상세 보기',
      child: Material(
        color: AppColors.backgroundDark,
        borderRadius: AppRadius.pillMdAll,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.pillMdAll,
          child: Container(
            height: AppControlHeight.pillSm,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            child: ExcludeSemantics(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '경매 상세 보기',
                    style: AppTextStyles.pretendardH3.copyWith(
                      color: AppColors.textInverse,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s6),
                  Flexible(
                    child: Text(
                      '가격 추이 · 검수 리포트 · 입찰 이력',
                      style: AppTextStyles.pretendardCaption1Regular.copyWith(
                        color: AppColors.textInverse,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.s6),
                  // Figma는 ChevronLeft를 180° 돌려 오른쪽 화살표로 쓴다.
                  const RotatedBox(
                    quarterTurns: 2,
                    child: AppSvgIcon(
                      AppIcons.chevronLeft,
                      color: AppColors.textInverse,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

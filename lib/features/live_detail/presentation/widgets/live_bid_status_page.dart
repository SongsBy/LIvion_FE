import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import 'live_bid_trend_chart.dart';
import 'live_detail_ui.dart';

/// 채팅·입찰현황 패널의 "입찰현황" 탭 (Figma 26:551).
///
/// 현재 입찰가 · 참여인원/총 입찰 · 입찰가 추이 · 내 입찰 · 순위 목록이 스크롤되고,
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
                  child: _BidStatusList(
                    status: current,
                    now: now ?? DateTime.now(),
                    onChangeAutoBid: onChangeAutoBid,
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

class _BidStatusList extends StatelessWidget {
  const _BidStatusList({
    required this.status,
    required this.now,
    required this.onChangeAutoBid,
  });

  final LiveBidStatus status;
  final DateTime now;
  final VoidCallback? onChangeAutoBid;

  @override
  Widget build(BuildContext context) {
    final myBid = status.myBid;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.s16,
        AppSpacing.s20,
        AppSpacing.s16,
        AppSpacing.s24,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const _SectionTitle('현재 입찰가'),
          const SizedBox(height: AppSpacing.s14),
          _CurrentPriceRow(status: status),
          const SizedBox(height: AppSpacing.s14),
          _StatsBox(status: status),
          const SizedBox(height: AppSpacing.s20),
          const _SectionTitle('입찰가 추이'),
          const SizedBox(height: AppSpacing.s14),
          LiveBidTrendChart(status: status),
          if (status.extensionLabel != null) ...[
            const SizedBox(height: AppSpacing.s12),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                status.extensionLabel!,
                style: AppTextStyles.pretendardCaption1Medium.copyWith(
                  color: AppColors.textPoint,
                ),
              ),
            ),
          ],
          const SizedBox(height: AppSpacing.s20),
          if (myBid != null) ...[
            BidRankRow(
              rank: myBid.rank,
              name: myBid.bidderName,
              price: myBid.priceLabel,
              timeAgo: myBid.timeAgoLabel(now),
              highlighted: true,
            ),
            if (status.maxAutoBidLabel != null) ...[
              const SizedBox(height: AppSpacing.s10),
              _AutoBidRow(
                label: status.maxAutoBidLabel!,
                onChange: onChangeAutoBid,
              ),
            ],
            const SizedBox(height: AppSpacing.s14),
          ],
          if (status.ranking.isEmpty)
            const AppEmptyView(message: '아직 입찰이 없어요.')
          else
            for (final entry in status.ranking)
              BidRankRow(
                rank: entry.rank,
                name: entry.bidderName,
                price: entry.priceLabel,
                timeAgo: entry.timeAgoLabel(now),
              ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.pretendardCaption1Medium.copyWith(
        color: AppColors.textSecondary,
      ),
    );
  }
}

/// "7,900원  [2.6배]                시작가 3,000원"
class _CurrentPriceRow extends StatelessWidget {
  const _CurrentPriceRow({required this.status});

  final LiveBidStatus status;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: status.currentPriceLabel,
                style: AppTextStyles.pretendardH1Tight,
              ),
              TextSpan(text: '원', style: AppTextStyles.pretendardBody2Regular),
            ],
          ),
          maxLines: 1,
        ),
        if (status.multiplierLabel != null) ...[
          const SizedBox(width: AppSpacing.s8),
          _MultiplierPill(status.multiplierLabel!),
        ],
        const Spacer(),
        Text(
          status.startPriceLabel,
          style: AppTextStyles.pretendardCaption1Medium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

/// 연한 오렌지 알약 "2.6배" (높이 20, radius 20).
class _MultiplierPill extends StatelessWidget {
  const _MultiplierPill(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppControlHeight.badge,
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s6),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.backgroundBrandWeak,
        borderRadius: AppRadius.pillMdAll,
      ),
      child: Text(
        text,
        style: AppTextStyles.pretendardCaption1Medium.copyWith(
          color: AppColors.textPoint,
        ),
      ),
    );
  }
}

/// "참여인원 14명 | 총 입찰 32회" 회색 상자.
class _StatsBox extends StatelessWidget {
  const _StatsBox({required this.status});

  final LiveBidStatus status;

  static const double _dividerHeight = AppSpacing.s14;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.s10),
      decoration: const BoxDecoration(
        color: AppColors.backgroundPressed,
        borderRadius: AppRadius.r4All,
      ),
      child: Row(
        children: [
          Expanded(
            child: _Stat(
              icon: AppIcons.userGroup,
              label: '참여인원',
              value: status.participantLabel,
              unit: '명',
            ),
          ),
          Container(
            width: AppBorderWidth.thin,
            height: _dividerHeight,
            color: AppColors.borderSubtle,
          ),
          Expanded(
            child: _Stat(
              icon: AppIcons.currencyDollar,
              label: '총 입찰',
              value: status.totalBidLabel,
              unit: '회',
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
  });

  final String icon;
  final String label;
  final String value;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSvgIcon(icon, size: AppIconSize.stat, color: AppColors.textDisabled),
        const SizedBox(width: AppSpacing.s4),
        Text(
          label,
          style: AppTextStyles.pretendardCaption1Medium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        const SizedBox(width: AppSpacing.s4),
        Text(value, style: AppTextStyles.pretendardBody2),
        const SizedBox(width: AppSpacing.s2),
        Text(unit, style: AppTextStyles.pretendardBody2),
      ],
    );
  }
}

/// "최대가 자동입찰 9,000원  변경" — 오른쪽 정렬.
class _AutoBidRow extends StatelessWidget {
  const _AutoBidRow({required this.label, required this.onChange});

  final String label;
  final VoidCallback? onChange;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          label,
          style: AppTextStyles.pretendardCaption1Medium.copyWith(
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(width: AppSpacing.s4),
        Semantics(
          button: true,
          label: '자동입찰 변경',
          child: InkWell(
            onTap: onChange,
            borderRadius: AppRadius.r4All,
            child: Padding(
              // 12pt 글자에 44 터치 영역을 확보한다.
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.s4,
                vertical: AppSpacing.s15,
              ),
              child: ExcludeSemantics(
                child: Text(
                  '변경',
                  style: AppTextStyles.pretendardCaption1Medium.copyWith(
                    color: AppColors.textPoint,
                  ),
                ),
              ),
            ),
          ),
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

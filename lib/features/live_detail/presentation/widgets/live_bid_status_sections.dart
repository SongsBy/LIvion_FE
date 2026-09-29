import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import 'live_bid_trend_chart.dart';
import 'live_detail_ui.dart';

/// 입찰 현황 본문: 현재 입찰가 · 참여인원/총 입찰 · 입찰가 추이 · 내 입찰 · 순위 목록.
///
/// 채팅·입찰현황 패널의 "입찰현황" 탭(Figma 26:551)과 경매 상세(37:6134)가 함께 쓴다.
/// 스크롤·여백은 쓰는 쪽이 정한다.
class LiveBidStatusSections extends StatelessWidget {
  const LiveBidStatusSections({
    super.key,
    required this.status,
    required this.now,
    this.trendCaption,
    this.onChangeAutoBid,
  });

  final LiveBidStatus status;

  /// "13초전" 계산 기준.
  final DateTime now;

  /// "입찰가 추이" 오른쪽의 참고 문구 (경매 상세의 "유사 품목 평균 낙찰 …"). null이면 숨긴다.
  final String? trendCaption;
  final VoidCallback? onChangeAutoBid;

  @override
  Widget build(BuildContext context) {
    final myBid = status.myBid;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const _SectionTitle('현재 입찰가'),
        const SizedBox(height: AppSpacing.s14),
        _CurrentPriceRow(status: status),
        const SizedBox(height: AppSpacing.s14),
        _StatsBox(status: status),
        const SizedBox(height: AppSpacing.s20),
        _TrendTitle(caption: trendCaption),
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
    );
  }
}

/// "입찰가 추이"와 오른쪽 끝의 작은 참고 문구.
class _TrendTitle extends StatelessWidget {
  const _TrendTitle({required this.caption});

  final String? caption;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionTitle('입찰가 추이'),
        if (caption != null) ...[
          const SizedBox(width: AppSpacing.s8),
          Expanded(
            child: Text(
              caption!,
              style: AppTextStyles.pretendardCaption2.copyWith(
                color: AppColors.textDisabled,
              ),
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ],
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

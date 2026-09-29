import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_program_stats.dart';

/// 판매자 전환 안내 본문 (Figma node 37:3594).
///
/// 제목 · 혜택 카드 3개 · 참여 기업 실적 2개 · 유의사항 순서. 실적만 서버에서
/// 받고, 나머지는 정책 문구라 여기서 고정으로 둔다.
class SellerIntroView extends StatelessWidget {
  const SellerIntroView({super.key, required this.stats, this.onRetryStats});

  final AsyncValue<SellerProgramStats> stats;
  final VoidCallback? onRetryStats;

  static const _features = [
    (AppIcons.featureCard, '유찰 시 수수료 0원', '낙찰 거래에만 12%'),
    (
      AppIcons.featureShield,
      'Livion 검수 등급으로 구매자 신뢰 확보',
      'A/B/C 등급 + 소비기한 D-day 공개',
    ),
    (AppIcons.featureLock, '에스크로 정산', '수취 확인 후 자동 지급'),
  ];

  static const _notes = [
    'Livion은 통신판매중개자이며 사업자등록번호가 필요합니다.',
    '주말·저녁 프라임 슬롯은 편성료 10~30만 원이 부과됩니다.',
    '심사는 영업일 2일 이내, 심사 중에도 재고를 등록할 수 있습니다.',
  ];

  /// Figma: 유의사항 상자와 하단 CTA 줄 사이 30.
  static const double _gapAboveBottomBar = AppSpacing.s30;

  @override
  Widget build(BuildContext context) {
    // extendBody라 아래 padding에 하단 CTA 줄 높이가 들어 있다.
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return ListView(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.s16,
        AppSpacing.s24,
        AppSpacing.s16,
        bottomInset + _gapAboveBottomBar,
      ),
      children: [
        Text(
          '간편하게\n재고 목록만 올리세요',
          style: AppTextStyles.archivoH1Relaxed,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.s10),
        Text(
          '검수·방송·정산·CS는  Livion이 합니다',
          style: AppTextStyles.pretendardBody2.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.s24),
        for (var i = 0; i < _features.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.s10),
          AppFeatureCard(
            icon: _features[i].$1,
            title: _features[i].$2,
            caption: _features[i].$3,
          ),
        ],
        const SizedBox(height: AppSpacing.s48),
        stats.when(
          loading: () => const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSpacing.s56),
            child: AppLoadingView(),
          ),
          error: (_, _) => AppErrorView(
            message: '참여 기업 실적을 불러오지 못했어요.',
            onRetry: onRetryStats,
          ),
          data: (data) => _ProgramStats(stats: data),
        ),
        const SizedBox(height: AppSpacing.s48),
        const AppPanel(
          padding: EdgeInsets.all(AppSpacing.s16),
          child: AppBulletList(items: _notes),
        ),
      ],
    );
  }
}

/// 평균 시작가 대비 배수 + 낙찰률, 각각 아래에 일러스트.
class _ProgramStats extends StatelessWidget {
  const _ProgramStats({required this.stats});

  final SellerProgramStats stats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppStatFigure(
          title: '참여 기업\n평균 시작가 대비',
          value: stats.averageStartPriceMultiplier.toStringAsFixed(1),
          unit: '배',
        ),
        const SizedBox(height: AppSpacing.s24),
        SvgPicture.asset(
          AppIcons.illustrationSellerMultiplier,
          excludeFromSemantics: true,
        ),
        const SizedBox(height: AppSpacing.s64),
        AppStatFigure(
          title: '낙찰 · 낙찰률',
          value: '${stats.winRatePercent}',
          unit: '%',
        ),
        const SizedBox(height: AppSpacing.s24),
        SvgPicture.asset(
          AppIcons.illustrationSellerWinRate,
          excludeFromSemantics: true,
        ),
      ],
    );
  }
}

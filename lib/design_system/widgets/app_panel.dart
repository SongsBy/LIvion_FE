import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 회색 바탕 위 상자. 결제 화면의 금액·배송지·결제수단 상자 등.
///
/// - 기본: 흰 바탕, radius 4, 좌우 10 · 위아래 16
/// - [AppPanel.compact]: 흰 바탕, radius 4, 사방 10 (상품 요약 카드)
/// - [AppPanel.card]: 흰 바탕, radius 8, 사방 16 (재고 등록 검토 · 예상 정산)
/// - [AppPanel.muted]: 검정 10% 트레이, radius 4, 사방 8 (편성 시간 선택)
/// - [AppPanel.translucent]: 흰 30%, radius 4, 좌우 10 · 위아래 8 (트레이 안 안내 줄)
class AppPanel extends StatelessWidget {
  const AppPanel({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.s10,
      vertical: AppSpacing.s16,
    ),
  }) : color = AppColors.backgroundDefault,
       borderRadius = AppRadius.r4All;

  /// 상품 요약 카드처럼 사방 10 여백.
  const AppPanel.compact({super.key, required this.child})
    : padding = const EdgeInsets.all(AppSpacing.s10),
      color = AppColors.backgroundDefault,
      borderRadius = AppRadius.r4All;

  const AppPanel.card({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.s16),
  }) : color = AppColors.backgroundDefault,
       borderRadius = AppRadius.r8All;

  const AppPanel.muted({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(AppSpacing.s8),
  }) : color = AppColors.opacityBlack10,
       borderRadius = AppRadius.r4All;

  const AppPanel.translucent({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      horizontal: AppSpacing.s10,
      vertical: AppSpacing.s8,
    ),
  }) : color = AppColors.opacityWhite30,
       borderRadius = AppRadius.r4All;

  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  final BorderRadius borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(color: color, borderRadius: borderRadius),
      child: child,
    );
  }
}

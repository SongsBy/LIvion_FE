import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 가격 표기 크기. Figma 카드 3종에 맞춘다.
enum AppPriceSize {
  /// 12 / 12 — 라이브 카드 상품 줄
  sm,

  /// 14 / 12 — 판매자 카드 상품 줄
  md,

  /// 16 / 14 — 상품 카드
  lg,

  /// 18 / 18 굵게 — 결제 금액 합계
  xl,
}

/// "0,000원 0배" 표기. 금액은 Bold, 단위는 Medium, 배수는 point 색.
class AppPriceLabel extends StatelessWidget {
  const AppPriceLabel({
    super.key,
    required this.price,
    this.multiplier,
    this.size = AppPriceSize.md,
    this.unit = '원',
    this.multiplierUnit = '배',
  });

  /// 이미 포맷된 금액 문자열 (예: "7,400").
  final String price;

  /// 시작가 대비 배수 (예: "2"). null이면 표시하지 않는다.
  final String? multiplier;
  final AppPriceSize size;
  final String unit;
  final String multiplierUnit;

  @override
  Widget build(BuildContext context) {
    final (priceBold, priceMedium, multBold, multMedium) = switch (size) {
      AppPriceSize.sm => (
        AppTextStyles.pretendardCaption1Bold,
        AppTextStyles.pretendardCaption1Medium,
        AppTextStyles.pretendardCaption1Bold,
        AppTextStyles.pretendardCaption1Medium,
      ),
      AppPriceSize.md => (
        AppTextStyles.pretendardH3,
        AppTextStyles.pretendardBody2,
        AppTextStyles.pretendardCaption1Bold,
        AppTextStyles.pretendardCaption1Medium,
      ),
      AppPriceSize.lg => (
        AppTextStyles.pretendardH2,
        AppTextStyles.pretendardBody1,
        AppTextStyles.pretendardH3,
        AppTextStyles.pretendardBody2,
      ),
      AppPriceSize.xl => (
        AppTextStyles.pretendardH1,
        AppTextStyles.pretendardH1,
        AppTextStyles.pretendardH3,
        AppTextStyles.pretendardBody2,
      ),
    };

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: price, style: priceBold),
                TextSpan(text: unit, style: priceMedium),
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (multiplier != null) ...[
          const SizedBox(width: AppSpacing.s4),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: multiplier,
                  style: multBold.copyWith(color: AppColors.textPoint),
                ),
                TextSpan(
                  text: multiplierUnit,
                  style: multMedium.copyWith(color: AppColors.textPoint),
                ),
              ],
            ),
            maxLines: 1,
          ),
        ],
      ],
    );
  }
}

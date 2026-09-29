import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// 결제 결과 머리: 카드 일러스트 · "낙찰 · 등록 카드로 즉시 결제됐어요" ·
/// "21:14:07 | 국민카드 ****1234" · "에스크로 예치 완료".
class PaymentResultHeader extends StatelessWidget {
  const PaymentResultHeader({
    super.key,
    required this.paidAtLabel,
    required this.cardLabel,
    this.escrowed = false,
  });

  final String paidAtLabel;
  final String cardLabel;

  /// true면 "에스크로 예치 완료" 뱃지를 보인다.
  final bool escrowed;

  static const double _metaDividerHeight = AppSpacing.s10;

  @override
  Widget build(BuildContext context) {
    final metaStyle = AppTextStyles.pretendardCaption1Medium;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppIllustrationBadge.card(semanticLabel: '카드 결제 완료'),
        const SizedBox(height: AppSpacing.s16),
        Text('낙찰 · 등록 카드로 즉시 결제됐어요', style: AppTextStyles.archivoH1),
        const SizedBox(height: AppSpacing.s10),
        Opacity(
          opacity: AppOpacity.muted,
          child: Row(
            children: [
              Text(paidAtLabel, style: metaStyle),
              const SizedBox(width: AppSpacing.s8),
              const AppVerticalDivider(
                height: _metaDividerHeight,
                color: AppColors.opacityBlack5,
              ),
              const SizedBox(width: AppSpacing.s8),
              Flexible(
                child: Text(
                  cardLabel,
                  style: metaStyle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
        if (escrowed) ...[
          const SizedBox(height: AppSpacing.s10),
          const AppBadge.done('에스크로 예치 완료'),
        ],
      ],
    );
  }
}

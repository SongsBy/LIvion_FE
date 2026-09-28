import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Figma `Row/Frame 2147238706`: 입찰 순위 행. "2위 김*빈 7,400원 13초전".
class BidRankRow extends StatelessWidget {
  const BidRankRow({
    super.key,
    required this.rank,
    required this.name,
    required this.price,
    required this.timeAgo,
    this.highlighted = false,
  });

  final int rank;
  final String name;

  /// 포맷된 금액 (예: "7,400원").
  final String price;
  final String timeAgo;

  /// true면 눌린 배경(pressed)으로 강조. false면 아래 subtle 구분선.
  final bool highlighted;

  static const double _rankNameWidth = 92;

  @override
  Widget build(BuildContext context) {
    final rankStyle = AppTextStyles.pretendardH3.copyWith(
      color: rank == 1 ? AppColors.textPoint : AppColors.textPrimary,
    );

    return Container(
      padding: const EdgeInsets.all(AppSpacing.s12),
      decoration: highlighted
          ? const BoxDecoration(
              color: AppColors.backgroundPressed,
              borderRadius: AppRadius.r4All,
            )
          : const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.borderSubtle,
                  width: AppBorderWidth.thin,
                ),
              ),
            ),
      child: Row(
        children: [
          SizedBox(
            width: _rankNameWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('$rank위', style: rankStyle),
                Text(name, style: AppTextStyles.pretendardBody2Regular),
              ],
            ),
          ),
          Expanded(
            child: Text(
              price,
              style: AppTextStyles.pretendardH3,
              textAlign: TextAlign.right,
            ),
          ),
          const SizedBox(width: AppSpacing.s24),
          Text(
            timeAgo,
            style: AppTextStyles.pretendardCaption1Regular.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

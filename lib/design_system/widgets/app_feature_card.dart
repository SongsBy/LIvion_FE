import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 흰 카드(radius 12) 안에 원형 아이콘(36) + 제목 + 설명. 혜택·특징 안내.
///
/// - 기본: 아이콘 왼쪽, 글자 오른쪽 한 줄. Figma 판매자 전환(37:3600):
///   "유찰 시 수수료 0원 / 낙찰 거래에만 12%".
/// - [AppFeatureCard.stacked]: 아이콘 위, 글자 아래 가운데. 좁은 칸을 여럿 나란히 둔다.
///   Figma 재고 등록 검토: "검수 / 영업일 1일 소요", 설명이 없는 "편성 확정".
class AppFeatureCard extends StatelessWidget {
  const AppFeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required String this.caption,
  }) : _stacked = false;

  const AppFeatureCard.stacked({
    super.key,
    required this.icon,
    required this.title,
    this.caption,
  }) : _stacked = true;

  /// 원본 색을 유지하는 36 아이콘 (예: [AppIcons.featureCard]).
  final String icon;
  final String title;
  final String? caption;
  final bool _stacked;

  @override
  Widget build(BuildContext context) {
    final captionStyle = AppTextStyles.pretendardCaption1Medium.copyWith(
      color: AppColors.textSecondary,
    );
    if (_stacked) {
      return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s20,
        ),
        decoration: const BoxDecoration(
          color: AppColors.backgroundDefault,
          borderRadius: AppRadius.r12All,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppSvgIcon(icon, size: AppIconSize.feature),
            const SizedBox(height: AppSpacing.s16),
            Text(
              title,
              style: AppTextStyles.pretendardH3,
              textAlign: TextAlign.center,
            ),
            if (caption != null) ...[
              const SizedBox(height: AppSpacing.s8),
              Text(caption!, style: captionStyle, textAlign: TextAlign.center),
            ],
          ],
        ),
      );
    }
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.s16,
        vertical: AppSpacing.s20,
      ),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r12All,
      ),
      child: Row(
        children: [
          AppSvgIcon(icon, size: AppIconSize.feature),
          const SizedBox(width: AppSpacing.s16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.pretendardH3),
                const SizedBox(height: AppSpacing.s8),
                Text(caption!, style: captionStyle),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

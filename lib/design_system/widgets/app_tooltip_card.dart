import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 어두운 안내 말풍선: ⓘ + 제목, 여러 줄 설명, 아래 가운데 꼬리.
///
/// Figma 재고 등록 상태·검수 "주의사항". 폭은 감싸는 쪽을 채운다.
class AppTooltipCard extends StatelessWidget {
  const AppTooltipCard({super.key, required this.title, required this.message});

  final String title;
  final String message;

  /// Figma: 꼬리(15)가 상자 아래로 5 겹치고, 꼬리 자리(18)가 끝난 곳에서 다음 내용이 온다.
  static const double _pointerOverlap = AppSpacing.s5;
  static const double _pointerSlot = 18;

  @override
  Widget build(BuildContext context) {
    final inverse = AppColors.textInverse;
    return Semantics(
      container: true,
      label: '$title, $message',
      excludeSemantics: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s16,
              vertical: AppSpacing.s10,
            ),
            decoration: const BoxDecoration(
              color: AppColors.backgroundDark,
              borderRadius: AppRadius.r8All,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const AppSvgIcon(AppIcons.info, size: AppIconSize.lg),
                    const SizedBox(width: AppSpacing.s10),
                    Flexible(
                      child: Text(
                        title,
                        style: AppTextStyles.pretendardH2.copyWith(
                          color: inverse,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.s8),
                Text(
                  message,
                  style: AppTextStyles.pretendardBody2Relaxed.copyWith(
                    color: inverse,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: _pointerSlot - _pointerOverlap,
            child: OverflowBox(
              alignment: Alignment.bottomCenter,
              maxHeight: _pointerSlot,
              child: Align(
                alignment: Alignment.topCenter,
                // 꼬리 그림은 위를 향하므로 뒤집어 아래를 가리키게 한다.
                child: RotatedBox(
                  quarterTurns: 2,
                  child: AppSvgIcon.sized(
                    AppIcons.tooltipPointer,
                    size: AppIconSize.tooltipPointer,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// "채팅 1,204 · 입찰현황 14 ⌃" 반투명 알약. 누르면 채팅·입찰 패널을 연다.
class LiveActivityPill extends StatelessWidget {
  const LiveActivityPill({
    super.key,
    required this.chatCountLabel,
    required this.bidCountLabel,
    this.onTap,
  });

  final String chatCountLabel;
  final String bidCountLabel;
  final VoidCallback? onTap;

  static const double _height = AppControlHeight.buttonMd;

  /// Figma backdrop-blur 10 ≈ sigma 5.
  static const double _blurSigma = 5;

  @override
  Widget build(BuildContext context) {
    final labelStyle = AppTextStyles.pretendardH2.copyWith(
      color: AppColors.textInverse,
    );
    final countStyle = AppTextStyles.pretendardBody1.copyWith(
      color: AppColors.textInverse,
    );

    return Semantics(
      button: true,
      label: '채팅 $chatCountLabel, 입찰현황 $bidCountLabel 열기',
      child: ClipRRect(
        borderRadius: AppRadius.pillMdAll,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: _blurSigma, sigmaY: _blurSigma),
          child: Material(
            color: AppColors.opacityWhite15,
            child: InkWell(
              onTap: onTap,
              child: Container(
                height: _height,
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
                child: ExcludeSemantics(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '채팅 ', style: labelStyle),
                            TextSpan(text: chatCountLabel, style: countStyle),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.s6),
                      Text(
                        '·',
                        style: AppTextStyles.pretendardLabel.copyWith(
                          color: AppColors.textInverse,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.s6),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '입찰현황 ', style: labelStyle),
                            TextSpan(text: bidCountLabel, style: countStyle),
                          ],
                        ),
                      ),
                      const SizedBox(width: AppSpacing.s2),
                      const AppSvgIcon(
                        AppIcons.chevronUp,
                        color: AppColors.textInverse,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

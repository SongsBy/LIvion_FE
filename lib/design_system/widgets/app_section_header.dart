import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 섹션 제목 줄. "인기 급상승 라이브 ······ 전체 보기 ›"
///
/// [accent]는 오렌지로 강조되는 부분이다. [accentLeading]이 true면 제목 앞,
/// false면 제목 뒤("전체 라이브 24")에 붙는다.
/// 글자 높이는 18이지만 "전체 보기" 터치 영역을 위해 전체 높이는 44다.
/// 주변 간격을 Figma와 맞출 때는 [touchInset]만큼 빼서 준다.
class AppSectionHeader extends StatelessWidget {
  const AppSectionHeader({
    super.key,
    required this.title,
    this.accent,
    this.accentLeading = true,
    this.actionLabel,
    this.onAction,
  });

  final String title;
  final String? accent;
  final bool accentLeading;
  final String? actionLabel;
  final VoidCallback? onAction;

  static const double height = AppIconSize.touch;

  /// 제목 글자(18)와 전체 높이(44) 차이의 절반.
  static const double touchInset = (height - _titleHeight) / 2;
  static const double _titleHeight = 18;

  @override
  Widget build(BuildContext context) {
    final accentText = accent == null
        ? null
        : Text(
            accent!,
            style: AppTextStyles.archivoH1Tight.copyWith(
              color: AppColors.textBrand,
            ),
          );
    final titleText = Text(title, style: AppTextStyles.archivoH1);

    return SizedBox(
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.s16),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  if (accentLeading && accentText != null) ...[
                    accentText,
                    const SizedBox(width: AppSpacing.s4),
                  ],
                  Flexible(child: titleText),
                  if (!accentLeading && accentText != null) ...[
                    const SizedBox(width: AppSpacing.s4),
                    accentText,
                  ],
                ],
              ),
            ),
            if (actionLabel != null)
              _Action(label: actionLabel!, onTap: onAction)
            else
              const SizedBox(width: AppSpacing.s16),
          ],
        ),
      ),
    );
  }
}

class _Action extends StatelessWidget {
  const _Action({required this.label, required this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: label,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: AppSectionHeader.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
            child: Row(
              children: [
                Text(
                  label,
                  style: AppTextStyles.pretendardBody2.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: AppSpacing.s2),
                const RotatedBox(
                  quarterTurns: 2,
                  child: AppSvgIcon(
                    AppIcons.chevronLeft,
                    size: AppIconSize.sm,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

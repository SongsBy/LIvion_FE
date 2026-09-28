import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

enum AppButtonVariant {
  /// 알약형 오렌지 (36) — 텍스트 Pretendard Bold 14
  primary,

  /// 알약형 외곽선 (36) — 텍스트 Pretendard SemiBold 14
  outline,

  /// 전체 너비 CTA (52) — 텍스트 Archivo ExtraBold 18, 예: "8400원에 입찰"
  cta,

  /// 더보기 (40) — 외곽선 알약 + 아래 화살표, 텍스트 Pretendard Medium 14
  more,
}

/// Figma `button` 세트의 텍스트 버튼. [onPressed]가 null이면 비활성.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
  });

  const AppButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : variant = AppButtonVariant.primary;

  const AppButton.outline({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : variant = AppButtonVariant.outline;

  const AppButton.cta({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : variant = AppButtonVariant.cta;

  /// Figma `Frame 61`: "더보기 ⌄". 목록을 더 펼칠 때 쓴다.
  const AppButton.more({
    super.key,
    this.label = '더보기',
    required this.onPressed,
    this.isLoading = false,
  }) : variant = AppButtonVariant.more;

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;

    final TextStyle textStyle;
    final Color background;
    final Color? borderColor;
    final BorderRadius radius;
    final double height;
    final EdgeInsets padding;
    switch (variant) {
      case AppButtonVariant.primary:
        textStyle = AppTextStyles.pretendardH3.copyWith(
          color: AppColors.textInverseSub,
        );
        background = AppColors.backgroundBrand;
        borderColor = null;
        radius = AppRadius.pillAll;
        height = AppControlHeight.buttonSm;
        padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s16);
      case AppButtonVariant.outline:
        textStyle = AppTextStyles.pretendardLabel.copyWith(
          color: AppColors.textPlaceholder,
        );
        background = AppColors.backgroundDefault;
        borderColor = AppColors.borderStrong;
        radius = AppRadius.pillAll;
        height = AppControlHeight.buttonSm;
        padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s16);
      case AppButtonVariant.cta:
        textStyle = AppTextStyles.archivoH1.copyWith(
          color: AppColors.textInverse,
        );
        background = AppColors.backgroundBrand;
        borderColor = null;
        radius = AppRadius.r4All;
        height = AppControlHeight.buttonLg;
        padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s16);
      case AppButtonVariant.more:
        textStyle = AppTextStyles.pretendardBody2.copyWith(
          color: AppColors.textSecondary,
        );
        background = AppColors.backgroundDefault;
        borderColor = AppColors.borderStrong;
        radius = AppRadius.pillMdAll;
        height = AppControlHeight.buttonMd;
        padding = const EdgeInsets.only(
          left: AppSpacing.s16,
          right: AppSpacing.s12,
        );
    }

    final Widget labelWidget = Text(
      label,
      style: textStyle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    final Widget content = isLoading
        ? SizedBox.square(
            dimension: AppIconSize.md,
            child: CircularProgressIndicator(
              strokeWidth: AppBorderWidth.thick,
              color: textStyle.color,
            ),
          )
        : variant == AppButtonVariant.more
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: labelWidget),
              const SizedBox(width: AppSpacing.s2),
              AppSvgIcon(
                AppIcons.chevronDown,
                size: AppIconSize.xs,
                color: textStyle.color,
              ),
            ],
          )
        : labelWidget;

    Widget button = Opacity(
      opacity: enabled || isLoading ? 1 : AppOpacity.disabled,
      child: Material(
        color: background,
        borderRadius: radius,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: radius,
          child: Container(
            height: height,
            padding: padding,
            decoration: borderColor == null
                ? null
                : BoxDecoration(
                    borderRadius: radius,
                    border: Border.all(
                      color: borderColor,
                      width: AppBorderWidth.thin,
                    ),
                  ),
            child: Center(widthFactor: 1, child: content),
          ),
        ),
      ),
    );

    if (variant == AppButtonVariant.cta) {
      button = SizedBox(width: double.infinity, child: button);
    }

    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      child: button,
    );
  }
}

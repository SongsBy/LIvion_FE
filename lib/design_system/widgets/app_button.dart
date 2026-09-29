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

  /// 전체 너비 CTA (50) — 텍스트 Archivo ExtraBold 16, 예: "로그인", "가입하기"
  ctaMedium,

  /// CTA 옆 흰 외곽선 버튼 (52) — 텍스트 Archivo ExtraBold 18, 예: "이전"
  ctaOutline,

  /// 더보기 (40) — 외곽선 알약 + 아래 화살표, 텍스트 Pretendard Medium 14
  more,

  /// 작은 회색 외곽선 (24) — 텍스트 Pretendard Bold 14, 예: 섹션 제목 옆 "수정"
  smallOutline,

  /// 모서리 5 오렌지 채움 (36) — 아이콘 + Pretendard Bold 14, 예: "♡ 팔로워 1.4천"
  compact,

  /// 모서리 5 오렌지 외곽선 (36) — 아이콘 + Pretendard Bold 14, 예: "라이브 알림 신청"
  compactOutline,
}

/// Figma `button` 세트의 텍스트 버튼. [onPressed]가 null이면 비활성.
///
/// 비활성 cta는 Figma(재고 등록 검토)처럼 검정 10% 바탕 + 흰 글자로, 나머지는 40%로
/// 흐리게 보인다.
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.isLoading = false,
  }) : secondaryLabel = null,
       icon = null;

  const AppButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : variant = AppButtonVariant.primary,
       secondaryLabel = null,
       icon = null;

  const AppButton.outline({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : variant = AppButtonVariant.outline,
       secondaryLabel = null,
       icon = null;

  /// [secondaryLabel]이 있으면 세로 구분선 뒤에 가는 글씨로 잇는다
  /// ("라이브로 돌아가기 | 다음 품목 4/5").
  const AppButton.cta({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.secondaryLabel,
  }) : variant = AppButtonVariant.cta,
       icon = null;

  /// Figma 로그인·회원가입 (37:4033, 37:4170): [cta]보다 낮고 글자가 작다.
  const AppButton.ctaMedium({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : variant = AppButtonVariant.ctaMedium,
       secondaryLabel = null,
       icon = null;

  /// Figma 판매자 전환 하단 "이전": 흰 바탕 + 옅은 테두리. 폭은 감싸는 쪽이 정한다.
  const AppButton.ctaOutline({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  }) : variant = AppButtonVariant.ctaOutline,
       secondaryLabel = null,
       icon = null;

  /// Figma `Frame 61`: "더보기 ⌄". 목록을 더 펼칠 때 쓴다.
  const AppButton.more({
    super.key,
    this.label = '더보기',
    required this.onPressed,
    this.isLoading = false,
  }) : variant = AppButtonVariant.more,
       secondaryLabel = null,
       icon = null;

  /// Figma 재고 등록 검토 "기본 정보 [수정]". 글자 폭만큼 차지한다.
  const AppButton.smallOutline({
    super.key,
    required this.label,
    required this.onPressed,
  }) : variant = AppButtonVariant.smallOutline,
       isLoading = false,
       secondaryLabel = null,
       icon = null;

  /// Figma 판매자 페이지 "♡ 팔로워 1.4천". [outlined]면 오렌지 외곽선 버튼이 된다
  /// (팔로우한 뒤, "라이브 알림 신청"). 폭은 감싸는 쪽이 정한다.
  const AppButton.compact({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    bool outlined = false,
    this.isLoading = false,
  }) : variant = outlined
           ? AppButtonVariant.compactOutline
           : AppButtonVariant.compact,
       secondaryLabel = null;

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final bool isLoading;

  /// cta 전용 보조 문구.
  final String? secondaryLabel;

  /// compact 전용 글자 앞 단색 아이콘 (20, 글자 색으로 칠한다).
  final String? icon;

  /// cta 보조 문구 앞 세로 구분선 높이.
  static const double _secondaryDividerHeight = AppSpacing.s10;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;

    // cta는 비활성일 때 흐리게 하지 않고 회색 바탕으로 바꾼다.
    final disabledCta =
        !enabled &&
        !isLoading &&
        (variant == AppButtonVariant.cta ||
            variant == AppButtonVariant.ctaMedium);

    TextStyle textStyle;
    Color background;
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
      case AppButtonVariant.ctaMedium:
        textStyle = AppTextStyles.archivoH2.copyWith(
          color: AppColors.textInverse,
        );
        background = AppColors.backgroundBrand;
        borderColor = null;
        radius = AppRadius.r4All;
        height = AppControlHeight.buttonCtaMd;
        padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s10);
      case AppButtonVariant.ctaOutline:
        textStyle = AppTextStyles.archivoH1;
        background = AppColors.backgroundDefault;
        borderColor = AppColors.borderSubtle;
        radius = AppRadius.r4All;
        height = AppControlHeight.buttonLg;
        padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s10);
      case AppButtonVariant.smallOutline:
        textStyle = AppTextStyles.pretendardH3.copyWith(
          color: AppColors.textSecondary,
        );
        background = AppColors.backgroundDefault;
        borderColor = AppColors.borderSecondary;
        radius = AppRadius.r4All;
        height = AppControlHeight.buttonXs;
        padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s8);
      case AppButtonVariant.compact:
        textStyle = AppTextStyles.pretendardH3.copyWith(
          color: AppColors.textInverseSub,
        );
        background = AppColors.backgroundBrand;
        borderColor = null;
        radius = AppRadius.r5All;
        height = AppControlHeight.buttonSm;
        padding = const EdgeInsets.symmetric(horizontal: AppSpacing.s16);
      case AppButtonVariant.compactOutline:
        textStyle = AppTextStyles.pretendardH3.copyWith(
          color: AppColors.textBrand,
        );
        background = AppColors.backgroundDefault;
        borderColor = AppColors.borderBrand;
        radius = AppRadius.r5All;
        height = AppControlHeight.buttonSm;
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

    if (disabledCta) background = AppColors.backgroundDisabledCta;

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
        : icon != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppSvgIcon(icon!, size: AppIconSize.lg, color: textStyle.color),
              const SizedBox(width: AppSpacing.s5),
              Flexible(child: labelWidget),
            ],
          )
        : secondaryLabel != null
        ? Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: labelWidget),
              const SizedBox(width: AppSpacing.s16),
              const SizedBox(
                height: _secondaryDividerHeight,
                child: VerticalDivider(
                  width: AppBorderWidth.thin,
                  thickness: AppBorderWidth.thin,
                  color: AppColors.borderInverseSubtle,
                ),
              ),
              const SizedBox(width: AppSpacing.s16),
              Text(
                secondaryLabel!,
                style: AppTextStyles.archivoBody1Regular.copyWith(
                  color: AppColors.textInverse,
                ),
                maxLines: 1,
              ),
            ],
          )
        : labelWidget;

    Widget button = Opacity(
      opacity: enabled || isLoading || disabledCta ? 1 : AppOpacity.disabled,
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

    if (variant == AppButtonVariant.cta ||
        variant == AppButtonVariant.ctaMedium ||
        variant == AppButtonVariant.ctaOutline ||
        variant == AppButtonVariant.compact ||
        variant == AppButtonVariant.compactOutline) {
      button = SizedBox(width: double.infinity, child: button);
    }

    return Semantics(
      button: true,
      enabled: enabled,
      label: secondaryLabel == null ? label : '$label, $secondaryLabel',
      excludeSemantics: secondaryLabel != null,
      child: button,
    );
  }
}

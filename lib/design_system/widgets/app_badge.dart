import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

enum _AppBadgeKind { live, dim, timer, seller, neutral }

/// Figma `Badge` 세트.
///
/// - [AppBadge.live]     오렌지 "● LIVE" (20, 아바타용 compact 18)
/// - [AppBadge.viewers]  어두운 반투명 + 눈 아이콘 + 숫자
/// - [AppBadge.dim]      어두운 반투명 텍스트 ("1,204 시청")
/// - [AppBadge.timer]    연한 오렌지 + 시계 + 시간
/// - [AppBadge.seller]   오렌지 작은 뱃지 "판매자"
/// - [AppBadge.neutral]  회색 작은 뱃지 ("마감 임박", "D-12")
class AppBadge extends StatelessWidget {
  const AppBadge.live({super.key, this.compact = false})
    : _kind = _AppBadgeKind.live,
      text = 'LIVE',
      icon = null;

  const AppBadge.viewers(this.text, {super.key})
    : _kind = _AppBadgeKind.dim,
      icon = AppIcons.eyeSmall,
      compact = false;

  const AppBadge.dim(this.text, {super.key})
    : _kind = _AppBadgeKind.dim,
      icon = null,
      compact = false;

  const AppBadge.timer(this.text, {super.key})
    : _kind = _AppBadgeKind.timer,
      icon = AppIcons.clock,
      compact = false;

  const AppBadge.seller({super.key, this.text = '판매자'})
    : _kind = _AppBadgeKind.seller,
      icon = null,
      compact = false;

  const AppBadge.neutral(this.text, {super.key})
    : _kind = _AppBadgeKind.neutral,
      icon = null,
      compact = false;

  final _AppBadgeKind _kind;
  final String text;
  final String? icon;

  /// live 전용: 아바타 아래에 붙는 18 높이·11pt 버전.
  final bool compact;

  static const double _liveDotSize = 6;

  @override
  Widget build(BuildContext context) {
    final Color background;
    final TextStyle style;
    final double height;
    final double horizontalPadding;
    final double gap;
    final Color iconColor;

    switch (_kind) {
      case _AppBadgeKind.live:
        background = AppColors.backgroundBrand;
        style =
            (compact
                    ? AppTextStyles.pretendardCaption2Bold
                    : AppTextStyles.pretendardCaption1Bold)
                .copyWith(color: AppColors.textInverseSub);
        height = compact ? AppControlHeight.badgeLive : AppControlHeight.badge;
        horizontalPadding = AppSpacing.s6;
        gap = AppSpacing.s4;
        iconColor = AppColors.textInverseSub;
      case _AppBadgeKind.dim:
        background = AppColors.backgroundDim;
        style = AppTextStyles.pretendardCaption1Bold.copyWith(
          color: AppColors.textInverseSub,
        );
        height = AppControlHeight.badge;
        horizontalPadding = AppSpacing.s6;
        gap = AppSpacing.s2;
        iconColor = AppColors.textInverseSub;
      case _AppBadgeKind.timer:
        background = AppColors.backgroundBrandWeaker;
        style = AppTextStyles.pretendardCaption1Medium.copyWith(
          color: AppColors.textPoint,
        );
        height = AppControlHeight.badge;
        horizontalPadding = AppSpacing.s6;
        gap = AppSpacing.s2;
        iconColor = AppColors.textPoint;
      case _AppBadgeKind.seller:
        background = AppColors.backgroundBrand;
        style = AppTextStyles.pretendardCaption2.copyWith(
          color: AppColors.textInverse,
        );
        height = AppControlHeight.badgeSm;
        horizontalPadding = AppSpacing.s4;
        gap = 0;
        iconColor = AppColors.textInverse;
      case _AppBadgeKind.neutral:
        background = AppColors.backgroundSubtle;
        style = AppTextStyles.pretendardCaption2.copyWith(
          color: AppColors.textSecondary,
        );
        height = AppControlHeight.badgeSm;
        horizontalPadding = AppSpacing.s4;
        gap = 0;
        iconColor = AppColors.textSecondary;
    }

    return Container(
      height: height,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        color: background,
        borderRadius: AppRadius.r4All,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_kind == _AppBadgeKind.live) ...[
            Container(
              width: _liveDotSize,
              height: _liveDotSize,
              decoration: const BoxDecoration(
                color: AppColors.backgroundSubtle,
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: gap),
          ] else if (icon != null) ...[
            AppSvgIcon(
              icon!,
              size: _kind == _AppBadgeKind.timer
                  ? AppIconSize.sm
                  : AppIconSize.xs,
              color: iconColor,
            ),
            SizedBox(width: gap),
          ],
          Text(text, style: style),
        ],
      ),
    );
  }
}

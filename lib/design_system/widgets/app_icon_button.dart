import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 아이콘 버튼. 기본은 44 터치 영역, [AppIconButton.boxed]는 52 테두리 박스.
class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.semanticLabel,
    this.size = AppIconSize.touch,
    this.iconSize = AppIconSize.xl,
    this.iconColor = AppColors.textPrimary,
    this.showDot = false,
  }) : bordered = false;

  /// Figma "…" 버튼: 52×52, 흰 배경, subtle 테두리, radius 4.
  const AppIconButton.boxed({
    super.key,
    required this.icon,
    required this.onPressed,
    this.semanticLabel,
    this.iconSize = AppIconSize.xl,
    this.iconColor = AppColors.textPrimary,
  }) : size = AppControlHeight.buttonLg,
       bordered = true,
       showDot = false;

  final String icon;
  final VoidCallback? onPressed;
  final String? semanticLabel;
  final double size;
  final double iconSize;

  /// null이면 아이콘 원본 색을 그대로 쓴다 ([AppIcons.messageBox]처럼 칸이 그려진 그림).
  final Color? iconColor;
  final bool bordered;

  /// 알림 점 (오렌지 6px) 표시 여부.
  final bool showDot;

  static const double _dotSize = 6;

  @override
  Widget build(BuildContext context) {
    Widget iconWidget = AppSvgIcon(icon, size: iconSize, color: iconColor);
    if (showDot) {
      iconWidget = SizedBox.square(
        dimension: iconSize,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            iconWidget,
            Positioned(
              top: 0,
              right: AppSpacing.s2,
              child: Container(
                width: _dotSize,
                height: _dotSize,
                decoration: const BoxDecoration(
                  color: AppColors.backgroundBrand,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Semantics(
      button: true,
      enabled: onPressed != null,
      label: semanticLabel,
      child: Material(
        color: bordered ? AppColors.backgroundDefault : null,
        type: bordered ? MaterialType.canvas : MaterialType.transparency,
        borderRadius: AppRadius.r4All,
        child: InkWell(
          onTap: onPressed,
          borderRadius: AppRadius.r4All,
          child: Container(
            width: size,
            height: size,
            alignment: Alignment.center,
            decoration: bordered
                ? BoxDecoration(
                    borderRadius: AppRadius.r4All,
                    border: Border.all(
                      color: AppColors.borderSubtle,
                      width: AppBorderWidth.thin,
                    ),
                  )
                : null,
            child: iconWidget,
          ),
        ),
      ),
    );
  }
}

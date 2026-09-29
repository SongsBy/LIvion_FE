import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 누르면 다른 화면으로 가는 흰 행: 굵은 이름 + 오른쪽 화살표.
///
/// Figma 판매자 심사 접수 완료 "지금 할 수 있는 일" (37:3574).
class AppNavRow extends StatelessWidget {
  const AppNavRow({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: label,
      onTap: onTap,
      excludeSemantics: true,
      child: Material(
        color: AppColors.backgroundDefault,
        borderRadius: AppRadius.r4All,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.r4All,
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppSpacing.s16,
              right: AppSpacing.s6,
              top: AppSpacing.s10,
              bottom: AppSpacing.s10,
            ),
            child: Row(
              children: [
                Expanded(child: Text(label, style: AppTextStyles.pretendardH3)),
                const SizedBox(width: AppSpacing.s8),
                const AppSvgIcon(
                  AppIcons.chevronRight,
                  color: AppColors.textPrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

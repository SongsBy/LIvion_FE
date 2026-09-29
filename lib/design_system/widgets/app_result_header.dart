import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 완료 화면 머리: 오렌지 원(48) 안 흰 체크 + 가운데 큰 제목 + 회색 안내.
///
/// Figma 판매자 심사 접수 완료 (37:3523).
class AppResultHeader extends StatelessWidget {
  const AppResultHeader({
    super.key,
    required this.title,
    required this.message,
  });

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: AppIconSize.resultBadge,
          height: AppIconSize.resultBadge,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.backgroundBrand,
            shape: BoxShape.circle,
          ),
          child: const AppSvgIcon(
            AppIcons.checkBold,
            size: AppIconSize.resultCheck,
          ),
        ),
        const SizedBox(height: AppSpacing.s24),
        Semantics(
          header: true,
          child: Text(
            title,
            style: AppTextStyles.archivoTitle,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: AppSpacing.s10),
        Text(
          message,
          style: AppTextStyles.pretendardBody2.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

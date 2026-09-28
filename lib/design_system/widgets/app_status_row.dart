import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// Figma `Row/Frame 2147238708` 첫 변형: 거래 상태 행.
///
/// - [AppStatusRow.checked] 오렌지 테두리 + 체크 ("에스크로 예치")
/// - [AppStatusRow.step]    번호 박스 + 라벨, 70% 불투명 ("3 배송 중")
class AppStatusRow extends StatelessWidget {
  const AppStatusRow.checked(this.label, {super.key}) : stepNumber = null;

  const AppStatusRow.step(this.stepNumber, this.label, {super.key});

  final String label;
  final int? stepNumber;

  static const double _stepBoxSize = 20;

  @override
  Widget build(BuildContext context) {
    if (stepNumber == null) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.s10),
        decoration: BoxDecoration(
          color: AppColors.backgroundDefault,
          borderRadius: AppRadius.r4All,
          border: Border.all(
            color: AppColors.borderBrand,
            width: AppBorderWidth.thin,
          ),
        ),
        child: Row(
          children: [
            const AppSvgIcon(AppIcons.check, size: AppIconSize.lg),
            const SizedBox(width: AppSpacing.s10),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.pretendardH3.copyWith(
                  color: AppColors.textBrand,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Opacity(
      opacity: AppOpacity.dimmed,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.s10),
        decoration: const BoxDecoration(
          color: AppColors.backgroundDefault,
          borderRadius: AppRadius.r4All,
        ),
        child: Row(
          children: [
            Container(
              width: _stepBoxSize,
              height: _stepBoxSize,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.backgroundSubtle,
                borderRadius: AppRadius.r4All,
              ),
              child: Text('$stepNumber', style: AppTextStyles.pretendardBody2),
            ),
            const SizedBox(width: AppSpacing.s10),
            Expanded(child: Text(label, style: AppTextStyles.pretendardH3)),
          ],
        ),
      ),
    );
  }
}

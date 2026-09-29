import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// Figma `Row/Frame 2147238708` 첫 변형: 거래 상태 행.
///
/// - [AppStatusRow.checked] 오렌지 테두리 + 체크 ("에스크로 예치")
/// - [AppStatusRow.step]    번호 박스 + 라벨, 70% 불투명 ("3 배송 중").
///   [nextLabel]이 있으면 화살표로 잇는다 ("4 수취 확인 › 판매자 지급").
///   [dimmed]가 false면 흐리지 않는다 (판매자 전환 "심사 절차 1 접수").
class AppStatusRow extends StatelessWidget {
  const AppStatusRow.checked(this.label, {super.key})
    : stepNumber = null,
      nextLabel = null,
      dimmed = false;

  const AppStatusRow.step(
    this.stepNumber,
    this.label, {
    super.key,
    this.nextLabel,
    this.dimmed = true,
  });

  final String label;
  final int? stepNumber;
  final String? nextLabel;

  /// step 전용: 지난 단계처럼 70%로 흐리게 보일지.
  final bool dimmed;

  static const double _stepBoxSize = 20;

  /// Figma "수취 확인 › 판매자 지급" 간격 5 (Figma 값 그대로, 토큰에 없는 한 번짜리).
  static const double _arrowGap = 5;

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
      opacity: dimmed ? AppOpacity.dimmed : 1,
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
            if (nextLabel == null)
              Expanded(child: Text(label, style: AppTextStyles.pretendardH3))
            else ...[
              Text(label, style: AppTextStyles.pretendardH3),
              const SizedBox(width: _arrowGap),
              const AppSvgIcon(
                AppIcons.chevronRightSmall,
                size: AppIconSize.md,
              ),
              const SizedBox(width: _arrowGap),
              Flexible(
                child: Text(nextLabel!, style: AppTextStyles.pretendardH3),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

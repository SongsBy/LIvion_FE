import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// Figma `Radio / Active / Selected`(16). 선택이면 오렌지 링, 아니면 옅은 회색 원.
///
/// 누르는 동작은 없다. 행 전체를 누르는 [AppOptionTile]·[AppOptionCard] 안에 쓴다.
class AppRadioMark extends StatelessWidget {
  const AppRadioMark({super.key, required this.selected});

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return AppSvgIcon(
      selected ? AppIcons.radioOn : AppIcons.radioOff,
      size: AppIconSize.md,
    );
  }
}

/// Figma `Checkbox / Active / Selected`(20). 체크면 오렌지 칸 + 흰 체크,
/// 아니면 옅은 회색 칸 + 테두리.
class AppCheckboxMark extends StatelessWidget {
  const AppCheckboxMark({super.key, required this.checked});

  final bool checked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppIconSize.lg,
      height: AppIconSize.lg,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: checked ? AppColors.backgroundBrand : AppColors.backgroundSubtle,
        borderRadius: AppRadius.r4All,
        border: checked
            ? null
            : Border.all(
                color: AppColors.borderControl,
                width: AppBorderWidth.thin,
              ),
      ),
      child: checked
          ? const AppSvgIcon(
              AppIcons.checkboxCheck,
              size: AppIconSize.checkMark,
            )
          : null,
    );
  }
}

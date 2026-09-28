import 'package:flutter/material.dart';

import 'package:livion/design_system/tokens/tokens.dart';

import '../color_sheet_spec.dart';

/// 스와치 한 칸: 색 타일 + 이름 + hex 값.
class ColorSwatchTile extends StatelessWidget {
  const ColorSwatchTile({super.key, required this.spec});

  /// Figma 스와치 타일 크기 (156 × 72).
  static const double width = 156;
  static const double tileHeight = 72;

  final ColorSwatchSpec spec;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Semantics(
            label: '${spec.name} ${formatSwatchValue(spec.color)}',
            child: Container(
              width: width,
              height: tileHeight,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: AppRadius.r8All,
              ).copyWith(color: spec.tileBackground),
              foregroundDecoration: BoxDecoration(
                borderRadius: AppRadius.r8All,
                border: Border.all(
                  color: AppColors.borderDefault,
                  width: AppBorderWidth.thin,
                ),
              ),
              child: ColoredBox(color: spec.color),
            ),
          ),
          const SizedBox(height: AppSpacing.s6),
          Text(spec.name, style: AppTextStyles.sheetLabel),
          const SizedBox(height: AppSpacing.s6),
          Text(
            formatSwatchValue(spec.color),
            style: AppTextStyles.sheetCaption,
          ),
        ],
      ),
    );
  }
}

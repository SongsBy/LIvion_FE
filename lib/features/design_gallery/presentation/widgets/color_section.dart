import 'package:flutter/material.dart';

import 'package:livion/design_system/tokens/tokens.dart';

import '../color_sheet_spec.dart';
import 'color_swatch_tile.dart';

/// 섹션 제목 + 설명 + 스와치 Wrap.
class ColorSection extends StatelessWidget {
  const ColorSection({super.key, required this.spec});

  final ColorSectionSpec spec;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(spec.title, style: AppTextStyles.sheetSectionTitle),
            const SizedBox(width: AppSpacing.s8),
            Flexible(
              child: Text(
                spec.caption,
                style: AppTextStyles.sheetSectionCaption,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.s12),
        Wrap(
          spacing: AppSpacing.s12,
          runSpacing: AppSpacing.s16,
          children: [
            for (final swatch in spec.swatches) ColorSwatchTile(spec: swatch),
          ],
        ),
      ],
    );
  }
}

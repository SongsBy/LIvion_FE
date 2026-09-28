import 'package:flutter/material.dart';

import 'package:livion/design_system/tokens/tokens.dart';

import '../text_sheet_spec.dart';

/// Text Sheet 한 항목: `Pretendard  16pt  Medium` 표기 + 용도 설명.
class TypographyEntry extends StatelessWidget {
  const TypographyEntry({super.key, required this.spec});

  /// Figma: 표기 사이 가로 간격 18, 표기와 설명 사이 세로 간격 14.
  static const double _labelGap = 18;
  static const double _usageGap = 14;

  final TypographyEntrySpec spec;

  @override
  Widget build(BuildContext context) {
    final style = spec.style;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          spacing: _labelGap,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(style.fontFamily ?? '', style: style),
            Text(fontSizeLabel(style), style: style),
            Text(fontWeightName(style.fontWeight), style: style),
          ],
        ),
        const SizedBox(height: _usageGap),
        Text(spec.usage, style: AppTextStyles.sheetUsage),
      ],
    );
  }
}

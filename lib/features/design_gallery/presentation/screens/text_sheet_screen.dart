import 'package:flutter/material.dart';

import '../text_sheet_spec.dart';
import '../widgets/sheet_card.dart';
import '../widgets/typography_row.dart';

/// Figma "Tect Sheet"(node 26:1775) 화면. 디자인 시스템 타이포그래피를 보여준다.
///
/// Figma 프레임의 제목 텍스트는 "Color"로 되어 있으나 내용은 타이포그래피라
/// 여기서는 "Text"로 표기한다.
class TextSheetScreen extends StatelessWidget {
  const TextSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SheetCard(
      title: 'Text',
      children: [for (final row in textSheetRows) TypographyRow(spec: row)],
    );
  }
}

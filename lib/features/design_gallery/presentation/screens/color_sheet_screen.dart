import 'package:flutter/material.dart';

import '../color_sheet_spec.dart';
import '../widgets/color_section.dart';
import '../widgets/sheet_card.dart';

/// Figma "Color Sheet"(node 26:1645) 화면. 디자인 시스템 색상 목록을 보여준다.
class ColorSheetScreen extends StatelessWidget {
  const ColorSheetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SheetCard(
      title: 'Color',
      children: [
        for (final section in colorSheetSections) ColorSection(spec: section),
      ],
    );
  }
}

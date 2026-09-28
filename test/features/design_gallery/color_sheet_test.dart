import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/tokens/tokens.dart';
import 'package:livion/features/design_gallery/presentation/color_sheet_spec.dart';
import 'package:livion/features/design_gallery/presentation/screens/color_sheet_screen.dart';

void main() {
  group('formatSwatchValue', () {
    test('불투명 색은 hex만 표기한다', () {
      expect(formatSwatchValue(AppColors.mainOrange), '#FF7D0C');
      expect(formatSwatchValue(AppColors.neutral0), '#FFFFFF');
    });

    test('반투명 색은 hex와 퍼센트를 표기한다', () {
      expect(formatSwatchValue(AppColors.mainOrange20), '#FF7D0C · 20%');
      expect(formatSwatchValue(AppColors.mainOrange10), '#FF7D0C · 10%');
      expect(formatSwatchValue(AppColors.opacityBlack65), '#201E1D · 65%');
      expect(formatSwatchValue(AppColors.opacityBlack55), '#201E1D · 55%');
      expect(formatSwatchValue(AppColors.opacityBlack40), '#201E1D · 40%');
      expect(formatSwatchValue(AppColors.opacityBlack5), '#201E1D · 5%');
      expect(formatSwatchValue(AppColors.opacityWhite80), '#FFFFFF · 80%');
      expect(formatSwatchValue(AppColors.opacityWhite30), '#FFFFFF · 30%');
      expect(formatSwatchValue(AppColors.opacityWhite15), '#FFFFFF · 15%');
    });
  });

  testWidgets('Color Sheet은 Figma의 5개 섹션과 20개 스와치를 그린다', (tester) async {
    tester.view.physicalSize = const Size(1000, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MaterialApp(home: ColorSheetScreen()));

    expect(find.text('Color'), findsOneWidget);
    for (final section in colorSheetSections) {
      expect(find.text(section.title), findsOneWidget);
      expect(find.text(section.caption), findsOneWidget);
    }
    expect(colorSheetSections.length, 5);
    expect(colorSheetSections.expand((s) => s.swatches).length, 20);
    expect(find.text('#FF7D0C'), findsOneWidget);
    expect(find.text('#FFFFFF · 15%'), findsOneWidget);
  });

  testWidgets('좁은 화면에서도 overflow 없이 그려진다', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MaterialApp(home: ColorSheetScreen()));
    expect(tester.takeException(), isNull);
  });
}

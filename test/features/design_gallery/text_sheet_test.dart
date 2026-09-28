import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/tokens/tokens.dart';
import 'package:livion/features/design_gallery/presentation/screens/text_sheet_screen.dart';
import 'package:livion/features/design_gallery/presentation/text_sheet_spec.dart';

void main() {
  test('표기 문자열은 스타일 토큰에서 계산한다', () {
    expect(fontSizeLabel(AppTextStyles.pretendardH1), '18pt');
    expect(fontSizeLabel(AppTextStyles.pretendardCaption2), '10pt');
    expect(
      fontWeightName(AppTextStyles.pretendardBody2Regular.fontWeight),
      'Regular',
    );
    expect(fontWeightName(AppTextStyles.pretendardBody1.fontWeight), 'Medium');
    expect(
      fontWeightName(AppTextStyles.pretendardLabel.fontWeight),
      'SemiBold',
    );
    expect(fontWeightName(AppTextStyles.pretendardH1.fontWeight), 'Bold');
    expect(fontWeightName(AppTextStyles.archivoH1.fontWeight), 'ExtraBold');
  });

  test('Text Sheet는 Figma의 8개 행과 17개 스타일을 담는다', () {
    expect(textSheetRows.map((r) => r.name), [
      'H1',
      'H2',
      'H3',
      'Body 1',
      'Body 2',
      'Label',
      'Caption 1',
      'Caption 2',
    ]);
    final entries = textSheetRows.expand(
      (r) => [...r.pretendard, ...r.archivo],
    );
    expect(entries.length, 17);
    expect(entries.map((e) => e.style.fontFamily).toSet(), {
      AppFonts.pretendard,
      AppFonts.archivo,
    });
  });

  testWidgets('Text Sheet 화면은 행 이름과 용도를 그린다', (tester) async {
    tester.view.physicalSize = const Size(1000, 1400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MaterialApp(home: TextSheetScreen()));

    expect(find.text('Text'), findsOneWidget);
    for (final row in textSheetRows) {
      expect(find.text(row.name), findsOneWidget);
    }
    expect(find.text('현재 입찰가, 상품명 대제목, 결제 금액'), findsOneWidget);
    expect(find.text('ExtraBold'), findsNWidgets(2));
    expect(find.text('배지, 태그'), findsOneWidget);
  });

  testWidgets('좁은 화면에서도 overflow 없이 그려진다', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MaterialApp(home: TextSheetScreen()));
    expect(tester.takeException(), isNull);
  });
}

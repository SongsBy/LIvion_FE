import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/design_gallery/presentation/screens/components_sheet_screen.dart';

void main() {
  testWidgets('Components 시트는 모든 섹션을 overflow 없이 그린다', (tester) async {
    tester.view.physicalSize = const Size(1000, 2400);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.light, home: const ComponentsSheetScreen()),
    );
    expect(tester.takeException(), isNull);
    for (final s in [
      'Icon',
      'Button',
      'Category tab',
      'Badge',
      'Avatar',
      'Message field',
      'Top bar',
      'Bottom nav',
      'Row',
      'Card',
    ]) {
      expect(find.text(s), findsOneWidget, reason: s);
    }
  });

  testWidgets('좁은 화면(360)에서도 예외 없이 그려진다', (tester) async {
    tester.view.physicalSize = const Size(360, 800);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(
      MaterialApp(theme: AppTheme.light, home: const ComponentsSheetScreen()),
    );
    expect(tester.takeException(), isNull);
  });
}

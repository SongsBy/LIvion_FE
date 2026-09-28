import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/app/root_tab/root_tab_chrome.dart';
import 'package:livion/app/root_tab/root_tab_scaffold.dart';
import 'package:livion/design_system/design_system.dart';

void main() {
  Widget build(RootTabChrome chrome) {
    return MaterialApp(
      theme: AppTheme.light,
      home: RootTabScaffold(
        chrome: chrome,
        selectedTab: AppBottomNavItem.home,
        onTabChanged: (_) {},
        body: const Text('본문'),
      ),
    );
  }

  testWidgets('chrome 정책대로 상단 바·하단 내비를 그린다', (tester) async {
    await tester.pumpWidget(build(const RootTabChrome()));
    expect(find.byType(AppTopBar), findsOneWidget);
    expect(find.byType(AppBottomNav), findsOneWidget);
    expect(find.text('본문'), findsOneWidget);

    await tester.pumpWidget(
      build(const RootTabChrome(showTopBar: false, showBottomNav: false)),
    );
    expect(find.byType(AppTopBar), findsNothing);
    expect(find.byType(AppBottomNav), findsNothing);
  });

  testWidgets('forced chrome은 둘 다 보인다', (tester) async {
    await tester.pumpWidget(build(const RootTabChrome.forced()));
    expect(find.byType(AppTopBar), findsOneWidget);
    expect(find.byType(AppBottomNav), findsOneWidget);
  });
}

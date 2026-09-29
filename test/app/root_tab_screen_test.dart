import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/app/app.dart';
import 'package:livion/app/root_tab/root_tab_chrome.dart';
import 'package:livion/app/root_tab/root_tab_screen.dart';
import 'package:livion/app/root_tab/root_tabs.dart';
import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/home/presentation/screens/home_screen.dart';

import '../helpers/app_launch.dart';

void main() {
  testWidgets('스플래시·로그인을 지나면 루트 탭의 홈이다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const ProviderScope(child: LivionApp()));
    await enterHomeFromLaunch(tester);
    // 데모 repository의 지연(400ms)이 끝날 때까지 기다린다.
    await tester.pump(const Duration(seconds: 1));
    // IndexedStack 안의 카테고리 탭은 대분류 조회가 끝난 뒤 본문을 한 번 더 조회한다.
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(RootTabScreen), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.byType(AppTopBar), findsOneWidget);
    expect(find.byType(AppBottomNav), findsOneWidget);
  });

  testWidgets('하단 내비로 탭을 바꾸면 본문이 바뀐다', (tester) async {
    final tabs = [
      RootTab(item: AppBottomNavItem.home, builder: (_) => const Text('홈 본문')),
      RootTab(item: AppBottomNavItem.my, builder: (_) => const Text('마이 본문')),
    ];
    // 상단 바의 계정 전환 토글이 provider를 읽는다.
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.light,
          home: RootTabScreen(tabs: tabs),
        ),
      ),
    );
    expect(find.text('홈 본문'), findsOneWidget);

    await tester.tap(find.bySemanticsLabel('마이'));
    await tester.pump();
    expect(find.text('마이 본문'), findsOneWidget);
  });

  testWidgets('화면이 chrome 숨김을 요청하면 따르지만 forced 탭은 무시한다', (tester) async {
    const hidden = RootTabChrome(showTopBar: false, showBottomNav: false);
    final tabs = [
      RootTab(
        item: AppBottomNavItem.home,
        builder: (context) => TextButton(
          onPressed: () => RootTabScope.of(
            context,
          ).requestChrome(AppBottomNavItem.home, hidden),
          child: const Text('홈 숨김 요청'),
        ),
      ),
      RootTab(
        item: AppBottomNavItem.live,
        chrome: const RootTabChrome.forced(),
        builder: (context) => TextButton(
          onPressed: () => RootTabScope.of(
            context,
          ).requestChrome(AppBottomNavItem.live, hidden),
          child: const Text('라이브 숨김 요청'),
        ),
      ),
    ];
    // 상단 바의 계정 전환 토글이 provider를 읽는다.
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppTheme.light,
          home: RootTabScreen(tabs: tabs),
        ),
      ),
    );

    await tester.tap(find.text('홈 숨김 요청'));
    await tester.pump();
    expect(find.byType(AppTopBar), findsNothing);
    expect(find.byType(AppBottomNav), findsNothing);

    // 하단 내비가 사라졌으므로 scope로 탭을 바꾼다.
    RootTabScope.of(
      tester.element(find.text('홈 숨김 요청')),
    ).selectTab(AppBottomNavItem.live);
    await tester.pump();
    expect(find.byType(AppTopBar), findsOneWidget);
    expect(find.byType(AppBottomNav), findsOneWidget);

    await tester.tap(find.text('라이브 숨김 요청'));
    await tester.pump();
    expect(find.byType(AppTopBar), findsOneWidget);
    expect(find.byType(AppBottomNav), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/home/data/demo/home_demo_feed.dart';
import 'package:livion/features/home/domain/entities/live_summary.dart';
import 'package:livion/features/home/presentation/widgets/all_live_section.dart';
import 'package:livion/features/home/presentation/widgets/home_feed_view.dart';
import 'package:livion/features/home/presentation/widgets/home_footer.dart';
import 'package:livion/features/home/presentation/widgets/trust_banner_list.dart';

void main() {
  Widget build({
    Future<void> Function()? onRefresh,
    ValueChanged<LiveSummary>? onLiveTap,
  }) {
    return MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        body: HomeFeedView(
          feed: HomeDemoFeed.build(),
          onRefresh: onRefresh ?? () async {},
          onLiveTap: onLiveTap,
        ),
      ),
    );
  }

  testWidgets('Figma 메인 화면의 섹션을 순서대로 그린다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(build());
    expect(tester.takeException(), isNull);

    expect(find.byType(AppCategoryTab), findsNWidgets(6));
    expect(find.text('Livion 공식 방송'), findsOneWidget);
    expect(find.byType(SellerLiveCard), findsOneWidget);

    final scrollable = find.byType(Scrollable).first;
    for (final title in ['팔로우한 판매자', '인기 급상승', '마감 D-7', '전체 라이브']) {
      await tester.scrollUntilVisible(
        find.text(title),
        300,
        scrollable: scrollable,
      );
      expect(find.text(title), findsOneWidget);
    }
    expect(find.byType(AppLiveAvatar), findsWidgets);
    expect(find.byType(LiveCard), findsWidgets);

    await tester.scrollUntilVisible(
      find.byType(TrustBannerList),
      400,
      scrollable: scrollable,
    );
    expect(find.text('에스크로 안전결제'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.byType(HomeFooter),
      400,
      scrollable: scrollable,
    );
    expect(find.text('개인정보취급방침'), findsOneWidget);
  });

  testWidgets('전체 라이브 칩으로 카테고리를 거르고, 없는 카테고리는 빈 상태를 보인다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(build());
    final scrollable = find.byType(Scrollable).first;
    await tester.scrollUntilVisible(
      find.byType(AllLiveSection),
      400,
      scrollable: scrollable,
    );

    await tester.tap(find.widgetWithText(AppButton, '뷰티'));
    await tester.pumpAndSettle();
    final beauty = tester
        .widgetList<LiveCard>(
          find.descendant(
            of: find.byType(AllLiveSection),
            matching: find.byType(LiveCard),
          ),
        )
        .toList();
    expect(beauty.length, 1);
    expect(beauty.single.sellerName, '리에르');

    await tester.tap(find.widgetWithText(AppButton, '테크'));
    await tester.pumpAndSettle();
    expect(find.byType(AppEmptyView), findsOneWidget);
  });

  testWidgets('공식 방송 히어로를 누르면 onLiveTap이 불린다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    LiveSummary? tapped;
    await tester.pumpWidget(build(onLiveTap: (l) => tapped = l));
    await tester.tap(find.byType(SellerLiveCard));
    expect(tapped?.id, 'official-1');
  });

  testWidgets('당겨서 새로고침하면 onRefresh가 불린다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    var refreshed = 0;
    await tester.pumpWidget(build(onRefresh: () async => refreshed++));
    await tester.fling(find.byType(ListView), const Offset(0, 400), 1000);
    await tester.pumpAndSettle();
    expect(refreshed, 1);
  });
}

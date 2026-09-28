import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/app/app.dart';
import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/home/presentation/widgets/home_feed_view.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_detail_view.dart';

void main() {
  testWidgets('홈의 공식 방송을 누르면 라이브 탭에 그 방송이 열리고 뒤로가기로 홈에 돌아온다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const ProviderScope(child: LivionApp()));
    // 데모 repository의 지연(400ms)이 끝날 때까지 기다린다.
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(HomeFeedView), findsOneWidget);
    expect(find.byType(LiveDetailView), findsNothing);

    await tester.tap(find.byType(SellerLiveCard));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(LiveDetailView), findsOneWidget);
    expect(
      tester.widget<LiveDetailView>(find.byType(LiveDetailView)).detail.id,
      'official-1',
    );
    // 라이브 화면은 상단 바·하단 내비를 끈다.
    expect(find.byType(AppTopBar), findsNothing);
    expect(find.byType(AppBottomNav), findsNothing);

    await tester.tap(find.bySemanticsLabel('뒤로'));
    await tester.pump();
    expect(find.byType(HomeFeedView), findsOneWidget);
    expect(find.byType(LiveDetailView), findsNothing);
    expect(find.byType(AppTopBar), findsOneWidget);
    expect(find.byType(AppBottomNav), findsOneWidget);
  });
}

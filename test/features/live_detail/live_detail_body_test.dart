import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/live_detail/data/demo/live_detail_demo_data.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_activity_panel.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_activity_pill.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_bid_status_page.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_detail_body.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_detail_view.dart';

final DateTime _now = DateTime(2026, 9, 28, 20, 40);

Widget _build({ValueChanged<String>? onSendMessage}) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(
      body: LiveDetailBody(
        detail: LiveDetailDemoData.build(now: _now),
        now: _now,
        onSendMessage: onSendMessage,
      ),
    ),
  );
}

void _usePhone(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

void main() {
  testWidgets('처음에는 라이브 화면만 있고 패널 내용은 만들지 않는다', (tester) async {
    _usePhone(tester);
    await tester.pumpWidget(_build());
    expect(tester.takeException(), isNull);
    expect(find.byType(LiveDetailView), findsOneWidget);
    expect(find.byType(LiveActivityPanel), findsNothing);
    // 화면에 입찰 CTA가 하나뿐이다 (패널 것이 겹쳐 있지 않다).
    expect(find.text('8,400원에 입찰'), findsOneWidget);
  });

  testWidgets('알약을 누르면 패널이 Figma 높이로 솟아오르고, 영상 영역을 누르면 닫힌다', (tester) async {
    _usePhone(tester);
    await tester.pumpWidget(_build());

    await tester.tap(find.byType(LiveActivityPill));
    await tester.pumpAndSettle();
    expect(find.byType(LiveActivityPanel), findsOneWidget);

    final panel = tester.getRect(find.byType(LiveActivityPanel));
    expect(panel.bottom, 844);
    expect(panel.height, closeTo(844 * LiveDetailBody.panelHeightFactor, 1));
    expect(find.text('오후 8:30'), findsOneWidget);

    // 패널 위 영상 영역을 누르면 닫힌다.
    await tester.tapAt(const Offset(195, 150));
    await tester.pumpAndSettle();
    expect(find.byType(LiveActivityPanel), findsNothing);
  });

  testWidgets('손잡이를 아래로 끌면 닫히고, 옆으로 넘기면 입찰현황이 보인다', (tester) async {
    _usePhone(tester);
    await tester.pumpWidget(_build());

    await tester.tap(find.byType(LiveActivityPill));
    await tester.pumpAndSettle();

    await tester.drag(find.byType(PageView), const Offset(-350, 0));
    await tester.pumpAndSettle();
    expect(find.byType(LiveBidStatusPage), findsOneWidget);
    expect(find.text('현재 입찰가'), findsOneWidget);

    final tabs = tester.getRect(find.byType(AppTabBar));
    await tester.fling(
      find.byType(AppTabBar),
      Offset(0, tabs.height + 400),
      1200,
    );
    await tester.pumpAndSettle();
    expect(find.byType(LiveActivityPanel), findsNothing);
  });
}

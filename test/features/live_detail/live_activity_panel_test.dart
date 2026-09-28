import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/live_detail/data/demo/live_detail_demo_data.dart';
import 'package:livion/features/live_detail/domain/entities/live_detail.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_activity_panel.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_bid_status_page.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_bid_trend_chart.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_chat_page.dart';

final DateTime _now = DateTime(2026, 9, 28, 20, 40);

/// 패널을 Figma 높이(568)로 고정해 그린다.
Widget _build(
  LiveDetail detail, {
  LiveActivityTab initialTab = LiveActivityTab.chat,
  ValueChanged<String>? onSendMessage,
  ValueChanged<LiveAuctionItem>? onBid,
  VoidCallback? onOpenAuctionDetail,
  VoidCallback? onChangeAutoBid,
}) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: 568,
          child: LiveActivityPanel(
            detail: detail,
            initialTab: initialTab,
            now: _now,
            onSendMessage: onSendMessage,
            onBid: onBid,
            onOpenAuctionDetail: onOpenAuctionDetail,
            onChangeAutoBid: onChangeAutoBid,
          ),
        ),
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
  testWidgets('채팅 탭(26:366): 탭·시각이 있는 채팅·입력줄·상품 카드·입찰 줄을 그린다', (tester) async {
    _usePhone(tester);
    await tester.pumpWidget(_build(LiveDetailDemoData.build(now: _now)));
    expect(tester.takeException(), isNull);

    expect(find.byType(AppTabBar), findsOneWidget);
    expect(find.text('채팅'), findsOneWidget);
    expect(find.text('1,204'), findsOneWidget);
    expect(find.text('입찰현황'), findsOneWidget);
    expect(find.text('14'), findsOneWidget);

    // 최신 채팅이 아래에 있고 시각이 붙는다.
    expect(find.byType(LiveChatPage), findsOneWidget);
    expect(find.text('와 이거 사야해요'), findsOneWidget);
    expect(find.text('오후 8:30'), findsOneWidget);
    expect(find.text('전혀 맵지 않습니다!'), findsOneWidget);
    expect(find.text('판매자'), findsWidgets);
    expect(find.byType(AppMessageField), findsOneWidget);

    expect(find.byType(ProductCard), findsNWidgets(2));
    expect(find.text('8,400원에 입찰'), findsOneWidget);
    expect(find.textContaining('낙찰 시 등록 카드'), findsOneWidget);
  });

  testWidgets('채팅은 위로 스크롤하면 이전 메시지가 보이고, 전송하면 onSendMessage가 불린다', (
    tester,
  ) async {
    _usePhone(tester);
    String? sent;
    await tester.pumpWidget(
      _build(
        LiveDetailDemoData.build(now: _now),
        onSendMessage: (t) => sent = t,
      ),
    );

    final oldest = find.text('오늘 주문하면 언제 와요?');
    expect(oldest, findsNothing);
    await tester.drag(find.byType(LiveChatPage), const Offset(0, 600));
    await tester.pumpAndSettle();
    expect(oldest, findsOneWidget);

    await tester.enterText(find.byType(TextField), '  구매할게요  ');
    await tester.pump();
    await tester.tap(find.bySemanticsLabel('전송'));
    await tester.pump();
    expect(sent, '구매할게요');
  });

  testWidgets('옆으로 넘기거나 탭을 누르면 입찰현황(26:551)으로 바뀐다', (tester) async {
    _usePhone(tester);
    var details = 0;
    var autoBids = 0;
    await tester.pumpWidget(
      _build(
        LiveDetailDemoData.build(now: _now),
        onOpenAuctionDetail: () => details++,
        onChangeAutoBid: () => autoBids++,
      ),
    );

    await tester.drag(find.byType(PageView), const Offset(-350, 0));
    await tester.pumpAndSettle();
    expect(find.byType(LiveBidStatusPage), findsOneWidget);

    // 현재 입찰가 · 통계
    expect(find.text('현재 입찰가'), findsOneWidget);
    expect(find.text('7,900원'), findsWidgets); // 상단 금액 + 1위 순위
    expect(find.text('2.63배'), findsOneWidget); // 7,900 / 3,000
    expect(find.text('시작가 3,000원'), findsWidgets);
    expect(find.text('참여인원'), findsOneWidget);
    expect(find.text('총 입찰'), findsOneWidget);
    expect(find.text('32'), findsOneWidget);

    // 추이 차트 + 연장 안내
    expect(find.text('입찰가 추이'), findsOneWidget);
    expect(find.byType(LiveBidTrendChart), findsOneWidget);
    expect(find.text('+30초 연장'), findsOneWidget);

    // 내 입찰(강조) + 자동입찰 + 순위
    final rows = tester.widgetList<BidRankRow>(find.byType(BidRankRow));
    expect(rows.where((r) => r.highlighted).length, 1);
    expect(find.text('13초전'), findsNWidgets(2));
    await tester.dragUntilVisible(
      find.text('변경'),
      find.byType(LiveBidStatusPage),
      const Offset(0, -100),
    );
    expect(find.text('최대가 자동입찰 9,000원'), findsOneWidget);
    await tester.tap(find.text('변경'));
    expect(autoBids, 1);

    await tester.dragUntilVisible(
      find.text('3위'),
      find.byType(LiveBidStatusPage),
      const Offset(0, -100),
    );
    expect(find.text('홍*동'), findsOneWidget);
    expect(find.text('3초전'), findsOneWidget);
    expect(find.text('23초전'), findsOneWidget);

    await tester.pumpAndSettle();
    await tester.tap(find.text('경매 상세 보기'));
    expect(details, 1);

    // 탭을 눌러 채팅으로 돌아온다.
    await tester.tap(find.text('채팅'));
    await tester.pumpAndSettle();
    expect(find.byType(LiveChatPage), findsOneWidget);
    expect(find.byType(LiveBidStatusPage), findsNothing);
  });

  testWidgets('채팅·입찰 현황·상품이 없으면 빈 안내와 비활성 CTA를 보인다', (tester) async {
    _usePhone(tester);
    final detail = LiveDetailDemoData.build(now: _now).copyWith(
      recentChats: const [],
      auctionItems: const [],
      bidStatus: null,
      paymentMethodLabel: null,
    );
    await tester.pumpWidget(
      _build(detail, initialTab: LiveActivityTab.bids, onBid: (_) {}),
    );
    expect(tester.takeException(), isNull);

    expect(find.text('진행 중인 입찰이 없어요.'), findsOneWidget);
    expect(find.text('진행 중인 경매 상품이 없어요.'), findsOneWidget);
    final cta = tester.widget<AppButton>(find.widgetWithText(AppButton, '입찰'));
    expect(cta.onPressed, isNull);

    await tester.tap(find.text('채팅'));
    await tester.pumpAndSettle();
    expect(find.textContaining('아직 채팅이 없어요'), findsOneWidget);
  });

  testWidgets('입찰 순위가 없으면 순위 자리에 빈 안내를 보인다', (tester) async {
    _usePhone(tester);
    final base = LiveDetailDemoData.build(now: _now);
    final detail = base.copyWith(
      bidStatus: base.bidStatus!.copyWith(
        ranking: const [],
        myBid: null,
        maxAutoBidWon: null,
        extensionStartSeconds: null,
        priceHistory: const [],
      ),
    );
    await tester.pumpWidget(_build(detail, initialTab: LiveActivityTab.bids));
    expect(tester.takeException(), isNull);
    expect(find.byType(LiveBidTrendChart), findsOneWidget);
    expect(find.text('+30초 연장'), findsNothing);
    expect(find.byType(BidRankRow), findsNothing);
    await tester.dragUntilVisible(
      find.text('아직 입찰이 없어요.'),
      find.byType(LiveBidStatusPage),
      const Offset(0, -100),
    );
    expect(find.text('아직 입찰이 없어요.'), findsOneWidget);
  });
}

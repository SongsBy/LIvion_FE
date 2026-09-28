import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/live_detail/data/demo/live_detail_demo_data.dart';
import 'package:livion/features/live_detail/domain/entities/live_detail.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_activity_pill.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_broadcast_backdrop.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_chat_overlay.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_detail_view.dart';

void main() {
  Widget build(
    LiveDetail detail, {
    VoidCallback? onBack,
    VoidCallback? onFollowTap,
    VoidCallback? onOpenActivity,
    ValueChanged<LiveAuctionItem>? onAuctionItemTap,
    ValueChanged<LiveAuctionItem>? onBid,
  }) {
    return MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        body: LiveDetailView(
          detail: detail,
          onBack: onBack,
          onFollowTap: onFollowTap,
          onOpenActivity: onOpenActivity,
          onAuctionItemTap: onAuctionItemTap,
          onBid: onBid,
        ),
      ),
    );
  }

  void usePhone(WidgetTester tester) {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
  }

  testWidgets('Figma 라이브 디테일(26:238)의 요소를 모두 그린다', (tester) async {
    usePhone(tester);
    await tester.pumpWidget(build(LiveDetailDemoData.build()));
    expect(tester.takeException(), isNull);

    expect(find.byType(LiveBroadcastBackdrop), findsOneWidget);

    // 상단: 판매자 + 공식 뱃지 + 팔로우, 우측 아이콘
    expect(find.text('한빛식품'), findsNWidgets(2)); // 상단 + 채팅 답글
    expect(find.text('공식'), findsOneWidget);
    expect(find.text('팔로우'), findsOneWidget);
    for (final label in ['뒤로', '공유', '더보기', '화면 축소']) {
      expect(find.bySemanticsLabel(label), findsOneWidget);
    }

    // 제목 + LIVE·시청자
    expect(find.text('화요일 공식 방송 · 냉동식품 5종 급처분'), findsOneWidget);
    expect(find.text('LIVE'), findsOneWidget);
    expect(find.text('1,204'), findsOneWidget);

    // 채팅: 최근 4줄이 보이고 판매자 답글이 있다
    expect(find.byType(ChatMessageRow), findsWidgets);
    expect(find.text('전혀 맵지 않습니다!'), findsOneWidget);
    expect(find.text('와 이거 사야해요'), findsOneWidget);

    // 채팅·입찰현황 알약
    expect(find.text('채팅 1,204'), findsOneWidget);
    expect(find.text('입찰현황 14'), findsOneWidget);

    // 상품 카드 2장 (둘째는 오른쪽에 걸쳐 보인다)
    expect(find.byType(ProductCard), findsNWidgets(2));
    expect(find.text('냉동만두 1.2kg'), findsNWidgets(2));
    expect(find.text('수량 100개'), findsNWidgets(2));
    expect(find.text('D-12'), findsNWidgets(2));
    expect(find.text('시작가 3,000원'), findsNWidgets(2));
    expect(find.text('00:47'), findsNWidgets(2));

    // 입찰 줄 + 결제 안내
    expect(find.text('8,400원에 입찰'), findsOneWidget);
    expect(find.bySemanticsLabel('입찰 옵션'), findsOneWidget);
    expect(
      find.text('낙찰 시 등록 카드(국민 ****1234)로 즉시 결제 · 에스크로 예치'),
      findsOneWidget,
    );
  });

  testWidgets('뒤로·팔로우·알약·상품·입찰이 각 콜백을 부른다', (tester) async {
    usePhone(tester);
    var backs = 0;
    var follows = 0;
    var activities = 0;
    LiveAuctionItem? tappedItem;
    LiveAuctionItem? bidItem;
    await tester.pumpWidget(
      build(
        LiveDetailDemoData.build(),
        onBack: () => backs++,
        onFollowTap: () => follows++,
        onOpenActivity: () => activities++,
        onAuctionItemTap: (i) => tappedItem = i,
        onBid: (i) => bidItem = i,
      ),
    );

    await tester.tap(find.bySemanticsLabel('뒤로'));
    expect(backs, 1);

    await tester.tap(find.text('팔로우'));
    expect(follows, 1);

    await tester.tap(find.byType(LiveActivityPill));
    expect(activities, 1);

    await tester.tap(find.byType(ProductCard).first);
    expect(tappedItem?.id, 'item-1');

    await tester.tap(find.text('8,400원에 입찰'));
    expect(bidItem?.id, 'item-1');
  });

  testWidgets('채팅은 최신이 아래에 있고 위로 스크롤하면 이전 채팅이 보인다', (tester) async {
    usePhone(tester);
    await tester.pumpWidget(build(LiveDetailDemoData.build()));

    final overlay = tester.getRect(find.byType(LiveChatOverlay));
    expect(overlay.height, LiveChatOverlay.height);

    // 최신 줄은 창 안에 있고, 가장 오래된 줄은 아직 화면에 없다.
    final newest = find.text('와 이거 사야해요');
    final oldest = find.text('오늘 주문하면 언제 와요?');
    expect(tester.getRect(newest).bottom, lessThanOrEqualTo(overlay.bottom));
    expect(oldest, findsNothing);

    await tester.drag(find.byType(LiveChatOverlay), const Offset(0, 400));
    await tester.pumpAndSettle();
    final scrolled = tester.getRect(oldest);
    expect(scrolled.top, greaterThanOrEqualTo(overlay.top));
    expect(scrolled.bottom, lessThanOrEqualTo(overlay.bottom));
  });

  testWidgets('경매 상품이 없으면 빈 안내와 비활성 CTA를 보인다', (tester) async {
    usePhone(tester);
    final detail = LiveDetailDemoData.build().copyWith(
      auctionItems: const [],
      paymentMethodLabel: null,
    );
    await tester.pumpWidget(build(detail, onBid: (_) {}));
    expect(tester.takeException(), isNull);

    expect(find.text('진행 중인 경매 상품이 없어요.'), findsOneWidget);
    expect(find.byType(ProductCard), findsNothing);
    final cta = tester.widget<AppButton>(find.widgetWithText(AppButton, '입찰'));
    expect(cta.onPressed, isNull);
    expect(find.textContaining('낙찰 시'), findsNothing);
  });
}

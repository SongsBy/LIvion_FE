import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/seller_channel/data/repositories/demo_seller_channel_repository.dart';
import 'package:livion/features/seller_channel/presentation/providers/seller_channel_dependencies.dart';
import 'package:livion/features/seller_channel/presentation/screens/seller_channel_screen.dart';

Widget _app({ValueChanged<String>? onOpenLive}) {
  final now = DateTime(2026, 9, 29, 21);
  return ProviderScope(
    overrides: [
      sellerChannelClockProvider.overrideWithValue(() => now),
      sellerChannelRepositoryProvider.overrideWithValue(
        DemoSellerChannelRepository(latency: Duration.zero, clock: () => now),
      ),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(
        body: SellerChannelScreen(
          sellerId: 'store-hanbit',
          onOpenLive: onOpenLive ?? (_) {},
        ),
      ),
    ),
  );
}

void _phoneSize(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

Finder get _page => find.byType(Scrollable).first;

void main() {
  testWidgets('Figma 판매자 페이지 홈 탭을 그린다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();

    expect(find.byType(AppChannelHeader), findsOneWidget);
    expect(find.text('한빛식품'), findsWidgets);
    expect(find.text('팔로워 1,435'), findsOneWidget);
    expect(find.text('팔로워 1.4천'), findsOneWidget);
    expect(find.text('입찰현황 14'), findsOneWidget);
    expect(find.byType(ProductCard), findsNWidgets(2));

    await tester.scrollUntilVisible(
      find.text('배송·반품·교환·A/S'),
      300,
      scrollable: _page,
    );
    expect(find.byType(AppPostCard), findsNWidgets(3));
    expect(find.byType(LiveCard), findsNWidgets(3));
    expect(find.byType(AppNoticeList), findsOneWidget);
  });

  testWidgets('팔로우를 누르면 팔로워 수가 늘고 외곽선 버튼이 된다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();

    await tester.tap(find.text('팔로워 1.4천'));
    await tester.pumpAndSettle();
    expect(find.text('팔로워 1,436'), findsOneWidget);
    final button = tester.widget<AppButton>(
      find.widgetWithText(AppButton, '팔로워 1.4천'),
    );
    expect(button.variant, AppButtonVariant.compactOutline);
  });

  testWidgets('상품 카드를 누르면 방송 중인 라이브를 연다', (tester) async {
    _phoneSize(tester);
    String? opened;
    await tester.pumpWidget(_app(onOpenLive: (id) => opened = id));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(ProductCard).first);
    expect(opened, 'trend-1');
  });

  testWidgets('콘텐츠 탭은 게시글을 세로로 보이고, 댓글 시트에서 댓글을 남긴다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app());
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('콘텐츠').first,
      200,
      scrollable: _page,
    );
    await tester.tap(find.widgetWithText(AppButton, '콘텐츠'));
    await tester.pumpAndSettle();
    expect(find.byType(LiveCard), findsNothing);

    final comment = find.text('댓글 6').first;
    await tester.scrollUntilVisible(comment, 200, scrollable: _page);
    await tester.tap(comment);
    await tester.pumpAndSettle();

    expect(find.byType(CommentRow), findsNWidgets(6));
    expect(find.text('판매자'), findsNWidgets(2));
    expect(find.text('오후 8:14'), findsOneWidget);

    await tester.enterText(
      find.descendant(
        of: find.byType(AppMessageField),
        matching: find.byType(TextField),
      ),
      '곧 방송에서 뵐게요',
    );
    await tester.pump();
    await tester.tap(find.text('전송'));
    await tester.pumpAndSettle();
    expect(find.text('곧 방송에서 뵐게요'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);

    // 시트를 닫으면 게시글 댓글 수가 맞춰져 있다.
    await tester.tapAt(const Offset(195, 40));
    await tester.pumpAndSettle();
    expect(find.text('댓글 7'), findsOneWidget);
  });
}

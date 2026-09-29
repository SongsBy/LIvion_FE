import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/live_detail/data/demo/live_detail_demo_data.dart';
import 'package:livion/features/live_detail/data/repositories/demo_auction_detail_repository.dart';
import 'package:livion/features/live_detail/domain/entities/live_detail.dart';
import 'package:livion/features/live_detail/domain/repositories/live_detail_repository.dart';
import 'package:livion/features/live_detail/presentation/providers/live_detail_dependencies.dart';
import 'package:livion/features/live_detail/presentation/providers/live_detail_selection.dart';
import 'package:livion/features/live_detail/presentation/providers/live_detail_controller.dart';
import 'package:livion/features/live_detail/presentation/screens/auction_detail_screen.dart';
import 'package:livion/features/live_detail/presentation/screens/live_detail_screen.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_activity_panel.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_activity_pill.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_detail_view.dart';

import '../../helpers/fake_picture_in_picture.dart';

/// 요청된 id를 기록하고, 첫 조회 실패·팔로우 실패를 흉내 내는 fake.
class _FakeLiveDetailRepository implements LiveDetailRepository {
  _FakeLiveDetailRepository({
    this.failFirstFetch = false,
    this.followError,
    this.chatError,
  });

  final bool failFirstFetch;
  final Object? followError;
  final Object? chatError;
  final List<String?> requestedIds = [];
  final List<(String, bool)> followCalls = [];
  final List<(String, String)> chatCalls = [];

  @override
  Future<LiveDetail> fetchFeaturedLive() => _fetch(null);

  @override
  Future<LiveDetail> fetchLiveDetail(String liveId) => _fetch(liveId);

  Future<LiveDetail> _fetch(String? liveId) async {
    requestedIds.add(liveId);
    if (failFirstFetch && requestedIds.length == 1) throw StateError('network');
    return LiveDetailDemoData.build(
      liveId: liveId ?? LiveDetailDemoData.featuredLiveId,
    );
  }

  @override
  Future<void> setFollowing({
    required String sellerId,
    required bool following,
  }) async {
    followCalls.add((sellerId, following));
    if (followError != null) throw followError!;
  }

  @override
  Future<void> sendChatMessage({
    required String liveId,
    required String message,
  }) async {
    chatCalls.add((liveId, message));
    if (chatError != null) throw chatError!;
  }
}

Widget _app(LiveDetailRepository repository) {
  return ProviderScope(
    overrides: [
      liveDetailRepositoryProvider.overrideWithValue(repository),
      auctionDetailRepositoryProvider.overrideWithValue(
        const DemoAuctionDetailRepository(latency: Duration.zero),
      ),
      pictureInPictureProvider.overrideWithValue(FakePictureInPicture()),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      home: const Scaffold(body: LiveDetailScreen()),
    ),
  );
}

void _usePhone(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

LiveDetail _shownDetail(WidgetTester tester) =>
    tester.widget<LiveDetailView>(find.byType(LiveDetailView)).detail;

void main() {
  testWidgets('선택이 없으면 대표 방송을 로딩 → 데이터 순서로 그린다', (tester) async {
    _usePhone(tester);
    final repo = _FakeLiveDetailRepository();
    await tester.pumpWidget(_app(repo));
    expect(find.byType(AppLoadingView), findsOneWidget);

    await tester.pump();
    expect(find.byType(LiveDetailView), findsOneWidget);
    expect(repo.requestedIds, [null]);
    expect(_shownDetail(tester).id, LiveDetailDemoData.featuredLiveId);
  });

  testWidgets('실패하면 안내와 다시 시도 버튼을 보이고, 재시도 후 데이터를 그린다', (tester) async {
    _usePhone(tester);
    final repo = _FakeLiveDetailRepository(failFirstFetch: true);
    await tester.pumpWidget(_app(repo));
    await tester.pump();
    expect(find.byType(AppErrorView), findsOneWidget);
    expect(find.byType(LiveDetailView), findsNothing);

    await tester.tap(find.text('다시 시도'));
    await tester.pump();
    await tester.pump();
    expect(find.byType(LiveDetailView), findsOneWidget);
    expect(repo.requestedIds.length, 2);
  });

  testWidgets('홈에서 고른 id가 바뀌면 그 방송을 다시 조회한다', (tester) async {
    _usePhone(tester);
    final repo = _FakeLiveDetailRepository();
    await tester.pumpWidget(_app(repo));
    await tester.pump();

    final container = ProviderScope.containerOf(
      tester.element(find.byType(LiveDetailScreen)),
    );
    container.read(liveDetailSelectionProvider.notifier).select('live-2');
    await tester.pump();
    expect(find.byType(AppLoadingView), findsOneWidget);

    await tester.pump();
    expect(repo.requestedIds, [null, 'live-2']);
    expect(_shownDetail(tester).id, 'live-2');
  });

  testWidgets('팔로우를 누르면 바로 팔로잉으로 바뀌고 repository에 알린다', (tester) async {
    _usePhone(tester);
    final repo = _FakeLiveDetailRepository();
    await tester.pumpWidget(_app(repo));
    await tester.pump();

    await tester.tap(find.text('팔로우'));
    await tester.pump();
    expect(find.text('팔로잉'), findsOneWidget);
    expect(repo.followCalls, [('seller-hanbit', true)]);
  });

  testWidgets('팔로우 변경이 실패하면 되돌리고 안내를 보인다', (tester) async {
    _usePhone(tester);
    final repo = _FakeLiveDetailRepository(followError: StateError('network'));
    await tester.pumpWidget(_app(repo));
    await tester.pump();

    await tester.tap(find.text('팔로우'));
    await tester.pump();
    await tester.pump();
    expect(find.text('팔로우'), findsOneWidget);
    expect(find.text('팔로잉'), findsNothing);
    expect(find.text('팔로우를 변경하지 못했어요.'), findsOneWidget);
  });

  testWidgets('입찰 버튼을 누르면 지금 입찰 중인 상품의 경매 상세가 열린다', (tester) async {
    _usePhone(tester);
    await tester.pumpWidget(_app(_FakeLiveDetailRepository()));
    await tester.pump();

    await tester.tap(find.text('8,400원에 입찰'));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<AuctionDetailScreen>(find.byType(AuctionDetailScreen))
          .itemId,
      'item-1',
    );
    expect(find.text('입찰 기능은 준비 중입니다.'), findsNothing);
  });

  testWidgets('패널이 열린 뒤 입찰 버튼을 눌러도 경매 상세가 열린다', (tester) async {
    _usePhone(tester);
    await tester.pumpWidget(_app(_FakeLiveDetailRepository()));
    await tester.pump();

    await tester.tap(find.byType(LiveActivityPill));
    await tester.pumpAndSettle();
    await tester.tap(
      find.descendant(
        of: find.byType(LiveActivityPanel),
        matching: find.text('8,400원에 입찰'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.byType(AuctionDetailScreen), findsOneWidget);
  });

  testWidgets('상품 카드를 누르면 그 상품의 경매 상세가 열린다', (tester) async {
    _usePhone(tester);
    await tester.pumpWidget(_app(_FakeLiveDetailRepository()));
    await tester.pump();

    await tester.tap(find.text('냉동만두 1.2kg').first);
    await tester.pumpAndSettle();
    final screen = tester.widget<AuctionDetailScreen>(
      find.byType(AuctionDetailScreen),
    );
    expect(screen.liveId, LiveDetailDemoData.featuredLiveId);
    expect(screen.itemId, 'item-1');
    expect(screen.pipSource?.broadcastImage, isNotNull);
    expect(find.text('9/22 검수완료'), findsOneWidget);
  });

  testWidgets('패널의 "경매 상세 보기"는 지금 입찰 중인 상품을 연다', (tester) async {
    _usePhone(tester);
    await tester.pumpWidget(_app(_FakeLiveDetailRepository()));
    await tester.pump();

    await tester.tap(find.byType(LiveActivityPill));
    await tester.pumpAndSettle();
    await tester.drag(find.byType(PageView), const Offset(-350, 0));
    await tester.pumpAndSettle();
    await tester.tap(find.text('경매 상세 보기'));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<AuctionDetailScreen>(find.byType(AuctionDetailScreen))
          .itemId,
      'item-1',
    );
  });

  testWidgets('알약을 누르면 채팅·입찰현황 패널이 열리고, 채팅을 보내면 목록 끝에 붙는다', (tester) async {
    _usePhone(tester);
    final repo = _FakeLiveDetailRepository();
    await tester.pumpWidget(_app(repo));
    await tester.pump();

    await tester.tap(find.byType(LiveActivityPill));
    await tester.pumpAndSettle();
    expect(find.byType(LiveActivityPanel), findsOneWidget);

    await tester.enterText(find.byType(TextField), '배송은 언제 오나요?');
    await tester.pump();
    await tester.tap(find.bySemanticsLabel('전송'));
    await tester.pumpAndSettle();

    expect(repo.chatCalls, [
      (LiveDetailDemoData.featuredLiveId, '배송은 언제 오나요?'),
    ]);
    // 패널 목록과 영상 위 오버레이 양쪽에 새 메시지가 보인다.
    expect(find.text('배송은 언제 오나요?'), findsNWidgets(2));
    expect(find.text(LiveDetailController.localSenderName), findsNWidgets(2));
    expect(find.text('1,205'), findsWidgets);
  });

  testWidgets('채팅 전송이 실패하면 메시지를 되돌리고 안내를 보인다', (tester) async {
    _usePhone(tester);
    final repo = _FakeLiveDetailRepository(chatError: StateError('network'));
    await tester.pumpWidget(_app(repo));
    await tester.pump();

    await tester.tap(find.byType(LiveActivityPill));
    await tester.pumpAndSettle();
    await tester.enterText(find.byType(TextField), '안녕하세요');
    await tester.pump();
    await tester.tap(find.bySemanticsLabel('전송'));
    await tester.pumpAndSettle();

    expect(find.text('안녕하세요'), findsNothing);
    expect(find.text('메시지를 보내지 못했어요.'), findsOneWidget);
    expect(_shownDetail(tester).chatCount, 1204);
  });
}

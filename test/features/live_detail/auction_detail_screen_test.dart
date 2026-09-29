import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/core/pip/picture_in_picture.dart';
import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/live_detail/data/demo/auction_detail_demo_data.dart';
import 'package:livion/features/live_detail/domain/entities/auction_detail.dart';
import 'package:livion/features/live_detail/domain/entities/bid_outcome.dart';
import 'package:livion/features/live_detail/domain/repositories/auction_detail_repository.dart';
import 'package:livion/features/live_detail/presentation/providers/live_detail_dependencies.dart';
import 'package:livion/features/live_detail/presentation/providers/live_pip_state.dart';
import 'package:livion/features/live_detail/presentation/screens/auction_detail_screen.dart';
import 'package:livion/features/live_detail/presentation/widgets/auction_detail_view.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_floating_player.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_pip_window.dart';
import 'package:livion/features/payment/data/repositories/demo_payment_repository.dart';
import 'package:livion/features/payment/presentation/providers/payment_dependencies.dart';
import 'package:livion/features/payment/presentation/screens/payment_complete_screen.dart';

import '../../helpers/fake_picture_in_picture.dart';

final DateTime _now = DateTime(2026, 9, 28, 20, 30);

const _source = LivePipSource(
  liveId: 'official-1',
  broadcastImage: 'asset/images/demo/live_broadcast_dumpling.jpg',
);

class _FakeAuctionDetailRepository implements AuctionDetailRepository {
  _FakeAuctionDetailRepository({this.failFirstFetch = false, this.bidError});

  final bool failFirstFetch;
  final Object? bidError;
  final List<(String, String)> requests = [];
  final List<int> bids = [];

  /// null이 아니면 입찰 응답이 이 completer를 기다린다.
  Completer<void>? bidGate;

  @override
  Future<BidOutcome> placeBid({
    required String liveId,
    required String itemId,
    required int priceWon,
  }) async {
    bids.add(priceWon);
    await bidGate?.future;
    if (bidError != null) throw bidError!;
    return BidOutcome.won(orderId: 'order-$itemId');
  }

  @override
  Future<AuctionDetail> fetchAuctionDetail({
    required String liveId,
    required String itemId,
  }) async {
    requests.add((liveId, itemId));
    if (failFirstFetch && requests.length == 1) throw StateError('network');
    return AuctionDetailDemoData.build(
      liveId: liveId,
      itemId: itemId,
      now: _now,
    );
  }
}

/// 첫 화면의 버튼으로 경매 상세를 연다. 돌아가기(pop)를 확인하려고 한 단계 아래에서 시작한다.
Widget _app({
  required AuctionDetailRepository repository,
  required FakePictureInPicture pip,
  LivePipSource? source = _source,
}) {
  return ProviderScope(
    overrides: [
      auctionDetailRepositoryProvider.overrideWithValue(repository),
      pictureInPictureProvider.overrideWithValue(pip),
      paymentRepositoryProvider.overrideWithValue(
        const DemoPaymentRepository(latency: Duration.zero),
      ),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: TextButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => AuctionDetailScreen(
                    liveId: 'official-1',
                    itemId: 'item-1',
                    pipSource: source,
                    now: _now,
                  ),
                ),
              ),
              child: const Text('라이브'),
            ),
          ),
        ),
      ),
    ),
  );
}

Future<void> _open(WidgetTester tester) async {
  await tester.tap(find.text('라이브'));
  await tester.pumpAndSettle();
}

/// 네이티브 창 상태를 흉내 낸다. 스트림 전달 한 번, 다시 그리기 한 번.
Future<void> _emit(
  WidgetTester tester,
  FakePictureInPicture pip,
  PipEvent event,
) async {
  pip.emit(event);
  await tester.pump();
  await tester.pump();
}

/// 화면을 닫은 뒤 Riverpod이 autoDispose provider를 버릴 때까지 기다린다
/// (ProviderScope는 0초 타이머 두 번 뒤에 dispose 작업을 돈다).
Future<void> _settleDisposal(WidgetTester tester) async {
  await tester.pumpAndSettle();
  await tester.pump(const Duration(milliseconds: 1));
  await tester.pump(const Duration(milliseconds: 1));
}

void _usePhone(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

void main() {
  testWidgets('Figma 경매 상세 내용을 그린다', (tester) async {
    _usePhone(tester);
    final repo = _FakeAuctionDetailRepository();
    await tester.pumpWidget(
      _app(repository: repo, pip: FakePictureInPicture()),
    );
    await _open(tester);

    expect(repo.requests, [('official-1', 'item-1')]);
    expect(find.byType(AuctionDetailView), findsOneWidget);
    for (final text in [
      '한빛마을',
      '공식',
      '냉동만두 1.2kg',
      'D-12',
      '9/22 검수완료',
      '냉동 · 미개봉',
      '수량 100개',
      '소비기한 2026.09.26',
      '1 / 3',
      '현재 입찰가',
      '시작가 3,000원',
      '유사 품목 평균 낙찰 2.3배 · 최근 낙찰 8,900원',
      '+30초 연장',
      '최대가 자동입찰 9,000원',
      '8,400원에 입찰',
      '낙찰 시 등록 카드(국민 ****1234)로 즉시 결제 · 에스크로 예치',
    ]) {
      expect(find.text(text), findsWidgets, reason: text);
    }

    // 순위 5명은 스크롤 아래에 있다.
    await tester.scrollUntilVisible(
      find.text('성*리'),
      200,
      scrollable: find
          .descendant(
            of: find.byType(AuctionDetailView),
            matching: find.byType(Scrollable),
          )
          .first,
    );
    expect(find.text('유*진'), findsOneWidget);
    expect(find.text('3분전'), findsOneWidget);
  });

  testWidgets('작은 사진을 누르면 그 사진이 커지고 순번이 바뀐다', (tester) async {
    _usePhone(tester);
    await tester.pumpWidget(
      _app(
        repository: _FakeAuctionDetailRepository(),
        pip: FakePictureInPicture(),
      ),
    );
    await _open(tester);

    await tester.tap(find.bySemanticsLabel('상품 사진 2 / 3'));
    await tester.pumpAndSettle();
    expect(find.text('2 / 3'), findsOneWidget);
    expect(find.text('1 / 3'), findsNothing);
  });

  testWidgets('조회에 실패하면 다시 시도할 수 있다', (tester) async {
    _usePhone(tester);
    final repo = _FakeAuctionDetailRepository(failFirstFetch: true);
    await tester.pumpWidget(
      _app(repository: repo, pip: FakePictureInPicture()),
    );
    await _open(tester);
    expect(find.byType(AppErrorView), findsOneWidget);
    expect(find.text('8,400원에 입찰'), findsNothing);

    await tester.tap(find.text('다시 시도'));
    await tester.pumpAndSettle();
    expect(find.byType(AuctionDetailView), findsOneWidget);
    expect(repo.requests.length, 2);
  });

  testWidgets('입찰하면 낙찰 결제 화면으로 바뀌고 작은 창을 닫는다', (tester) async {
    _usePhone(tester);
    final repo = _FakeAuctionDetailRepository();
    final pip = FakePictureInPicture(supportValue: PipSupport.appWindow);
    await tester.pumpWidget(_app(repository: repo, pip: pip));
    await _open(tester);

    await tester.tap(find.text('8,400원에 입찰'));
    await _settleDisposal(tester);

    expect(repo.bids, [8400]);
    final payment = tester.widget<PaymentCompleteScreen>(
      find.byType(PaymentCompleteScreen),
    );
    expect(payment.orderId, 'order-item-1');
    expect(find.byType(AuctionDetailScreen), findsNothing);
    expect(find.text('낙찰 · 등록 카드로 즉시 결제됐어요'), findsOneWidget);
    expect(pip.calls, ['enterOnLeave', 'close']);

    // 라이브로 돌아가면 처음 화면이다 (경매 상세는 결제 화면으로 바뀌었다).
    await tester.tap(find.text('라이브로 돌아가기'));
    await tester.pumpAndSettle();
    expect(find.byType(PaymentCompleteScreen), findsNothing);
    expect(find.text('라이브'), findsOneWidget);
  });

  testWidgets('입찰 요청 중에는 로딩을 보이고 다시 보내지 않는다', (tester) async {
    _usePhone(tester);
    final repo = _FakeAuctionDetailRepository()..bidGate = Completer<void>();
    await tester.pumpWidget(
      _app(repository: repo, pip: FakePictureInPicture()),
    );
    await _open(tester);

    await tester.tap(find.text('8,400원에 입찰'));
    await tester.pump();
    expect(find.text('8,400원에 입찰'), findsNothing);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.tap(find.byType(CircularProgressIndicator));
    await tester.pump();
    expect(repo.bids, [8400]);

    repo.bidGate!.complete();
    await tester.pumpAndSettle();
    expect(find.byType(PaymentCompleteScreen), findsOneWidget);
  });

  testWidgets('입찰이 실패하면 안내하고 경매 상세에 남는다', (tester) async {
    _usePhone(tester);
    final repo = _FakeAuctionDetailRepository(bidError: StateError('network'));
    await tester.pumpWidget(
      _app(repository: repo, pip: FakePictureInPicture()),
    );
    await _open(tester);

    await tester.tap(find.text('8,400원에 입찰'));
    await tester.pumpAndSettle();
    expect(find.text('입찰하지 못했어요. 잠시 후 다시 시도해 주세요.'), findsOneWidget);
    expect(find.byType(AuctionDetailScreen), findsOneWidget);
    expect(find.text('8,400원에 입찰'), findsOneWidget);
  });

  group('Android PiP', () {
    testWidgets('앱 안에서는 미니 플레이어, 시스템 PiP 동안에는 방송만 그린다', (tester) async {
      _usePhone(tester);
      final pip = FakePictureInPicture(supportValue: PipSupport.appWindow);
      final repo = _FakeAuctionDetailRepository();
      await tester.pumpWidget(_app(repository: repo, pip: pip));
      await _open(tester);

      expect(pip.calls, ['enterOnLeave']);
      expect(find.byType(LiveFloatingPlayer), findsOneWidget);

      await _emit(tester, pip, PipEvent.started);
      expect(find.byType(LivePipWindow), findsOneWidget);
      expect(find.byType(AuctionDetailView), findsNothing);

      await _emit(tester, pip, PipEvent.stopped);
      expect(find.byType(LivePipWindow), findsNothing);
      expect(find.byType(AuctionDetailView), findsOneWidget);
      expect(find.byType(LiveFloatingPlayer), findsOneWidget);
      // PiP 동안 숨겨 두었을 뿐이라 다시 조회하지 않는다.
      expect(repo.requests.length, 1);
    });

    testWidgets('미니 플레이어를 누르면 라이브로 돌아가고 PiP를 해제한다', (tester) async {
      _usePhone(tester);
      final pip = FakePictureInPicture(supportValue: PipSupport.appWindow);
      await tester.pumpWidget(
        _app(repository: _FakeAuctionDetailRepository(), pip: pip),
      );
      await _open(tester);

      await tester.tap(find.bySemanticsLabel('라이브 방송으로 돌아가기'));
      await _settleDisposal(tester);
      expect(find.byType(AuctionDetailScreen), findsNothing);
      expect(find.text('라이브'), findsOneWidget);
      expect(pip.calls, ['enterOnLeave', 'close']);
    });

    testWidgets('미니 플레이어를 끌어 놓으면 가까운 가장자리로 붙는다', (tester) async {
      _usePhone(tester);
      await tester.pumpWidget(
        _app(
          repository: _FakeAuctionDetailRepository(),
          pip: FakePictureInPicture(),
        ),
      );
      await _open(tester);

      final player = find.bySemanticsLabel('라이브 방송으로 돌아가기');
      expect(tester.getTopRight(player).dx, 390 - 20);

      await tester.drag(player, const Offset(-250, 100));
      await tester.pumpAndSettle();
      expect(tester.getTopLeft(player).dx, 20);
    });
  });

  group('iOS PiP', () {
    testWidgets('시스템 창을 띄우고 앱 안에는 미니 플레이어를 그리지 않는다', (tester) async {
      _usePhone(tester);
      final pip = FakePictureInPicture(supportValue: PipSupport.overlay);
      await tester.pumpWidget(
        _app(repository: _FakeAuctionDetailRepository(), pip: pip),
      );
      await _open(tester);

      expect(pip.calls, ['show']);
      await _emit(tester, pip, PipEvent.started);
      expect(find.byType(LiveFloatingPlayer), findsNothing);
      expect(find.byType(LivePipWindow), findsNothing);
      expect(find.byType(AuctionDetailView), findsOneWidget);
    });

    testWidgets('화면을 벗어나면 시스템 창을 닫는다', (tester) async {
      _usePhone(tester);
      final pip = FakePictureInPicture(supportValue: PipSupport.overlay);
      await tester.pumpWidget(
        _app(repository: _FakeAuctionDetailRepository(), pip: pip),
      );
      await _open(tester);

      final navigator = tester.state<NavigatorState>(find.byType(Navigator));
      navigator.pop();
      await _settleDisposal(tester);
      expect(pip.calls, ['show', 'close']);
    });
  });

  testWidgets('방송 정보 없이 열면 작은 창을 띄우지 않는다', (tester) async {
    _usePhone(tester);
    final pip = FakePictureInPicture();
    await tester.pumpWidget(
      _app(repository: _FakeAuctionDetailRepository(), pip: pip, source: null),
    );
    await _open(tester);

    expect(pip.calls, isEmpty);
    expect(find.byType(LiveFloatingPlayer), findsNothing);
  });
}

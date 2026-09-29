import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/payment/data/demo/payment_demo_data.dart';
import 'package:livion/features/payment/domain/entities/order_payment.dart';
import 'package:livion/features/payment/domain/repositories/payment_repository.dart';
import 'package:livion/features/payment/presentation/providers/payment_dependencies.dart';
import 'package:livion/features/payment/presentation/screens/payment_complete_screen.dart';
import 'package:livion/features/payment/presentation/widgets/payment_complete_view.dart';
import 'package:livion/features/payment/presentation/widgets/payment_ui.dart';

class _FakePaymentRepository implements PaymentRepository {
  _FakePaymentRepository({this.failFirstFetch = false, this.memoError});

  final bool failFirstFetch;
  final Object? memoError;
  final List<String> requestedIds = [];
  final List<(String, String)> memoCalls = [];

  @override
  Future<OrderPayment> fetchOrderPayment(String orderId) async {
    requestedIds.add(orderId);
    if (failFirstFetch && requestedIds.length == 1) throw StateError('network');
    return PaymentDemoData.build(orderId: orderId);
  }

  @override
  Future<void> updateDeliveryMemo({
    required String orderId,
    required String memo,
  }) async {
    memoCalls.add((orderId, memo));
    if (memoError != null) throw memoError!;
  }
}

Widget _app(PaymentRepository repository, {VoidCallback? onBackToLive}) {
  return ProviderScope(
    overrides: [paymentRepositoryProvider.overrideWithValue(repository)],
    child: MaterialApp(
      theme: AppTheme.light,
      home: PaymentCompleteScreen(
        orderId: 'order-1',
        onBackToLive: onBackToLive,
      ),
    ),
  );
}

void _usePhone(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

Finder get _scrollable => find
    .descendant(
      of: find.byType(PaymentCompleteView),
      matching: find.byType(Scrollable),
    )
    .first;

void main() {
  test('결제 금액은 낙찰가·배송비·수수료의 합이고 배수는 소수 첫째 자리다', () {
    final payment = PaymentDemoData.build(orderId: 'o');
    expect(payment.totalWon, 11400);
    expect(payment.totalLabel, '11,400');
    expect(payment.multiplierLabel, '2.8');
    expect(payment.shippingFeeTitle, '배송비 (냉동)');
    expect(payment.nextItemLabel, '다음 품목 4/5');
    expect(payment.paidAtLabel, '21:14:07');
  });

  test('배송지는 로그에 개인정보를 남기지 않는다', () {
    final text = PaymentDemoData.build(orderId: 'o').toString();
    expect(text, isNot(contains('010-0000-0000')));
    expect(text, isNot(contains('홍길동')));
  });

  testWidgets('로딩 뒤 Figma 결제 화면 내용을 그린다', (tester) async {
    _usePhone(tester);
    final repo = _FakePaymentRepository();
    await tester.pumpWidget(_app(repo));
    expect(find.byType(AppLoadingView), findsOneWidget);
    await tester.pumpAndSettle();

    expect(repo.requestedIds, ['order-1']);
    for (final text in [
      '낙찰 · 등록 카드로 즉시 결제됐어요',
      '21:14:07',
      '국민카드 ****1234',
      '에스크로 예치 완료',
      '냉동만두 1.2kg',
      'D-12',
      '시작가 3,000원',
      '낙찰가',
      '배송비 (냉동)',
      '구매자 수수료',
      '결제 금액',
      '배송지',
      '배송지 변경',
      '우리집',
      '홍길동',
      '010-0000-0000',
      '서울특별시 00구 00로 00-0',
      '배송 메모',
      '선택해주세요',
    ]) {
      expect(find.text(text), findsWidgets, reason: text);
    }
    expect(find.bySemanticsLabel('결제 금액 11,400원'), findsOneWidget);
    expect(find.text('라이브로 돌아가기'), findsOneWidget);
    expect(find.text('다음 품목 4/5'), findsOneWidget);
    expect(find.text('주문 상세 보기'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('판매자 지급'),
      200,
      scrollable: _scrollable,
    );
    expect(find.text('자동결제'), findsOneWidget);
    expect(find.text('****1234'), findsOneWidget);
    // 결제·예치는 끝난 단계라 체크, 배송·수취는 번호로 남는다.
    expect(find.text('결제완료'), findsOneWidget);
    expect(find.text('에스크로 예치'), findsOneWidget);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.text('수취 확인'), findsOneWidget);
  });

  testWidgets('조회에 실패하면 다시 시도할 수 있다', (tester) async {
    _usePhone(tester);
    final repo = _FakePaymentRepository(failFirstFetch: true);
    await tester.pumpWidget(_app(repo));
    await tester.pumpAndSettle();
    expect(find.byType(AppErrorView), findsOneWidget);
    expect(find.text('라이브로 돌아가기'), findsNothing);

    await tester.tap(find.text('다시 시도'));
    await tester.pumpAndSettle();
    expect(find.byType(PaymentCompleteView), findsOneWidget);
    expect(repo.requestedIds.length, 2);
  });

  testWidgets('배송 메모를 고르면 바로 보이고 저장을 요청한다', (tester) async {
    _usePhone(tester);
    final repo = _FakePaymentRepository();
    await tester.pumpWidget(_app(repo));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('선택해주세요'),
      200,
      scrollable: _scrollable,
    );
    await tester.tap(find.text('선택해주세요'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('경비실에 맡겨주세요'));
    await tester.pumpAndSettle();

    expect(find.text('경비실에 맡겨주세요'), findsOneWidget);
    expect(find.text('선택해주세요'), findsNothing);
    expect(repo.memoCalls, [('order-1', '경비실에 맡겨주세요')]);
  });

  testWidgets('배송 메모 저장이 실패하면 되돌리고 안내한다', (tester) async {
    _usePhone(tester);
    final repo = _FakePaymentRepository(memoError: StateError('network'));
    await tester.pumpWidget(_app(repo));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('선택해주세요'),
      200,
      scrollable: _scrollable,
    );
    await tester.tap(find.text('선택해주세요'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('문 앞에 놓아주세요'));
    await tester.pumpAndSettle();

    expect(find.text('선택해주세요'), findsOneWidget);
    expect(find.text('배송 메모를 저장하지 못했어요.'), findsOneWidget);
  });

  testWidgets('"라이브로 돌아가기"는 콜백을 부르고, 준비 안 된 링크는 안내한다', (tester) async {
    _usePhone(tester);
    var backs = 0;
    await tester.pumpWidget(
      _app(_FakePaymentRepository(), onBackToLive: () => backs++),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('라이브로 돌아가기'));
    expect(backs, 1);

    await tester.tap(find.text('주문 상세 보기'));
    await tester.pump();
    expect(find.text('주문 상세 기능은 준비 중입니다.'), findsOneWidget);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/inventory_registration/data/repositories/demo_inventory_registration_repository.dart';
import 'package:livion/features/inventory_registration/presentation/providers/inventory_registration_dependencies.dart';
import 'package:livion/features/inventory_registration/presentation/screens/inventory_registration_screen.dart';
import 'package:livion/features/inventory_registration/presentation/widgets/pricing_step.dart';
import 'package:livion/features/inventory_registration/presentation/widgets/review_step.dart';
import 'package:livion/features/seller_onboarding/domain/entities/seller_application.dart';
import 'package:livion/features/seller_onboarding/presentation/screens/seller_application_complete_screen.dart';

/// 판매자 심사 접수 완료 화면에서 시작한다. 시계는 Figma 예시 날짜로 고정한다.
Widget _app() {
  final now = DateTime(2026, 9, 14, 12);
  return ProviderScope(
    overrides: [
      inventoryRegistrationClockProvider.overrideWithValue(() => now),
      inventoryRegistrationRepositoryProvider.overrideWithValue(
        DemoInventoryRegistrationRepository(
          latency: Duration.zero,
          clock: () => now,
        ),
      ),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      home: const SellerApplicationCompleteScreen(
        receipt: SellerApplicationReceipt(
          receiptNumber: 'S-260914-0042',
          channelName: '한빛식품',
          broadcastMode: BroadcastMode.official,
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

/// 단계 본문 ListView. 입력칸마다 안쪽 Scrollable이 있어 가장 바깥 것을 고른다.
Finder _scrollableOf(Type step) => find
    .descendant(of: find.byType(step), matching: find.byType(Scrollable))
    .first;

Future<void> _tapNext(WidgetTester tester) async {
  await tester.tap(find.widgetWithText(AppButton, '다음'));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('첫 재고 등록하기로 열고 1단계 기본 정보를 보인다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app());
    await tester.tap(find.text('첫 재고 등록하기'));
    await tester.pumpAndSettle();

    expect(find.byType(InventoryRegistrationScreen), findsOneWidget);
    expect(find.text('재고 등록'), findsOneWidget);
    expect(find.text('임시저장'), findsOneWidget);
    expect(find.text('STEP 01'), findsOneWidget);
    expect(find.byType(AppPhotoTile), findsNWidgets(4));
    expect(find.text('소비기한 라벨 필수'), findsOneWidget);

    // 데모 사진 고르기: 정면은 예시 사진이 들어오고 삭제 버튼이 생긴다.
    await tester.tap(find.bySemanticsLabel('정면 사진 추가'));
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('정면 사진 삭제'), findsOneWidget);

    // 사진이 준비되지 않은 칸은 안내만 한다.
    await tester.tap(find.bySemanticsLabel('포장 상태 사진 추가'));
    await tester.pump();
    expect(find.text('사진 촬영은 준비 중입니다.'), findsOneWidget);
  });

  testWidgets('네 단계를 지나 확인해야 신청 버튼이 켜지고, 신청하면 완료 화면으로 돌아온다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app());
    await tester.tap(find.text('첫 재고 등록하기'));
    await tester.pumpAndSettle();

    await _tapNext(tester);
    expect(find.text('STEP 02'), findsOneWidget);
    expect(find.byType(AppCriteriaTable), findsOneWidget);

    // 상태를 고르면 기준표 칸이 강조된다.
    await tester.tap(find.widgetWithText(AppOptionTile, '이상 없음'));
    await tester.pumpAndSettle();
    expect(
      find.descendant(
        of: find.byType(AppCriteriaTable),
        matching: find.byType(AppCheckLabel),
      ),
      findsOneWidget,
    );

    await _tapNext(tester);
    expect(find.text('STEP 03'), findsOneWidget);
    expect(find.text('Livion 공식 방송에 위탁'), findsOneWidget);

    // 화요일 20:00은 정기 슬롯이다.
    await tester.tap(find.text('화'));
    await tester.pumpAndSettle();
    expect(find.widgetWithText(AppBadge, '정기'), findsWidgets);
    await tester.tap(find.text('20:00'));
    await tester.pumpAndSettle();
    await tester.scrollUntilVisible(
      find.text('6,952원'),
      200,
      scrollable: _scrollableOf(PricingStep),
    );
    expect(find.text('편성료 (정기)'), findsOneWidget);

    await _tapNext(tester);
    expect(find.text('STEP 04'), findsOneWidget);

    final submit = find.widgetWithText(AppButton, '검수 요청 및 편성 신청');
    expect(tester.widget<AppButton>(submit).onPressed, isNull);

    final consent = find.byType(AppCheckRow);
    await tester.scrollUntilVisible(
      consent,
      200,
      scrollable: _scrollableOf(ReviewStep),
    );
    await tester.tap(consent);
    await tester.pumpAndSettle();
    expect(tester.widget<AppButton>(submit).onPressed, isNotNull);

    await tester.tap(submit);
    await tester.pumpAndSettle();
    expect(find.byType(InventoryRegistrationScreen), findsNothing);
    expect(find.textContaining('L-260914-0001'), findsOneWidget);
  });

  testWidgets('검토의 수정은 그 단계로 돌아가고, 첫 단계 뒤로가기는 닫는다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app());
    await tester.tap(find.text('재고 미리 등록 (검수는 승인 후 진행)'));
    await tester.pumpAndSettle();

    await _tapNext(tester);
    await _tapNext(tester);
    await _tapNext(tester);
    await tester.tap(find.widgetWithText(AppButton, '수정').first);
    await tester.pumpAndSettle();
    expect(find.text('STEP 01'), findsOneWidget);

    await tester.tap(find.bySemanticsLabel('뒤로'));
    await tester.pumpAndSettle();
    expect(find.byType(InventoryRegistrationScreen), findsNothing);
    expect(find.byType(SellerApplicationCompleteScreen), findsOneWidget);
  });
}

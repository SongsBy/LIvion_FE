import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/seller_onboarding/data/repositories/demo_seller_onboarding_repository.dart';
import 'package:livion/features/seller_onboarding/domain/entities/seller_application.dart';
import 'package:livion/features/seller_onboarding/presentation/providers/seller_onboarding_providers.dart';
import 'package:livion/features/seller_onboarding/presentation/screens/seller_application_complete_screen.dart';
import 'package:livion/features/seller_onboarding/presentation/screens/seller_application_screen.dart';
import 'package:livion/features/seller_onboarding/presentation/widgets/business_info_step.dart';
import 'package:livion/features/seller_onboarding/presentation/widgets/channel_info_step.dart';
import 'package:livion/features/seller_onboarding/presentation/widgets/seller_type_step.dart';
import 'package:livion/features/seller_onboarding/presentation/widgets/settlement_terms_step.dart';

/// 버튼으로 신청 화면을 열고, 닫힐 때 돌려준 값을 [onResult]로 알린다.
/// 시계를 고정해 인증번호 남은 시간이 흐르지 않게 한다.
/// [requiresInput]가 true면 필수 항목 검사를 켠다 (기본 앱은 꺼져 있다).
Widget _app(
  ValueChanged<SellerApplicationReceipt?> onResult, {
  bool requiresInput = false,
}) {
  final now = DateTime(2026, 9, 29, 12);
  return ProviderScope(
    overrides: [
      sellerOnboardingRepositoryProvider.overrideWithValue(
        const DemoSellerOnboardingRepository(latency: Duration.zero),
      ),
      sellerOnboardingClockProvider.overrideWithValue(() => now),
      sellerApplicationRequiresInputProvider.overrideWithValue(requiresInput),
    ],
    child: MaterialApp(
      theme: AppTheme.light,
      home: Builder(
        builder: (context) => Scaffold(
          body: TextButton(
            onPressed: () async =>
                onResult(await SellerApplicationScreen.open(context)),
            child: const Text('열기'),
          ),
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

Finder _input(String hint) => find.descendant(
  of: find.byWidgetPredicate((w) => w is AppTextInput && w.hint == hint),
  matching: find.byType(EditableText),
);

String _counter(WidgetTester tester) {
  final bar = find.byType(AppTopBar);
  return tester
      .widgetList<Text>(find.descendant(of: bar, matching: find.byType(Text)))
      .map((t) => t.data)
      .join();
}

void main() {
  late Type step;

  Future<void> reveal(WidgetTester tester, Finder finder) async {
    await tester.scrollUntilVisible(
      finder,
      200,
      scrollable: _scrollableOf(step),
    );
    await tester.pumpAndSettle();
  }

  Future<void> fill(WidgetTester tester, String hint, String text) async {
    await reveal(tester, _input(hint));
    await tester.enterText(_input(hint), text);
    // 포커스를 받으면 입력칸이 보이도록 목록이 움직이므로 끝날 때까지 기다린다.
    await tester.pumpAndSettle();
  }

  Future<void> tapIn(WidgetTester tester, Finder finder) async {
    await reveal(tester, finder);
    await tester.tap(finder);
    await tester.pumpAndSettle();
  }

  Future<void> next(WidgetTester tester) async {
    await tester.tap(find.text('다음'));
    await tester.pumpAndSettle();
  }

  testWidgets('Figma 1/4 유형: 사업자 선택 · 심사 절차 · 준비 서류를 그린다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app((_) {}));
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    expect(_counter(tester), '판매자 전환1/4');
    expect(find.text('STEP 01'), findsOneWidget);
    expect(find.bySemanticsLabel('4단계 중 1단계, 유형'), findsOneWidget);

    final business = tester.widget<AppOptionCard>(
      find.widgetWithText(AppOptionCard, '사업자'),
    );
    expect(business.selected, isTrue);
    final individual = tester.widget<AppOptionCard>(
      find.widgetWithText(AppOptionCard, '개인 판매자'),
    );
    expect(individual.onTap, isNull, reason: '개인 판매자는 준비중');

    step = SellerTypeStep;
    for (final label in ['접수', '서류 확인', '채널 개설', '첫 편성']) {
      await reveal(tester, find.text(label));
    }
    await reveal(tester, find.text('통신판매업 신고번호'));
    expect(find.text('필수'), findsNWidgets(3));
    expect(find.text('선택'), findsOneWidget);
  });

  testWidgets('기본(데모)은 빈 칸이어도 다음 → 심사 신청까지 넘어가 접수 완료 화면을 연다', (tester) async {
    _phoneSize(tester);
    SellerApplicationReceipt? result;
    await tester.pumpWidget(_app((r) => result = r));
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();

    for (var i = 2; i <= 4; i++) {
      await next(tester);
      expect(_counter(tester), '판매자 전환$i/4');
    }
    await tester.tap(find.text('심사 신청'));
    await tester.pumpAndSettle();
    expect(find.byType(SellerApplicationScreen), findsNothing);
    expect(find.byType(SellerApplicationCompleteScreen), findsOneWidget);
    expect(result?.channelName, '한빛식품');
  });

  testWidgets('검사를 켜면 빠진 항목이 있을 때 넘어가지 않고 알린다, 이전은 입력을 남긴다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app((_) {}, requiresInput: true));
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();

    await next(tester);
    expect(_counter(tester), '판매자 전환2/4');
    expect(find.text('STEP 02'), findsOneWidget);

    await next(tester);
    expect(find.text('사업자등록번호를 확인해 주세요.'), findsOneWidget);
    expect(_counter(tester), '판매자 전환2/4');

    step = BusinessInfoStep;
    await fill(tester, '상호명을 입력해주세요.', '한빛식품');
    await tester.tap(find.text('이전'));
    await tester.pumpAndSettle();
    expect(_counter(tester), '판매자 전환1/4');
    await next(tester);
    expect(find.text('한빛식품'), findsOneWidget);
  });

  testWidgets('검사를 켜고 1/4 → 4/4를 채워 심사 신청하면 접수 완료 화면으로 바뀐다', (tester) async {
    _phoneSize(tester);
    SellerApplicationReceipt? result;
    await tester.pumpWidget(_app((r) => result = r, requiresInput: true));
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();

    // 1/4 유형
    await next(tester);

    // 2/4 사업자
    step = BusinessInfoStep;
    await fill(tester, '사업자등록번호를 입력해주세요.', '1234567890');
    await tester.tap(find.text('확인'));
    await tester.pumpAndSettle();
    expect(find.text('확인완료'), findsOneWidget);

    await fill(tester, '상호명을 입력해주세요.', '한빛식품');
    await fill(tester, '대표자명을 입력해주세요.', '홍길동');
    await fill(tester, '휴대폰 번호를 입력해주세요.', '01012345678');
    await tapIn(tester, find.text('인증번호'));
    expect(find.text('03:00'), findsOneWidget);
    await fill(tester, '인증번호 입력', '123456');
    await tester.pumpAndSettle();
    expect(find.text('인증완료'), findsOneWidget);
    expect(_input('인증번호 입력'), findsNothing);

    await tapIn(tester, find.text('과잉'));
    await tapIn(tester, find.text('1회'));
    await next(tester);

    // 3/4 채널
    expect(_counter(tester), '판매자 전환3/4');
    step = ChannelInfoStep;
    await fill(tester, '채널명을 입력해주세요.', 'Livion');
    await tapIn(tester, find.text('중복확인'));
    expect(find.text('이미 사용 중인 채널명이에요.'), findsOneWidget);
    await fill(tester, '채널명을 입력해주세요.', '한빛마켓');
    await tapIn(tester, find.text('중복확인'));
    expect(find.text('사용가능'), findsOneWidget);

    await fill(
      tester,
      '주로 취급하는 상품 혹은 정기 방송일 등\n채널 소개를 작성해주세요.',
      '매주 토요일 저녁 과일 임박 재고 방송',
    );
    await tapIn(
      tester,
      find.descendant(
        of: find.byType(ChannelInfoStep),
        matching: find.text('생활용품'),
      ),
    );
    await reveal(tester, find.text('자체 채널 방송'));
    expect(
      tester
          .widget<AppOptionCard>(
            find.widgetWithText(AppOptionCard, 'Livion 공식 방송 위탁'),
          )
          .selected,
      isTrue,
    );
    await next(tester);

    // 4/4 정산·약관
    expect(_counter(tester), '판매자 전환4/4');
    expect(find.text('심사 신청'), findsOneWidget);
    step = SettlementTermsStep;
    await tapIn(tester, find.text('은행 선택'));
    expect(find.byType(AppLogoTile), findsNWidgets(20));
    await tester.tap(find.bySemanticsLabel('신한은행'));
    await tester.pumpAndSettle();
    expect(find.byType(AppLogoTile), findsNothing);
    expect(find.text('신한은행'), findsOneWidget);

    await fill(tester, '계좌번호 입력', '110123456789');
    await tapIn(tester, find.text('1원 인증'));
    expect(find.text('인증완료'), findsWidgets);
    await fill(tester, '이메일을 입력해주세요.', 'tax@hanbit.example');

    await reveal(tester, find.text('낙찰가의 12% · 유찰 시 0원'));
    await tester.tap(find.text('심사 신청'));
    await tester.pumpAndSettle();
    expect(find.text('필수 약관에 모두 동의해 주세요.'), findsOneWidget);

    await tapIn(tester, find.text('전체동의'));
    await reveal(tester, find.text('수수료 12% 및 프라임 편성료 안내'));
    await tester.tap(find.text('심사 신청'));
    await tester.pumpAndSettle();

    expect(find.byType(SellerApplicationScreen), findsNothing);
    expect(result?.channelName, '한빛마켓');
    expect(find.text('판매자 심사 접수 완료'), findsOneWidget);
    expect(find.text('한빛마켓'), findsOneWidget);
    expect(find.text('공식 위탁'), findsOneWidget);
    expect(find.text(result!.receiptNumber), findsOneWidget);

    // 완료 화면에서 뒤로 가면 시작한 화면으로 돌아간다.
    await tester.tap(find.bySemanticsLabel('뒤로'));
    await tester.pumpAndSettle();
    expect(find.byType(SellerApplicationCompleteScreen), findsNothing);
    expect(find.text('열기'), findsOneWidget);
  });

  testWidgets('1단계에서 이전을 누르면 결과 없이 닫힌다', (tester) async {
    _phoneSize(tester);
    SellerApplicationReceipt? result;
    var closed = false;
    await tester.pumpWidget(
      _app((r) {
        result = r;
        closed = true;
      }),
    );
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('이전'));
    await tester.pumpAndSettle();
    expect(find.byType(SellerApplicationScreen), findsNothing);
    expect(closed, isTrue);
    expect(result, isNull);
  });
}

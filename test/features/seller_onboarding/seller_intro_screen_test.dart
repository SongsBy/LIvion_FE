import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/seller_onboarding/data/repositories/demo_seller_onboarding_repository.dart';
import 'package:livion/features/seller_onboarding/domain/entities/seller_application.dart';
import 'package:livion/features/seller_onboarding/domain/entities/seller_program_stats.dart';
import 'package:livion/features/seller_onboarding/domain/repositories/seller_onboarding_repository.dart';
import 'package:livion/features/seller_onboarding/presentation/providers/seller_onboarding_providers.dart';
import 'package:livion/features/seller_onboarding/presentation/screens/seller_application_complete_screen.dart';
import 'package:livion/features/seller_onboarding/presentation/screens/seller_application_screen.dart';
import 'package:livion/features/seller_onboarding/presentation/screens/seller_intro_screen.dart';

/// 실적은 [failures]번까지 실패하고 그 뒤로 데모 실적을 돌려주는 fake.
/// 신청 폼 요청은 지연 없는 데모 구현에 맡긴다.
class _FakeRepository implements SellerOnboardingRepository {
  _FakeRepository({this.failures = 0});

  final int failures;
  int calls = 0;

  static const _demo = DemoSellerOnboardingRepository(latency: Duration.zero);

  @override
  Future<SellerProgramStats> fetchProgramStats() async {
    calls++;
    if (calls <= failures) throw StateError('network');
    return DemoSellerOnboardingRepository.stats;
  }

  @override
  Future<bool> verifyBusinessNumber(String businessNumber) =>
      _demo.verifyBusinessNumber(businessNumber);

  @override
  Future<Duration> requestPhoneCode(String phone) =>
      _demo.requestPhoneCode(phone);

  @override
  Future<bool> confirmPhoneCode({
    required String phone,
    required String code,
  }) => _demo.confirmPhoneCode(phone: phone, code: code);

  @override
  Future<bool> isChannelNameAvailable(String channelName) =>
      _demo.isChannelNameAvailable(channelName);

  @override
  Future<List<SettlementBank>> fetchBanks() => _demo.fetchBanks();

  @override
  Future<bool> verifyBankAccount({
    required String bankCode,
    required String accountNumber,
  }) =>
      _demo.verifyBankAccount(bankCode: bankCode, accountNumber: accountNumber);

  @override
  Future<SellerApplicationReceipt> submitApplication(
    SellerApplication application,
  ) => _demo.submitApplication(application);
}

/// 첫 화면의 버튼으로 안내 화면을 열고, 닫힐 때 돌려준 값을 [onResult]로 알린다.
Widget _app(SellerOnboardingRepository repo, ValueChanged<bool> onResult) {
  return ProviderScope(
    overrides: [sellerOnboardingRepositoryProvider.overrideWithValue(repo)],
    child: MaterialApp(
      theme: AppTheme.light,
      home: Builder(
        builder: (context) => Scaffold(
          body: TextButton(
            onPressed: () async =>
                onResult(await SellerIntroScreen.open(context)),
            child: const Text('열기'),
          ),
        ),
      ),
    ),
  );
}

const _receipt = SellerApplicationReceipt(
  receiptNumber: 'S-260914-0042',
  channelName: '한빛식품',
  broadcastMode: BroadcastMode.official,
);

final _vertical = find.byWidgetPredicate(
  (w) => w is Scrollable && w.axisDirection == AxisDirection.down,
);

Finder _stat(String value, String unit) => find.byWidgetPredicate(
  (w) => w is AppStatFigure && w.value == value && w.unit == unit,
);

void _phoneSize(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

void main() {
  testWidgets('Figma 판매자 전환 안내를 그리고, 시작하기는 신청 화면을 연다', (tester) async {
    _phoneSize(tester);
    bool? result;
    await tester.pumpWidget(_app(_FakeRepository(), (r) => result = r));
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    expect(find.text('간편하게\n재고 목록만 올리세요'), findsOneWidget);
    expect(find.byType(AppFeatureCard), findsNWidgets(3));
    expect(find.text('유찰 시 수수료 0원'), findsOneWidget);

    await tester.scrollUntilVisible(
      _stat('2.0', '배'),
      300,
      scrollable: _vertical,
    );
    await tester.scrollUntilVisible(
      _stat('68', '%'),
      300,
      scrollable: _vertical,
    );
    await tester.scrollUntilVisible(
      find.textContaining('심사는 영업일 2일 이내'),
      300,
      scrollable: _vertical,
    );

    // 시작하기 → 판매자 전환 1/4. 1단계에서 뒤로 오면 안내 화면에 남는다.
    await tester.tap(find.text('판매자 전환 시작하기'));
    await tester.pumpAndSettle();
    expect(find.byType(SellerApplicationScreen), findsOneWidget);
    await tester.tap(find.text('이전'));
    await tester.pumpAndSettle();
    expect(find.byType(SellerApplicationScreen), findsNothing);
    expect(find.byType(SellerIntroScreen), findsOneWidget);
    expect(result, isNull);

    // 심사 신청까지 마치면(접수 결과) 안내 화면도 true로 닫힌다.
    await tester.tap(find.text('판매자 전환 시작하기'));
    await tester.pumpAndSettle();
    Navigator.of(
      tester.element(find.byType(SellerApplicationScreen)),
    ).pop(_receipt);
    await tester.pumpAndSettle();
    expect(find.byType(SellerIntroScreen), findsNothing);
    expect(result, isTrue);
  });

  testWidgets('심사 신청이 끝나면 접수 완료 화면만 남고 안내 화면은 밑에서 true로 빠진다', (tester) async {
    _phoneSize(tester);
    bool? result;
    await tester.pumpWidget(_app(_FakeRepository(), (r) => result = r));
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('판매자 전환 시작하기'));
    await tester.pumpAndSettle();
    // 필수 항목 검사가 꺼진 기본 설정이라 빈 칸으로 끝까지 간다.
    for (var i = 0; i < 3; i++) {
      await tester.tap(find.text('다음'));
      await tester.pumpAndSettle();
    }
    await tester.tap(find.text('심사 신청'));
    await tester.pumpAndSettle();

    expect(find.byType(SellerApplicationCompleteScreen), findsOneWidget);
    expect(find.byType(SellerIntroScreen), findsNothing);
    expect(find.byType(SellerApplicationScreen), findsNothing);
    expect(result, isTrue);

    await tester.tap(find.bySemanticsLabel('뒤로'));
    await tester.pumpAndSettle();
    expect(find.byType(SellerApplicationCompleteScreen), findsNothing);
    expect(find.text('열기'), findsOneWidget);
  });

  testWidgets('뒤로가기는 false로 닫힌다', (tester) async {
    _phoneSize(tester);
    bool? result;
    await tester.pumpWidget(_app(_FakeRepository(), (r) => result = r));
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();

    await tester.tap(find.bySemanticsLabel('뒤로'));
    await tester.pumpAndSettle();
    expect(result, isFalse);
  });

  testWidgets('실적 조회가 실패해도 안내·시작하기는 보이고 다시 시도할 수 있다', (tester) async {
    _phoneSize(tester);
    final repo = _FakeRepository(failures: 1);
    await tester.pumpWidget(_app(repo, (_) {}));
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();

    expect(find.text('판매자 전환 시작하기'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.text('다시 시도'),
      300,
      scrollable: _vertical,
    );
    await tester.tap(find.text('다시 시도'));
    await tester.pumpAndSettle();
    expect(repo.calls, 2);
    expect(_stat('68', '%'), findsOneWidget);
  });
}

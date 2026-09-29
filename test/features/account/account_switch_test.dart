import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/account/data/demo/account_demo_data.dart';
import 'package:livion/features/account/domain/entities/account_profile.dart';
import 'package:livion/features/account/domain/repositories/account_repository.dart';
import 'package:livion/features/account/presentation/providers/account_dependencies.dart';
import 'package:livion/features/account/presentation/providers/account_switch_controller.dart';
import 'package:livion/features/account/presentation/widgets/account_switch_button.dart';
import 'package:livion/features/seller_onboarding/data/repositories/demo_seller_onboarding_repository.dart';
import 'package:livion/features/seller_onboarding/domain/entities/seller_application.dart';
import 'package:livion/features/seller_onboarding/presentation/providers/seller_onboarding_providers.dart';
import 'package:livion/features/seller_onboarding/presentation/screens/seller_application_screen.dart';
import 'package:livion/features/seller_onboarding/presentation/screens/seller_intro_screen.dart';

/// 요청 응답을 테스트가 직접 끝내는 fake.
class _FakeAccountRepository implements AccountRepository {
  _FakeAccountRepository({bool withSeller = false})
    : profiles = [
        AccountDemoData.buyer,
        if (withSeller) AccountDemoData.seller,
      ];

  final List<AccountProfile> profiles;
  String activeId = AccountDemoData.buyerId;
  int requests = 0;
  Completer<void>? pending;
  bool fail = false;

  AccountSession get _session =>
      AccountSession(profiles: [...profiles], activeProfileId: activeId);

  Future<void> _await() async {
    requests++;
    pending = Completer<void>();
    await pending!.future;
    if (fail) throw StateError('network');
  }

  @override
  Future<AccountSession> fetchSession() async => _session;

  @override
  Future<AccountSession> switchProfile(String profileId) async {
    await _await();
    activeId = profileId;
    return _session;
  }

  @override
  Future<AccountSession> registerSeller() async {
    await _await();
    profiles.add(AccountDemoData.seller);
    activeId = AccountDemoData.sellerId;
    return _session;
  }
}

void main() {
  group('AccountSwitchController', () {
    late _FakeAccountRepository repo;
    late ProviderContainer container;

    void setUpWith({bool withSeller = false}) {
      repo = _FakeAccountRepository(withSeller: withSeller);
      container = ProviderContainer(
        overrides: [accountRepositoryProvider.overrideWithValue(repo)],
      );
      addTearDown(container.dispose);
    }

    AccountSwitchState read() =>
        container.read(accountSwitchControllerProvider).requireValue;
    AccountSwitchController notifier() =>
        container.read(accountSwitchControllerProvider.notifier);

    test('전환 중에는 이전 계정을 유지하고, 끝나면 새 계정이 된다', () async {
      setUpWith(withSeller: true);
      await container.read(accountSwitchControllerProvider.future);

      final result = notifier().switchTo(AccountDemoData.sellerId);
      expect(read().isSubmitting, isTrue);
      expect(read().session.active.role, AccountRole.buyer);

      // 요청 중 중복 요청은 보내지 않는다.
      expect(await notifier().switchTo(AccountDemoData.sellerId), isFalse);
      expect(await notifier().registerSeller(), isFalse);
      expect(repo.requests, 1);

      repo.pending!.complete();
      expect(await result, isTrue);
      expect(read().isSubmitting, isFalse);
      expect(read().session.active.name, '한빛식품');
    });

    test('같은 계정은 요청하지 않는다', () async {
      setUpWith(withSeller: true);
      await container.read(accountSwitchControllerProvider.future);
      expect(await notifier().switchTo(AccountDemoData.buyerId), isFalse);
      expect(repo.requests, 0);
    });

    test('실패하면 이전 계정으로 돌아간다', () async {
      setUpWith(withSeller: true);
      repo.fail = true;
      await container.read(accountSwitchControllerProvider.future);
      final result = notifier().switchTo(AccountDemoData.sellerId);
      repo.pending!.complete();
      expect(await result, isFalse);
      expect(read().isSubmitting, isFalse);
      expect(read().session.active.role, AccountRole.buyer);
    });

    test('판매자 등록은 판매자 계정을 만들고 그 계정으로 바꾼다', () async {
      setUpWith();
      await container.read(accountSwitchControllerProvider.future);
      expect(read().session.hasSeller, isFalse);

      final result = notifier().registerSeller();
      repo.pending!.complete();
      expect(await result, isTrue);
      expect(read().session.hasSeller, isTrue);
      expect(read().session.active.role, AccountRole.seller);

      // 이미 판매자 계정이 있으면 다시 등록하지 않는다.
      expect(await notifier().registerSeller(), isFalse);
      expect(repo.requests, 1);
    });
  });

  group('AccountSwitchButton', () {
    Widget app(_FakeAccountRepository repo) => ProviderScope(
      overrides: [
        accountRepositoryProvider.overrideWithValue(repo),
        sellerOnboardingRepositoryProvider.overrideWithValue(
          const DemoSellerOnboardingRepository(latency: Duration.zero),
        ),
      ],
      child: MaterialApp(
        theme: AppTheme.light,
        home: Scaffold(
          appBar: AppTopBar.home(profile: const AccountSwitchButton()),
        ),
      ),
    );

    /// 요청 중에는 진행 표시가 계속 돌아 pumpAndSettle을 쓰지 않는다.
    Future<void> pumpFrames(WidgetTester tester) async {
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));
    }

    testWidgets('판매자 계정이 있으면 골라서 바로 전환한다', (tester) async {
      final repo = _FakeAccountRepository(withSeller: true);
      await tester.pumpWidget(app(repo));
      await tester.pump();
      expect(find.bySemanticsLabel('현재 구매자 계정 홍길동, 계정 전환'), findsOneWidget);

      await tester.tap(find.byType(AppProfileSwitch));
      await tester.pumpAndSettle();
      expect(find.text('계정 전환'), findsOneWidget);
      expect(find.text('판매자로 전환하기'), findsNothing);

      await tester.tap(find.text('한빛식품'));
      await pumpFrames(tester);
      expect(
        tester.widget<AppProfileSwitch>(find.byType(AppProfileSwitch)).isBusy,
        isTrue,
      );

      repo.pending!.complete();
      await tester.pumpAndSettle();
      expect(find.text('판매자 계정(한빛식품)으로 전환했어요.'), findsOneWidget);
      expect(find.bySemanticsLabel('현재 판매자 계정 한빛식품, 계정 전환'), findsOneWidget);
    });

    testWidgets('판매자 계정이 없으면 안내 → 판매자 전환 신청을 거쳐 판매자 계정을 만든다', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      final repo = _FakeAccountRepository();
      await tester.pumpWidget(app(repo));
      await tester.pump();

      await tester.tap(find.byType(AppProfileSwitch));
      await tester.pumpAndSettle();
      await tester.tap(find.text('판매자로 전환하기'));
      await tester.pumpAndSettle();
      expect(find.byType(SellerIntroScreen), findsOneWidget);

      await tester.tap(find.text('판매자 전환 시작하기'));
      await tester.pumpAndSettle();
      expect(find.byType(SellerApplicationScreen), findsOneWidget);
      expect(repo.requests, 0);

      // 4단계 입력은 seller_application_screen_test가 확인한다. 여기서는 심사 신청을
      // 마친 것처럼 접수 결과로 닫는다.
      Navigator.of(tester.element(find.byType(SellerApplicationScreen))).pop(
        const SellerApplicationReceipt(
          receiptNumber: 'S-260914-0042',
          channelName: '한빛식품',
          broadcastMode: BroadcastMode.official,
        ),
      );
      await pumpFrames(tester);
      await tester.pump(const Duration(milliseconds: 500));
      expect(find.byType(SellerApplicationScreen), findsNothing);
      expect(find.byType(SellerIntroScreen), findsNothing);
      expect(repo.requests, 1);

      repo.pending!.complete();
      await tester.pumpAndSettle();
      expect(find.text('판매자 계정(한빛식품)으로 전환했어요.'), findsOneWidget);
    });

    testWidgets('안내 화면에서 뒤로 가면 계정을 만들지 않는다', (tester) async {
      tester.view.physicalSize = const Size(390, 844);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      final repo = _FakeAccountRepository();
      await tester.pumpWidget(app(repo));
      await tester.pump();

      await tester.tap(find.byType(AppProfileSwitch));
      await tester.pumpAndSettle();
      await tester.tap(find.text('판매자로 전환하기'));
      await tester.pumpAndSettle();
      await tester.tap(find.bySemanticsLabel('뒤로'));
      await tester.pumpAndSettle();

      expect(find.byType(SellerIntroScreen), findsNothing);
      expect(repo.requests, 0);
      expect(find.bySemanticsLabel('현재 구매자 계정 홍길동, 계정 전환'), findsOneWidget);
    });
  });
}

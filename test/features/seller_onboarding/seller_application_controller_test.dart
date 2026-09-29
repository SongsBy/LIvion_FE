import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/features/seller_onboarding/data/repositories/demo_seller_onboarding_repository.dart';
import 'package:livion/features/seller_onboarding/domain/entities/seller_application.dart';
import 'package:livion/features/seller_onboarding/domain/entities/seller_program_stats.dart';
import 'package:livion/features/seller_onboarding/domain/repositories/seller_onboarding_repository.dart';
import 'package:livion/features/seller_onboarding/presentation/providers/seller_application_controller.dart';
import 'package:livion/features/seller_onboarding/presentation/providers/seller_onboarding_providers.dart';

/// 기본은 지연 없는 데모 응답. 사업자 확인·신청은 테스트가 끝낼 수 있다.
class _FakeRepository implements SellerOnboardingRepository {
  static final _demo = DemoSellerOnboardingRepository(
    latency: Duration.zero,
    clock: () => DateTime(2026, 9, 14),
  );

  static const shinhan = SettlementBank(code: '088', name: '신한은행');
  static const woori = SettlementBank(code: '020', name: '우리은행');

  Completer<bool>? businessCheck;
  bool failSubmit = false;
  final submitted = <SellerApplication>[];

  @override
  Future<SellerProgramStats> fetchProgramStats() => _demo.fetchProgramStats();

  @override
  Future<bool> verifyBusinessNumber(String businessNumber) =>
      businessCheck?.future ?? _demo.verifyBusinessNumber(businessNumber);

  @override
  Future<Duration> requestPhoneCode(String phone) =>
      _demo.requestPhoneCode(phone);

  @override
  Future<bool> confirmPhoneCode({
    required String phone,
    required String code,
  }) async => code == '123456';

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
  ) async {
    if (failSubmit) throw StateError('network');
    submitted.add(application);
    return _demo.submitApplication(application);
  }
}

void main() {
  late _FakeRepository repo;
  late ProviderContainer container;
  late DateTime now;

  setUp(() {
    repo = _FakeRepository();
    now = DateTime(2026, 9, 29, 12);
    container = ProviderContainer(
      overrides: [
        sellerOnboardingRepositoryProvider.overrideWithValue(repo),
        sellerOnboardingClockProvider.overrideWithValue(() => now),
        // 검사 로직을 확인하려고 켠다. 기본(꺼짐)은 아래 group에서 본다.
        sellerApplicationRequiresInputProvider.overrideWithValue(true),
      ],
    );
    // autoDispose provider를 테스트 내내 붙잡아 둔다.
    container.listen(sellerApplicationControllerProvider, (_, _) {});
    addTearDown(container.dispose);
  });

  SellerApplicationState read() =>
      container.read(sellerApplicationControllerProvider);
  SellerApplicationController notifier() =>
      container.read(sellerApplicationControllerProvider.notifier);

  /// 2단계 필수 항목을 모두 채운다.
  Future<void> fillBusiness() async {
    final c = notifier();
    c.setBusinessNumber('1234567890');
    await c.verifyBusinessNumber();
    c.setCompanyName('한빛식품');
    c.setRepresentativeName('홍길동');
    c.setContactPhone('01012345678');
    await c.requestPhoneCode();
    c.setPhoneCode('123456');
    await pumpEventQueue();
    c.toggleStockType(StockType.surplus);
    c.selectMonthlyBroadcasts(MonthlyBroadcasts.once);
  }

  Future<void> fillChannel() async {
    final c = notifier();
    c.setChannelName('한빛마켓');
    await c.checkChannelName();
    c.setChannelIntro('매주 토요일 저녁 과일 임박 재고 방송');
    c.selectCategory(ChannelCategory.imminent);
  }

  Future<void> fillSettlement() async {
    final c = notifier();
    c.selectBank(_FakeRepository.shinhan);
    c.setAccountNumber('110123456789');
    await c.verifyAccount();
    c.setTaxInvoiceEmail('tax@hanbit.example');
    c.setAllAgreements(agreed: true);
  }

  test('처음에는 1단계 · 사업자 · 공식 방송 위탁이 골라져 있다', () {
    final s = read();
    expect(s.step, SellerApplicationStep.type);
    expect(s.sellerType, SellerType.business);
    expect(s.broadcastMode, BroadcastMode.official);
    expect(s.isFirstStep, isTrue);
  });

  test('다음은 빠진 항목을 돌려주고 넘어가지 않는다, 이전은 한 단계씩 돌아간다', () async {
    expect(notifier().next(), isNull);
    expect(read().step, SellerApplicationStep.business);

    expect(notifier().next(), SellerApplicationIssue.businessNumberUnverified);
    expect(read().step, SellerApplicationStep.business);

    await fillBusiness();
    expect(notifier().next(), isNull);
    expect(read().step, SellerApplicationStep.channel);

    expect(notifier().back(), isTrue);
    expect(read().step, SellerApplicationStep.business);
    expect(read().companyName, '한빛식품', reason: '단계를 오가도 입력값은 남는다');
    expect(notifier().back(), isTrue);
    expect(notifier().back(), isFalse, reason: '첫 단계에서는 화면이 닫을지 정한다');
  });

  test('개인 판매자는 준비 중이라 고를 수 없다', () {
    notifier().selectSellerType(SellerType.individual);
    expect(read().sellerType, SellerType.business);
  });

  test('사업자등록번호 확인 중에 번호를 고치면 늦게 온 응답을 버린다', () async {
    repo.businessCheck = Completer<bool>();
    notifier().setBusinessNumber('1234567890');
    final pending = notifier().verifyBusinessNumber();
    expect(read().businessNumberCheck, CheckStatus.checking);

    notifier().setBusinessNumber('1234567891');
    expect(read().businessNumberCheck, CheckStatus.idle);

    repo.businessCheck!.complete(true);
    await pending;
    expect(read().businessNumberCheck, CheckStatus.idle);
  });

  test('형식이 맞지 않으면 확인을 요청하지 않는다', () async {
    notifier().setBusinessNumber('12345');
    await notifier().verifyBusinessNumber();
    expect(read().businessNumberCheck, CheckStatus.idle);
  });

  group('휴대폰 인증', () {
    setUp(() => notifier().setContactPhone('01012345678'));

    test('보내면 유효 시간을 재고, 6자리를 넣으면 바로 확인한다', () async {
      await notifier().requestPhoneCode();
      expect(read().phoneCodeRequest, CheckStatus.passed);
      expect(read().phoneCodeExpiresAt, now.add(const Duration(minutes: 3)));

      notifier().setPhoneCode('000000');
      await pumpEventQueue();
      expect(read().phoneCheck, CheckStatus.rejected);

      notifier().setPhoneCode('123456');
      await pumpEventQueue();
      expect(read().phoneCheck, CheckStatus.passed);
    });

    test('유효 시간이 지나면 확인하지 않고 만료로 알린다', () async {
      await notifier().requestPhoneCode();
      now = now.add(const Duration(minutes: 3));
      notifier().setPhoneCode('123456');
      await pumpEventQueue();
      expect(read().phoneCheck, CheckStatus.expired);
    });

    test('번호를 고치면 보낸 인증번호와 결과를 버린다', () async {
      await notifier().requestPhoneCode();
      notifier().setPhoneCode('123456');
      await pumpEventQueue();
      notifier().setContactPhone('01098765432');
      final s = read();
      expect(s.phoneCheck, CheckStatus.idle);
      expect(s.phoneCodeExpiresAt, isNull);
      expect(s.phoneCode, isEmpty);
    });
  });

  test('채널명이 이미 쓰이면 거절된다', () async {
    notifier().setChannelName('Livion');
    await notifier().checkChannelName();
    expect(read().channelNameCheck, CheckStatus.rejected);
  });

  test('은행을 바꾸면 계좌 인증을 다시 해야 한다', () async {
    notifier().selectBank(_FakeRepository.shinhan);
    notifier().setAccountNumber('110123456789');
    await notifier().verifyAccount();
    expect(read().accountCheck, CheckStatus.passed);
    notifier().selectBank(_FakeRepository.woori);
    expect(read().accountCheck, CheckStatus.idle);
  });

  test('전체동의는 필수 약관을 모두 켜고 끈다', () {
    notifier().setAllAgreements(agreed: true);
    expect(read().agreedToAll, isTrue);
    notifier().setAgreement(SellerAgreement.escrowSettlement, agreed: false);
    expect(read().agreedToAll, isFalse);
    expect(read().agreements, hasLength(2));
  });

  test('모두 채우면 신청서를 보내고, 실패하면 다시 누를 수 있다', () async {
    await fillBusiness();
    await fillChannel();
    await fillSettlement();
    expect(read().issueIn(SellerApplicationStep.settlement), isNull);

    repo.failSubmit = true;
    expect(await notifier().submit(), isNull);
    expect(read().isSubmitting, isFalse);

    repo.failSubmit = false;
    final receipt = await notifier().submit();
    expect(
      receipt,
      const SellerApplicationReceipt(
        receiptNumber: 'S-260914-0042',
        channelName: '한빛마켓',
        broadcastMode: BroadcastMode.official,
      ),
    );
    expect(read().isSubmitting, isTrue, reason: '닫힐 때까지 다시 누르지 못하게 둔다');
    expect(await notifier().submit(), isNull);

    final application = repo.submitted.single;
    expect(application.businessNumber, '1234567890');
    expect(application.stockTypes, {StockType.surplus});
    expect(application.mailOrderNumber, isNull);
    expect(application.channelName, '한빛마켓');
    expect(application.bankCode, '088');
    expect(application.agreements, SellerAgreement.values.toSet());
  });

  group('필수 항목 검사를 끈 기본 설정 (데모)', () {
    late ProviderContainer demo;

    setUp(() {
      demo = ProviderContainer(
        overrides: [sellerOnboardingRepositoryProvider.overrideWithValue(repo)],
      );
      demo.listen(sellerApplicationControllerProvider, (_, _) {});
      addTearDown(demo.dispose);
    });

    test('빈 칸이 있어도 다음으로 넘어가 마지막 단계에서 멈춘다', () {
      final c = demo.read(sellerApplicationControllerProvider.notifier);
      for (final _ in SellerApplicationStep.values) {
        expect(c.next(), isNull);
      }
      expect(
        demo.read(sellerApplicationControllerProvider).step,
        SellerApplicationStep.settlement,
      );
    });

    test('빈 칸이 있으면 첫 선택지로 채운 신청서를 보내고 접수 결과를 받는다', () async {
      final c = demo.read(sellerApplicationControllerProvider.notifier);
      final receipt = await c.submit();
      expect(receipt?.receiptNumber, 'S-260914-0042');
      expect(receipt?.channelName, '한빛식품', reason: '채널명이 비면 데모 판매자 이름');

      final draft = repo.submitted.single;
      expect(draft.monthlyBroadcasts, MonthlyBroadcasts.once);
      expect(draft.category, ChannelCategory.imminent);
      expect(draft.bankCode, isEmpty);
      expect(await c.submit(), isNull, reason: '닫힐 때까지 다시 누르지 못한다');
    });
  });

  test('빠진 항목이 있으면 신청하지 않는다', () async {
    await fillBusiness();
    expect(await notifier().submit(), isNull);
    expect(repo.submitted, isEmpty);
  });
}

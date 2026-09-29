import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:livion/shared/domain/check_status.dart';

import '../../domain/entities/seller_application.dart';
import '../../domain/repositories/seller_onboarding_repository.dart';
import 'seller_onboarding_providers.dart';

export 'package:livion/shared/domain/check_status.dart';

part 'seller_application_controller.freezed.dart';
part 'seller_application_controller.g.dart';

/// 판매자 전환 폼 단계 (Figma 판매자 전환_01 ~ _04).
enum SellerApplicationStep { type, business, channel, settlement }

/// 다음 단계로 넘어가기 전에 채워야 하는 항목. 화면이 안내 문구로 바꾼다.
enum SellerApplicationIssue {
  businessNumberUnverified,
  companyNameMissing,
  representativeNameMissing,
  phoneUnverified,
  stockTypesMissing,
  monthlyBroadcastsMissing,
  channelNameUnchecked,
  channelIntroMissing,
  categoryMissing,
  bankMissing,
  accountUnverified,
  taxInvoiceEmailInvalid,
  agreementsMissing,
}

/// 판매자 전환 폼 전체 상태. 단계를 오가도 입력값을 그대로 둔다.
@freezed
abstract class SellerApplicationState with _$SellerApplicationState {
  const SellerApplicationState._();

  const factory SellerApplicationState({
    @Default(SellerApplicationStep.type) SellerApplicationStep step,

    // ── 1 유형 ──
    @Default(SellerType.business) SellerType sellerType,

    // ── 2 사업자 ──
    @Default('') String businessNumber,
    @Default(CheckStatus.idle) CheckStatus businessNumberCheck,
    @Default('') String companyName,
    @Default('') String representativeName,
    @Default('') String contactPhone,

    /// 인증번호 보내기 요청. passed면 [phoneCodeExpiresAt]까지 번호를 받는다.
    @Default(CheckStatus.idle) CheckStatus phoneCodeRequest,
    DateTime? phoneCodeExpiresAt,
    @Default('') String phoneCode,

    /// 인증번호 확인. passed면 휴대폰 인증 완료.
    @Default(CheckStatus.idle) CheckStatus phoneCheck,
    @Default('') String mailOrderNumber,
    @Default(<StockType>{}) Set<StockType> stockTypes,
    MonthlyBroadcasts? monthlyBroadcasts,

    // ── 3 채널 ──
    @Default('') String channelName,
    @Default(CheckStatus.idle) CheckStatus channelNameCheck,
    @Default('') String channelIntro,
    ChannelCategory? category,
    @Default(BroadcastMode.official) BroadcastMode broadcastMode,

    // ── 4 정산·약관 ──
    SettlementBank? bank,
    @Default('') String accountNumber,
    @Default(CheckStatus.idle) CheckStatus accountCheck,
    @Default('') String taxInvoiceEmail,
    @Default(<SellerAgreement>{}) Set<SellerAgreement> agreements,

    /// 심사 신청 요청 중. 성공하면 화면이 닫힐 때까지 true로 둔다.
    @Default(false) bool isSubmitting,
  }) = _SellerApplicationState;

  bool get isFirstStep => step == SellerApplicationStep.values.first;
  bool get isLastStep => step == SellerApplicationStep.values.last;

  bool get agreedToAll => agreements.length == SellerAgreement.values.length;

  /// [target] 단계에서 아직 채우지 않은 첫 항목. 다 채웠으면 null.
  SellerApplicationIssue? issueIn(SellerApplicationStep target) =>
      switch (target) {
        SellerApplicationStep.type => null,
        SellerApplicationStep.business => _businessIssue,
        SellerApplicationStep.channel => _channelIssue,
        SellerApplicationStep.settlement => _settlementIssue,
      };

  SellerApplicationIssue? get _businessIssue {
    if (!businessNumberCheck.isPassed) {
      return SellerApplicationIssue.businessNumberUnverified;
    }
    if (companyName.trim().isEmpty) {
      return SellerApplicationIssue.companyNameMissing;
    }
    if (representativeName.trim().isEmpty) {
      return SellerApplicationIssue.representativeNameMissing;
    }
    if (!phoneCheck.isPassed) return SellerApplicationIssue.phoneUnverified;
    if (stockTypes.isEmpty) return SellerApplicationIssue.stockTypesMissing;
    if (monthlyBroadcasts == null) {
      return SellerApplicationIssue.monthlyBroadcastsMissing;
    }
    return null;
  }

  SellerApplicationIssue? get _channelIssue {
    if (!channelNameCheck.isPassed) {
      return SellerApplicationIssue.channelNameUnchecked;
    }
    if (channelIntro.trim().isEmpty) {
      return SellerApplicationIssue.channelIntroMissing;
    }
    if (category == null) return SellerApplicationIssue.categoryMissing;
    return null;
  }

  SellerApplicationIssue? get _settlementIssue {
    if (bank == null) return SellerApplicationIssue.bankMissing;
    if (!accountCheck.isPassed) return SellerApplicationIssue.accountUnverified;
    if (!SellerApplicationRules.isEmail(taxInvoiceEmail)) {
      return SellerApplicationIssue.taxInvoiceEmailInvalid;
    }
    if (!agreedToAll) return SellerApplicationIssue.agreementsMissing;
    return null;
  }

  /// 모든 단계를 채웠으면 신청서, 아니면 null.
  SellerApplication? toApplication() {
    for (final s in SellerApplicationStep.values) {
      if (issueIn(s) != null) return null;
    }
    return _application();
  }

  /// 빈 칸이 있어도 만드는 신청서. 고르지 않은 항목은 첫 선택지로 채운다.
  ///
  /// 필수 항목 검사를 끈 데모에서만 쓴다 ([SellerApplicationController.submit]).
  SellerApplication toDraftApplication() => _application(
    monthly: monthlyBroadcasts ?? MonthlyBroadcasts.values.first,
    channelCategory: category ?? ChannelCategory.values.first,
  );

  SellerApplication _application({
    MonthlyBroadcasts? monthly,
    ChannelCategory? channelCategory,
  }) {
    final mailOrder = mailOrderNumber.trim();
    return SellerApplication(
      sellerType: sellerType,
      businessNumber: businessNumber,
      companyName: companyName.trim(),
      representativeName: representativeName.trim(),
      contactPhone: contactPhone,
      mailOrderNumber: mailOrder.isEmpty ? null : mailOrder,
      stockTypes: stockTypes,
      monthlyBroadcasts: monthly ?? monthlyBroadcasts!,
      channelName: channelName.trim(),
      channelIntro: channelIntro.trim(),
      category: channelCategory ?? category!,
      broadcastMode: broadcastMode,
      bankCode: bank?.code ?? '',
      accountNumber: accountNumber,
      taxInvoiceEmail: taxInvoiceEmail.trim(),
      agreements: agreements,
    );
  }
}

/// 판매자 전환 4단계 폼. 화면이 닫히면 입력값도 버린다.
///
/// 확인 요청(사업자·휴대폰·채널명·계좌)은 요청한 값을 기억해 두고, 응답이 오기 전에
/// 사용자가 값을 고쳤으면 그 응답을 버린다. 값을 고치면 확인 결과도 처음으로 돌아간다.
@riverpod
class SellerApplicationController extends _$SellerApplicationController {
  late SellerOnboardingRepository _repository;
  late DateTime Function() _now;
  late bool _requiresInput;

  @override
  SellerApplicationState build() {
    _repository = ref.watch(sellerOnboardingRepositoryProvider);
    _now = ref.watch(sellerOnboardingClockProvider);
    _requiresInput = ref.watch(sellerApplicationRequiresInputProvider);
    return const SellerApplicationState();
  }

  // ── 단계 이동 ─────────────────────────────────────────────────

  /// 다음 단계로 넘어간다. 마지막 단계에서는 넘어가지 않는다.
  ///
  /// 필수 항목 검사([sellerApplicationRequiresInputProvider])가 켜져 있으면
  /// 빠진 항목이 있을 때 넘어가지 않고 그 항목을 돌려준다.
  SellerApplicationIssue? next() {
    final issue = _requiresInput ? state.issueIn(state.step) : null;
    if (issue != null || state.isLastStep || state.isSubmitting) return issue;
    state = state.copyWith(
      step: SellerApplicationStep.values[state.step.index + 1],
    );
    return null;
  }

  /// 이전 단계로 돌아간다. 첫 단계이거나 신청 중이면 false (화면이 닫을지 정한다).
  bool back() {
    if (state.isFirstStep || state.isSubmitting) return false;
    state = state.copyWith(
      step: SellerApplicationStep.values[state.step.index - 1],
    );
    return true;
  }

  // ── 1 유형 ───────────────────────────────────────────────────

  /// 개인 판매자는 준비 중이라 사업자만 고를 수 있다.
  void selectSellerType(SellerType type) {
    if (type != SellerType.business) return;
    state = state.copyWith(sellerType: type);
  }

  // ── 2 사업자 ─────────────────────────────────────────────────

  void setBusinessNumber(String value) {
    if (value == state.businessNumber) return;
    state = state.copyWith(
      businessNumber: value,
      businessNumberCheck: CheckStatus.idle,
    );
  }

  Future<void> verifyBusinessNumber() async {
    final number = state.businessNumber;
    if (!SellerApplicationRules.isBusinessNumber(number) ||
        state.businessNumberCheck.isChecking) {
      return;
    }
    state = state.copyWith(businessNumberCheck: CheckStatus.checking);
    final result = await _check(() => _repository.verifyBusinessNumber(number));
    if (!ref.mounted || state.businessNumber != number) return;
    state = state.copyWith(businessNumberCheck: result);
  }

  void setCompanyName(String value) =>
      state = state.copyWith(companyName: value);

  void setRepresentativeName(String value) =>
      state = state.copyWith(representativeName: value);

  /// 번호를 고치면 보낸 인증번호와 인증 결과를 모두 버린다.
  void setContactPhone(String value) {
    if (value == state.contactPhone) return;
    state = state.copyWith(
      contactPhone: value,
      phoneCodeRequest: CheckStatus.idle,
      phoneCodeExpiresAt: null,
      phoneCode: '',
      phoneCheck: CheckStatus.idle,
    );
  }

  /// 인증번호를 (다시) 보낸다. 성공하면 입력한 번호를 비우고 시간을 새로 잰다.
  Future<void> requestPhoneCode() async {
    final phone = state.contactPhone;
    if (!SellerApplicationRules.isMobilePhone(phone) ||
        state.phoneCodeRequest.isChecking ||
        state.phoneCheck.isPassed) {
      return;
    }
    state = state.copyWith(phoneCodeRequest: CheckStatus.checking);
    try {
      final validity = await _repository.requestPhoneCode(phone);
      if (!ref.mounted || state.contactPhone != phone) return;
      state = state.copyWith(
        phoneCodeRequest: CheckStatus.passed,
        phoneCodeExpiresAt: _now().add(validity),
        phoneCode: '',
        phoneCheck: CheckStatus.idle,
      );
    } catch (_) {
      if (!ref.mounted || state.contactPhone != phone) return;
      state = state.copyWith(phoneCodeRequest: CheckStatus.failed);
    }
  }

  /// 6자리를 다 넣으면 바로 확인한다.
  void setPhoneCode(String code) {
    if (code == state.phoneCode) return;
    state = state.copyWith(phoneCode: code, phoneCheck: CheckStatus.idle);
    if (SellerApplicationRules.isVerificationCode(code)) confirmPhoneCode();
  }

  Future<void> confirmPhoneCode() async {
    final expiresAt = state.phoneCodeExpiresAt;
    final phone = state.contactPhone;
    final code = state.phoneCode;
    if (expiresAt == null ||
        !SellerApplicationRules.isVerificationCode(code) ||
        state.phoneCheck.isChecking ||
        state.phoneCheck.isPassed) {
      return;
    }
    if (!_now().isBefore(expiresAt)) {
      state = state.copyWith(phoneCheck: CheckStatus.expired);
      return;
    }
    state = state.copyWith(phoneCheck: CheckStatus.checking);
    final result = await _check(
      () => _repository.confirmPhoneCode(phone: phone, code: code),
    );
    if (!ref.mounted ||
        state.contactPhone != phone ||
        state.phoneCode != code) {
      return;
    }
    state = state.copyWith(phoneCheck: result);
  }

  void setMailOrderNumber(String value) =>
      state = state.copyWith(mailOrderNumber: value);

  void toggleStockType(StockType type) {
    final next = {...state.stockTypes};
    if (!next.remove(type)) next.add(type);
    state = state.copyWith(stockTypes: next);
  }

  void selectMonthlyBroadcasts(MonthlyBroadcasts value) =>
      state = state.copyWith(monthlyBroadcasts: value);

  // ── 3 채널 ───────────────────────────────────────────────────

  void setChannelName(String value) {
    if (value == state.channelName) return;
    state = state.copyWith(
      channelName: value,
      channelNameCheck: CheckStatus.idle,
    );
  }

  Future<void> checkChannelName() async {
    final name = state.channelName;
    if (!SellerApplicationRules.isChannelName(name) ||
        state.channelNameCheck.isChecking) {
      return;
    }
    state = state.copyWith(channelNameCheck: CheckStatus.checking);
    final result = await _check(
      () => _repository.isChannelNameAvailable(name.trim()),
    );
    if (!ref.mounted || state.channelName != name) return;
    state = state.copyWith(channelNameCheck: result);
  }

  void setChannelIntro(String value) =>
      state = state.copyWith(channelIntro: value);

  void selectCategory(ChannelCategory value) =>
      state = state.copyWith(category: value);

  void selectBroadcastMode(BroadcastMode value) =>
      state = state.copyWith(broadcastMode: value);

  // ── 4 정산·약관 ──────────────────────────────────────────────

  /// 은행을 바꾸면 계좌 인증을 다시 해야 한다.
  void selectBank(SettlementBank bank) {
    if (bank == state.bank) return;
    state = state.copyWith(bank: bank, accountCheck: CheckStatus.idle);
  }

  void setAccountNumber(String value) {
    if (value == state.accountNumber) return;
    state = state.copyWith(
      accountNumber: value,
      accountCheck: CheckStatus.idle,
    );
  }

  Future<void> verifyAccount() async {
    final bank = state.bank;
    final account = state.accountNumber;
    if (bank == null ||
        !SellerApplicationRules.isAccountNumber(account) ||
        state.accountCheck.isChecking) {
      return;
    }
    state = state.copyWith(accountCheck: CheckStatus.checking);
    final result = await _check(
      () => _repository.verifyBankAccount(
        bankCode: bank.code,
        accountNumber: account,
      ),
    );
    if (!ref.mounted || state.bank != bank || state.accountNumber != account) {
      return;
    }
    state = state.copyWith(accountCheck: result);
  }

  void setTaxInvoiceEmail(String value) =>
      state = state.copyWith(taxInvoiceEmail: value);

  void setAgreement(SellerAgreement agreement, {required bool agreed}) {
    final next = {...state.agreements};
    agreed ? next.add(agreement) : next.remove(agreement);
    state = state.copyWith(agreements: next);
  }

  void setAllAgreements({required bool agreed}) => state = state.copyWith(
    agreements: agreed ? SellerAgreement.values.toSet() : const {},
  );

  // ── 신청 ─────────────────────────────────────────────────────

  /// 심사를 신청하고 접수 결과를 돌려준다. 실패하거나 신청 중이면 null.
  ///
  /// 검사가 켜져 있으면 빠진 항목이 있을 때 요청하지 않는다. 검사를 끈 데모에서는
  /// 빈 칸을 채운 [SellerApplicationState.toDraftApplication]을 보낸다.
  Future<SellerApplicationReceipt?> submit() async {
    if (state.isSubmitting) return null;
    final application =
        state.toApplication() ??
        (_requiresInput ? null : state.toDraftApplication());
    if (application == null) return null;
    state = state.copyWith(isSubmitting: true);
    try {
      final receipt = await _repository.submitApplication(application);
      return ref.mounted ? receipt : null;
    } catch (_) {
      if (ref.mounted) state = state.copyWith(isSubmitting: false);
      return null;
    }
  }

  Future<CheckStatus> _check(Future<bool> Function() request) async {
    try {
      return await request() ? CheckStatus.passed : CheckStatus.rejected;
    } catch (_) {
      return CheckStatus.failed;
    }
  }
}

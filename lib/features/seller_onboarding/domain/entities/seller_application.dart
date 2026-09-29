import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:livion/shared/domain/contact_rules.dart';

part 'seller_application.freezed.dart';

/// 판매자 유형. 지금은 사업자만 받는다 (개인 판매자는 2년차 오픈 예정).
enum SellerType { business, individual }

/// 취급 재고 유형 (여러 개 선택).
enum StockType { imminent, surplus, refurbished, carryover }

/// 월 예상 방송 횟수.
enum MonthlyBroadcasts { once, twoToThree, fourOrMore }

/// 채널 대표 카테고리.
enum ChannelCategory { imminent, living, refurbished, carryover }

/// 방송 방식.
enum BroadcastMode {
  /// Livion 공식 방송 위탁 — 검수·진행·CS 대행 (권장).
  official,

  /// 자체 채널 방송 — 방송 툴 제공, 사전 신청.
  own,
}

/// 판매자 전환 필수 동의 항목.
enum SellerAgreement { sellerTerms, escrowSettlement, feeNotice }

/// 정산 계좌 은행. [code]는 금융결제원 은행 코드 ("004" KB국민은행).
@freezed
abstract class SettlementBank with _$SettlementBank {
  const factory SettlementBank({required String code, required String name}) =
      _SettlementBank;
}

/// 심사 접수 결과. 완료 화면에 보인다.
@freezed
abstract class SellerApplicationReceipt with _$SellerApplicationReceipt {
  const factory SellerApplicationReceipt({
    /// 접수번호 ("S-260914-0042").
    required String receiptNumber,
    required String channelName,
    required BroadcastMode broadcastMode,
  }) = _SellerApplicationReceipt;
}

/// 판매자 전환 4단계 폼을 모두 채워 심사에 넘기는 신청서.
///
/// 번호·계좌는 숫자만 담는다. 인증(사업자·휴대폰·계좌·채널명)은 폼에서 마친 뒤에만
/// 만들어진다.
@freezed
abstract class SellerApplication with _$SellerApplication {
  const factory SellerApplication({
    required SellerType sellerType,
    required String businessNumber,
    required String companyName,
    required String representativeName,
    required String contactPhone,
    String? mailOrderNumber,
    required Set<StockType> stockTypes,
    required MonthlyBroadcasts monthlyBroadcasts,
    required String channelName,
    required String channelIntro,
    required ChannelCategory category,
    required BroadcastMode broadcastMode,
    required String bankCode,
    required String accountNumber,
    required String taxInvoiceEmail,
    required Set<SellerAgreement> agreements,
  }) = _SellerApplication;
}

/// 판매자 전환 입력값 형식 규칙. 서버 검증을 대신하지 않고 요청 전 걸러내기만 한다.
abstract final class SellerApplicationRules {
  static final RegExp _businessNumber = RegExp(r'^\d{10}$');
  static final RegExp _accountNumber = RegExp(r'^\d{10,14}$');

  static const int businessNumberLength = 10;
  static const int mobilePhoneMaxLength = ContactRules.mobilePhoneMaxLength;
  static const int verificationCodeLength = ContactRules.verificationCodeLength;
  static const int accountNumberMaxLength = 14;
  static const int channelNameMinLength = 2;
  static const int channelNameMaxLength = 20;
  static const int channelIntroMaxLength = 200;

  static bool isBusinessNumber(String value) => _businessNumber.hasMatch(value);

  static bool isMobilePhone(String value) => ContactRules.isMobilePhone(value);

  static bool isVerificationCode(String value) =>
      ContactRules.isVerificationCode(value);

  static bool isAccountNumber(String value) => _accountNumber.hasMatch(value);

  static bool isEmail(String value) => ContactRules.isEmail(value);

  static bool isChannelName(String value) {
    final length = value.trim().length;
    return length >= channelNameMinLength && length <= channelNameMaxLength;
  }
}

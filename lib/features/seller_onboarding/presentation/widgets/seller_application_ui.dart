import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_application.dart';
import '../providers/seller_application_controller.dart';

/// 판매자 전환 폼 화면 문구. 도메인 값은 문구를 모르고 여기서만 바꾼다.

extension SellerApplicationStepLabel on SellerApplicationStep {
  String get label => switch (this) {
    SellerApplicationStep.type => '유형',
    SellerApplicationStep.business => '사업자',
    SellerApplicationStep.channel => '채널',
    SellerApplicationStep.settlement => '정산·약관',
  };
}

extension StockTypeLabel on StockType {
  String get label => switch (this) {
    StockType.imminent => '임박',
    StockType.surplus => '과잉',
    StockType.refurbished => '리퍼브',
    StockType.carryover => '이월',
  };
}

extension MonthlyBroadcastsLabel on MonthlyBroadcasts {
  String get label => switch (this) {
    MonthlyBroadcasts.once => '1회',
    MonthlyBroadcasts.twoToThree => '2~3회',
    MonthlyBroadcasts.fourOrMore => '4회 이상',
  };
}

extension ChannelCategoryLabel on ChannelCategory {
  String get label => switch (this) {
    ChannelCategory.imminent => '임박',
    ChannelCategory.living => '생활용품',
    ChannelCategory.refurbished => '리퍼브',
    ChannelCategory.carryover => '이월',
  };
}

extension BroadcastModeLabel on BroadcastMode {
  /// 접수 완료 화면에 보이는 짧은 이름.
  String get shortLabel => switch (this) {
    BroadcastMode.official => '공식 위탁',
    BroadcastMode.own => '자체 방송',
  };
}

/// 금융결제원 은행 코드 → 로고 타일. 목록에 없는 은행은 이름 첫 글자 타일로 보인다.
extension SettlementBankLogo on SettlementBank {
  String? get logo => _bankLogos[code];
}

const _bankLogos = {
  '090': AppBankLogos.kakao,
  '092': AppBankLogos.toss,
  '089': AppBankLogos.kbank,
  '004': AppBankLogos.kb,
  '088': AppBankLogos.shinhan,
  '020': AppBankLogos.woori,
  '023': AppBankLogos.sc,
  '081': AppBankLogos.hana,
  '027': AppBankLogos.citi,
  '003': AppBankLogos.ibk,
  '011': AppBankLogos.nh,
  '071': AppBankLogos.post,
  '045': AppBankLogos.mg,
  '032': AppBankLogos.busan,
  '007': AppBankLogos.suhyup,
  '002': AppBankLogos.kdb,
  '048': AppBankLogos.shinhyup,
  '034': AppBankLogos.gwangju,
  '050': AppBankLogos.sbi,
  '031': AppBankLogos.im,
};

extension SellerAgreementLabel on SellerAgreement {
  String get label => switch (this) {
    SellerAgreement.sellerTerms => '판매자 이용약관',
    SellerAgreement.escrowSettlement => '에스크로 정산 동의',
    SellerAgreement.feeNotice => '수수료 12% 및 프라임 편성료 안내',
  };
}

extension SellerApplicationIssueMessage on SellerApplicationIssue {
  String get message => switch (this) {
    SellerApplicationIssue.businessNumberUnverified => '사업자등록번호를 확인해 주세요.',
    SellerApplicationIssue.companyNameMissing => '상호를 입력해 주세요.',
    SellerApplicationIssue.representativeNameMissing => '대표자명을 입력해 주세요.',
    SellerApplicationIssue.phoneUnverified => '담당자 휴대폰 인증을 완료해 주세요.',
    SellerApplicationIssue.stockTypesMissing => '취급 재고 유형을 하나 이상 골라 주세요.',
    SellerApplicationIssue.monthlyBroadcastsMissing => '월 예상 방송 횟수를 골라 주세요.',
    SellerApplicationIssue.channelNameUnchecked => '채널명 중복확인을 해 주세요.',
    SellerApplicationIssue.channelIntroMissing => '채널 소개를 입력해 주세요.',
    SellerApplicationIssue.categoryMissing => '대표 카테고리를 골라 주세요.',
    SellerApplicationIssue.bankMissing => '정산 은행을 골라 주세요.',
    SellerApplicationIssue.accountUnverified => '정산 계좌 1원 인증을 완료해 주세요.',
    SellerApplicationIssue.taxInvoiceEmailInvalid => '세금계산서 받을 이메일을 확인해 주세요.',
    SellerApplicationIssue.agreementsMissing => '필수 약관에 모두 동의해 주세요.',
  };
}

/// 확인 요청이 실패했을 때 입력 아래 문구. 문제가 없으면 null.
String? checkFailureMessage(CheckStatus status, {required String rejected}) =>
    switch (status) {
      CheckStatus.rejected => rejected,
      CheckStatus.expired => '인증 시간이 지났어요. 인증번호를 다시 받아 주세요.',
      CheckStatus.failed => '확인하지 못했어요. 잠시 후 다시 시도해 주세요.',
      CheckStatus.idle || CheckStatus.checking || CheckStatus.passed => null,
    };

/// 확인 요청이 있는 입력창의 오른쪽 끝: 확인 중 → 진행 표시, 통과 → "✓ [passedLabel]",
/// 그 밖에는 [actionLabel] 버튼. [onAction]이 null이면 버튼이 흐려진다.
Widget checkTrailing({
  required CheckStatus status,
  required String actionLabel,
  required String passedLabel,
  required VoidCallback? onAction,
}) => switch (status) {
  CheckStatus.checking => const AppInputTrailing.progress(),
  CheckStatus.passed => AppInputTrailing.status(passedLabel),
  _ => AppInputTrailing.action(actionLabel, onPressed: onAction),
};

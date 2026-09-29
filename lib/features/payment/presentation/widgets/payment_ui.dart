import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/core/formatting/time_format.dart';

import '../../domain/entities/order_payment.dart';

/// domain 값을 화면 문자열로 바꾼다. 문구를 한 곳에 모아 API 연동 후에도 유지한다.
extension OrderPaymentUi on OrderPayment {
  /// "21:14:07"
  String get paidAtLabel => formatClockSeconds(paidAt);
  String get winningPriceLabel => formatThousands(winningPriceWon);
  String get shippingFeeLabel => formatThousands(shippingFeeWon);
  String get buyerFeeLabel => formatThousands(buyerFeeWon);
  String get totalLabel => formatThousands(totalWon);

  /// "2.8". 시작가가 없으면 null.
  String? get multiplierLabel =>
      multiplier == null ? null : formatMultiplier(_oneDecimal(multiplier!));

  /// "배송비 (냉동)"
  String get shippingFeeTitle =>
      shippingMethod == null ? '배송비' : '배송비 ($shippingMethod)';

  /// "다음 품목 4/5". 이어질 품목이 없으면 null.
  String? get nextItemLabel => nextItem == null
      ? null
      : '다음 품목 ${nextItem!.position}/${nextItem!.total}';

  bool get isEscrowed => stage.index >= EscrowStage.escrowed.index;
}

extension OrderItemSummaryUi on OrderItemSummary {
  String? get dDayLabel => dDay == null ? null : 'D-$dDay';
  String get startPriceLabel => '시작가 ${formatThousands(startPriceWon)}원';
}

extension PaymentCardUi on PaymentCard {
  /// "국민카드 ****1234"
  String get displayName => '$issuer $maskedNumber';

  /// "기본 결제수단 · 입찰 전 등록됨"
  String get registrationLabel => isDefault ? '기본 결제수단 · 입찰 전 등록됨' : '입찰 전 등록됨';
}

/// 결제 화면 배수는 Figma처럼 소수 첫째 자리까지 ("2.8배"). 8,400 / 3,000 = 2.8.
double _oneDecimal(double value) => (value * 10).round() / 10;

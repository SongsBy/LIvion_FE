import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:livion/shared/domain/inspection_grade.dart';

part 'order_payment.freezed.dart';

/// 에스크로 거래 단계. 순서대로 진행한다.
enum EscrowStage {
  /// 등록 카드로 결제됐다.
  paid,

  /// 결제 금액이 Livion 에스크로에 보관됐다.
  escrowed,

  /// 판매자가 보냈다.
  shipping,

  /// 구매자가 받았고(또는 배송 완료 후 3일) 판매자에게 지급됐다.
  settled,
}

/// 결제한 상품의 요약.
@freezed
abstract class OrderItemSummary with _$OrderItemSummary {
  const factory OrderItemSummary({
    required String name,
    required InspectionGrade grade,

    /// 마감까지 남은 일수. null이면 D-day 뱃지를 숨긴다.
    int? dDay,

    /// 시작가 (원, 정수).
    required int startPriceWon,

    /// 에셋 경로 또는 URL.
    String? thumbnail,
  }) = _OrderItemSummary;
}

/// 결제에 쓴 등록 카드. 번호는 서버가 마스킹해 내려준다.
@freezed
abstract class PaymentCard with _$PaymentCard {
  const factory PaymentCard({
    /// "국민카드"
    required String issuer,

    /// "****1234"
    required String maskedNumber,
    @Default(false) bool isDefault,

    /// 낙찰 즉시 자동결제되는 카드.
    @Default(false) bool isAutoPay,
  }) = _PaymentCard;
}

/// 배송지. 개인정보라 로그에 남지 않도록 [toString]은 값을 숨긴다.
@freezed
abstract class ShippingAddress with _$ShippingAddress {
  const ShippingAddress._();

  const factory ShippingAddress({
    /// "우리집"
    required String label,
    required String recipient,
    required String phone,
    required String address,
  }) = _ShippingAddress;

  @override
  String toString() => 'ShippingAddress(label: $label)';
}

/// 라이브 방송에서 다음으로 경매에 오르는 품목의 순번. "다음 품목 4/5".
@freezed
abstract class LineupProgress with _$LineupProgress {
  const factory LineupProgress({required int position, required int total}) =
      _LineupProgress;
}

/// 낙찰 직후 결제 결과 (Figma 결제 37:5982). 금액은 모두 원 단위 정수다.
@freezed
abstract class OrderPayment with _$OrderPayment {
  const OrderPayment._();

  const factory OrderPayment({
    required String orderId,

    /// 결제 시각 (기기 로컬).
    required DateTime paidAt,
    required OrderItemSummary item,
    required int winningPriceWon,
    required int shippingFeeWon,

    /// 배송 방식 ("냉동"). null이면 "배송비"만 보인다.
    String? shippingMethod,
    required int buyerFeeWon,
    required PaymentCard card,
    required ShippingAddress address,

    /// 배송 메모. 고르지 않았으면 null.
    String? deliveryMemo,
    required EscrowStage stage,

    /// 라이브로 돌아가면 이어질 품목. 방송이 끝났으면 null.
    LineupProgress? nextItem,
  }) = _OrderPayment;

  /// 결제 금액 = 낙찰가 + 배송비 + 구매자 수수료.
  int get totalWon => winningPriceWon + shippingFeeWon + buyerFeeWon;

  /// 시작가 대비 낙찰가 배수. 시작가가 0 이하면 null.
  double? get multiplier =>
      item.startPriceWon <= 0 ? null : winningPriceWon / item.startPriceWon;
}

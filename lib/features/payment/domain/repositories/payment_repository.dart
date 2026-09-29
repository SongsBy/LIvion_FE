import '../entities/order_payment.dart';

/// 결제 결과 데이터 계약.
///
/// 지금은 데모 구현만 있고, API가 확정되면 data/에 remote 구현을 추가해
/// `payment_dependencies.dart`에서만 교체한다. 화면은 이 interface만 안다.
abstract interface class PaymentRepository {
  /// 낙찰로 만들어진 주문 [orderId]의 결제 결과.
  Future<OrderPayment> fetchOrderPayment(String orderId);

  /// 배송 메모 변경. 서버 계약 확정 전까지 데모 구현은 바로 성공한다.
  Future<void> updateDeliveryMemo({
    required String orderId,
    required String memo,
  });
}

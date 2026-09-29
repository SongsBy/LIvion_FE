import '../../domain/entities/order_payment.dart';
import '../../domain/repositories/payment_repository.dart';
import '../demo/payment_demo_data.dart';

/// 데모 발표용 [PaymentRepository]. 네트워크 없이 Figma 데이터를 돌려준다.
///
/// API 연동 시 remote 구현으로 교체하며, DTO → entity 변환과 Failure 매핑은
/// 그 구현이 담당한다.
final class DemoPaymentRepository implements PaymentRepository {
  const DemoPaymentRepository({
    this.latency = const Duration(milliseconds: 400),
  });

  final Duration latency;

  @override
  Future<OrderPayment> fetchOrderPayment(String orderId) async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    return PaymentDemoData.build(orderId: orderId);
  }

  @override
  Future<void> updateDeliveryMemo({
    required String orderId,
    required String memo,
  }) async {}
}

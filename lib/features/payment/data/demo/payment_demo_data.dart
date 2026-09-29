import 'package:livion/shared/domain/inspection_grade.dart';

import '../../domain/entities/order_payment.dart';

/// Figma 결제(node 37:5982)의 내용을 그대로 옮긴 데모 데이터. API가 붙으면 제거한다.
///
/// 배송지·연락처는 Figma의 자리표시자 값이다. 실제 개인정보를 넣지 않는다.
abstract final class PaymentDemoData {
  static const String _productDumpling =
      'asset/images/demo/product_dumpling.jpg';

  static OrderPayment build({required String orderId}) {
    return OrderPayment(
      orderId: orderId,
      paidAt: DateTime(2026, 9, 28, 21, 14, 7),
      item: const OrderItemSummary(
        name: '냉동만두 1.2kg',
        grade: InspectionGrade.a,
        dDay: 12,
        startPriceWon: 3000,
        thumbnail: _productDumpling,
      ),
      winningPriceWon: 8400,
      shippingFeeWon: 3000,
      shippingMethod: '냉동',
      buyerFeeWon: 0,
      card: const PaymentCard(
        issuer: '국민카드',
        maskedNumber: '****1234',
        isDefault: true,
        isAutoPay: true,
      ),
      address: const ShippingAddress(
        label: '우리집',
        recipient: '홍길동',
        phone: '010-0000-0000',
        address: '서울특별시 00구 00로 00-0',
      ),
      stage: EscrowStage.escrowed,
      nextItem: const LineupProgress(position: 4, total: 5),
    );
  }
}

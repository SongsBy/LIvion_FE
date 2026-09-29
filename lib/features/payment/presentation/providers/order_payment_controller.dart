import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/order_payment.dart';
import 'payment_dependencies.dart';

part 'order_payment_controller.g.dart';

/// 실패 시 Riverpod 자동 재시도를 끈다. 재시도는 화면의 "다시 시도"로만 한다.
Duration? _noRetry(int retryCount, Object error) => null;

/// 주문 [orderId]의 결제 결과 조회 상태. 화면을 벗어나면 버린다(autoDispose).
@Riverpod(retry: _noRetry)
class OrderPaymentController extends _$OrderPaymentController {
  @override
  Future<OrderPayment> build(String orderId) =>
      ref.watch(paymentRepositoryProvider).fetchOrderPayment(orderId);

  /// 배송 메모 변경. 화면에 먼저 반영하고 실패하면 되돌린 뒤 false를 돌려준다.
  Future<bool> updateDeliveryMemo(String memo) async {
    final current = state;
    if (current.isLoading || !current.hasValue) return false;
    final previous = current.requireValue;
    if (previous.deliveryMemo == memo) return true;
    state = AsyncData(previous.copyWith(deliveryMemo: memo));
    try {
      await ref
          .read(paymentRepositoryProvider)
          .updateDeliveryMemo(orderId: orderId, memo: memo);
      return true;
    } catch (_) {
      if (ref.mounted) state = AsyncData(previous);
      return false;
    }
  }
}

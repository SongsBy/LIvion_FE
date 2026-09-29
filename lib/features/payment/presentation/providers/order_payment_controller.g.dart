// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_payment_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 주문 [orderId]의 결제 결과 조회 상태. 화면을 벗어나면 버린다(autoDispose).

@ProviderFor(OrderPaymentController)
const orderPaymentControllerProvider = OrderPaymentControllerFamily._();

/// 주문 [orderId]의 결제 결과 조회 상태. 화면을 벗어나면 버린다(autoDispose).
final class OrderPaymentControllerProvider
    extends $AsyncNotifierProvider<OrderPaymentController, OrderPayment> {
  /// 주문 [orderId]의 결제 결과 조회 상태. 화면을 벗어나면 버린다(autoDispose).
  const OrderPaymentControllerProvider._({
    required OrderPaymentControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: _noRetry,
         name: r'orderPaymentControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderPaymentControllerHash();

  @override
  String toString() {
    return r'orderPaymentControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OrderPaymentController create() => OrderPaymentController();

  @override
  bool operator ==(Object other) {
    return other is OrderPaymentControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderPaymentControllerHash() =>
    r'eb22aadff87dc9e5db73738df694adc86eeca038';

/// 주문 [orderId]의 결제 결과 조회 상태. 화면을 벗어나면 버린다(autoDispose).

final class OrderPaymentControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          OrderPaymentController,
          AsyncValue<OrderPayment>,
          OrderPayment,
          FutureOr<OrderPayment>,
          String
        > {
  const OrderPaymentControllerFamily._()
    : super(
        retry: _noRetry,
        name: r'orderPaymentControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 주문 [orderId]의 결제 결과 조회 상태. 화면을 벗어나면 버린다(autoDispose).

  OrderPaymentControllerProvider call(String orderId) =>
      OrderPaymentControllerProvider._(argument: orderId, from: this);

  @override
  String toString() => r'orderPaymentControllerProvider';
}

/// 주문 [orderId]의 결제 결과 조회 상태. 화면을 벗어나면 버린다(autoDispose).

abstract class _$OrderPaymentController extends $AsyncNotifier<OrderPayment> {
  late final _$args = ref.$arg as String;
  String get orderId => _$args;

  FutureOr<OrderPayment> build(String orderId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<OrderPayment>, OrderPayment>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<OrderPayment>, OrderPayment>,
              AsyncValue<OrderPayment>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

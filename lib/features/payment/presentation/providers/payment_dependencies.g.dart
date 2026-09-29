// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 결제 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoPaymentRepository`를 remote 구현으로 바꾼다.

@ProviderFor(paymentRepository)
const paymentRepositoryProvider = PaymentRepositoryProvider._();

/// 결제 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoPaymentRepository`를 remote 구현으로 바꾼다.

final class PaymentRepositoryProvider
    extends
        $FunctionalProvider<
          PaymentRepository,
          PaymentRepository,
          PaymentRepository
        >
    with $Provider<PaymentRepository> {
  /// 결제 feature 의존성 조립. 이 파일만 data 구현을 import한다.
  ///
  /// API가 준비되면 여기서 `DemoPaymentRepository`를 remote 구현으로 바꾼다.
  const PaymentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentRepositoryHash();

  @$internal
  @override
  $ProviderElement<PaymentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PaymentRepository create(Ref ref) {
    return paymentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentRepository>(value),
    );
  }
}

String _$paymentRepositoryHash() => r'29b61c310ea5ce850b4ec9baf89d78cbfd17ad08';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/demo_payment_repository.dart';
import '../../domain/repositories/payment_repository.dart';

part 'payment_dependencies.g.dart';

/// 결제 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoPaymentRepository`를 remote 구현으로 바꾼다.
@riverpod
PaymentRepository paymentRepository(Ref ref) => const DemoPaymentRepository();

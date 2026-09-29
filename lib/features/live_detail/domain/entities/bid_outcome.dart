import 'package:freezed_annotation/freezed_annotation.dart';

part 'bid_outcome.freezed.dart';

/// 입찰 요청 결과.
@freezed
sealed class BidOutcome with _$BidOutcome {
  /// 최고가로 입찰됐지만 아직 낙찰 전이다.
  const factory BidOutcome.leading() = BidLeading;

  /// 낙찰되어 등록 카드로 바로 결제됐다. [orderId]로 결제 결과를 조회한다.
  const factory BidOutcome.won({required String orderId}) = BidWon;
}

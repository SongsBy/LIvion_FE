import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_program_stats.freezed.dart';

/// 판매자 전환 안내에 보이는 참여 기업 실적.
@freezed
abstract class SellerProgramStats with _$SellerProgramStats {
  const factory SellerProgramStats({
    /// 참여 기업의 평균 낙찰가 ÷ 시작가 (예: 2.0).
    required double averageStartPriceMultiplier,

    /// 낙찰률 (0~100, 정수 %).
    required int winRatePercent,
  }) = _SellerProgramStats;
}

import '../../domain/entities/auction_detail.dart';
import '../../domain/entities/bid_outcome.dart';
import '../../domain/repositories/auction_detail_repository.dart';
import '../demo/auction_detail_demo_data.dart';

/// 데모 발표용 [AuctionDetailRepository]. 네트워크 없이 Figma 데이터를 돌려준다.
///
/// API 연동 시 remote 구현으로 교체하며, DTO → entity 변환과 Failure 매핑은
/// 그 구현이 담당한다.
final class DemoAuctionDetailRepository implements AuctionDetailRepository {
  const DemoAuctionDetailRepository({
    this.latency = const Duration(milliseconds: 400),
  });

  final Duration latency;

  @override
  Future<AuctionDetail> fetchAuctionDetail({
    required String liveId,
    required String itemId,
  }) async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    return AuctionDetailDemoData.build(liveId: liveId, itemId: itemId);
  }

  /// 데모: 누르는 즉시 낙찰·결제된 것으로 본다 (Figma 결제 37:5982 흐름).
  @override
  Future<BidOutcome> placeBid({
    required String liveId,
    required String itemId,
    required int priceWon,
  }) async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    return BidOutcome.won(orderId: 'order-$liveId-$itemId');
  }
}

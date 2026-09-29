import '../entities/auction_detail.dart';
import '../entities/bid_outcome.dart';

/// 경매 상세 화면 데이터 계약.
///
/// 지금은 데모 구현만 있고, API가 확정되면 data/에 remote 구현을 추가해
/// `live_detail_dependencies.dart`에서만 교체한다. 화면은 이 interface만 안다.
abstract interface class AuctionDetailRepository {
  /// [liveId] 방송에 올라온 [itemId] 상품의 경매 상세.
  Future<AuctionDetail> fetchAuctionDetail({
    required String liveId,
    required String itemId,
  });

  /// [priceWon]원으로 입찰한다. 결제가 따르는 mutation이라 자동 재시도하지 않는다.
  /// 서버 멱등성 키·낙찰 판정 계약이 확정되면 remote 구현이 그 계약을 따른다.
  Future<BidOutcome> placeBid({
    required String liveId,
    required String itemId,
    required int priceWon,
  });
}

import '../../domain/entities/auction_detail.dart';
import '../../domain/entities/live_detail.dart';
import 'live_detail_demo_assets.dart';
import 'live_detail_demo_data.dart';

/// Figma 경매 상세(node 37:6134)의 내용을 그대로 옮긴 데모 데이터.
///
/// 상품 카드 값은 라이브 데모의 같은 상품에서 가져오고, 경매 상세에만 있는
/// 사진·상태·소비기한·검수일·순위 5명·유사 품목 참고값을 덧붙인다.
/// 어떤 상품을 골라도 같은 입찰 현황을 돌려준다. API가 붙으면 제거한다.
abstract final class AuctionDetailDemoData {
  /// [now]는 "3초전" 같은 상대 시각의 기준이다. 테스트에서 고정한다.
  ///
  /// [itemId]가 라이브 데모에 없는 상품이면 [StateError]를 던진다.
  static AuctionDetail build({
    required String liveId,
    required String itemId,
    DateTime? now,
  }) {
    final reference = now ?? DateTime.now();
    final live = LiveDetailDemoData.build(liveId: liveId, now: reference);
    final item = live.auctionItems.firstWhere(
      (i) => i.id == itemId,
      orElse: () => throw StateError('경매 상품을 찾을 수 없습니다.'),
    );

    DateTime ago(Duration d) => reference.subtract(d);

    return AuctionDetail(
      // Figma 원본은 판매자를 "한빛마을"로 표기한다.
      seller: live.seller.copyWith(name: '한빛마을'),
      item: item.copyWith(
        images: const [
          LiveDetailDemoAssets.productDumpling,
          LiveDetailDemoAssets.productNuts,
          LiveDetailDemoAssets.productPizza,
        ],
        conditions: const ['냉동', '미개봉'],
        expiryDate: DateTime(2026, 9, 26),
        inspectedAt: DateTime(2026, 9, 22),
      ),
      bidStatus: live.bidStatus?.copyWith(
        similarAverageMultiplier: 2.3,
        recentWinningPriceWon: 8900,
        ranking: [
          LiveBidEntry(
            rank: 1,
            bidderName: '홍*동',
            priceWon: 7900,
            placedAt: ago(const Duration(seconds: 3)),
          ),
          LiveBidEntry(
            rank: 2,
            bidderName: '김*빈',
            priceWon: 7400,
            placedAt: ago(const Duration(seconds: 13)),
          ),
          LiveBidEntry(
            rank: 3,
            bidderName: '유*진',
            priceWon: 6900,
            placedAt: ago(const Duration(seconds: 23)),
          ),
          LiveBidEntry(
            rank: 4,
            bidderName: '하*훈',
            priceWon: 6800,
            placedAt: ago(const Duration(minutes: 1)),
          ),
          LiveBidEntry(
            rank: 5,
            bidderName: '성*리',
            priceWon: 6400,
            placedAt: ago(const Duration(minutes: 3)),
          ),
        ],
      ),
      paymentMethodLabel: live.paymentMethodLabel,
    );
  }
}

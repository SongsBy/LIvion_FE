import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/bid_outcome.dart';
import 'live_detail_dependencies.dart';

part 'auction_bid_controller.g.dart';

/// 경매 상세의 입찰 요청 상태. null 데이터는 아직 입찰하지 않았다는 뜻이다.
///
/// 결제가 따르는 mutation이므로 요청 중에는 다시 보내지 않고, 실패해도 자동으로
/// 다시 보내지 않는다. 화면을 벗어나면 버린다(autoDispose).
@riverpod
class AuctionBidController extends _$AuctionBidController {
  @override
  AsyncValue<BidOutcome?> build({
    required String liveId,
    required String itemId,
  }) => const AsyncData(null);

  /// [priceWon]원으로 입찰한다. 요청 중이면 무시하고 null, 실패하면 null을 돌려준다.
  Future<BidOutcome?> submit(int priceWon) async {
    if (state.isLoading) return null;
    state = const AsyncLoading();
    try {
      final outcome = await ref
          .read(auctionDetailRepositoryProvider)
          .placeBid(liveId: liveId, itemId: itemId, priceWon: priceWon);
      if (!ref.mounted) return null;
      state = AsyncData(outcome);
      return outcome;
    } catch (error, stack) {
      if (ref.mounted) state = AsyncError(error, stack);
      return null;
    }
  }
}

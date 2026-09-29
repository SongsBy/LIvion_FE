import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/auction_detail.dart';
import 'live_detail_dependencies.dart';

part 'auction_detail_provider.g.dart';

/// 실패 시 Riverpod 자동 재시도를 끈다. 재시도는 화면의 "다시 시도"로만 한다.
Duration? _noRetry(int retryCount, Object error) => null;

/// [liveId] 방송의 [itemId] 상품 경매 상세 조회 상태.
/// 화면을 벗어나면 버린다(autoDispose). 다시 조회는 `ref.invalidate`로 한다.
@Riverpod(retry: _noRetry)
Future<AuctionDetail> auctionDetail(
  Ref ref, {
  required String liveId,
  required String itemId,
}) => ref
    .watch(auctionDetailRepositoryProvider)
    .fetchAuctionDetail(liveId: liveId, itemId: itemId);

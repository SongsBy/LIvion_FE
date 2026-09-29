import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/demo_seller_channel_repository.dart';
import '../../domain/repositories/seller_channel_repository.dart';

part 'seller_channel_dependencies.g.dart';

/// 판매자 페이지 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// 데모 구현이 팔로우·좋아요·댓글을 메모리에 두므로 앱이 떠 있는 동안 하나만 둔다.
@Riverpod(keepAlive: true)
SellerChannelRepository sellerChannelRepository(Ref ref) =>
    DemoSellerChannelRepository(clock: ref.watch(sellerChannelClockProvider));

/// 댓글 시각("오후 8:14" / 날짜) 판단용 시계. 테스트에서 고정 시각으로 바꾼다.
@Riverpod(keepAlive: true)
DateTime Function() sellerChannelClock(Ref ref) => DateTime.now;

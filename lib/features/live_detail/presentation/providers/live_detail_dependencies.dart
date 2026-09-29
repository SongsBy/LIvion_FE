import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:livion/core/pip/picture_in_picture.dart';
import 'package:livion/core/pip/plugin_picture_in_picture.dart';

import '../../data/repositories/demo_auction_detail_repository.dart';
import '../../data/repositories/demo_live_detail_repository.dart';
import '../../domain/repositories/auction_detail_repository.dart';
import '../../domain/repositories/live_detail_repository.dart';

part 'live_detail_dependencies.g.dart';

/// 라이브 상세 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoLiveDetailRepository`를 remote 구현으로 바꾼다.
/// 테스트에서는 `liveDetailRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.
@riverpod
LiveDetailRepository liveDetailRepository(Ref ref) =>
    const DemoLiveDetailRepository();

/// 경매 상세 데이터. API가 준비되면 `DemoAuctionDetailRepository`를 바꾼다.
@riverpod
AuctionDetailRepository auctionDetailRepository(Ref ref) =>
    const DemoAuctionDetailRepository();

/// 네이티브 PiP 창. 플랫폼 창은 앱에 하나뿐이고 상태 관찰자도 하나만 붙으므로 keepAlive다.
/// 테스트에서는 fake로 갈아끼운다.
@Riverpod(keepAlive: true)
PictureInPicture pictureInPicture(Ref ref) => PluginPictureInPicture();

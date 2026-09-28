import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/entities/home_feed.dart';
import 'home_dependencies.dart';

part 'home_feed_controller.g.dart';

/// 실패 시 Riverpod 자동 재시도를 끈다. 재시도는 화면의 "다시 시도"와
/// pull-to-refresh로만 하고, API가 붙으면 dio 재시도 정책과 겹치지 않게 한다.
Duration? _noRetry(int retryCount, Object error) => null;

/// 홈 피드 조회 상태. 화면은 `AsyncValue<HomeFeed>`를 `when`으로 그린다.
@Riverpod(retry: _noRetry)
class HomeFeedController extends _$HomeFeedController {
  @override
  Future<HomeFeed> build() {
    return ref.watch(homeRepositoryProvider).fetchHomeFeed();
  }

  /// pull-to-refresh. 다시 조회하는 동안 기존 데이터는 유지된다.
  Future<void> refresh() {
    ref.invalidateSelf();
    return future;
  }
}

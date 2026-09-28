import 'package:freezed_annotation/freezed_annotation.dart';

import 'followed_seller.dart';
import 'live_summary.dart';
import 'scheduled_live.dart';

part 'home_feed.freezed.dart';

/// 홈 화면 한 번 조회로 받는 묶음.
@freezed
abstract class HomeFeed with _$HomeFeed {
  const factory HomeFeed({
    /// Livion 공식 방송 (히어로).
    required LiveSummary officialLive,

    /// 공식 방송 편성표. 첫 항목이 현재 방송.
    @Default(<ScheduledLive>[]) List<ScheduledLive> schedule,
    @Default(<FollowedSeller>[]) List<FollowedSeller> followedSellers,
    @Default(<LiveSummary>[]) List<LiveSummary> trendingLives,
    @Default(<LiveSummary>[]) List<LiveSummary> closingSoonLives,

    /// "전체 라이브" 첫 페이지.
    @Default(<LiveSummary>[]) List<LiveSummary> lives,

    /// 전체 라이브 총 개수 (섹션 제목 옆 숫자).
    @Default(0) int totalLiveCount,

    /// 전체 라이브 필터 칩. 첫 항목이 "전체".
    @Default(<String>['전체']) List<String> liveCategories,
  }) = _HomeFeed;
}

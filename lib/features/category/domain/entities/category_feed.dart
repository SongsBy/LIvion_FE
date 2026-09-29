import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:livion/features/home/domain/entities/live_summary.dart';

// 라이브 요약은 홈 feature가 소유한 개념이라 그 공개 entity를 그대로 쓴다.
export 'package:livion/features/home/domain/entities/live_summary.dart';

part 'category_feed.freezed.dart';

/// 카테고리 "인기 판매자" 한 명. [isLive]면 오렌지 링과 LIVE 뱃지가 붙는다.
@freezed
abstract class CategorySeller with _$CategorySeller {
  const factory CategorySeller({
    required String id,
    required String name,
    String? avatar,
    @Default(false) bool isLive,
  }) = _CategorySeller;
}

/// 대분류·하위 분류 하나를 골랐을 때 받는 카테고리 화면 본문.
@freezed
abstract class CategoryFeed with _$CategoryFeed {
  const factory CategoryFeed({
    /// "BEST 라이브" 가로 목록.
    @Default(<LiveSummary>[]) List<LiveSummary> bestLives,
    @Default(<CategorySeller>[]) List<CategorySeller> popularSellers,

    /// "전체 보기" · 라이브 탭.
    @Default(<LiveSummary>[]) List<LiveSummary> lives,

    /// "전체 보기" · 예정 라이브 탭.
    @Default(<LiveSummary>[]) List<LiveSummary> scheduledLives,

    /// "전체 보기" · 지난 방송 탭.
    @Default(<LiveSummary>[]) List<LiveSummary> pastLives,
  }) = _CategoryFeed;
}

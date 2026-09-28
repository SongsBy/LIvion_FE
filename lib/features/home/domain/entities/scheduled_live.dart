import 'package:freezed_annotation/freezed_annotation.dart';

part 'scheduled_live.freezed.dart';

/// 공식 방송 편성 한 칸.
///
/// [isOnAir]면 현재 방송(오렌지 테두리). [startsAt]이 null이면 시각 미정으로
/// 썸네일만 보인다. 시각은 서버 계약에 따라 기기 로컬 시간으로 표시한다.
@freezed
abstract class ScheduledLive with _$ScheduledLive {
  const factory ScheduledLive({
    required String id,
    String? thumbnail,
    DateTime? startsAt,
    @Default(false) bool isOnAir,
  }) = _ScheduledLive;
}

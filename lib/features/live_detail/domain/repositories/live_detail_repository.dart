import '../entities/live_detail.dart';

/// 라이브 방송 화면 데이터 계약.
///
/// 지금은 데모 구현만 있고, API가 확정되면 data/에 remote 구현을 추가해
/// `live_detail_dependencies.dart`에서만 교체한다. 화면은 이 interface만 안다.
abstract interface class LiveDetailRepository {
  /// 하단 내비 LIVE 탭으로 바로 들어왔을 때 보여 줄 대표(공식) 방송.
  Future<LiveDetail> fetchFeaturedLive();

  /// 홈의 라이브 카드에서 고른 방송.
  Future<LiveDetail> fetchLiveDetail(String liveId);

  /// 판매자 팔로우 상태 변경. 서버 계약 확정 전까지 데모 구현은 바로 성공한다.
  Future<void> setFollowing({
    required String sellerId,
    required bool following,
  });

  /// 채팅 전송. 실시간 채팅 계약(소켓·보낸 사람 식별)이 확정되기 전까지
  /// 데모 구현은 바로 성공하고, 화면은 보낸 메시지를 목록에 바로 붙인다.
  Future<void> sendChatMessage({
    required String liveId,
    required String message,
  });
}

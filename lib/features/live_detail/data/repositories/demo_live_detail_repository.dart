import '../../domain/entities/live_detail.dart';
import '../../domain/repositories/live_detail_repository.dart';
import '../demo/live_detail_demo_data.dart';

/// 데모 발표용 [LiveDetailRepository]. 네트워크 없이 Figma 데이터를 돌려준다.
///
/// [latency]로 로딩 상태를 눈으로 확인할 수 있다.
/// API 연동 시 remote 구현으로 교체하며, DTO → entity 변환과 Failure 매핑은
/// 그 구현이 담당한다.
final class DemoLiveDetailRepository implements LiveDetailRepository {
  const DemoLiveDetailRepository({
    this.latency = const Duration(milliseconds: 400),
  });

  final Duration latency;

  Future<void> _wait() async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
  }

  @override
  Future<LiveDetail> fetchFeaturedLive() async {
    await _wait();
    return LiveDetailDemoData.build();
  }

  @override
  Future<LiveDetail> fetchLiveDetail(String liveId) async {
    await _wait();
    return LiveDetailDemoData.build(liveId: liveId);
  }

  @override
  Future<void> setFollowing({
    required String sellerId,
    required bool following,
  }) async {}

  @override
  Future<void> sendChatMessage({
    required String liveId,
    required String message,
  }) async {}
}

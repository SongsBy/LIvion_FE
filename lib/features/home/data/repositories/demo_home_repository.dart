import '../../domain/entities/home_feed.dart';
import '../../domain/repositories/home_repository.dart';
import '../demo/home_demo_feed.dart';

/// 데모 발표용 [HomeRepository]. 네트워크 없이 Figma 데이터를 돌려준다.
///
/// [latency]로 로딩 상태를 눈으로 확인할 수 있다.
/// API 연동 시 remote 구현으로 교체하며, DTO → entity 변환과 Failure 매핑은
/// 그 구현이 담당한다.
final class DemoHomeRepository implements HomeRepository {
  const DemoHomeRepository({this.latency = const Duration(milliseconds: 400)});

  final Duration latency;

  @override
  Future<HomeFeed> fetchHomeFeed() async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
    return HomeDemoFeed.build();
  }
}

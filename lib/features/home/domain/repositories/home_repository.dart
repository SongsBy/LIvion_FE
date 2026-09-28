import '../entities/home_feed.dart';

/// 홈 화면 데이터 계약.
///
/// 지금은 데모용 구현만 있고, API가 확정되면 data/에 remote 구현을 추가해
/// `home_dependencies.dart`에서만 교체한다. 화면은 이 interface만 안다.
abstract interface class HomeRepository {
  Future<HomeFeed> fetchHomeFeed();
}

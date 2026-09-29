import '../entities/account_profile.dart';

/// 계정 목록·전환 계약.
///
/// 지금은 데모 구현만 있고, 인증·세션 API가 확정되면 data/에 remote 구현을 추가해
/// `account_dependencies.dart`에서만 교체한다.
abstract interface class AccountRepository {
  Future<AccountSession> fetchSession();

  /// [profileId] 계정으로 전환하고 바뀐 세션을 돌려준다.
  Future<AccountSession> switchProfile(String profileId);

  /// 판매자 전환을 마치고 새 판매자 계정으로 바꾼 세션을 돌려준다.
  Future<AccountSession> registerSeller();
}

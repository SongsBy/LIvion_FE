import '../../domain/entities/account_profile.dart';
import '../../domain/repositories/account_repository.dart';
import '../demo/account_demo_data.dart';

/// 데모 발표용 [AccountRepository]. 계정 목록과 지금 계정을 메모리에만 기억한다.
///
/// 세션 조회는 저장된 값을 읽는 것이라 바로 돌려주고, 전환·판매자 등록만
/// [latency]만큼 기다려 진행 표시를 확인할 수 있게 한다.
final class DemoAccountRepository implements AccountRepository {
  DemoAccountRepository({
    this.latency = const Duration(milliseconds: 400),
    List<AccountProfile> profiles = const [AccountDemoData.buyer],
  }) : _profiles = [...profiles];

  final Duration latency;
  final List<AccountProfile> _profiles;
  String _activeId = AccountDemoData.buyerId;

  AccountSession get _session => AccountSession(
    profiles: List.unmodifiable(_profiles),
    activeProfileId: _activeId,
  );

  @override
  Future<AccountSession> fetchSession() async => _session;

  @override
  Future<AccountSession> switchProfile(String profileId) async {
    if (!_profiles.any((p) => p.id == profileId)) {
      throw ArgumentError.value(profileId, 'profileId', '없는 계정');
    }
    await _wait();
    _activeId = profileId;
    return _session;
  }

  @override
  Future<AccountSession> registerSeller() async {
    await _wait();
    if (!_profiles.any((p) => p.id == AccountDemoData.sellerId)) {
      _profiles.add(AccountDemoData.seller);
    }
    _activeId = AccountDemoData.sellerId;
    return _session;
  }

  Future<void> _wait() async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
  }
}

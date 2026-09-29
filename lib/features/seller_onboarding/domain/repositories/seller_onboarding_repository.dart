import '../entities/seller_application.dart';
import '../entities/seller_program_stats.dart';

/// 판매자 전환 안내·신청 데이터 계약.
///
/// 지금은 데모 구현만 있고, API가 확정되면 data/에 remote 구현을 추가해
/// `seller_onboarding_providers.dart`에서만 교체한다.
/// 확인 요청은 통과하면 true, 서버가 거절하면 false, 통신 실패는 예외로 알린다.
abstract interface class SellerOnboardingRepository {
  Future<SellerProgramStats> fetchProgramStats();

  /// 사업자등록번호(숫자 10자리)가 영업 중인 사업자인지 확인한다.
  Future<bool> verifyBusinessNumber(String businessNumber);

  /// 휴대폰으로 인증번호를 보내고 번호의 유효 시간을 돌려준다.
  Future<Duration> requestPhoneCode(String phone);

  /// 받은 인증번호가 맞는지 확인한다.
  Future<bool> confirmPhoneCode({required String phone, required String code});

  /// 채널명을 쓸 수 있는지(중복이 아닌지) 확인한다.
  Future<bool> isChannelNameAvailable(String channelName);

  /// 정산 계좌로 고를 수 있는 은행 목록 (보여 줄 순서대로).
  Future<List<SettlementBank>> fetchBanks();

  /// 계좌 1원 인증. 예금주·계좌가 맞으면 true.
  Future<bool> verifyBankAccount({
    required String bankCode,
    required String accountNumber,
  });

  /// 판매자 심사를 신청하고 접수 결과를 돌려준다.
  Future<SellerApplicationReceipt> submitApplication(
    SellerApplication application,
  );
}

import '../../domain/entities/seller_application.dart';
import '../../domain/entities/seller_program_stats.dart';
import '../../domain/repositories/seller_onboarding_repository.dart';
import '../demo/seller_onboarding_demo_data.dart';

/// 데모 발표용 [SellerOnboardingRepository]. Figma(37:3593)의 수치를 돌려준다.
///
/// 확인 요청은 형식만 맞으면 통과한다. 휴대폰 인증번호는 6자리면 아무 숫자나
/// 맞는 것으로 보고, 채널명은 [SellerOnboardingDemoData.takenChannelNames]만
/// 중복으로 거절한다. 접수번호는 [clock]의 날짜로 만든다.
final class DemoSellerOnboardingRepository
    implements SellerOnboardingRepository {
  const DemoSellerOnboardingRepository({
    this.latency = const Duration(milliseconds: 300),
    this.clock,
  });

  final Duration latency;

  /// 접수일 계산용. null이면 지금 시각.
  final DateTime Function()? clock;

  static const stats = SellerProgramStats(
    averageStartPriceMultiplier: 2.0,
    winRatePercent: 68,
  );

  Future<void> _wait() async {
    if (latency > Duration.zero) await Future<void>.delayed(latency);
  }

  @override
  Future<SellerProgramStats> fetchProgramStats() async {
    await _wait();
    return stats;
  }

  @override
  Future<bool> verifyBusinessNumber(String businessNumber) async {
    await _wait();
    return SellerApplicationRules.isBusinessNumber(businessNumber);
  }

  @override
  Future<Duration> requestPhoneCode(String phone) async {
    await _wait();
    return SellerOnboardingDemoData.phoneCodeValidity;
  }

  @override
  Future<bool> confirmPhoneCode({
    required String phone,
    required String code,
  }) async {
    await _wait();
    return SellerApplicationRules.isVerificationCode(code);
  }

  @override
  Future<bool> isChannelNameAvailable(String channelName) async {
    await _wait();
    final name = channelName.trim().toLowerCase();
    return !SellerOnboardingDemoData.takenChannelNames.contains(name);
  }

  @override
  Future<List<SettlementBank>> fetchBanks() async {
    await _wait();
    return SellerOnboardingDemoData.banks;
  }

  @override
  Future<bool> verifyBankAccount({
    required String bankCode,
    required String accountNumber,
  }) async {
    await _wait();
    return SellerApplicationRules.isAccountNumber(accountNumber);
  }

  @override
  Future<SellerApplicationReceipt> submitApplication(
    SellerApplication application,
  ) async {
    await _wait();
    final channel = application.channelName.trim();
    return SellerApplicationReceipt(
      receiptNumber: SellerOnboardingDemoData.receiptNumber(
        (clock ?? DateTime.now)(),
      ),
      channelName: channel.isEmpty
          ? SellerOnboardingDemoData.fallbackChannelName
          : channel,
      broadcastMode: application.broadcastMode,
    );
  }
}

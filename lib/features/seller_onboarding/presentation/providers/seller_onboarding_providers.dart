import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/repositories/demo_seller_onboarding_repository.dart';
import '../../domain/entities/seller_application.dart';
import '../../domain/entities/seller_program_stats.dart';
import '../../domain/repositories/seller_onboarding_repository.dart';

part 'seller_onboarding_providers.g.dart';

/// 판매자 전환 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// API가 준비되면 `DemoSellerOnboardingRepository`를 remote 구현으로 바꾼다.
@riverpod
SellerOnboardingRepository sellerOnboardingRepository(Ref ref) =>
    const DemoSellerOnboardingRepository();

/// 실패 시 Riverpod 자동 재시도를 끈다. 다시 시도는 화면 버튼으로만 한다.
Duration? _noRetry(int retryCount, Object error) => null;

/// 안내 화면의 참여 기업 실적. 화면을 벗어나면 버린다.
@Riverpod(retry: _noRetry)
Future<SellerProgramStats> sellerProgramStats(Ref ref) =>
    ref.watch(sellerOnboardingRepositoryProvider).fetchProgramStats();

/// 정산 계좌 은행 목록. 판매자 전환 폼이 열려 있는 동안만 둔다.
@Riverpod(retry: _noRetry)
Future<List<SettlementBank>> sellerBanks(Ref ref) =>
    ref.watch(sellerOnboardingRepositoryProvider).fetchBanks();

/// 인증번호 남은 시간 계산용 시계. 테스트에서 고정 시각으로 바꾼다.
@riverpod
DateTime Function() sellerOnboardingClock(Ref ref) => DateTime.now;

/// 판매자 전환 폼의 필수 항목 검사 여부.
///
/// 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "다음"·"심사 신청"으로 넘어간다.
/// true로 바꾸면 빠진 항목이 있을 때 넘어가지 않고 안내한다.
@riverpod
bool sellerApplicationRequiresInput(Ref ref) => false;

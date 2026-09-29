// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_onboarding_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 판매자 전환 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// API가 준비되면 `DemoSellerOnboardingRepository`를 remote 구현으로 바꾼다.

@ProviderFor(sellerOnboardingRepository)
const sellerOnboardingRepositoryProvider =
    SellerOnboardingRepositoryProvider._();

/// 판매자 전환 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// API가 준비되면 `DemoSellerOnboardingRepository`를 remote 구현으로 바꾼다.

final class SellerOnboardingRepositoryProvider
    extends
        $FunctionalProvider<
          SellerOnboardingRepository,
          SellerOnboardingRepository,
          SellerOnboardingRepository
        >
    with $Provider<SellerOnboardingRepository> {
  /// 판매자 전환 feature 의존성 조립. data 구현은 여기서만 import한다.
  ///
  /// API가 준비되면 `DemoSellerOnboardingRepository`를 remote 구현으로 바꾼다.
  const SellerOnboardingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerOnboardingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerOnboardingRepositoryHash();

  @$internal
  @override
  $ProviderElement<SellerOnboardingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SellerOnboardingRepository create(Ref ref) {
    return sellerOnboardingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SellerOnboardingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SellerOnboardingRepository>(value),
    );
  }
}

String _$sellerOnboardingRepositoryHash() =>
    r'c47413ceb54a32d74f18ba5c5edf04fef7c8db1e';

/// 안내 화면의 참여 기업 실적. 화면을 벗어나면 버린다.

@ProviderFor(sellerProgramStats)
const sellerProgramStatsProvider = SellerProgramStatsProvider._();

/// 안내 화면의 참여 기업 실적. 화면을 벗어나면 버린다.

final class SellerProgramStatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<SellerProgramStats>,
          SellerProgramStats,
          FutureOr<SellerProgramStats>
        >
    with
        $FutureModifier<SellerProgramStats>,
        $FutureProvider<SellerProgramStats> {
  /// 안내 화면의 참여 기업 실적. 화면을 벗어나면 버린다.
  const SellerProgramStatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'sellerProgramStatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerProgramStatsHash();

  @$internal
  @override
  $FutureProviderElement<SellerProgramStats> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SellerProgramStats> create(Ref ref) {
    return sellerProgramStats(ref);
  }
}

String _$sellerProgramStatsHash() =>
    r'b35ff390846430834e9b331d466c77d6d36376b3';

/// 정산 계좌 은행 목록. 판매자 전환 폼이 열려 있는 동안만 둔다.

@ProviderFor(sellerBanks)
const sellerBanksProvider = SellerBanksProvider._();

/// 정산 계좌 은행 목록. 판매자 전환 폼이 열려 있는 동안만 둔다.

final class SellerBanksProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SettlementBank>>,
          List<SettlementBank>,
          FutureOr<List<SettlementBank>>
        >
    with
        $FutureModifier<List<SettlementBank>>,
        $FutureProvider<List<SettlementBank>> {
  /// 정산 계좌 은행 목록. 판매자 전환 폼이 열려 있는 동안만 둔다.
  const SellerBanksProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'sellerBanksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerBanksHash();

  @$internal
  @override
  $FutureProviderElement<List<SettlementBank>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<SettlementBank>> create(Ref ref) {
    return sellerBanks(ref);
  }
}

String _$sellerBanksHash() => r'1fbb69ea71f9db60ee4e695ff434dbe53c381033';

/// 인증번호 남은 시간 계산용 시계. 테스트에서 고정 시각으로 바꾼다.

@ProviderFor(sellerOnboardingClock)
const sellerOnboardingClockProvider = SellerOnboardingClockProvider._();

/// 인증번호 남은 시간 계산용 시계. 테스트에서 고정 시각으로 바꾼다.

final class SellerOnboardingClockProvider
    extends
        $FunctionalProvider<
          DateTime Function(),
          DateTime Function(),
          DateTime Function()
        >
    with $Provider<DateTime Function()> {
  /// 인증번호 남은 시간 계산용 시계. 테스트에서 고정 시각으로 바꾼다.
  const SellerOnboardingClockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerOnboardingClockProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerOnboardingClockHash();

  @$internal
  @override
  $ProviderElement<DateTime Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DateTime Function() create(Ref ref) {
    return sellerOnboardingClock(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime Function()>(value),
    );
  }
}

String _$sellerOnboardingClockHash() =>
    r'aec53d02bd90606c1e724962d4f0ce1ae88a4062';

/// 판매자 전환 폼의 필수 항목 검사 여부.
///
/// 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "다음"·"심사 신청"으로 넘어간다.
/// true로 바꾸면 빠진 항목이 있을 때 넘어가지 않고 안내한다.

@ProviderFor(sellerApplicationRequiresInput)
const sellerApplicationRequiresInputProvider =
    SellerApplicationRequiresInputProvider._();

/// 판매자 전환 폼의 필수 항목 검사 여부.
///
/// 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "다음"·"심사 신청"으로 넘어간다.
/// true로 바꾸면 빠진 항목이 있을 때 넘어가지 않고 안내한다.

final class SellerApplicationRequiresInputProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 판매자 전환 폼의 필수 항목 검사 여부.
  ///
  /// 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "다음"·"심사 신청"으로 넘어간다.
  /// true로 바꾸면 빠진 항목이 있을 때 넘어가지 않고 안내한다.
  const SellerApplicationRequiresInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerApplicationRequiresInputProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerApplicationRequiresInputHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return sellerApplicationRequiresInput(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$sellerApplicationRequiresInputHash() =>
    r'ccbd87198037fecb0c5cbfab641b0dc951ae56ce';

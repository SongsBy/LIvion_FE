// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventory_registration_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 재고 등록 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// API가 준비되면 데모 구현을 remote 구현으로 바꾼다. 재고 번호 순서를 이어 가도록
/// 앱이 떠 있는 동안 하나만 둔다.

@ProviderFor(inventoryRegistrationRepository)
const inventoryRegistrationRepositoryProvider =
    InventoryRegistrationRepositoryProvider._();

/// 재고 등록 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// API가 준비되면 데모 구현을 remote 구현으로 바꾼다. 재고 번호 순서를 이어 가도록
/// 앱이 떠 있는 동안 하나만 둔다.

final class InventoryRegistrationRepositoryProvider
    extends
        $FunctionalProvider<
          InventoryRegistrationRepository,
          InventoryRegistrationRepository,
          InventoryRegistrationRepository
        >
    with $Provider<InventoryRegistrationRepository> {
  /// 재고 등록 feature 의존성 조립. data 구현은 여기서만 import한다.
  ///
  /// API가 준비되면 데모 구현을 remote 구현으로 바꾼다. 재고 번호 순서를 이어 가도록
  /// 앱이 떠 있는 동안 하나만 둔다.
  const InventoryRegistrationRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryRegistrationRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryRegistrationRepositoryHash();

  @$internal
  @override
  $ProviderElement<InventoryRegistrationRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InventoryRegistrationRepository create(Ref ref) {
    return inventoryRegistrationRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InventoryRegistrationRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InventoryRegistrationRepository>(
        value,
      ),
    );
  }
}

String _$inventoryRegistrationRepositoryHash() =>
    r'857edf7711d38550a3917eb280ae3df79ede479a';

/// 사진 찍기·고르기. 데모는 정면·소비기한 라벨 칸만 예시 사진을 준다.

@ProviderFor(inventoryPhotoSource)
const inventoryPhotoSourceProvider = InventoryPhotoSourceProvider._();

/// 사진 찍기·고르기. 데모는 정면·소비기한 라벨 칸만 예시 사진을 준다.

final class InventoryPhotoSourceProvider
    extends
        $FunctionalProvider<
          InventoryPhotoSource,
          InventoryPhotoSource,
          InventoryPhotoSource
        >
    with $Provider<InventoryPhotoSource> {
  /// 사진 찍기·고르기. 데모는 정면·소비기한 라벨 칸만 예시 사진을 준다.
  const InventoryPhotoSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryPhotoSourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryPhotoSourceHash();

  @$internal
  @override
  $ProviderElement<InventoryPhotoSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  InventoryPhotoSource create(Ref ref) {
    return inventoryPhotoSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InventoryPhotoSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InventoryPhotoSource>(value),
    );
  }
}

String _$inventoryPhotoSourceHash() =>
    r'd33bbbedc70eff088870ffe4908570291d5eae6d';

/// 소비기한 D-day·재고 번호 날짜 계산용 시계. 테스트에서 고정 시각으로 바꾼다.

@ProviderFor(inventoryRegistrationClock)
const inventoryRegistrationClockProvider =
    InventoryRegistrationClockProvider._();

/// 소비기한 D-day·재고 번호 날짜 계산용 시계. 테스트에서 고정 시각으로 바꾼다.

final class InventoryRegistrationClockProvider
    extends
        $FunctionalProvider<
          DateTime Function(),
          DateTime Function(),
          DateTime Function()
        >
    with $Provider<DateTime Function()> {
  /// 소비기한 D-day·재고 번호 날짜 계산용 시계. 테스트에서 고정 시각으로 바꾼다.
  const InventoryRegistrationClockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryRegistrationClockProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryRegistrationClockHash();

  @$internal
  @override
  $ProviderElement<DateTime Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DateTime Function() create(Ref ref) {
    return inventoryRegistrationClock(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime Function()>(value),
    );
  }
}

String _$inventoryRegistrationClockHash() =>
    r'cdf0c09fc1e2d77e8808c0059f06f6befe1c0b0e';

/// 재고 등록 폼의 필수 항목 검사 여부.
///
/// 판매자 전환 폼과 같이 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "다음"으로 넘어간다.
/// true로 바꾸면 빠진 항목이 있을 때 넘어가지 않고 안내한다. 마지막 확인 체크는
/// 이 값과 상관없이 해야 신청 버튼이 켜진다.

@ProviderFor(inventoryRegistrationRequiresInput)
const inventoryRegistrationRequiresInputProvider =
    InventoryRegistrationRequiresInputProvider._();

/// 재고 등록 폼의 필수 항목 검사 여부.
///
/// 판매자 전환 폼과 같이 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "다음"으로 넘어간다.
/// true로 바꾸면 빠진 항목이 있을 때 넘어가지 않고 안내한다. 마지막 확인 체크는
/// 이 값과 상관없이 해야 신청 버튼이 켜진다.

final class InventoryRegistrationRequiresInputProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// 재고 등록 폼의 필수 항목 검사 여부.
  ///
  /// 판매자 전환 폼과 같이 데모 발표 동안은 꺼 두어 빈 칸이 있어도 "다음"으로 넘어간다.
  /// true로 바꾸면 빠진 항목이 있을 때 넘어가지 않고 안내한다. 마지막 확인 체크는
  /// 이 값과 상관없이 해야 신청 버튼이 켜진다.
  const InventoryRegistrationRequiresInputProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inventoryRegistrationRequiresInputProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() =>
      _$inventoryRegistrationRequiresInputHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return inventoryRegistrationRequiresInput(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$inventoryRegistrationRequiresInputHash() =>
    r'fe3477cb546871d424eb40dbb6517c900d0fe558';

/// 카테고리·브랜드·호가 단위·가격 안내. 재고 등록 화면이 열려 있는 동안만 둔다.

@ProviderFor(inventoryFormOptions)
const inventoryFormOptionsProvider = InventoryFormOptionsProvider._();

/// 카테고리·브랜드·호가 단위·가격 안내. 재고 등록 화면이 열려 있는 동안만 둔다.

final class InventoryFormOptionsProvider
    extends
        $FunctionalProvider<
          AsyncValue<InventoryFormOptions>,
          InventoryFormOptions,
          FutureOr<InventoryFormOptions>
        >
    with
        $FutureModifier<InventoryFormOptions>,
        $FutureProvider<InventoryFormOptions> {
  /// 카테고리·브랜드·호가 단위·가격 안내. 재고 등록 화면이 열려 있는 동안만 둔다.
  const InventoryFormOptionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'inventoryFormOptionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inventoryFormOptionsHash();

  @$internal
  @override
  $FutureProviderElement<InventoryFormOptions> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<InventoryFormOptions> create(Ref ref) {
    return inventoryFormOptions(ref);
  }
}

String _$inventoryFormOptionsHash() =>
    r'1a207e4200dbf67c536331f663c5ef5e8ff7c15f';

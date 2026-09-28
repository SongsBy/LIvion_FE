// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 홈 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoHomeRepository`를 remote 구현으로 바꾼다.
/// 화면·notifier는 [HomeRepository] interface만 알기 때문에 다른 곳은 손대지 않는다.
/// 테스트에서는 `homeRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.

@ProviderFor(homeRepository)
const homeRepositoryProvider = HomeRepositoryProvider._();

/// 홈 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoHomeRepository`를 remote 구현으로 바꾼다.
/// 화면·notifier는 [HomeRepository] interface만 알기 때문에 다른 곳은 손대지 않는다.
/// 테스트에서는 `homeRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.

final class HomeRepositoryProvider
    extends $FunctionalProvider<HomeRepository, HomeRepository, HomeRepository>
    with $Provider<HomeRepository> {
  /// 홈 feature 의존성 조립. 이 파일만 data 구현을 import한다.
  ///
  /// API가 준비되면 여기서 `DemoHomeRepository`를 remote 구현으로 바꾼다.
  /// 화면·notifier는 [HomeRepository] interface만 알기 때문에 다른 곳은 손대지 않는다.
  /// 테스트에서는 `homeRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.
  const HomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homeRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeRepositoryHash();

  @$internal
  @override
  $ProviderElement<HomeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HomeRepository create(Ref ref) {
    return homeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeRepository>(value),
    );
  }
}

String _$homeRepositoryHash() => r'58ad6a5270751668cc536bc7d374c00cb1ea82d0';

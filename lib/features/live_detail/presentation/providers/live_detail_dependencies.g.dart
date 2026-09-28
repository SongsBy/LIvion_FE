// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_detail_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 라이브 상세 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoLiveDetailRepository`를 remote 구현으로 바꾼다.
/// 테스트에서는 `liveDetailRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.

@ProviderFor(liveDetailRepository)
const liveDetailRepositoryProvider = LiveDetailRepositoryProvider._();

/// 라이브 상세 feature 의존성 조립. 이 파일만 data 구현을 import한다.
///
/// API가 준비되면 여기서 `DemoLiveDetailRepository`를 remote 구현으로 바꾼다.
/// 테스트에서는 `liveDetailRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.

final class LiveDetailRepositoryProvider
    extends
        $FunctionalProvider<
          LiveDetailRepository,
          LiveDetailRepository,
          LiveDetailRepository
        >
    with $Provider<LiveDetailRepository> {
  /// 라이브 상세 feature 의존성 조립. 이 파일만 data 구현을 import한다.
  ///
  /// API가 준비되면 여기서 `DemoLiveDetailRepository`를 remote 구현으로 바꾼다.
  /// 테스트에서는 `liveDetailRepositoryProvider.overrideWithValue(fake)`로 갈아끼운다.
  const LiveDetailRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'liveDetailRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveDetailRepositoryHash();

  @$internal
  @override
  $ProviderElement<LiveDetailRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LiveDetailRepository create(Ref ref) {
    return liveDetailRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LiveDetailRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LiveDetailRepository>(value),
    );
  }
}

String _$liveDetailRepositoryHash() =>
    r'e147c15f0d0074494cc55ceecec3c43c3a29f53e';

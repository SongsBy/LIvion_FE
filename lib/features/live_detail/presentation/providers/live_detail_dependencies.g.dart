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

/// 경매 상세 데이터. API가 준비되면 `DemoAuctionDetailRepository`를 바꾼다.

@ProviderFor(auctionDetailRepository)
const auctionDetailRepositoryProvider = AuctionDetailRepositoryProvider._();

/// 경매 상세 데이터. API가 준비되면 `DemoAuctionDetailRepository`를 바꾼다.

final class AuctionDetailRepositoryProvider
    extends
        $FunctionalProvider<
          AuctionDetailRepository,
          AuctionDetailRepository,
          AuctionDetailRepository
        >
    with $Provider<AuctionDetailRepository> {
  /// 경매 상세 데이터. API가 준비되면 `DemoAuctionDetailRepository`를 바꾼다.
  const AuctionDetailRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'auctionDetailRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$auctionDetailRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuctionDetailRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AuctionDetailRepository create(Ref ref) {
    return auctionDetailRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuctionDetailRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuctionDetailRepository>(value),
    );
  }
}

String _$auctionDetailRepositoryHash() =>
    r'7f264cc599c317f6034541d7a484db9767501090';

/// 네이티브 PiP 창. 플랫폼 창은 앱에 하나뿐이고 상태 관찰자도 하나만 붙으므로 keepAlive다.
/// 테스트에서는 fake로 갈아끼운다.

@ProviderFor(pictureInPicture)
const pictureInPictureProvider = PictureInPictureProvider._();

/// 네이티브 PiP 창. 플랫폼 창은 앱에 하나뿐이고 상태 관찰자도 하나만 붙으므로 keepAlive다.
/// 테스트에서는 fake로 갈아끼운다.

final class PictureInPictureProvider
    extends
        $FunctionalProvider<
          PictureInPicture,
          PictureInPicture,
          PictureInPicture
        >
    with $Provider<PictureInPicture> {
  /// 네이티브 PiP 창. 플랫폼 창은 앱에 하나뿐이고 상태 관찰자도 하나만 붙으므로 keepAlive다.
  /// 테스트에서는 fake로 갈아끼운다.
  const PictureInPictureProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pictureInPictureProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pictureInPictureHash();

  @$internal
  @override
  $ProviderElement<PictureInPicture> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PictureInPicture create(Ref ref) {
    return pictureInPicture(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PictureInPicture value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PictureInPicture>(value),
    );
  }
}

String _$pictureInPictureHash() => r'6a8162a2e5db171400a00340a4a797d274a41ef6';

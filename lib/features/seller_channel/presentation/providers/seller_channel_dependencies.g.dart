// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_channel_dependencies.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 판매자 페이지 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// 데모 구현이 팔로우·좋아요·댓글을 메모리에 두므로 앱이 떠 있는 동안 하나만 둔다.

@ProviderFor(sellerChannelRepository)
const sellerChannelRepositoryProvider = SellerChannelRepositoryProvider._();

/// 판매자 페이지 feature 의존성 조립. data 구현은 여기서만 import한다.
///
/// 데모 구현이 팔로우·좋아요·댓글을 메모리에 두므로 앱이 떠 있는 동안 하나만 둔다.

final class SellerChannelRepositoryProvider
    extends
        $FunctionalProvider<
          SellerChannelRepository,
          SellerChannelRepository,
          SellerChannelRepository
        >
    with $Provider<SellerChannelRepository> {
  /// 판매자 페이지 feature 의존성 조립. data 구현은 여기서만 import한다.
  ///
  /// 데모 구현이 팔로우·좋아요·댓글을 메모리에 두므로 앱이 떠 있는 동안 하나만 둔다.
  const SellerChannelRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerChannelRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerChannelRepositoryHash();

  @$internal
  @override
  $ProviderElement<SellerChannelRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SellerChannelRepository create(Ref ref) {
    return sellerChannelRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SellerChannelRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SellerChannelRepository>(value),
    );
  }
}

String _$sellerChannelRepositoryHash() =>
    r'f7b2397e12bee2a1659d91874c53a835cfd72af2';

/// 댓글 시각("오후 8:14" / 날짜) 판단용 시계. 테스트에서 고정 시각으로 바꾼다.

@ProviderFor(sellerChannelClock)
const sellerChannelClockProvider = SellerChannelClockProvider._();

/// 댓글 시각("오후 8:14" / 날짜) 판단용 시계. 테스트에서 고정 시각으로 바꾼다.

final class SellerChannelClockProvider
    extends
        $FunctionalProvider<
          DateTime Function(),
          DateTime Function(),
          DateTime Function()
        >
    with $Provider<DateTime Function()> {
  /// 댓글 시각("오후 8:14" / 날짜) 판단용 시계. 테스트에서 고정 시각으로 바꾼다.
  const SellerChannelClockProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellerChannelClockProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellerChannelClockHash();

  @$internal
  @override
  $ProviderElement<DateTime Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DateTime Function() create(Ref ref) {
    return sellerChannelClock(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime Function()>(value),
    );
  }
}

String _$sellerChannelClockHash() =>
    r'9c732ce4ba459451fbac585594a6bff75d0c34db';

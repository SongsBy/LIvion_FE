// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// [liveId] 방송의 [itemId] 상품 경매 상세 조회 상태.
/// 화면을 벗어나면 버린다(autoDispose). 다시 조회는 `ref.invalidate`로 한다.

@ProviderFor(auctionDetail)
const auctionDetailProvider = AuctionDetailFamily._();

/// [liveId] 방송의 [itemId] 상품 경매 상세 조회 상태.
/// 화면을 벗어나면 버린다(autoDispose). 다시 조회는 `ref.invalidate`로 한다.

final class AuctionDetailProvider
    extends
        $FunctionalProvider<
          AsyncValue<AuctionDetail>,
          AuctionDetail,
          FutureOr<AuctionDetail>
        >
    with $FutureModifier<AuctionDetail>, $FutureProvider<AuctionDetail> {
  /// [liveId] 방송의 [itemId] 상품 경매 상세 조회 상태.
  /// 화면을 벗어나면 버린다(autoDispose). 다시 조회는 `ref.invalidate`로 한다.
  const AuctionDetailProvider._({
    required AuctionDetailFamily super.from,
    required ({String liveId, String itemId}) super.argument,
  }) : super(
         retry: _noRetry,
         name: r'auctionDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$auctionDetailHash();

  @override
  String toString() {
    return r'auctionDetailProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $FutureProviderElement<AuctionDetail> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AuctionDetail> create(Ref ref) {
    final argument = this.argument as ({String liveId, String itemId});
    return auctionDetail(ref, liveId: argument.liveId, itemId: argument.itemId);
  }

  @override
  bool operator ==(Object other) {
    return other is AuctionDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$auctionDetailHash() => r'4fe8f73cb13ee816d61ca299ee2897d7d81392e2';

/// [liveId] 방송의 [itemId] 상품 경매 상세 조회 상태.
/// 화면을 벗어나면 버린다(autoDispose). 다시 조회는 `ref.invalidate`로 한다.

final class AuctionDetailFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<AuctionDetail>,
          ({String liveId, String itemId})
        > {
  const AuctionDetailFamily._()
    : super(
        retry: _noRetry,
        name: r'auctionDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// [liveId] 방송의 [itemId] 상품 경매 상세 조회 상태.
  /// 화면을 벗어나면 버린다(autoDispose). 다시 조회는 `ref.invalidate`로 한다.

  AuctionDetailProvider call({
    required String liveId,
    required String itemId,
  }) => AuctionDetailProvider._(
    argument: (liveId: liveId, itemId: itemId),
    from: this,
  );

  @override
  String toString() => r'auctionDetailProvider';
}

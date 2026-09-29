// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction_bid_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 경매 상세의 입찰 요청 상태. null 데이터는 아직 입찰하지 않았다는 뜻이다.
///
/// 결제가 따르는 mutation이므로 요청 중에는 다시 보내지 않고, 실패해도 자동으로
/// 다시 보내지 않는다. 화면을 벗어나면 버린다(autoDispose).

@ProviderFor(AuctionBidController)
const auctionBidControllerProvider = AuctionBidControllerFamily._();

/// 경매 상세의 입찰 요청 상태. null 데이터는 아직 입찰하지 않았다는 뜻이다.
///
/// 결제가 따르는 mutation이므로 요청 중에는 다시 보내지 않고, 실패해도 자동으로
/// 다시 보내지 않는다. 화면을 벗어나면 버린다(autoDispose).
final class AuctionBidControllerProvider
    extends $NotifierProvider<AuctionBidController, AsyncValue<BidOutcome?>> {
  /// 경매 상세의 입찰 요청 상태. null 데이터는 아직 입찰하지 않았다는 뜻이다.
  ///
  /// 결제가 따르는 mutation이므로 요청 중에는 다시 보내지 않고, 실패해도 자동으로
  /// 다시 보내지 않는다. 화면을 벗어나면 버린다(autoDispose).
  const AuctionBidControllerProvider._({
    required AuctionBidControllerFamily super.from,
    required ({String liveId, String itemId}) super.argument,
  }) : super(
         retry: null,
         name: r'auctionBidControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$auctionBidControllerHash();

  @override
  String toString() {
    return r'auctionBidControllerProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  AuctionBidController create() => AuctionBidController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<BidOutcome?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<BidOutcome?>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AuctionBidControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$auctionBidControllerHash() =>
    r'22a38a34c3cc75e8272a5ddfd084f3f7da290e48';

/// 경매 상세의 입찰 요청 상태. null 데이터는 아직 입찰하지 않았다는 뜻이다.
///
/// 결제가 따르는 mutation이므로 요청 중에는 다시 보내지 않고, 실패해도 자동으로
/// 다시 보내지 않는다. 화면을 벗어나면 버린다(autoDispose).

final class AuctionBidControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          AuctionBidController,
          AsyncValue<BidOutcome?>,
          AsyncValue<BidOutcome?>,
          AsyncValue<BidOutcome?>,
          ({String liveId, String itemId})
        > {
  const AuctionBidControllerFamily._()
    : super(
        retry: null,
        name: r'auctionBidControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 경매 상세의 입찰 요청 상태. null 데이터는 아직 입찰하지 않았다는 뜻이다.
  ///
  /// 결제가 따르는 mutation이므로 요청 중에는 다시 보내지 않고, 실패해도 자동으로
  /// 다시 보내지 않는다. 화면을 벗어나면 버린다(autoDispose).

  AuctionBidControllerProvider call({
    required String liveId,
    required String itemId,
  }) => AuctionBidControllerProvider._(
    argument: (liveId: liveId, itemId: itemId),
    from: this,
  );

  @override
  String toString() => r'auctionBidControllerProvider';
}

/// 경매 상세의 입찰 요청 상태. null 데이터는 아직 입찰하지 않았다는 뜻이다.
///
/// 결제가 따르는 mutation이므로 요청 중에는 다시 보내지 않고, 실패해도 자동으로
/// 다시 보내지 않는다. 화면을 벗어나면 버린다(autoDispose).

abstract class _$AuctionBidController
    extends $Notifier<AsyncValue<BidOutcome?>> {
  late final _$args = ref.$arg as ({String liveId, String itemId});
  String get liveId => _$args.liveId;
  String get itemId => _$args.itemId;

  AsyncValue<BidOutcome?> build({
    required String liveId,
    required String itemId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(liveId: _$args.liveId, itemId: _$args.itemId);
    final ref =
        this.ref as $Ref<AsyncValue<BidOutcome?>, AsyncValue<BidOutcome?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<BidOutcome?>, AsyncValue<BidOutcome?>>,
              AsyncValue<BidOutcome?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

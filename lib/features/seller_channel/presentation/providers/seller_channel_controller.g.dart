// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_channel_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 판매자 페이지 한 곳. 화면을 벗어나면 버린다.
///
/// 팔로우·좋아요는 누르자마자 화면에 반영하고, 서버가 실패하면 되돌린 뒤 false를
/// 돌려준다. 같은 대상에 요청이 가는 중이면 다시 보내지 않는다.

@ProviderFor(SellerChannelController)
const sellerChannelControllerProvider = SellerChannelControllerFamily._();

/// 판매자 페이지 한 곳. 화면을 벗어나면 버린다.
///
/// 팔로우·좋아요는 누르자마자 화면에 반영하고, 서버가 실패하면 되돌린 뒤 false를
/// 돌려준다. 같은 대상에 요청이 가는 중이면 다시 보내지 않는다.
final class SellerChannelControllerProvider
    extends $AsyncNotifierProvider<SellerChannelController, SellerChannel> {
  /// 판매자 페이지 한 곳. 화면을 벗어나면 버린다.
  ///
  /// 팔로우·좋아요는 누르자마자 화면에 반영하고, 서버가 실패하면 되돌린 뒤 false를
  /// 돌려준다. 같은 대상에 요청이 가는 중이면 다시 보내지 않는다.
  const SellerChannelControllerProvider._({
    required SellerChannelControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: _noRetry,
         name: r'sellerChannelControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sellerChannelControllerHash();

  @override
  String toString() {
    return r'sellerChannelControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  SellerChannelController create() => SellerChannelController();

  @override
  bool operator ==(Object other) {
    return other is SellerChannelControllerProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sellerChannelControllerHash() =>
    r'76a74283d61fe32242da010f48a5ddc37303fe74';

/// 판매자 페이지 한 곳. 화면을 벗어나면 버린다.
///
/// 팔로우·좋아요는 누르자마자 화면에 반영하고, 서버가 실패하면 되돌린 뒤 false를
/// 돌려준다. 같은 대상에 요청이 가는 중이면 다시 보내지 않는다.

final class SellerChannelControllerFamily extends $Family
    with
        $ClassFamilyOverride<
          SellerChannelController,
          AsyncValue<SellerChannel>,
          SellerChannel,
          FutureOr<SellerChannel>,
          String
        > {
  const SellerChannelControllerFamily._()
    : super(
        retry: _noRetry,
        name: r'sellerChannelControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// 판매자 페이지 한 곳. 화면을 벗어나면 버린다.
  ///
  /// 팔로우·좋아요는 누르자마자 화면에 반영하고, 서버가 실패하면 되돌린 뒤 false를
  /// 돌려준다. 같은 대상에 요청이 가는 중이면 다시 보내지 않는다.

  SellerChannelControllerProvider call(String sellerId) =>
      SellerChannelControllerProvider._(argument: sellerId, from: this);

  @override
  String toString() => r'sellerChannelControllerProvider';
}

/// 판매자 페이지 한 곳. 화면을 벗어나면 버린다.
///
/// 팔로우·좋아요는 누르자마자 화면에 반영하고, 서버가 실패하면 되돌린 뒤 false를
/// 돌려준다. 같은 대상에 요청이 가는 중이면 다시 보내지 않는다.

abstract class _$SellerChannelController extends $AsyncNotifier<SellerChannel> {
  late final _$args = ref.$arg as String;
  String get sellerId => _$args;

  FutureOr<SellerChannel> build(String sellerId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<SellerChannel>, SellerChannel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SellerChannel>, SellerChannel>,
              AsyncValue<SellerChannel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

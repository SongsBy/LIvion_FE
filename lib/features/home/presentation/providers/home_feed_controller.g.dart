// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_feed_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 홈 피드 조회 상태. 화면은 `AsyncValue<HomeFeed>`를 `when`으로 그린다.

@ProviderFor(HomeFeedController)
const homeFeedControllerProvider = HomeFeedControllerProvider._();

/// 홈 피드 조회 상태. 화면은 `AsyncValue<HomeFeed>`를 `when`으로 그린다.
final class HomeFeedControllerProvider
    extends $AsyncNotifierProvider<HomeFeedController, HomeFeed> {
  /// 홈 피드 조회 상태. 화면은 `AsyncValue<HomeFeed>`를 `when`으로 그린다.
  const HomeFeedControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'homeFeedControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homeFeedControllerHash();

  @$internal
  @override
  HomeFeedController create() => HomeFeedController();
}

String _$homeFeedControllerHash() =>
    r'e518038e42e67a2a95174ed21f9e06692b34fc3d';

/// 홈 피드 조회 상태. 화면은 `AsyncValue<HomeFeed>`를 `when`으로 그린다.

abstract class _$HomeFeedController extends $AsyncNotifier<HomeFeed> {
  FutureOr<HomeFeed> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<HomeFeed>, HomeFeed>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomeFeed>, HomeFeed>,
              AsyncValue<HomeFeed>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

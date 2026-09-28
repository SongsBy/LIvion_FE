// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_detail_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 라이브 방송 화면 조회 상태. [LiveDetailSelection]이 바뀌면 다시 조회한다.

@ProviderFor(LiveDetailController)
const liveDetailControllerProvider = LiveDetailControllerProvider._();

/// 라이브 방송 화면 조회 상태. [LiveDetailSelection]이 바뀌면 다시 조회한다.
final class LiveDetailControllerProvider
    extends $AsyncNotifierProvider<LiveDetailController, LiveDetail> {
  /// 라이브 방송 화면 조회 상태. [LiveDetailSelection]이 바뀌면 다시 조회한다.
  const LiveDetailControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: _noRetry,
        name: r'liveDetailControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$liveDetailControllerHash();

  @$internal
  @override
  LiveDetailController create() => LiveDetailController();
}

String _$liveDetailControllerHash() =>
    r'296ba27ff58e24d8b94f4654fa49947f579273b5';

/// 라이브 방송 화면 조회 상태. [LiveDetailSelection]이 바뀌면 다시 조회한다.

abstract class _$LiveDetailController extends $AsyncNotifier<LiveDetail> {
  FutureOr<LiveDetail> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<LiveDetail>, LiveDetail>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LiveDetail>, LiveDetail>,
              AsyncValue<LiveDetail>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

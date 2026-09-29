// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minimized_live.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 라이브 화면의 "화면 축소"로 작은 창(PiP)에 띄워 둔 방송. null이면 축소하지 않았다.
///
/// 축소하면 루트 탭이 다른 탭(홈)을 보이면서 이 방송을 작은 창으로 띄운다.
/// 라이브 탭으로 돌아가면 [restore]로 지운다. 탭 전환과 무관하게 살아 있어야
/// 하는 앱 수준 상태라 keepAlive다.

@ProviderFor(MinimizedLive)
const minimizedLiveProvider = MinimizedLiveProvider._();

/// 라이브 화면의 "화면 축소"로 작은 창(PiP)에 띄워 둔 방송. null이면 축소하지 않았다.
///
/// 축소하면 루트 탭이 다른 탭(홈)을 보이면서 이 방송을 작은 창으로 띄운다.
/// 라이브 탭으로 돌아가면 [restore]로 지운다. 탭 전환과 무관하게 살아 있어야
/// 하는 앱 수준 상태라 keepAlive다.
final class MinimizedLiveProvider
    extends $NotifierProvider<MinimizedLive, LivePipSource?> {
  /// 라이브 화면의 "화면 축소"로 작은 창(PiP)에 띄워 둔 방송. null이면 축소하지 않았다.
  ///
  /// 축소하면 루트 탭이 다른 탭(홈)을 보이면서 이 방송을 작은 창으로 띄운다.
  /// 라이브 탭으로 돌아가면 [restore]로 지운다. 탭 전환과 무관하게 살아 있어야
  /// 하는 앱 수준 상태라 keepAlive다.
  const MinimizedLiveProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'minimizedLiveProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$minimizedLiveHash();

  @$internal
  @override
  MinimizedLive create() => MinimizedLive();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LivePipSource? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LivePipSource?>(value),
    );
  }
}

String _$minimizedLiveHash() => r'46ccf967dca58e9e20a5ad1d451f3d6764e38b51';

/// 라이브 화면의 "화면 축소"로 작은 창(PiP)에 띄워 둔 방송. null이면 축소하지 않았다.
///
/// 축소하면 루트 탭이 다른 탭(홈)을 보이면서 이 방송을 작은 창으로 띄운다.
/// 라이브 탭으로 돌아가면 [restore]로 지운다. 탭 전환과 무관하게 살아 있어야
/// 하는 앱 수준 상태라 keepAlive다.

abstract class _$MinimizedLive extends $Notifier<LivePipSource?> {
  LivePipSource? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LivePipSource?, LivePipSource?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LivePipSource?, LivePipSource?>,
              LivePipSource?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

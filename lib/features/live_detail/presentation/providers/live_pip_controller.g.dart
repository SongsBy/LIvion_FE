// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_pip_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 경매 상세를 보는 동안 라이브 방송을 작은 창으로 계속 보여 준다.
///
/// - iOS: 시스템 PiP 창을 바로 띄운다. 띄우지 못하면 앱 안 미니 플레이어로 대신한다.
/// - Android: 앱 안에서는 미니 플레이어를 띄우고, 사용자가 앱을 떠나면 앱 창이
///   시스템 PiP로 줄어든다. 돌아오면 다시 미니 플레이어다.
///
/// 경매 상세 화면이 구독하는 동안만 살아 있다(autoDispose). 화면을 벗어나면
/// 시스템 창을 닫고 자동 진입도 해제한다.

@ProviderFor(LivePipController)
const livePipControllerProvider = LivePipControllerProvider._();

/// 경매 상세를 보는 동안 라이브 방송을 작은 창으로 계속 보여 준다.
///
/// - iOS: 시스템 PiP 창을 바로 띄운다. 띄우지 못하면 앱 안 미니 플레이어로 대신한다.
/// - Android: 앱 안에서는 미니 플레이어를 띄우고, 사용자가 앱을 떠나면 앱 창이
///   시스템 PiP로 줄어든다. 돌아오면 다시 미니 플레이어다.
///
/// 경매 상세 화면이 구독하는 동안만 살아 있다(autoDispose). 화면을 벗어나면
/// 시스템 창을 닫고 자동 진입도 해제한다.
final class LivePipControllerProvider
    extends $NotifierProvider<LivePipController, LivePipState> {
  /// 경매 상세를 보는 동안 라이브 방송을 작은 창으로 계속 보여 준다.
  ///
  /// - iOS: 시스템 PiP 창을 바로 띄운다. 띄우지 못하면 앱 안 미니 플레이어로 대신한다.
  /// - Android: 앱 안에서는 미니 플레이어를 띄우고, 사용자가 앱을 떠나면 앱 창이
  ///   시스템 PiP로 줄어든다. 돌아오면 다시 미니 플레이어다.
  ///
  /// 경매 상세 화면이 구독하는 동안만 살아 있다(autoDispose). 화면을 벗어나면
  /// 시스템 창을 닫고 자동 진입도 해제한다.
  const LivePipControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'livePipControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$livePipControllerHash();

  @$internal
  @override
  LivePipController create() => LivePipController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LivePipState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LivePipState>(value),
    );
  }
}

String _$livePipControllerHash() => r'76ff33b9c1b5a0228bfcb6fa5b82c3e238c65dbf';

/// 경매 상세를 보는 동안 라이브 방송을 작은 창으로 계속 보여 준다.
///
/// - iOS: 시스템 PiP 창을 바로 띄운다. 띄우지 못하면 앱 안 미니 플레이어로 대신한다.
/// - Android: 앱 안에서는 미니 플레이어를 띄우고, 사용자가 앱을 떠나면 앱 창이
///   시스템 PiP로 줄어든다. 돌아오면 다시 미니 플레이어다.
///
/// 경매 상세 화면이 구독하는 동안만 살아 있다(autoDispose). 화면을 벗어나면
/// 시스템 창을 닫고 자동 진입도 해제한다.

abstract class _$LivePipController extends $Notifier<LivePipState> {
  LivePipState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<LivePipState, LivePipState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<LivePipState, LivePipState>,
              LivePipState,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:pip/pip.dart';

import 'picture_in_picture.dart';

/// `pip` 플러그인으로 구현한 [PictureInPicture].
///
/// - iOS(15+): AVKit 영상통화형 PiP. 창 안의 화면은 Runner의 `livion/pip_content`
///   채널이 만든 네이티브 뷰가 그린다 (`ios/Runner/AppDelegate.swift`).
/// - Android(8+): 액티비티 PiP. `MainActivity`가 `PipActivity`를 상속해 앱을 떠날 때
///   자동으로 들어가고, 창 안은 Flutter 화면이 그대로 그린다.
///
/// 플러그인의 상태 관찰자는 하나만 등록되므로 이 객체가 받아서 [events]로 넓혀 준다.
/// 요청은 순서대로 하나씩 처리해 show와 close가 섞이지 않게 한다.
final class PluginPictureInPicture implements PictureInPicture {
  PluginPictureInPicture({Pip? pip, MethodChannel? contentChannel})
    : _pip = pip ?? Pip(),
      _contentChannel =
          contentChannel ?? const MethodChannel('livion/pip_content');

  final Pip _pip;
  final MethodChannel _contentChannel;
  final StreamController<PipEvent> _events = StreamController.broadcast();

  PipSupport? _support;
  bool _observing = false;

  /// iOS에서 PiP 창에 넘긴 네이티브 뷰 핸들.
  int? _contentView;

  /// Android에서 자동 진입을 켜 둔 비율. 끌 때 같은 비율로 다시 설정한다.
  PipContent? _armed;

  Future<void> _pending = Future<void>.value();

  Future<T> _serial<T>(Future<T> Function() task) {
    final result = _pending.then((_) => task());
    _pending = result.then<void>((_) {}, onError: (_) {});
    return result;
  }

  @override
  Stream<PipEvent> get events => _events.stream;

  @override
  Future<PipSupport> support() async {
    final cached = _support;
    if (cached != null) return cached;
    final platform = kIsWeb ? null : defaultTargetPlatform;
    if (platform != TargetPlatform.iOS && platform != TargetPlatform.android) {
      return _support = PipSupport.unsupported;
    }
    try {
      final supported = await _pip.isSupported();
      return _support = !supported
          ? PipSupport.unsupported
          : platform == TargetPlatform.iOS
          ? PipSupport.overlay
          : PipSupport.appWindow;
    } on PlatformException {
      return _support = PipSupport.unsupported;
    } on MissingPluginException {
      return _support = PipSupport.unsupported;
    }
  }

  Future<void> _observe() async {
    if (_observing) return;
    _observing = true;
    await _pip.registerStateChangedObserver(
      PipStateChangedObserver(
        onPipStateChanged: (state, _) => _events.add(switch (state) {
          PipState.pipStateStarted => PipEvent.started,
          PipState.pipStateStopped => PipEvent.stopped,
          PipState.pipStateFailed => PipEvent.failed,
        }),
      ),
    );
  }

  @override
  Future<bool> show(PipContent content) => _serial(() async {
    if (await support() != PipSupport.overlay) return false;
    try {
      await _observe();
      await _releaseContentView();
      final view = await _contentChannel.invokeMethod<int>('create', {
        'image': content.image,
      });
      if (view == null) return false;
      _contentView = view;
      final ready = await _pip.setup(
        PipOptions(
          autoEnterEnabled: true,
          contentView: view,
          // 창 비율은 이 크기의 빈 영상 프레임으로 정해진다.
          preferredContentWidth: content.aspectWidth * _iosSizeScale,
          preferredContentHeight: content.aspectHeight * _iosSizeScale,
          // 1: 앞뒤 건너뛰기를 숨긴다 (공개 API). 2·3은 private API라 쓰지 않는다.
          controlStyle: 1,
        ),
      );
      if (!ready) {
        await _releaseContentView();
        return false;
      }
      return await _pip.start();
    } on PlatformException {
      await _releaseContentView();
      return false;
    }
  });

  @override
  Future<bool> enterOnLeave(PipContent content) => _serial(() async {
    if (await support() != PipSupport.appWindow) return false;
    try {
      await _observe();
      final ready = await _pip.setup(_androidOptions(content, autoEnter: true));
      _armed = ready ? content : null;
      return ready;
    } on PlatformException {
      return false;
    }
  });

  @override
  Future<void> close() => _serial(() async {
    try {
      switch (_support) {
        case PipSupport.overlay:
          // dispose는 창을 애니메이션 없이 바로 닫고 네이티브 컨트롤러를 비운다.
          await _pip.dispose();
          await _releaseContentView();
        case PipSupport.appWindow:
          final armed = _armed;
          if (armed == null) return;
          _armed = null;
          // Android에서는 dispose 뒤 PiP 콜백이 오면 플러그인이 죽으므로
          // 자동 진입만 끈다.
          await _pip.setup(_androidOptions(armed, autoEnter: false));
        case PipSupport.unsupported:
        case null:
          return;
      }
    } on PlatformException {
      // 닫기는 실패해도 화면 흐름을 막지 않는다.
    }
  });

  Future<void> _releaseContentView() async {
    final view = _contentView;
    if (view == null) return;
    _contentView = null;
    await _contentChannel.invokeMethod<void>('dispose', {'view': view});
  }

  static PipOptions _androidOptions(
    PipContent content, {
    required bool autoEnter,
  }) => PipOptions(
    autoEnterEnabled: autoEnter,
    aspectRatioX: content.aspectWidth,
    aspectRatioY: content.aspectHeight,
  );

  /// iOS 빈 영상 프레임 크기 = 비율 × 이 값. 비율이 같으면 크기는 창 모양에 영향이 없다.
  static const int _iosSizeScale = 10;
}

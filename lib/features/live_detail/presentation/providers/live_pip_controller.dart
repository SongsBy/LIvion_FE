import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:livion/core/pip/picture_in_picture.dart';

import 'live_detail_dependencies.dart';
import 'live_pip_state.dart';

part 'live_pip_controller.g.dart';

/// 경매 상세를 보는 동안 라이브 방송을 작은 창으로 계속 보여 준다.
///
/// - iOS: 시스템 PiP 창을 바로 띄운다. 띄우지 못하면 앱 안 미니 플레이어로 대신한다.
/// - Android: 앱 안에서는 미니 플레이어를 띄우고, 사용자가 앱을 떠나면 앱 창이
///   시스템 PiP로 줄어든다. 돌아오면 다시 미니 플레이어다.
///
/// 경매 상세 화면이 구독하는 동안만 살아 있다(autoDispose). 화면을 벗어나면
/// 시스템 창을 닫고 자동 진입도 해제한다.
@riverpod
class LivePipController extends _$LivePipController {
  PipSupport _support = PipSupport.unsupported;

  /// [present]가 다시 불리거나 dispose되면 늘어난다. 늦게 끝난 요청을 버린다.
  int _session = 0;

  /// Figma 경매 상세(37:6134) 우상단 방송 창 118×230의 비율.
  static const int aspectWidth = 59;
  static const int aspectHeight = 115;

  @override
  LivePipState build() {
    final pip = ref.watch(pictureInPictureProvider);
    final subscription = pip.events.listen(_onEvent);
    ref.onDispose(() {
      _session++;
      subscription.cancel();
      unawaited(pip.close());
    });
    return const LivePipState();
  }

  /// [source] 방송을 작은 창으로 띄운다. 경매 상세에 들어온 직후 한 번 부른다.
  Future<void> present(LivePipSource source) async {
    final session = ++_session;
    final pip = ref.read(pictureInPictureProvider);
    state = LivePipState(source: source);

    final image = source.broadcastImage;
    final support = image == null
        ? PipSupport.unsupported
        : await pip.support();
    if (!_isCurrent(session)) return;
    _support = support;

    switch (support) {
      case PipSupport.overlay:
        // 창이 실제로 뜨면 events의 started가 systemOverlay로 바꾼다.
        final requested = await pip.show(_content(image!));
        if (_isCurrent(session) && !requested) {
          _present(LivePipPresentation.floating);
        }
      case PipSupport.appWindow:
        _present(LivePipPresentation.floating);
        await pip.enterOnLeave(_content(image!));
      case PipSupport.unsupported:
        _present(LivePipPresentation.floating);
    }
  }

  bool _isCurrent(int session) => ref.mounted && session == _session;

  PipContent _content(String image) => PipContent(
    image: image,
    aspectWidth: aspectWidth,
    aspectHeight: aspectHeight,
  );

  void _present(LivePipPresentation presentation) {
    if (state.source == null) return;
    state = state.copyWith(presentation: presentation);
  }

  void _onEvent(PipEvent event) {
    if (!ref.mounted) return;
    switch ((event, _support)) {
      case (PipEvent.started, PipSupport.overlay):
        _present(LivePipPresentation.systemOverlay);
      case (PipEvent.started, PipSupport.appWindow):
        _present(LivePipPresentation.systemAppWindow);
      // iOS 창을 닫거나(X) 앱으로 되돌렸다. 사용자가 닫은 창을 다시 띄우지 않는다.
      case (PipEvent.stopped, PipSupport.overlay):
        _present(LivePipPresentation.hidden);
      // Android PiP에서 앱으로 돌아왔다. 다시 앱 안 미니 플레이어다.
      case (PipEvent.stopped, PipSupport.appWindow):
      case (PipEvent.failed, _):
        _present(LivePipPresentation.floating);
      case (PipEvent.started || PipEvent.stopped, PipSupport.unsupported):
        break;
    }
  }
}

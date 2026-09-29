import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'live_pip_state.dart';

part 'minimized_live.g.dart';

/// 라이브 화면의 "화면 축소"로 작은 창(PiP)에 띄워 둔 방송. null이면 축소하지 않았다.
///
/// 축소하면 루트 탭이 다른 탭(홈)을 보이면서 이 방송을 작은 창으로 띄운다.
/// 라이브 탭으로 돌아가면 [restore]로 지운다. 탭 전환과 무관하게 살아 있어야
/// 하는 앱 수준 상태라 keepAlive다.
@Riverpod(keepAlive: true)
class MinimizedLive extends _$MinimizedLive {
  @override
  LivePipSource? build() => null;

  void minimize(LivePipSource source) => state = source;

  void restore() => state = null;
}

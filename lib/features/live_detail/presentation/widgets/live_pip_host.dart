import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../providers/live_pip_controller.dart';
import '../providers/live_pip_state.dart';
import 'live_floating_player.dart';
import 'live_pip_window.dart';

/// [source] 방송을 작은 창(PiP)으로 띄우는 동안 화면을 감싼다.
///
/// - [source]가 생기거나 바뀌면 [LivePipController.present]로 창을 띄우고,
///   null이 되거나 이 위젯이 사라지면 구독을 끊어 창을 닫는다.
/// - 앱 안 미니 플레이어는 [builder]의 `floatingPlayer`로 넘긴다. 화면을 꽉
///   채우는 층이므로 받은 쪽이 원하는 [Stack] 맨 위에 놓는다. 누르면 [onReturn].
/// - Android에서 앱 창이 PiP 창이 된 동안에는 방송만 그린다. 화면은 숨긴 채
///   그대로 두어 돌아왔을 때 다시 조회하거나 스크롤 위치를 잃지 않게 한다.
///
/// [source]가 바뀌어도 [builder] 결과의 위치는 그대로라 화면 상태가 유지된다.
class LivePipHost extends ConsumerStatefulWidget {
  const LivePipHost({
    super.key,
    required this.source,
    required this.builder,
    this.onReturn,
  });

  /// 작은 창으로 띄울 방송. null이면 띄우지 않는다.
  final LivePipSource? source;

  /// 미니 플레이어를 눌렀을 때. 라이브 화면으로 돌아간다.
  final VoidCallback? onReturn;

  final Widget Function(BuildContext context, Widget? floatingPlayer) builder;

  @override
  ConsumerState<LivePipHost> createState() => _LivePipHostState();
}

class _LivePipHostState extends ConsumerState<LivePipHost> {
  @override
  void initState() {
    super.initState();
    _present(widget.source);
  }

  @override
  void didUpdateWidget(covariant LivePipHost oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.source != oldWidget.source) _present(widget.source);
  }

  /// 사용자 탭에 대한 응답으로 한 번만 띄운다. build 중 상태 변경을 피한다.
  void _present(LivePipSource? source) {
    if (source == null) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted && widget.source == source) {
        ref.read(livePipControllerProvider.notifier).present(source);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // 띄울 방송이 없으면 구독하지 않는다. autoDispose로 창이 닫힌다.
    final pip = widget.source == null
        ? const LivePipState()
        : ref.watch(livePipControllerProvider);
    final image = resolveAppImageOrNull(pip.source?.broadcastImage);
    final inPipWindow = pip.presentation == LivePipPresentation.systemAppWindow;
    final floatingPlayer = pip.presentation == LivePipPresentation.floating
        ? LiveFloatingPlayer(image: image, onTap: widget.onReturn)
        : null;

    return Stack(
      fit: StackFit.expand,
      children: [
        Offstage(
          offstage: inPipWindow,
          child: TickerMode(
            enabled: !inPipWindow,
            child: widget.builder(context, floatingPlayer),
          ),
        ),
        if (inPipWindow) LivePipWindow(image: image),
      ],
    );
  }
}

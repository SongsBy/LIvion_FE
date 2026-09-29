import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// 경매 상세 위에 떠 있는 라이브 방송 미니 플레이어 (Figma 37:6134 우상단 118×230).
///
/// 부모 [Stack]을 꽉 채우는 층으로 놓는다. 처음에는 오른쪽 위에 있고, 끌어서 옮기면
/// 놓은 쪽 가장자리로 붙는다. 누르면 [onTap](라이브로 돌아가기)을 부른다.
/// 창 밖 빈 곳의 터치는 아래 화면으로 그대로 넘어간다.
class LiveFloatingPlayer extends StatefulWidget {
  const LiveFloatingPlayer({super.key, required this.image, this.onTap});

  /// 방송 화면. 영상이 붙으면 이 자리를 플레이어로 바꾼다.
  final ImageProvider? image;
  final VoidCallback? onTap;

  static const double width = 118;
  static const double height = 230;
  static const double _margin = AppSpacing.s20;
  static const Duration _snapDuration = Duration(milliseconds: 200);

  @override
  State<LiveFloatingPlayer> createState() => _LiveFloatingPlayerState();
}

class _LiveFloatingPlayerState extends State<LiveFloatingPlayer> {
  /// 창의 왼쪽 위. null이면 기본 자리(오른쪽 위)다.
  Offset? _offset;
  bool _dragging = false;

  @override
  Widget build(BuildContext context) {
    // extendBody로 아래 입찰 줄 뒤까지 늘어난 영역이면 그 높이만큼 비킨다.
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxLeft = constraints.maxWidth - LiveFloatingPlayer.width;
        final maxTop =
            constraints.maxHeight - bottomInset - LiveFloatingPlayer.height;
        Offset clamp(Offset o) => Offset(
          o.dx.clamp(0, maxLeft < 0 ? 0 : maxLeft),
          o.dy.clamp(0, maxTop < 0 ? 0 : maxTop),
        );
        final offset = clamp(
          _offset ??
              Offset(
                maxLeft - LiveFloatingPlayer._margin,
                LiveFloatingPlayer._margin,
              ),
        );

        // 한 프레임에 update와 end가 함께 오면(빠른 튕김) 이 build의 offset은
        // 이미 지난 값이다. 콜백은 항상 방금 바뀐 _offset부터 읽는다.
        Offset latest() => clamp(_offset ?? offset);

        void onDragEnd(DragEndDetails _) {
          // 가까운 쪽 가장자리로 붙인다.
          final current = latest();
          final snapLeft =
              current.dx + LiveFloatingPlayer.width / 2 <
              constraints.maxWidth / 2;
          setState(() {
            _dragging = false;
            _offset = clamp(
              Offset(
                snapLeft
                    ? LiveFloatingPlayer._margin
                    : maxLeft - LiveFloatingPlayer._margin,
                current.dy,
              ),
            );
          });
        }

        return Stack(
          children: [
            AnimatedPositioned(
              duration: _dragging
                  ? Duration.zero
                  : LiveFloatingPlayer._snapDuration,
              curve: Curves.easeOut,
              left: offset.dx,
              top: offset.dy,
              width: LiveFloatingPlayer.width,
              height: LiveFloatingPlayer.height,
              child: GestureDetector(
                onTap: widget.onTap,
                onPanStart: (_) => setState(() => _dragging = true),
                onPanUpdate: (d) =>
                    setState(() => _offset = clamp(latest() + d.delta)),
                onPanEnd: onDragEnd,
                child: Semantics(
                  button: true,
                  label: '라이브 방송으로 돌아가기',
                  child: _PlayerFrame(image: widget.image),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

/// radius 12 방송 화면 + 위쪽 어두운 그라데이션.
class _PlayerFrame extends StatelessWidget {
  const _PlayerFrame({required this.image});

  final ImageProvider? image;

  /// Figma: 6.07%에서 검정 60% → 24.19%에서 투명.
  static const List<double> _stops = [0.0607, 0.2419];

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        borderRadius: AppRadius.r12All,
        image: image == null
            ? null
            : DecorationImage(image: image!, fit: BoxFit.cover),
      ),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: AppRadius.r12All,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: _stops,
            colors: [AppColors.scrimBlack60, AppColors.scrimTransparent],
          ),
        ),
      ),
    );
  }
}

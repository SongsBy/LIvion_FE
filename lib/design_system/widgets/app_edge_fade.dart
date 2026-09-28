import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 스크롤 영역의 한쪽 가장자리를 서서히 투명하게 만들어 "더 있음"을 알린다.
///
/// [extent] 길이만큼 [edge] 쪽 끝이 투명 → 불투명으로 바뀐다. 색을 칠하지 않고
/// 알파만 깎으므로 어떤 배경 위에서도 쓸 수 있다.
class AppEdgeFade extends StatelessWidget {
  const AppEdgeFade({
    super.key,
    required this.child,
    this.edge = AppFadeEdge.top,
    this.extent = AppAvatarSize.xs,
  });

  final Widget child;
  final AppFadeEdge edge;

  /// 투명해지는 길이.
  final double extent;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        final fraction = (extent / rect.height).clamp(0.0, 1.0);
        return switch (edge) {
          AppFadeEdge.top => LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: const [AppColors.scrimTransparent, AppColors.neutral900],
            stops: [0, fraction],
          ),
          AppFadeEdge.bottom => LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: const [AppColors.scrimTransparent, AppColors.neutral900],
            stops: [0, fraction],
          ),
        }.createShader(rect);
      },
      child: child,
    );
  }
}

enum AppFadeEdge { top, bottom }

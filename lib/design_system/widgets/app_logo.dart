import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tokens/tokens.dart';

/// Livion 워드마크. 기본은 원본 색(#201E1D), [color]를 주면 단색으로 칠한다.
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width = defaultWidth, this.color});

  /// 상단 바·푸터에서 쓰는 고유 폭 (61.65 × 16.19).
  static const double defaultWidth = 61.65;
  static const double _aspectRatio = 61.65 / 16.19;

  final double width;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AppIcons.logoLivion,
      width: width,
      height: width / _aspectRatio,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
      semanticsLabel: 'Livion',
    );
  }
}

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tokens/tokens.dart';

/// SVG 아이콘. 단색 아이콘은 [color]로 칠하고, 원본 색을 유지하려면 null로 둔다.
class AppSvgIcon extends StatelessWidget {
  const AppSvgIcon(
    this.asset, {
    super.key,
    double size = AppIconSize.xl,
    this.color,
    this.semanticLabel,
  }) : width = size,
       height = size;

  /// 정사각형이 아닌 그림 ("✓" 11.75×9.5, 툴팁 꼬리 16.4×15).
  AppSvgIcon.sized(
    this.asset, {
    super.key,
    required Size size,
    this.color,
    this.semanticLabel,
  }) : width = size.width,
       height = size.height;

  final String asset;
  final double width;
  final double height;
  final Color? color;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      width: width,
      height: height,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(color!, BlendMode.srcIn),
      semanticsLabel: semanticLabel,
      excludeFromSemantics: semanticLabel == null,
    );
  }
}

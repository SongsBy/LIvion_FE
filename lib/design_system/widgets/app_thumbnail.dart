import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 썸네일 자리. 이미지가 없으면 회색(subtle) 박스.
class AppThumbnail extends StatelessWidget {
  const AppThumbnail({
    super.key,
    this.width,
    this.height,
    this.image,
    this.borderRadius = AppRadius.r4All,
    this.child,
  });

  const AppThumbnail.square({
    super.key,
    required double size,
    this.image,
    this.borderRadius = AppRadius.r4All,
    this.child,
  }) : width = size,
       height = size;

  final double? width;
  final double? height;
  final ImageProvider? image;
  final BorderRadius borderRadius;

  /// 썸네일 위에 겹쳐 그릴 내용 (뱃지 등).
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.backgroundSubtle,
        borderRadius: borderRadius,
        image: image == null
            ? null
            : DecorationImage(image: image!, fit: BoxFit.cover),
      ),
      child: child,
    );
  }
}

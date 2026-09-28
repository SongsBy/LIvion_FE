import 'package:flutter/widgets.dart';

import '../tokens/tokens.dart';
import 'app_logo.dart';

/// 오렌지 원(32) 안에 흰 Livion 로고. 공식 방송 카드의 판매자 아바타.
class AppBrandAvatar extends StatelessWidget {
  const AppBrandAvatar({super.key, this.size = AppAvatarSize.sm});

  final double size;

  /// Figma: 32 원 안의 로고 폭 24.73.
  static const double _logoRatio = 24.73 / 32;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.backgroundBrand,
        shape: BoxShape.circle,
      ),
      child: AppLogo(width: size * _logoRatio, color: AppColors.textInverse),
    );
  }
}

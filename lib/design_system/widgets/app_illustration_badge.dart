import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tokens/tokens.dart';

/// 흰 원(64) 안의 일러스트. Figma 결제 완료(37:5982) 상단 카드 그림.
///
/// Figma 컴포넌트는 그림 여러 개를 가로로 늘어놓고 원으로 잘라 보이는 방식이라,
/// 카드 그림이 원 안에서 왼쪽으로 1 벗어나 있는 위치까지 그대로 옮긴다.
class AppIllustrationBadge extends StatelessWidget {
  /// 결제 카드 그림.
  const AppIllustrationBadge.card({super.key, this.semanticLabel});

  final String? semanticLabel;

  static const double size = AppIconSize.illustrationBackdrop;

  // 카드 몸체 52×40이 원 안 (-1, 12)에 있고, 브랜드 원은 몸체의 (53.54%, 57.82%)에 있다.
  static const double _cardLeft = -1;
  static const double _cardTop = 12;
  static const double _cardWidth = 52;
  static const double _cardHeight = 40;
  static const double _brandWidth = 18.2762;
  static const double _brandHeight = 10.9832;
  static const double _brandLeft = _cardLeft + _cardWidth * 0.5354;
  static const double _brandTop = _cardTop + _cardHeight * 0.5782;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      image: true,
      label: semanticLabel,
      excludeSemantics: true,
      child: ClipOval(
        child: Container(
          width: size,
          height: size,
          color: AppColors.backgroundDefault,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: _cardLeft,
                top: _cardTop,
                child: SvgPicture.asset(
                  AppIcons.paymentCard,
                  width: _cardWidth,
                  height: _cardHeight,
                ),
              ),
              Positioned(
                left: _brandLeft,
                top: _brandTop,
                child: SvgPicture.asset(
                  AppIcons.paymentCardBrand,
                  width: _brandWidth,
                  height: _brandHeight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

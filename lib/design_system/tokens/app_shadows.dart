import 'package:flutter/painting.dart';

import 'app_colors.dart';

/// 그림자 토큰.
abstract final class AppShadows {
  /// 상품 카드 — drop-shadow(0 0 2px rgba(0,0,0,0.1))
  static const List<BoxShadow> card = [
    BoxShadow(color: AppColors.shadow, blurRadius: 2),
  ];
}

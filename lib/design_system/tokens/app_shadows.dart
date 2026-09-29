import 'package:flutter/painting.dart';

import 'app_colors.dart';

/// 그림자 토큰.
abstract final class AppShadows {
  /// 상품 카드 — drop-shadow(0 0 2px rgba(0,0,0,0.1))
  static const List<BoxShadow> card = [
    BoxShadow(color: AppColors.shadow, blurRadius: 2),
  ];

  /// 떠 있는 알약 (단계 표시) — drop-shadow(0 2px 4px rgba(0,0,0,0.08))
  static const List<BoxShadow> floating = [
    BoxShadow(color: AppColors.shadowSoft, offset: Offset(0, 2), blurRadius: 4),
  ];
}

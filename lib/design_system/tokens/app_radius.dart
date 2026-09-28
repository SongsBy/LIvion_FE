import 'package:flutter/painting.dart';

/// 모서리 radius 토큰.
abstract final class AppRadius {
  /// 2 — 등급 뱃지
  static const double r2 = 2;

  /// 4 — 뱃지, 버튼, 입력창, 작은 썸네일
  static const double r4 = 4;

  /// 6 — 라이브 썸네일, 상품 카드
  static const double r6 = 6;

  /// 8 — 판매자 카드, 스와치 타일
  static const double r8 = 8;

  /// 12 — 신뢰 안내 카드
  static const double r12 = 12;

  /// 16 — 갤러리 시트
  static const double r16 = 16;

  /// 17 — 알약 버튼 (높이 36의 절반 + 1)
  static const double pill = 17;

  /// 20 — 알약 버튼 (높이 40의 절반)
  static const double pillMd = 20;

  static const BorderRadius r2All = BorderRadius.all(Radius.circular(r2));
  static const BorderRadius r4All = BorderRadius.all(Radius.circular(r4));
  static const BorderRadius r6All = BorderRadius.all(Radius.circular(r6));
  static const BorderRadius r8All = BorderRadius.all(Radius.circular(r8));
  static const BorderRadius r12All = BorderRadius.all(Radius.circular(r12));
  static const BorderRadius r16All = BorderRadius.all(Radius.circular(r16));
  static const BorderRadius pillAll = BorderRadius.all(Radius.circular(pill));
  static const BorderRadius pillMdAll = BorderRadius.all(
    Radius.circular(pillMd),
  );
}

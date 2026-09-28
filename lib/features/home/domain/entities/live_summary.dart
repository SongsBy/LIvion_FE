import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:livion/shared/domain/inspection_grade.dart';

// 검수 등급은 라이브 상세와 공유하는 공통 개념이라 shared/domain에 있다.
// 기존 import 경로가 그대로 동작하도록 다시 내보낸다.
export 'package:livion/shared/domain/inspection_grade.dart';

part 'live_summary.freezed.dart';

/// 라이브 카드에 노출되는 대표 상품.
@freezed
abstract class LiveProduct with _$LiveProduct {
  const factory LiveProduct({
    required String name,
    required InspectionGrade grade,

    /// 현재가 (원, 정수).
    required int priceWon,

    /// 시작가 대비 배수. 없으면 표시하지 않는다.
    double? multiplier,

    /// 에셋 경로 또는 URL.
    String? thumbnail,
  }) = _LiveProduct;
}

/// 홈 목록용 라이브 요약. 상세 화면은 별도 계약을 따른다.
@freezed
abstract class LiveSummary with _$LiveSummary {
  const factory LiveSummary({
    required String id,
    required String sellerName,
    String? sellerAvatar,
    required String title,
    String? thumbnail,
    required int viewers,

    /// 카테고리 칩과 같은 이름 ("푸드", "뷰티" ...).
    required String category,

    /// 마감까지 남은 일수. null이면 D-day 뱃지를 보이지 않는다.
    int? dDay,
    @Default(false) bool isClosingSoon,
    @Default(false) bool isBookmarked,
    required LiveProduct product,
  }) = _LiveSummary;
}

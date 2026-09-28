import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/presentation/inspection_grade_ui.dart';

import '../../domain/entities/live_summary.dart';

/// domain 값을 디자인 시스템 카드가 받는 표시 값으로 바꾼다.
extension LiveSummaryUi on LiveSummary {
  String get viewersLabel => formatThousands(viewers);

  List<String> get tags => [
    if (isClosingSoon) '마감 임박',
    if (dDay != null) 'D-$dDay',
  ];

  ProductLineData get productLine => ProductLineData(
    name: product.name,
    grade: product.grade.toAppGrade(),
    price: formatThousands(product.priceWon),
    multiplier: product.multiplier == null
        ? null
        : formatMultiplier(product.multiplier!),
    thumbnail: resolveAppImageOrNull(product.thumbnail),
  );
}

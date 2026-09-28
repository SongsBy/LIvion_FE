import 'package:livion/design_system/design_system.dart';

import '../domain/inspection_grade.dart';

/// domain 등급을 디자인 시스템 [AppGrade]로 바꾼다.
extension InspectionGradeUi on InspectionGrade {
  AppGrade toAppGrade() => switch (this) {
    InspectionGrade.a => AppGrade.a,
    InspectionGrade.b => AppGrade.b,
    InspectionGrade.c => AppGrade.c,
  };
}

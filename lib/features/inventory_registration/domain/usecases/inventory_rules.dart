import 'package:livion/shared/domain/inspection_grade.dart';

import '../entities/inventory_listing.dart';

/// [today]부터 [date]까지 남은 날 수. 시각은 버리고 날짜만 센다 (지났으면 음수).
int daysUntil(DateTime date, {required DateTime today}) => DateTime.utc(
  date.year,
  date.month,
  date.day,
).difference(DateTime.utc(today.year, today.month, today.day)).inDays;

/// 입력값으로 예상 검수 등급을 매기는 규칙 (Figma 재고 등록 상태·검수 기준표).
///
/// | 기준     | A          | B          | C       |
/// | -------- | ---------- | ---------- | ------- |
/// | 소비기한 | D-30 이상  | D-8~29     | D-7 이하 |
/// | 외관     | 이상 없음  | 경미한 이상 | 외관 이상 |
/// | 포장     | 미개봉     | 재포장 외(벌크) | 재포장 |
///
/// 세 기준 중 가장 낮은 등급이 예상 등급이다. 실제 등급은 검수에서 확정된다.
abstract final class InspectionGradeRules {
  static const int gradeADays = 30;
  static const int gradeBDays = 8;

  static InspectionGrade forExpiry(int daysLeft) {
    if (daysLeft >= gradeADays) return InspectionGrade.a;
    if (daysLeft >= gradeBDays) return InspectionGrade.b;
    return InspectionGrade.c;
  }

  /// 아무것도 고르지 않았으면 null. 스크래치·라벨 훼손은 경미한 이상,
  /// 찌그러짐·기타는 외관 이상으로 본다.
  static InspectionGrade? forAppearance(Set<AppearanceCondition> conditions) {
    if (conditions.isEmpty) return null;
    if (conditions.contains(AppearanceCondition.dented) ||
        conditions.contains(AppearanceCondition.other)) {
      return InspectionGrade.c;
    }
    if (conditions.contains(AppearanceCondition.scratched) ||
        conditions.contains(AppearanceCondition.labelDamaged)) {
      return InspectionGrade.b;
    }
    return InspectionGrade.a;
  }

  static InspectionGrade forPackaging(PackagingCondition packaging) =>
      switch (packaging) {
        PackagingCondition.sealed => InspectionGrade.a,
        PackagingCondition.bulk => InspectionGrade.b,
        PackagingCondition.repackaged => InspectionGrade.c,
      };

  /// 세 기준이 모두 정해졌을 때만 가장 낮은 등급을 돌려준다.
  static InspectionGrade? estimate({
    int? daysLeft,
    required Set<AppearanceCondition> appearance,
    PackagingCondition? packaging,
  }) {
    final appearanceGrade = forAppearance(appearance);
    if (daysLeft == null || appearanceGrade == null || packaging == null) {
      return null;
    }
    return [
      forExpiry(daysLeft),
      appearanceGrade,
      forPackaging(packaging),
    ].reduce((a, b) => a.index >= b.index ? a : b);
  }
}

/// 외관 상태를 고른 대로 정리한다. "이상 없음"은 다른 항목과 함께 둘 수 없다.
Set<AppearanceCondition> toggledAppearance(
  Set<AppearanceCondition> current,
  AppearanceCondition condition,
) {
  if (current.contains(condition)) return {...current}..remove(condition);
  if (condition == AppearanceCondition.intact) return {condition};
  return {...current}
    ..remove(AppearanceCondition.intact)
    ..add(condition);
}

/// 편성 슬롯 종류와 편성료 규칙.
abstract final class BroadcastSlotRules {
  static const regularDays = {BroadcastWeekday.tue, BroadcastWeekday.thu};
  static const regularHour = 20;
  static const primeDays = {BroadcastWeekday.sat, BroadcastWeekday.sun};
  static const primeHour = 19;

  /// 프라임 편성료 범위 (원). 예상 정산에는 최소 금액을 쓴다.
  static const primeFeeMin = 100000;
  static const primeFeeMax = 300000;

  static BroadcastSlotKind kindOf(BroadcastSlot slot) {
    if (regularDays.contains(slot.weekday) && slot.hour == regularHour) {
      return BroadcastSlotKind.regular;
    }
    if (primeDays.contains(slot.weekday) && slot.hour == primeHour) {
      return BroadcastSlotKind.prime;
    }
    return BroadcastSlotKind.standard;
  }

  static int feeOf(BroadcastSlotKind? kind) =>
      kind == BroadcastSlotKind.prime ? primeFeeMin : 0;
}

/// 낙찰가 기준 예상 정산. 금액은 원 단위 정수.
class SettlementEstimate {
  const SettlementEstimate({
    required this.winningPrice,
    required this.commission,
    required this.slotFee,
  });

  /// 수수료율 12% (유찰 시 0원).
  static const int commissionPercent = 12;

  factory SettlementEstimate.of({
    required int winningPrice,
    BroadcastSlotKind? slotKind,
  }) => SettlementEstimate(
    winningPrice: winningPrice,
    // 원 미만은 반올림한다.
    commission: (winningPrice * commissionPercent + 50) ~/ 100,
    slotFee: BroadcastSlotRules.feeOf(slotKind),
  );

  final int winningPrice;
  final int commission;
  final int slotFee;

  int get payout => winningPrice - commission - slotFee;
}

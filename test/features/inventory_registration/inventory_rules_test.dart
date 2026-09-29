import 'package:flutter_test/flutter_test.dart';

import 'package:livion/features/inventory_registration/domain/entities/inventory_listing.dart';
import 'package:livion/features/inventory_registration/domain/usecases/inventory_rules.dart';
import 'package:livion/shared/domain/inspection_grade.dart';

void main() {
  group('InspectionGradeRules', () {
    test('소비기한은 30일 이상 A, 8~29일 B, 7일 이하 C', () {
      expect(InspectionGradeRules.forExpiry(30), InspectionGrade.a);
      expect(InspectionGradeRules.forExpiry(29), InspectionGrade.b);
      expect(InspectionGradeRules.forExpiry(8), InspectionGrade.b);
      expect(InspectionGradeRules.forExpiry(7), InspectionGrade.c);
      expect(InspectionGradeRules.forExpiry(-1), InspectionGrade.c);
    });

    test('외관은 이상 없음 A, 스크래치·라벨 훼손 B, 찌그러짐·기타 C', () {
      expect(InspectionGradeRules.forAppearance({}), isNull);
      expect(
        InspectionGradeRules.forAppearance({AppearanceCondition.intact}),
        InspectionGrade.a,
      );
      expect(
        InspectionGradeRules.forAppearance({AppearanceCondition.labelDamaged}),
        InspectionGrade.b,
      );
      expect(
        InspectionGradeRules.forAppearance({
          AppearanceCondition.scratched,
          AppearanceCondition.dented,
        }),
        InspectionGrade.c,
      );
    });

    test('예상 등급은 세 기준 중 가장 낮은 등급 (Figma: D-12 · 이상 없음 · 미개봉 = B)', () {
      expect(
        InspectionGradeRules.estimate(
          daysLeft: 12,
          appearance: {AppearanceCondition.intact},
          packaging: PackagingCondition.sealed,
        ),
        InspectionGrade.b,
      );
      expect(
        InspectionGradeRules.estimate(
          daysLeft: 40,
          appearance: {AppearanceCondition.intact},
          packaging: PackagingCondition.repackaged,
        ),
        InspectionGrade.c,
      );
    });

    test('기준이 하나라도 비면 예상 등급이 없다', () {
      expect(
        InspectionGradeRules.estimate(
          appearance: {AppearanceCondition.intact},
          packaging: PackagingCondition.sealed,
        ),
        isNull,
      );
      expect(
        InspectionGradeRules.estimate(
          daysLeft: 12,
          appearance: {},
          packaging: PackagingCondition.sealed,
        ),
        isNull,
      );
    });
  });

  test('이상 없음은 다른 외관 이상과 함께 고를 수 없다', () {
    var s = toggledAppearance({}, AppearanceCondition.scratched);
    s = toggledAppearance(s, AppearanceCondition.dented);
    expect(s, {AppearanceCondition.scratched, AppearanceCondition.dented});
    s = toggledAppearance(s, AppearanceCondition.intact);
    expect(s, {AppearanceCondition.intact});
    s = toggledAppearance(s, AppearanceCondition.other);
    expect(s, {AppearanceCondition.other});
    s = toggledAppearance(s, AppearanceCondition.other);
    expect(s, isEmpty);
  });

  test('daysUntil은 시각을 버리고 날짜만 센다', () {
    final today = DateTime(2026, 9, 14, 23, 59);
    expect(daysUntil(DateTime(2026, 9, 26), today: today), 12);
    expect(daysUntil(DateTime(2026, 9, 14, 1), today: today), 0);
    expect(daysUntil(DateTime(2026, 9, 13), today: today), -1);
  });

  group('BroadcastSlotRules', () {
    test('화·목 20:00은 정기, 토·일 19:00은 프라임, 나머지는 일반', () {
      BroadcastSlotKind kind(BroadcastWeekday d, int h) =>
          BroadcastSlotRules.kindOf(BroadcastSlot(weekday: d, hour: h));
      expect(kind(BroadcastWeekday.tue, 20), BroadcastSlotKind.regular);
      expect(kind(BroadcastWeekday.thu, 20), BroadcastSlotKind.regular);
      expect(kind(BroadcastWeekday.sun, 19), BroadcastSlotKind.prime);
      expect(kind(BroadcastWeekday.tue, 19), BroadcastSlotKind.standard);
      expect(kind(BroadcastWeekday.mon, 20), BroadcastSlotKind.standard);
    });
  });

  group('SettlementEstimate', () {
    test('Figma: 낙찰가 7,900원 · 수수료 12% 948원 · 정기 0원 → 6,952원', () {
      final e = SettlementEstimate.of(
        winningPrice: 7900,
        slotKind: BroadcastSlotKind.regular,
      );
      expect(e.commission, 948);
      expect(e.slotFee, 0);
      expect(e.payout, 6952);
    });

    test('프라임 슬롯은 최소 편성료를 뺀다', () {
      final e = SettlementEstimate.of(
        winningPrice: 500000,
        slotKind: BroadcastSlotKind.prime,
      );
      expect(e.slotFee, BroadcastSlotRules.primeFeeMin);
      expect(e.payout, 500000 - 60000 - 100000);
    });

    test('수수료는 원 미만을 반올림한다', () {
      expect(SettlementEstimate.of(winningPrice: 1004).commission, 120);
      expect(SettlementEstimate.of(winningPrice: 1005).commission, 121);
    });
  });
}

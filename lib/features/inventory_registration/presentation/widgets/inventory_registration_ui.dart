import 'package:livion/core/formatting/number_format.dart';
import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/domain/inspection_grade.dart';
import 'package:livion/shared/presentation/inspection_grade_ui.dart';

import '../../domain/entities/inventory_listing.dart';
import '../../domain/usecases/inventory_rules.dart';
import '../providers/inventory_registration_controller.dart';

/// 재고 등록 화면 문구. 도메인 값은 문구를 모르고 여기서만 바꾼다.

extension InventoryRegistrationStepLabel on InventoryRegistrationStep {
  String get label => switch (this) {
    InventoryRegistrationStep.basic => '기본 정보',
    InventoryRegistrationStep.condition => '상태·검수',
    InventoryRegistrationStep.pricing => '방송·가격',
    InventoryRegistrationStep.review => '검토',
  };
}

extension InventoryPhotoSlotLabel on InventoryPhotoSlot {
  /// 사진 칸 아래 이름.
  String get label => switch (this) {
    InventoryPhotoSlot.front => '정면',
    InventoryPhotoSlot.expiryLabel => '소비기한 라벨',
    InventoryPhotoSlot.packaging => '포장 상태',
    InventoryPhotoSlot.contents => '내용물',
  };

  /// 검토 화면 "사진 제공" 줄의 이름.
  String get reviewLabel => switch (this) {
    InventoryPhotoSlot.front => '정면 사진',
    _ => label,
  };
}

extension StorageConditionLabel on StorageCondition {
  String get label => switch (this) {
    StorageCondition.roomTemperature => '상온',
    StorageCondition.refrigerated => '냉장',
    StorageCondition.frozen => '냉동',
  };
}

extension InventoryStockTypeLabel on InventoryStockType {
  String get label => switch (this) {
    InventoryStockType.imminent => '임박',
    InventoryStockType.surplus => '과잉',
    InventoryStockType.refurbished => '리퍼브',
  };
}

extension AppearanceConditionLabel on AppearanceCondition {
  String get label => switch (this) {
    AppearanceCondition.intact => '이상 없음',
    AppearanceCondition.scratched => '스크래치',
    AppearanceCondition.dented => '찌그러짐',
    AppearanceCondition.labelDamaged => '라벨 훼손',
    AppearanceCondition.other => '기타',
  };
}

extension PackagingConditionLabel on PackagingCondition {
  String get label => switch (this) {
    PackagingCondition.sealed => '미개봉',
    PackagingCondition.repackaged => '재포장',
    PackagingCondition.bulk => '벌크',
  };
}

extension BroadcastChannelLabel on BroadcastChannel {
  String get title => switch (this) {
    BroadcastChannel.official => 'Livion 공식 방송에 위탁',
    BroadcastChannel.own => '내 채널에서 직접 방송',
  };

  String get caption => switch (this) {
    BroadcastChannel.official =>
      '검수·진행·CS 대행 · 수수료 ${SettlementEstimate.commissionPercent}% (유찰 시 0원)',
    BroadcastChannel.own => '방송 툴 제공 · 검수 등급은 동일 적용',
  };
}

extension BroadcastWeekdayLabel on BroadcastWeekday {
  String get label => switch (this) {
    BroadcastWeekday.mon => '월',
    BroadcastWeekday.tue => '화',
    BroadcastWeekday.wed => '수',
    BroadcastWeekday.thu => '목',
    BroadcastWeekday.fri => '금',
    BroadcastWeekday.sat => '토',
    BroadcastWeekday.sun => '일',
  };
}

extension BroadcastSlotKindLabel on BroadcastSlotKind {
  /// 시각 칸 앞 뱃지·검토 문구. 일반 시간은 표시하지 않는다.
  String? get label => switch (this) {
    BroadcastSlotKind.regular => '정기',
    BroadcastSlotKind.prime => '프라임',
    BroadcastSlotKind.standard => null,
  };
}

extension InventoryRegistrationIssueMessage on InventoryRegistrationIssue {
  String get message => switch (this) {
    InventoryRegistrationIssue.photosMissing => '정면과 소비기한 라벨 사진을 올려 주세요.',
    InventoryRegistrationIssue.productNameMissing => '상품명을 입력해 주세요.',
    InventoryRegistrationIssue.categoryMissing => '카테고리를 골라 주세요.',
    InventoryRegistrationIssue.sizeMissing => '규격을 입력해 주세요.',
    InventoryRegistrationIssue.supplyQuantityMissing => '회당 공급 수량을 입력해 주세요.',
    InventoryRegistrationIssue.expiryMissing => '소비기한을 골라 주세요.',
    InventoryRegistrationIssue.storageMissing => '보관 조건을 골라 주세요.',
    InventoryRegistrationIssue.stockTypeMissing => '재고 유형을 골라 주세요.',
    InventoryRegistrationIssue.appearanceMissing => '외관 상태를 골라 주세요.',
    InventoryRegistrationIssue.packagingMissing => '포장 상태를 골라 주세요.',
    InventoryRegistrationIssue.startPriceMissing => '시작가를 입력해 주세요.',
    InventoryRegistrationIssue.bidIncrementMissing => '호가 단위를 골라 주세요.',
    InventoryRegistrationIssue.minimumPriceMissing => '최저 낙찰 허용가를 입력해 주세요.',
    InventoryRegistrationIssue.consentMissing => '검수 결과에 따른 변경 안내를 확인해 주세요.',
  };
}

/// 값이 없을 때 검토 화면에 보이는 자리 표시.
const emptyValue = '-';

/// 1204 → "1,204원".
String formatWon(int won) => '${formatThousands(won)}원';

/// 20 → "20:00".
String formatSlotHour(int hour) => '${hour.toString().padLeft(2, '0')}:00';

/// 소비기한까지 남은 날 → "D-12", 당일 "D-DAY", 지나면 "D+3".
String formatDDay(int daysLeft) => switch (daysLeft) {
  0 => 'D-DAY',
  > 0 => 'D-$daysLeft',
  _ => 'D+${-daysLeft}',
};

/// "화 20:00 정기". 일반 시간은 종류를 붙이지 않는다.
String formatSlot(BroadcastSlot slot) => [
  slot.weekday.label,
  formatSlotHour(slot.hour),
  ?BroadcastSlotRules.kindOf(slot).label,
].join(' ');

/// "외관 이상 없음" 또는 고른 이상 "스크래치·찌그러짐".
String appearanceSummary(Set<AppearanceCondition> appearance) =>
    appearance.contains(AppearanceCondition.intact)
    ? '외관 이상 없음'
    : [
        for (final c in AppearanceCondition.values)
          if (appearance.contains(c)) c.label,
      ].join('·');

/// 예상 검수 등급 상자 문구 ("B 범위 · 외관 이상 없음 · 미개봉").
String gradeCaption(InventoryRegistrationState state, InspectionGrade? grade) {
  if (grade == null) return '소비기한·외관·포장 상태를 고르면 예상 등급이 보여요';
  return [
    '${grade.toAppGrade().label} 범위',
    appearanceSummary(state.appearance),
    state.packaging!.label,
  ].join(' · ');
}

/// 등급 기준표 열 (A, B, C).
final gradeColumns = [
  for (final g in InspectionGrade.values) g.toAppGrade().label,
];

/// 등급 기준표. 지금 값이 해당하는 칸을 강조한다.
List<AppCriteriaRow> gradeCriteriaRows(
  InventoryRegistrationState state,
  DateTime today,
) {
  final days = state.daysLeft(today);
  final packaging = state.packaging;
  return [
    AppCriteriaRow(
      cells: const ['D-30 이상', 'D-8~29', 'D-7'],
      highlightedIndex: days == null
          ? null
          : InspectionGradeRules.forExpiry(days).index,
    ),
    AppCriteriaRow(
      cells: const ['외관 양호', '경미한 이상', '외관 이상'],
      highlightedIndex: InspectionGradeRules.forAppearance(
        state.appearance,
      )?.index,
    ),
    AppCriteriaRow(
      cells: const ['미개봉', '재포장 외', '재포장'],
      highlightedIndex: packaging == null
          ? null
          : InspectionGradeRules.forPackaging(packaging).index,
    ),
  ];
}

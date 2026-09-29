import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:livion/shared/domain/inspection_grade.dart';

part 'inventory_listing.freezed.dart';

/// 재고 사진 칸. [isRequired]인 칸은 검수에 꼭 필요하다.
enum InventoryPhotoSlot {
  front(isRequired: true),
  expiryLabel(isRequired: true),
  packaging(isRequired: false),
  contents(isRequired: false);

  const InventoryPhotoSlot({required this.isRequired});

  final bool isRequired;
}

/// 보관 조건.
enum StorageCondition { roomTemperature, refrigerated, frozen }

/// 재고 유형.
enum InventoryStockType { imminent, surplus, refurbished }

/// 외관 상태 (여러 개 선택). [intact]는 다른 항목과 함께 고를 수 없다.
enum AppearanceCondition { intact, scratched, dented, labelDamaged, other }

/// 포장 상태.
enum PackagingCondition { sealed, repackaged, bulk }

/// 방송 구분.
enum BroadcastChannel {
  /// Livion 공식 방송에 위탁 — 검수·진행·CS 대행, 수수료 12%.
  official,

  /// 내 채널에서 직접 방송 — 방송 툴 제공.
  own,
}

/// 편성 요일 (월요일부터).
enum BroadcastWeekday { mon, tue, wed, thu, fri, sat, sun }

/// 편성 슬롯 종류. 편성료가 다르다.
enum BroadcastSlotKind {
  /// 정기 슬롯 (화·목 20:00) — 편성료 없음.
  regular,

  /// 프라임 슬롯 (토·일 19:00) — 편성료 있음.
  prime,

  /// 그 밖의 시간.
  standard,
}

/// 희망 편성 슬롯 한 칸 (요일 + 시작 시각).
@freezed
abstract class BroadcastSlot with _$BroadcastSlot {
  const factory BroadcastSlot({
    required BroadcastWeekday weekday,

    /// 24시간제 시작 시각 (19, 20, 21).
    required int hour,
  }) = _BroadcastSlot;
}

/// 가격 입력 안내. 금액은 원 단위 정수.
@freezed
abstract class PricingGuide with _$PricingGuide {
  const factory PricingGuide({
    /// 권장 시작가.
    required int recommendedStartPrice,

    /// 유사 품목 최근 낙찰가 ÷ 시작가 평균 (2.3).
    required double similarItemMultiplier,

    /// 예상 정산을 계산할 기준 낙찰가.
    required int referenceWinningPrice,
  }) = _PricingGuide;
}

/// 재고 등록 폼의 선택지. 서버가 정한다.
@freezed
abstract class InventoryFormOptions with _$InventoryFormOptions {
  const factory InventoryFormOptions({
    /// "임박식품 > 냉동" 같은 표시용 경로.
    required List<String> categories,
    required List<String> brands,

    /// 고를 수 있는 호가 단위 (원).
    required List<int> bidIncrements,

    /// 편성 시작 시각 선택지 (19, 20, 21).
    required List<int> slotHours,
    required PricingGuide pricingGuide,
  }) = _InventoryFormOptions;
}

/// 검수·편성을 신청할 재고 한 건.
///
/// 사진은 올린 파일 경로(데모는 번들 에셋 경로)다. 금액·수량은 정수.
@freezed
abstract class InventoryListing with _$InventoryListing {
  const factory InventoryListing({
    required Map<InventoryPhotoSlot, String> photos,
    required String productName,
    required String category,
    required String size,
    required int supplyQuantity,
    String? brand,
    required DateTime expiryDate,
    required StorageCondition storage,
    required InventoryStockType stockType,
    required Set<AppearanceCondition> appearance,
    required PackagingCondition packaging,
    required BroadcastChannel channel,
    BroadcastSlot? slot,
    required int startPrice,
    required int bidIncrement,

    /// 이 금액보다 낮으면 유찰. null이면 설정하지 않는다.
    int? minimumWinningPrice,
  }) = _InventoryListing;
}

/// 등록 접수 결과.
@freezed
abstract class InventoryListingReceipt with _$InventoryListingReceipt {
  const factory InventoryListingReceipt({
    /// 재고 번호 ("L-260929-0001").
    required String listingId,

    /// 예상 검수 등급. 실제 등급은 검수 후 확정된다.
    InspectionGrade? estimatedGrade,
  }) = _InventoryListingReceipt;
}

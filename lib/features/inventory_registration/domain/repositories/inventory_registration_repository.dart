import '../entities/inventory_listing.dart';

/// 재고 등록 데이터 계약.
///
/// 지금은 데모 구현만 있고, API가 확정되면 data/에 remote 구현을 추가해
/// `inventory_registration_dependencies.dart`에서만 교체한다.
abstract interface class InventoryRegistrationRepository {
  /// 카테고리·브랜드·호가 단위·편성 시각·가격 안내.
  Future<InventoryFormOptions> fetchFormOptions();

  /// 검수를 요청하고 편성을 신청한다.
  Future<InventoryListingReceipt> submitListing(InventoryListing listing);
}

/// 재고 사진을 찍거나 고른다. 고른 사진의 경로를 돌려주고, 고르지 않았으면 null.
abstract interface class InventoryPhotoSource {
  Future<String?> pick(InventoryPhotoSlot slot);
}

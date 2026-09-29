import '../../domain/entities/inventory_listing.dart';

/// 데모 발표용 재고 등록 데이터. Figma(37:1640 ~ 37:2076)의 값을 따른다.
abstract final class InventoryRegistrationDemoData {
  static const options = InventoryFormOptions(
    categories: [
      '임박식품 > 냉동',
      '임박식품 > 냉장',
      '임박식품 > 상온',
      '생활용품',
      '리퍼브 가전',
      '이월 의류',
    ],
    brands: ['풀무원', 'CJ제일제당', '오뚜기', '농심', '동원F&B', '기타'],
    bidIncrements: [100, 500, 1000],
    slotHours: [19, 20, 21],
    pricingGuide: PricingGuide(
      recommendedStartPrice: 3000,
      similarItemMultiplier: 2.3,
      referenceWinningPrice: 7900,
    ),
  );

  /// 사진 칸을 누르면 바로 채워 보일 예시 사진. 없는 칸은 촬영 준비 중이다.
  static const samplePhotos = {
    InventoryPhotoSlot.front: 'asset/images/demo/inventory_front.jpg',
    InventoryPhotoSlot.expiryLabel: 'asset/images/demo/inventory_label.jpg',
  };
}

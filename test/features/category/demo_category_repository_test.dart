import 'package:flutter_test/flutter_test.dart';

import 'package:livion/features/category/data/repositories/demo_category_repository.dart';

void main() {
  const repo = DemoCategoryRepository(latency: Duration.zero);

  test('대분류 목록은 ALL을 맨 앞에 두고 푸드를 처음 선택한다', () async {
    final catalog = await repo.fetchCatalog();
    expect(catalog.categories.first.mark, 'ALL');
    expect(catalog.initialCategoryId, 'food');
    expect(catalog.categories.map((c) => c.name), [
      '전체',
      '푸드',
      '뷰티',
      '리빙',
      '패션',
      '테크',
      '여행',
      '키즈',
    ]);
  });

  test('푸드 "전체"는 Figma의 BEST 3 · 판매자 6 · 라이브 6을 돌려준다', () async {
    final feed = await repo.fetchFeed(categoryId: 'food');
    expect(feed.bestLives, hasLength(3));
    expect(feed.popularSellers, hasLength(6));
    expect(feed.lives, hasLength(6));
    expect(
      feed.lives.where((l) => l.isOfficial).single.sellerName,
      'Livion 공식',
    );
  });

  test('하위 분류는 BEST와 라이브를 거르고 판매자는 그대로 둔다', () async {
    final feed = await repo.fetchFeed(categoryId: 'food', subcategory: '축산물');
    expect(feed.bestLives.map((l) => l.sellerName), ['싱싱마트']);
    expect(feed.lives.map((l) => l.sellerName), ['한빛식품']);
    expect(feed.popularSellers, hasLength(6));
  });

  test('데모 내용이 없는 대분류는 빈 본문', () async {
    final feed = await repo.fetchFeed(categoryId: 'beauty');
    expect(feed.bestLives, isEmpty);
    expect(feed.lives, isEmpty);
  });
}

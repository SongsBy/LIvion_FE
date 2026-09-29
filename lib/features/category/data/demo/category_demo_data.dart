import 'package:livion/features/home/data/demo/home_demo_assets.dart';

import '../../domain/entities/category_feed.dart';
import '../../domain/entities/product_category.dart';
import 'category_demo_assets.dart';

/// Figma 카테고리 화면(node 37:7032)의 내용을 옮긴 데모 데이터.
///
/// 내용은 "푸드"에만 있다. "전체"는 푸드와 같은 목록을, 나머지 대분류는 빈 본문을 돌려준다.
abstract final class CategoryDemoData {
  static const String allId = 'all';
  static const String foodId = 'food';

  static const catalog = CategoryCatalog(
    initialCategoryId: foodId,
    categories: [
      ProductCategory(id: allId, name: '전체', mark: 'ALL'),
      ProductCategory(
        id: foodId,
        name: '푸드',
        icon: CategoryDemoAssets.iconFood,
        subcategories: [
          '전체',
          '농산물',
          '건강식품',
          '축산물',
          '음료',
          '냉동/간편조리식품',
          '밀키트',
          '베이커리',
          '스낵/과자',
          '주류',
        ],
      ),
      ProductCategory(
        id: 'beauty',
        name: '뷰티',
        icon: CategoryDemoAssets.iconBeauty,
      ),
      ProductCategory(
        id: 'living',
        name: '리빙',
        icon: CategoryDemoAssets.iconLiving,
      ),
      ProductCategory(
        id: 'fashion',
        name: '패션',
        icon: CategoryDemoAssets.iconFashion,
      ),
      ProductCategory(
        id: 'tech',
        name: '테크',
        icon: CategoryDemoAssets.iconTech,
      ),
      ProductCategory(
        id: 'travel',
        name: '여행',
        icon: CategoryDemoAssets.iconTravel,
      ),
      ProductCategory(
        id: 'kids',
        name: '키즈',
        icon: CategoryDemoAssets.iconKids,
      ),
    ],
  );

  /// 데모 하위 분류 필터용. 실제로는 서버가 걸러서 준다.
  static const subcategoryOf = <String, String>{
    'cat-best-1': '건강식품',
    'cat-best-2': '냉동/간편조리식품',
    'cat-best-3': '축산물',
    'cat-live-1': '축산물',
    'cat-live-2': '베이커리',
    'cat-live-3': '농산물',
    'cat-live-4': '냉동/간편조리식품',
  };

  static const food = CategoryFeed(
    bestLives: [
      LiveSummary(
        id: 'cat-best-1',
        sellerName: '굿모닝유통',
        sellerAvatar: HomeDemoAssets.avatarGoodmorning,
        title: '(마감 임박) 견과믹스 특가 판매',
        thumbnail: HomeDemoAssets.liveNuts,
        viewers: 312,
        category: '푸드',
        dDay: 25,
        isBookmarked: true,
        product: LiveProduct(
          name: '견과믹스 20봉',
          grade: InspectionGrade.b,
          priceWon: 4500,
          multiplier: 2.6,
          thumbnail: HomeDemoAssets.productNuts,
        ),
      ),
      LiveSummary(
        id: 'cat-best-2',
        sellerName: '한빛식품',
        sellerAvatar: HomeDemoAssets.avatarHanbitAlt,
        title: '냉동 식품 급처분 - 간편식품 피자 4판',
        thumbnail: HomeDemoAssets.livePizza,
        viewers: 208,
        category: '푸드',
        dDay: 5,
        isClosingSoon: true,
        product: LiveProduct(
          name: '냉동피자 4판',
          grade: InspectionGrade.a,
          priceWon: 6000,
          multiplier: 1.45,
          thumbnail: HomeDemoAssets.productPizza,
        ),
      ),
      LiveSummary(
        id: 'cat-best-3',
        sellerName: '싱싱마트',
        sellerAvatar: HomeDemoAssets.avatarSingsing,
        title: '북경식 로스팅 오리 7,500 초특가',
        thumbnail: HomeDemoAssets.liveDuck,
        viewers: 208,
        category: '푸드',
        dDay: 25,
        isClosingSoon: true,
        product: LiveProduct(
          name: '북경식 로스팅 오리',
          grade: InspectionGrade.a,
          priceWon: 126000,
          multiplier: 134,
          thumbnail: HomeDemoAssets.productDuck,
        ),
      ),
    ],
    popularSellers: [
      CategorySeller(
        id: 'seller-haedam',
        name: '해담수산',
        avatar: HomeDemoAssets.avatarHaedam,
        isLive: true,
      ),
      CategorySeller(
        id: 'seller-nakwon',
        name: '낙원식품',
        avatar: HomeDemoAssets.avatarNakwon,
        isLive: true,
      ),
      CategorySeller(
        id: 'seller-hanbit',
        name: '한빛식품',
        avatar: HomeDemoAssets.avatarHanbitAlt,
        isLive: true,
      ),
      CategorySeller(
        id: 'seller-goodmorning',
        name: '굿모닝유통',
        avatar: HomeDemoAssets.avatarGoodmorning,
        isLive: true,
      ),
      CategorySeller(
        id: 'seller-daily',
        name: '데일리마트',
        avatar: HomeDemoAssets.avatarDaily,
        isLive: true,
      ),
      CategorySeller(
        id: 'seller-refresh',
        name: '리프레시몰',
        avatar: HomeDemoAssets.avatarRefresh,
        isLive: true,
      ),
    ],
    lives: [
      LiveSummary(
        id: 'cat-live-1',
        sellerName: '한빛식품',
        sellerAvatar: HomeDemoAssets.avatarHanbitAlt,
        title: '안심한우 선물세트 추석 선물 고민 주말에 끝',
        thumbnail: HomeDemoAssets.liveHanwoo,
        viewers: 4321,
        category: '푸드',
        dDay: 25,
        isBookmarked: true,
        product: LiveProduct(
          name: '안심한우 선물세트',
          grade: InspectionGrade.a,
          priceWon: 89500,
          multiplier: 4.8,
          thumbnail: HomeDemoAssets.liveHanwoo,
        ),
      ),
      LiveSummary(
        id: 'cat-live-2',
        sellerName: '낙원식품',
        sellerAvatar: HomeDemoAssets.avatarNakwon,
        title: '[추석 특집] 팔도 진짜배기 떡 한 상',
        thumbnail: HomeDemoAssets.liveRiceCake,
        viewers: 208,
        category: '푸드',
        dDay: 8,
        isClosingSoon: true,
        product: LiveProduct(
          name: '명품 10호 떡선물세트',
          grade: InspectionGrade.a,
          priceWon: 134000,
          multiplier: 1.45,
          thumbnail: HomeDemoAssets.productRiceCake,
        ),
      ),
      LiveSummary(
        id: 'cat-live-3',
        sellerName: '청정농산',
        sellerAvatar: HomeDemoAssets.avatarCheongjeong,
        title: '[부산 씨테라스&씨라까따] 부산 관광지 10종 패키지',
        thumbnail: CategoryDemoAssets.liveMelon,
        viewers: 363,
        category: '푸드',
        dDay: 6,
        isClosingSoon: true,
        product: LiveProduct(
          name: '당일수확 참외 가정용 중소과 3kg(과일 실중량)',
          grade: InspectionGrade.a,
          priceWon: 11900,
          multiplier: 3.2,
          thumbnail: CategoryDemoAssets.productMelon,
        ),
      ),
      LiveSummary(
        id: 'cat-live-4',
        sellerName: 'Livion 공식',
        title: '화요일 공식 방송 · 냉동식품 5종 급처분',
        thumbnail: HomeDemoAssets.heroOfficial,
        viewers: 208,
        category: '푸드',
        dDay: 6,
        isClosingSoon: true,
        isOfficial: true,
        product: LiveProduct(
          name: '냉동만두 1.2kg',
          grade: InspectionGrade.a,
          priceWon: 4500,
          multiplier: 2.6,
          thumbnail: HomeDemoAssets.productDumpling,
        ),
      ),
      LiveSummary(
        id: 'cat-live-5',
        sellerName: '청해수산',
        sellerAvatar: HomeDemoAssets.avatarCheonghae,
        title: '밥도둑 총출동! 신선 수산물 장보기',
        thumbnail: HomeDemoAssets.liveGalchi,
        viewers: 363,
        category: '푸드',
        dDay: 6,
        isClosingSoon: true,
        product: LiveProduct(
          name: '제주 은갈치 특대 4미',
          grade: InspectionGrade.a,
          priceWon: 126000,
          multiplier: 3.2,
          thumbnail: HomeDemoAssets.liveGalchi,
        ),
      ),
      LiveSummary(
        id: 'cat-live-6',
        sellerName: '해담수산',
        sellerAvatar: HomeDemoAssets.avatarHaedam,
        title: '지금이 제일 맛있을 때, 제철 수산물 모음',
        thumbnail: HomeDemoAssets.liveSeafood,
        viewers: 208,
        category: '푸드',
        dDay: 6,
        isClosingSoon: true,
        product: LiveProduct(
          name: '국내산 손질 고등어 5팩',
          grade: InspectionGrade.b,
          priceWon: 6000,
          multiplier: 2.6,
          thumbnail: HomeDemoAssets.productMackerel,
        ),
      ),
    ],
  );
}

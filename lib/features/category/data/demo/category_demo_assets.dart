/// 카테고리 화면(Figma node 37:7032)에만 있는 데모 이미지 경로.
///
/// 홈과 같은 사진은 `HomeDemoAssets`를 그대로 쓴다.
/// API 연동 후에는 서버 URL이 이 자리를 대신하므로 data/demo 밖에서 쓰지 않는다.
abstract final class CategoryDemoAssets {
  static const String _dir = 'asset/images/demo';

  // 대분류 아이콘. Figma 54 원 안의 배치(크기·위치)를 그대로 담은 정사각 그림.
  static const String iconFood = '$_dir/category_food.png';
  static const String iconBeauty = '$_dir/category_beauty.png';
  static const String iconLiving = '$_dir/category_living.png';
  static const String iconFashion = '$_dir/category_fashion.png';
  static const String iconTech = '$_dir/category_tech.png';
  static const String iconTravel = '$_dir/category_travel.png';
  static const String iconKids = '$_dir/category_kids.png';

  // 청정농산 참외 라이브
  static const String liveMelon = '$_dir/live_melon.jpg';
  static const String productMelon = '$_dir/product_melon.jpg';
}

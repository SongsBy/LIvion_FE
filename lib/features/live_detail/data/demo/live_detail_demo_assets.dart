/// 데모 발표용 이미지 에셋 경로 (Figma 라이브 디테일 node 26:238 · 경매 상세 37:6134 원본).
///
/// 방송 화면 사진은 영상이 붙으면 스트림으로 대체된다. data/demo 밖에서 쓰지 않는다.
abstract final class LiveDetailDemoAssets {
  static const String _dir = 'asset/images/demo';

  /// 방송 화면 (Figma image 13). 추후 동영상으로 교체.
  static const String broadcastDumpling = '$_dir/live_broadcast_dumpling.jpg';

  static const String avatarHanbit = '$_dir/avatar_hanbit.jpg';
  static const String chatAvatarKim = '$_dir/chat_avatar_kim.jpg';
  static const String productDumpling = '$_dir/product_dumpling.jpg';

  /// 경매 상세(Figma 37:6134) 상품 사진 2·3번째.
  static const String productNuts = '$_dir/product_nuts.jpg';
  static const String productPizza = '$_dir/product_pizza.jpg';
}

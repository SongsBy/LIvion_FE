import 'package:livion/features/home/data/demo/home_demo_assets.dart';

import '../../domain/entities/account_profile.dart';

/// 데모 사용자: 처음에는 구매자 계정만 있고, 판매자 전환을 마치면
/// [seller] 상점 계정이 생긴다.
abstract final class AccountDemoData {
  static const String buyerId = 'me';
  static const String sellerId = 'store-hanbit';

  static const buyer = AccountProfile(
    id: buyerId,
    name: '홍길동',
    role: AccountRole.buyer,
  );

  static const seller = AccountProfile(
    id: sellerId,
    name: '한빛식품',
    avatar: HomeDemoAssets.avatarHanbitAlt,
    role: AccountRole.seller,
  );
}

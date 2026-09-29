import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/followed_seller.dart';

/// "팔로우한 판매자" 가로 목록. 그리기는 [AppLiveAvatarList]가 맡는다.
class FollowedSellerRow extends StatelessWidget {
  const FollowedSellerRow({super.key, required this.sellers, this.onTap});

  final List<FollowedSeller> sellers;
  final ValueChanged<FollowedSeller>? onTap;

  @override
  Widget build(BuildContext context) {
    return AppLiveAvatarList(
      items: [
        for (final s in sellers)
          AppLiveAvatarItem(
            name: s.name,
            image: resolveAppImageOrNull(s.avatar),
            isLive: s.isLive,
          ),
      ],
      onTap: onTap == null ? null : (i) => onTap!(sellers[i]),
    );
  }
}

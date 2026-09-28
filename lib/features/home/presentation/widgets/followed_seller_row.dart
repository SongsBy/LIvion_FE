import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/followed_seller.dart';

/// "팔로우한 판매자" 가로 목록. 아바타(62×66) + 이름.
class FollowedSellerRow extends StatelessWidget {
  const FollowedSellerRow({super.key, required this.sellers, this.onTap});

  final List<FollowedSeller> sellers;
  final ValueChanged<FollowedSeller>? onTap;

  /// 아바타 66 + 간격 8 + 이름 12.
  static const double _itemHeight = AppLiveAvatar.height + AppSpacing.s8 + 12;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _itemHeight + AppSpacing.s4,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          left: AppSpacing.s16,
          right: AppSpacing.s16,
          bottom: AppSpacing.s4,
        ),
        itemCount: sellers.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.s12),
        itemBuilder: (_, i) => _SellerTile(
          seller: sellers[i],
          onTap: onTap == null ? null : () => onTap!(sellers[i]),
        ),
      ),
    );
  }
}

class _SellerTile extends StatelessWidget {
  const _SellerTile({required this.seller, required this.onTap});

  final FollowedSeller seller;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: seller.isLive ? '${seller.name} 라이브 중' : seller.name,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.r8All,
        child: SizedBox(
          width: AppLiveAvatar.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppLiveAvatar(
                image: resolveAppImageOrNull(seller.avatar),
                isLive: seller.isLive,
              ),
              const SizedBox(height: AppSpacing.s8),
              ExcludeSemantics(
                child: Text(
                  seller.name,
                  style: AppTextStyles.pretendardCaption1Regular,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

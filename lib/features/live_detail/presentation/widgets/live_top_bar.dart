import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/live_detail.dart';
import 'follow_button.dart';

/// 영상 위 상단 줄: 뒤로가기 · 판매자(링 아바타 + 이름 + 공식 뱃지 + 팔로우) · 공유/더보기/축소.
///
/// 아이콘은 모두 흰색이다. Figma에서 뒤로가기(8)와 아바타(36)가 가까워서
/// 44 터치 영역이 겹치므로 뒤로가기를 Stack으로 위에 얹는다.
class LiveTopBar extends StatelessWidget {
  const LiveTopBar({
    super.key,
    required this.seller,
    this.onBack,
    this.onFollowTap,
    this.onShare,
    this.onMore,
    this.onMinimize,
  });

  final LiveSeller seller;
  final VoidCallback? onBack;
  final VoidCallback? onFollowTap;
  final VoidCallback? onShare;
  final VoidCallback? onMore;
  final VoidCallback? onMinimize;

  static const double height = AppIconSize.touch;

  /// 판매자 묶음 시작 x (Figma 36).
  static const double _sellerLeft = 36;

  /// 우측 아이콘 버튼 크기. Figma 아이콘 간격(8)에 맞추면서 터치 영역을 확보한다.
  static const double _actionSize = AppControlHeight.buttonMd;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            left: _sellerLeft,
            child: Row(
              children: [
                Expanded(
                  child: _SellerCluster(
                    seller: seller,
                    onFollowTap: onFollowTap,
                  ),
                ),
                AppIconButton(
                  icon: AppIcons.share,
                  onPressed: onShare,
                  semanticLabel: '공유',
                  size: _actionSize,
                  iconColor: AppColors.textInverse,
                ),
                AppIconButton(
                  icon: AppIcons.dotsVertical,
                  onPressed: onMore,
                  semanticLabel: '더보기',
                  size: _actionSize,
                  iconColor: AppColors.textInverse,
                ),
                AppIconButton(
                  icon: AppIcons.arrowNarrowLeft,
                  onPressed: onMinimize,
                  semanticLabel: '화면 축소',
                  size: _actionSize,
                  iconColor: AppColors.textInverse,
                ),
                const SizedBox(width: AppSpacing.s10),
              ],
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: AppIconButton(
              icon: AppIcons.chevronLeft,
              onPressed: onBack,
              semanticLabel: '뒤로',
              iconColor: AppColors.textInverse,
            ),
          ),
        ],
      ),
    );
  }
}

class _SellerCluster extends StatelessWidget {
  const _SellerCluster({required this.seller, required this.onFollowTap});

  final LiveSeller seller;
  final VoidCallback? onFollowTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _RingAvatar(image: resolveAppImageOrNull(seller.avatar)),
        const SizedBox(width: AppSpacing.s8),
        Flexible(
          child: Text(
            seller.name,
            style: AppTextStyles.pretendardH3.copyWith(
              color: AppColors.textInverse,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (seller.isOfficial) ...[
          const SizedBox(width: AppSpacing.s4),
          const AppBadge.seller(text: '공식'),
        ],
        const SizedBox(width: AppSpacing.s12),
        FollowButton(isFollowing: seller.isFollowing, onTap: onFollowTap),
      ],
    );
  }
}

/// 오렌지 1px 링(40) 안에 2px 틈을 두고 34 아바타.
class _RingAvatar extends StatelessWidget {
  const _RingAvatar({required this.image});

  final ImageProvider? image;

  static const double _size = AppAvatarSize.ringSm;
  static const double _gap = AppSpacing.s2;
  static const double _inner = _size - 2 * (AppBorderWidth.thin + _gap);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _size,
      height: _size,
      padding: const EdgeInsets.all(_gap),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: AppColors.borderBrand,
          width: AppBorderWidth.thin,
        ),
      ),
      child: AppAvatar(size: _inner, image: image, silhouette: true),
    );
  }
}

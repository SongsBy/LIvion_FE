import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';
import 'app_badge.dart';
import 'app_brand_avatar.dart';
import 'app_price_label.dart';
import 'app_svg_icon.dart';
import 'app_thumbnail.dart';
import 'product_line.dart';

/// Figma `Card ui/Frame 50`: 세로형 라이브 카드 (160).
///
/// - 기본: 썸네일 아래로 판매자 아바타(48)가 걸치고 판매자 이름이 보인다 (홈·카테고리).
/// - [LiveCard.compact]: 판매자 페이지 안이라 아바타·판매자 이름이 없다.
///   방송 중이 아니면([isLive] false) LIVE 뱃지 없이 시청자 수만 보인다.
class LiveCard extends StatelessWidget {
  const LiveCard({
    super.key,
    required String this.sellerName,
    required this.title,
    required this.viewers,
    required this.product,
    this.tags = const [],
    this.thumbnail,
    this.avatar,
    this.brandAvatar = false,
    this.width = defaultWidth,
    this.showBookmark = true,
    this.onTap,
    this.onBookmark,
  }) : isLive = true;

  const LiveCard.compact({
    super.key,
    required this.title,
    required this.viewers,
    required this.product,
    this.isLive = true,
    this.tags = const [],
    this.thumbnail,
    this.width = defaultWidth,
    this.showBookmark = true,
    this.onTap,
    this.onBookmark,
  }) : sellerName = null,
       avatar = null,
       brandAvatar = false;

  /// null이면 판매자 줄과 아바타를 그리지 않는다 ([LiveCard.compact]).
  final String? sellerName;
  final String title;

  /// 포맷된 시청자 수 (예: "1,204").
  final String viewers;
  final ProductLineData product;
  final List<String> tags;
  final ImageProvider? thumbnail;
  final ImageProvider? avatar;

  /// true면 [avatar] 대신 오렌지 Livion 브랜드 아바타를 그린다 (공식 방송).
  final bool brandAvatar;
  final double width;

  /// 우상단 북마크 표식. 북마크된 라이브에만 보인다.
  final bool showBookmark;

  /// false면 LIVE 뱃지를 빼고 시청자 수만 보인다.
  final bool isLive;
  final VoidCallback? onTap;
  final VoidCallback? onBookmark;

  static const double defaultWidth = 160;

  /// 썸네일 비율 120:180.
  static const double _thumbnailAspect = 120 / 180;

  /// 아바타(48)가 썸네일 아래로 튀어나오는 길이.
  static const double _avatarOverhang = AppAvatarSize.md - 32;

  /// 썸네일 위 뱃지 위치.
  static const double _badgeLeft = 7;
  static const double _badgeTop = 6;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.r8All,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _Header(
              thumbnail: thumbnail,
              avatar: avatar,
              brandAvatar: brandAvatar,
              showSeller: sellerName != null,
              isLive: isLive,
              viewers: viewers,
              showBookmark: showBookmark,
              onBookmark: onBookmark,
            ),
            const SizedBox(height: AppSpacing.s6),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (sellerName != null) ...[
                    Text(
                      sellerName!,
                      style: AppTextStyles.archivoCaption1Bold,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: AppSpacing.s8),
                  ],
                  Text(
                    title,
                    style: AppTextStyles.pretendardCaption1Medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (tags.isNotEmpty) ...[
                    const SizedBox(height: AppSpacing.s8),
                    Wrap(
                      spacing: AppSpacing.s4,
                      runSpacing: AppSpacing.s4,
                      children: [for (final t in tags) AppBadge.neutral(t)],
                    ),
                  ],
                  const SizedBox(height: AppSpacing.s8),
                  const Divider(
                    height: AppBorderWidth.thin,
                    thickness: AppBorderWidth.thin,
                    color: AppColors.borderSubtle,
                  ),
                  const SizedBox(height: AppSpacing.s8),
                  ProductLine(data: product, priceSize: AppPriceSize.sm),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.thumbnail,
    required this.avatar,
    required this.brandAvatar,
    required this.showSeller,
    required this.isLive,
    required this.viewers,
    required this.showBookmark,
    required this.onBookmark,
  });

  final ImageProvider? thumbnail;
  final ImageProvider? avatar;
  final bool brandAvatar;
  final bool showSeller;
  final bool isLive;
  final String viewers;
  final bool showBookmark;
  final VoidCallback? onBookmark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: showSeller ? LiveCard._avatarOverhang : 0,
          ),
          child: AspectRatio(
            aspectRatio: LiveCard._thumbnailAspect,
            child: AppThumbnail(
              image: thumbnail,
              borderRadius: AppRadius.r6All,
              child: Stack(
                children: [
                  Positioned(
                    left: LiveCard._badgeLeft,
                    top: LiveCard._badgeTop,
                    child: Row(
                      children: [
                        if (isLive) ...[
                          const AppBadge.live(),
                          const SizedBox(width: AppSpacing.s4),
                        ],
                        AppBadge.viewers(viewers),
                      ],
                    ),
                  ),
                  if (showBookmark)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Semantics(
                        button: true,
                        label: '북마크',
                        child: InkWell(
                          onTap: onBookmark,
                          child: const Padding(
                            padding: EdgeInsets.all(AppSpacing.s6),
                            child: AppSvgIcon(
                              AppIcons.bookmark,
                              size: AppIconSize.bookmark,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
        if (showSeller)
          Positioned(
            left: AppSpacing.s6,
            bottom: 0,
            child: brandAvatar
                ? Container(
                    foregroundDecoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.borderInverse,
                        width: AppBorderWidth.thick,
                      ),
                    ),
                    child: const AppBrandAvatar(size: AppAvatarSize.md),
                  )
                : AppAvatar(
                    size: AppAvatarSize.md,
                    image: avatar,
                    silhouette: true,
                    borderColor: AppColors.borderInverse,
                    borderWidth: AppBorderWidth.thick,
                  ),
          ),
      ],
    );
  }
}

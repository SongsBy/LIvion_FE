import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';
import 'app_badge.dart';
import 'app_price_label.dart';
import 'app_svg_icon.dart';
import 'app_thumbnail.dart';
import 'product_line.dart';

/// Figma `Card ui/Frame 50`: 세로형 라이브 카드 (160).
class LiveCard extends StatelessWidget {
  const LiveCard({
    super.key,
    required this.sellerName,
    required this.title,
    required this.viewers,
    required this.product,
    this.tags = const [],
    this.thumbnail,
    this.avatar,
    this.width = defaultWidth,
    this.showBookmark = true,
    this.onTap,
    this.onBookmark,
  });

  final String sellerName;
  final String title;

  /// 포맷된 시청자 수 (예: "1,204").
  final String viewers;
  final ProductLineData product;
  final List<String> tags;
  final ImageProvider? thumbnail;
  final ImageProvider? avatar;
  final double width;

  /// 우상단 북마크 표식. 북마크된 라이브에만 보인다.
  final bool showBookmark;
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
                  Text(
                    sellerName,
                    style: AppTextStyles.archivoCaption1Bold,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSpacing.s8),
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
    required this.viewers,
    required this.showBookmark,
    required this.onBookmark,
  });

  final ImageProvider? thumbnail;
  final ImageProvider? avatar;
  final String viewers;
  final bool showBookmark;
  final VoidCallback? onBookmark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: LiveCard._avatarOverhang),
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
                        const AppBadge.live(),
                        const SizedBox(width: AppSpacing.s4),
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
        Positioned(
          left: AppSpacing.s6,
          bottom: 0,
          child: AppAvatar(
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

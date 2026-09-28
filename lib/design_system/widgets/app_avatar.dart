import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../tokens/tokens.dart';
import 'app_badge.dart';

/// Figma `Avatar` 세트 (24 / 32 / 48 / 54).
///
/// [image]가 없으면 회색 원, [silhouette]가 true면 사람 실루엣이 그려진 빈 아바타
/// (Figma `empty_avatar`, node 26:2176).
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.size = AppAvatarSize.xs,
    this.image,
    this.silhouette = false,
    this.borderColor,
    this.borderWidth = AppBorderWidth.thin,
  });

  final double size;
  final ImageProvider? image;
  final bool silhouette;
  final Color? borderColor;
  final double borderWidth;

  /// Figma `empty_avatar`(48) 안의 `User` 실루엣은 52×52로 아바타보다 크다.
  /// 가로는 가운데(−2), 세로는 위에서 2px 내려 시작해 아래쪽이 원에 잘린다.
  static const double _silhouetteScale = 52 / 48;
  static const double _silhouetteTopFactor = 2 / 48;

  @override
  Widget build(BuildContext context) {
    final showSilhouette = silhouette && image == null;
    final silhouetteSize = size * _silhouetteScale;
    // 테두리는 foreground로 그려 Figma처럼 배경·실루엣 위에 겹치고,
    // 자식 좌표가 테두리와 무관하게 아바타 전체(size) 기준이 되게 한다.
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: showSilhouette
            ? AppColors.backgroundPlaceholder
            : AppColors.backgroundSubtle,
        image: image == null
            ? null
            : DecorationImage(image: image!, fit: BoxFit.cover),
      ),
      foregroundDecoration: borderColor == null
          ? null
          : BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: borderColor!, width: borderWidth),
            ),
      child: showSilhouette
          ? Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: size * _silhouetteTopFactor,
                  left: (size - silhouetteSize) / 2,
                  child: SvgPicture.asset(
                    AppIcons.userSilhouette,
                    width: silhouetteSize,
                    height: silhouetteSize,
                  ),
                ),
              ],
            )
          : null,
    );
  }
}

/// Figma `Avatar/Frame 33`: 오렌지 링(62) + 54 아바타 + 아래 LIVE 뱃지. 전체 62×66.
///
/// [isLive]가 false면 링과 뱃지를 그리지 않되 같은 자리를 차지해 줄이 맞는다.
class AppLiveAvatar extends StatelessWidget {
  const AppLiveAvatar({super.key, this.image, this.isLive = true});

  final ImageProvider? image;
  final bool isLive;

  static const double width = AppAvatarSize.ring;
  static const double height = 66;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: AppAvatarSize.ring,
            height: AppAvatarSize.ring,
            padding: const EdgeInsets.all(AppSpacing.s2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: isLive
                  ? Border.all(
                      color: AppColors.borderBrand,
                      width: AppBorderWidth.thick,
                    )
                  : null,
            ),
            child: AppAvatar(size: AppAvatarSize.lg, image: image),
          ),
          Positioned(
            bottom: 0,
            child: Visibility(
              visible: isLive,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: const AppBadge.live(compact: true),
            ),
          ),
        ],
      ),
    );
  }
}

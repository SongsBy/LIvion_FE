import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_avatar.dart';
import 'app_thumbnail.dart';

/// 판매자 페이지 맨 위: 아래 모서리가 둥근 커버 사진(240) 위로 오렌지 링 프로필(80)이
/// 걸치고, 그 오른쪽 아래에 이름과 팔로워 수가 놓인다 (Figma 37:2253).
///
/// 커버는 화면 폭을 채운다. 프로필 줄은 좌우 16 안쪽이다.
class AppChannelHeader extends StatelessWidget {
  const AppChannelHeader({
    super.key,
    required this.name,
    required this.meta,
    this.cover,
    this.avatar,
  });

  final String name;

  /// 이름 오른쪽 회색 글자 (예: "팔로워 1,435").
  final String meta;
  final ImageProvider? cover;
  final ImageProvider? avatar;

  /// 프로필 링이 커버 아래로 내려오는 길이 (Figma: 링 위쪽 190, 커버 240).
  static const double _ringOverlap = AppControlHeight.channelCover - _ringTop;
  static const double _ringTop = 190;

  /// 링 안쪽 여백: (링 80 − 테두리 2×2 − 사진 70) / 2.
  static const double _ringPadding = AppSpacing.s3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            bottom: AppAvatarSize.profileRing - _ringOverlap,
          ),
          child: SizedBox(
            height: AppControlHeight.channelCover,
            width: double.infinity,
            child: AppThumbnail(
              image: cover,
              borderRadius: AppRadius.r16Bottom,
            ),
          ),
        ),
        Positioned(
          left: AppSpacing.s16,
          right: AppSpacing.s16,
          bottom: 0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: AppAvatarSize.profileRing,
                height: AppAvatarSize.profileRing,
                padding: const EdgeInsets.all(_ringPadding),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.backgroundDefault,
                  border: Border.all(
                    color: AppColors.borderBrand,
                    width: AppBorderWidth.thick,
                  ),
                ),
                child: AppAvatar(size: AppAvatarSize.profile, image: avatar),
              ),
              const SizedBox(width: AppSpacing.s4),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: AppTextStyles.pretendardH2,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s8),
                    Text(
                      meta,
                      style: AppTextStyles.pretendardCaption1Medium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

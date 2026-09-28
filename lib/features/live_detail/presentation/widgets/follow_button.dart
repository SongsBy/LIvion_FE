import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// 영상 위 "팔로우" 알약 버튼: 흰 1px 테두리, 흰 글자 12.
/// 팔로우 중이면 오렌지로 채우고 "팔로잉"을 보인다.
class FollowButton extends StatelessWidget {
  const FollowButton({super.key, required this.isFollowing, this.onTap});

  final bool isFollowing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final label = isFollowing ? '팔로잉' : '팔로우';
    return Semantics(
      button: true,
      selected: isFollowing,
      label: label,
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.pillMdAll,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.s12,
              vertical: AppSpacing.s6,
            ),
            decoration: BoxDecoration(
              color: isFollowing ? AppColors.backgroundBrand : null,
              borderRadius: AppRadius.pillMdAll,
              border: Border.all(
                color: isFollowing
                    ? AppColors.borderBrand
                    : AppColors.borderInverse,
                width: AppBorderWidth.thin,
              ),
            ),
            child: ExcludeSemantics(
              child: Text(
                label,
                style: AppTextStyles.pretendardCaption1Medium.copyWith(
                  color: AppColors.textInverse,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

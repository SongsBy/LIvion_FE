import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 사진을 넣을 빈 자리 (120, radius 8). 옅은 회색 바탕에 사람 실루엣.
///
/// Figma 판매자 전환 채널 "프로필". 누르면 [onTap]으로 사진 고르기를 맡긴다.
class AppPhotoSlot extends StatelessWidget {
  const AppPhotoSlot({super.key, this.onTap, this.semanticLabel = '사진 추가'});

  final VoidCallback? onTap;
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: semanticLabel,
      onTap: onTap,
      excludeSemantics: true,
      child: Material(
        color: AppColors.backgroundSubtle,
        borderRadius: AppRadius.r8All,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.r8All,
          child: const SizedBox.square(
            dimension: AppControlHeight.photo,
            child: Center(
              child: AppSvgIcon(
                AppIcons.userPlaceholder,
                size: AppIconSize.photoPlaceholder,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 이름이 붙은 정사각 사진 칸 (radius 8) + 아래 이름. 폭은 감싸는 쪽이 정한다.
///
/// Figma 재고 등록 "사진": 사진이 있으면 채워 보이고 오른쪽 위에 삭제 버튼(30)이,
/// 없으면 검정 10% 바탕에 흰 카메라(40)와 회색 이름이 보인다.
/// 빈 칸을 누르면 [onAdd], 삭제 버튼을 누르면 [onRemove]를 부른다.
class AppPhotoTile extends StatelessWidget {
  const AppPhotoTile({
    super.key,
    required this.label,
    this.image,
    this.onAdd,
    this.onRemove,
  });

  final String label;
  final ImageProvider? image;
  final VoidCallback? onAdd;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final hasImage = image != null;
    final Widget frame = hasImage
        ? Semantics(
            image: true,
            label: '$label 사진',
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: AppRadius.r8All,
                image: DecorationImage(image: image!, fit: BoxFit.cover),
              ),
            ),
          )
        : Semantics(
            button: true,
            enabled: onAdd != null,
            label: '$label 사진 추가',
            onTap: onAdd,
            excludeSemantics: true,
            child: Material(
              color: AppColors.opacityBlack10,
              borderRadius: AppRadius.r8All,
              child: InkWell(
                onTap: onAdd,
                borderRadius: AppRadius.r8All,
                child: const Center(
                  child: AppSvgIcon(
                    AppIcons.camera,
                    size: AppIconSize.photoAdd,
                  ),
                ),
              ),
            ),
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: Stack(
            fit: StackFit.expand,
            children: [
              frame,
              if (hasImage)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Semantics(
                    button: true,
                    enabled: onRemove != null,
                    label: '$label 사진 삭제',
                    onTap: onRemove,
                    excludeSemantics: true,
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onRemove,
                      child: const AppSvgIcon(
                        AppIcons.photoRemove,
                        size: AppIconSize.photoRemove,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s10),
        ExcludeSemantics(
          child: Text(
            label,
            style: AppTextStyles.pretendardH3.copyWith(
              color: hasImage ? AppColors.textPrimary : AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

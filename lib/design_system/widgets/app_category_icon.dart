import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Figma 카테고리 `Frame 2147238605`: 회색 원(54) 안 그림 + 아래 이름.
///
/// 선택되면 원에 오렌지 2px 테두리, 이름은 오렌지. 그림 대신 글자를 넣을 때는
/// [AppCategoryIcon.mark]를 쓴다 ("ALL").
class AppCategoryIcon extends StatelessWidget {
  const AppCategoryIcon({
    super.key,
    required this.label,
    required ImageProvider this.image,
    required this.selected,
    required this.onTap,
  }) : mark = null;

  const AppCategoryIcon.mark({
    super.key,
    required this.label,
    required String this.mark,
    required this.selected,
    required this.onTap,
  }) : image = null;

  final String label;
  final ImageProvider? image;
  final String? mark;
  final bool selected;
  final VoidCallback onTap;

  static const double size = AppIconSize.category;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: size,
          child: ExcludeSemantics(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: size,
                  height: size,
                  alignment: Alignment.center,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.backgroundMuted,
                    image: image == null
                        ? null
                        : DecorationImage(image: image!, fit: BoxFit.cover),
                  ),
                  foregroundDecoration: selected
                      ? BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.borderBrand,
                            width: AppBorderWidth.thick,
                          ),
                        )
                      : null,
                  child: mark == null
                      ? null
                      : Text(mark!, style: AppTextStyles.pretendardH3),
                ),
                const SizedBox(height: AppSpacing.s8),
                Text(
                  label,
                  style: AppTextStyles.archivoLabel.copyWith(
                    color: selected
                        ? AppColors.textBrand
                        : AppColors.textPlaceholder,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

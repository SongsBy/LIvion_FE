import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 작은 표시 + 굵은 글자 한 덩어리.
///
/// - [checked]가 true: 오렌지 ✓ + 오렌지 글자 ("✓ 정면 사진", 등급 기준 "✓ D-8~29")
/// - false: 회색 × + 회색 글자 ("× 포장 상태")
class AppCheckLabel extends StatelessWidget {
  const AppCheckLabel({super.key, required this.label, required this.checked});

  final String label;
  final bool checked;

  @override
  Widget build(BuildContext context) {
    // Figma: 자리(9.75×7.5, 8.07×8)보다 그림이 선 두께만큼 커서 가운데를 맞춰 넘치게 둔다.
    final Size slot = checked ? AppIconSize.checkGlyph : AppIconSize.crossGlyph;
    final Size art = checked
        ? AppIconSize.checkGlyphArt
        : AppIconSize.crossGlyphArt;
    final String asset = checked ? AppIcons.checkMark : AppIcons.crossSmall;
    return Semantics(
      label: label,
      checked: checked,
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox.fromSize(
            size: slot,
            child: OverflowBox(
              maxWidth: art.width,
              maxHeight: art.height,
              child: AppSvgIcon.sized(asset, size: art),
            ),
          ),
          const SizedBox(width: AppSpacing.s8),
          Flexible(
            child: Text(
              label,
              style: AppTextStyles.pretendardH3.copyWith(
                color: checked ? AppColors.textBrand : AppColors.textSecondary,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

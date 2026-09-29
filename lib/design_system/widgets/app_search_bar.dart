import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// Figma 카테고리 `Frame 1407`: 회색 검색창 모양의 버튼 (44).
///
/// 이 자리에서는 글자를 받지 않고, 눌렀을 때 검색 화면으로 넘어가는 진입점이다.
class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key, required this.placeholder, this.onTap});

  final String placeholder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: placeholder,
      child: Material(
        color: AppColors.backgroundMuted,
        borderRadius: AppRadius.r4All,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.r4All,
          child: Container(
            height: AppControlHeight.search,
            padding: const EdgeInsets.only(
              left: AppSpacing.s16,
              right: AppSpacing.s12,
            ),
            child: Row(
              children: [
                const AppSvgIcon(
                  AppIcons.searchLucide,
                  color: AppColors.textPrimary,
                ),
                const SizedBox(width: AppSpacing.s8),
                Expanded(
                  child: ExcludeSemantics(
                    child: Text(
                      placeholder,
                      style: AppTextStyles.pretendardBody1Regular.copyWith(
                        color: AppColors.textDisabled,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

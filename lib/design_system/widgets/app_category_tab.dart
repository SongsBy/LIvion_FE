import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// Figma `Cate_A`: 카테고리 탭 하나. 선택 시 오렌지 글자 + 2px 밑줄.
class AppCategoryTab extends StatelessWidget {
  const AppCategoryTab({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      selected: selected,
      button: true,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: AppControlHeight.tab,
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s10),
          alignment: Alignment.center,
          child: Container(
            height: double.infinity,
            alignment: Alignment.center,
            decoration: selected
                ? const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: AppColors.borderBrand,
                        width: AppBorderWidth.thick,
                      ),
                    ),
                  )
                : null,
            child: Text(
              label,
              style: AppTextStyles.pretendardH2.copyWith(
                color: selected
                    ? AppColors.textBrand
                    : AppColors.textPlaceholder,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// 카테고리 탭 묶음. 가로 스크롤된다.
///
/// [showDividers]가 true면 탭 사이에 24 높이 세로 구분선을 둔다 (Figma 메인 `Frame 15`).
class AppCategoryTabBar extends StatelessWidget {
  const AppCategoryTabBar({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onChanged,
    this.showDividers = false,
    this.padding = EdgeInsets.zero,
  });

  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onChanged;
  final bool showDividers;
  final EdgeInsetsGeometry padding;

  static const double _dividerHeight = 24;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: padding,
      child: Row(
        children: [
          for (var i = 0; i < labels.length; i++) ...[
            if (i > 0 && showDividers) ...[
              const SizedBox(width: AppSpacing.s6),
              Container(
                width: AppBorderWidth.thin,
                height: _dividerHeight,
                color: AppColors.borderDefault,
              ),
              const SizedBox(width: AppSpacing.s6),
            ],
            AppCategoryTab(
              label: labels[i],
              selected: i == selectedIndex,
              onTap: () => onChanged(i),
            ),
          ],
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 같은 폭의 흰 칸을 한 줄로 늘어놓고 하나를 고른다 (칸 사이 5).
///
/// Figma 재고 등록 "희망 편성 슬롯"의 요일: 고른 칸은 오렌지 테두리·글자,
/// 나머지는 50% 흐리게 보인다.
class AppSegmentedChoice extends StatelessWidget {
  const AppSegmentedChoice({
    super.key,
    required this.options,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<String> options;

  /// 고른 칸. 아직 없으면 null.
  final int? selectedIndex;
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < options.length; i++) ...[
          if (i > 0) const SizedBox(width: AppSpacing.s5),
          Expanded(child: _segment(i)),
        ],
      ],
    );
  }

  Widget _segment(int index) {
    final selected = index == selectedIndex;
    final onTap = onChanged == null ? null : () => onChanged!(index);
    return Semantics(
      button: true,
      selected: selected,
      inMutuallyExclusiveGroup: true,
      enabled: onTap != null,
      label: options[index],
      onTap: onTap,
      excludeSemantics: true,
      child: Opacity(
        opacity: selected ? 1 : AppOpacity.muted,
        child: Material(
          color: AppColors.backgroundDefault,
          borderRadius: AppRadius.r4All,
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadius.r4All,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.s10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: AppRadius.r4All,
                // 고르기 전에도 같은 두께의 투명 테두리를 둬 크기가 변하지 않게 한다.
                border: Border.all(
                  color: selected
                      ? AppColors.borderBrand
                      : AppColors.backgroundTransparent,
                  width: AppBorderWidth.thin,
                ),
              ),
              child: Text(
                options[index],
                style: AppTextStyles.pretendardH3.copyWith(
                  color: selected
                      ? AppColors.textBrand
                      : AppColors.opacityBlack65,
                ),
                maxLines: 1,
                overflow: TextOverflow.clip,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

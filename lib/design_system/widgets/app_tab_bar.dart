import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 탭 항목. [count]는 "채팅 1,204"처럼 라벨 옆에 붙는 숫자.
class AppTabItem {
  const AppTabItem({required this.label, this.count});

  final String label;
  final String? count;
}

/// Figma `button/베리언트3`: 라벨 + 숫자, 선택 탭은 point 색과 오렌지 밑줄.
class AppTabBar extends StatelessWidget {
  const AppTabBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onChanged,
  });

  final List<AppTabItem> items;
  final int selectedIndex;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
      child: Row(
        children: [
          for (var i = 0; i < items.length; i++)
            Expanded(
              child: _Tab(
                item: items[i],
                selected: i == selectedIndex,
                onTap: () => onChanged(i),
              ),
            ),
        ],
      ),
    );
  }
}

class _Tab extends StatelessWidget {
  const _Tab({required this.item, required this.selected, required this.onTap});

  final AppTabItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.textPoint : AppColors.textPrimary;
    final labelStyle =
        (selected ? AppTextStyles.pretendardH2 : AppTextStyles.pretendardBody1)
            .copyWith(color: color);
    final countStyle = AppTextStyles.pretendardBody1.copyWith(color: color);

    return Semantics(
      selected: selected,
      button: true,
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    item.label,
                    style: labelStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (item.count != null) ...[
                  const SizedBox(width: AppSpacing.s4),
                  Text(item.count!, style: countStyle),
                ],
              ],
            ),
            const SizedBox(height: AppSpacing.s16),
            Container(
              height: AppBorderWidth.thin,
              color: selected ? AppColors.borderBrand : AppColors.borderSubtle,
            ),
          ],
        ),
      ),
    );
  }
}

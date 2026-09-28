import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_svg_icon.dart';

/// 하단 내비 항목. 순서는 Figma `Nav`와 같다.
enum AppBottomNavItem {
  home(AppIcons.navHome, '홈'),
  category(AppIcons.navGrid, '카테고리'),
  live(AppIcons.navLive, '라이브'),
  schedule(AppIcons.navCalendar, '편성표'),
  my(AppIcons.navUser, '마이');

  const AppBottomNavItem(this.icon, this.label);

  final String icon;
  final String label;
}

/// Figma `Nav`: 72 높이, 위 subtle 선, 선택 항목은 오렌지. 가운데는 LIVE 그림.
class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final AppBottomNavItem selected;
  final ValueChanged<AppBottomNavItem> onChanged;

  /// 아이콘 줄 높이 (72 - 홈 인디케이터 21).
  static const double _contentHeight =
      AppControlHeight.bottomNav - AppSpacing.s21;

  @override
  Widget build(BuildContext context) {
    // Figma 72 = 아이콘 줄 51 + 홈 인디케이터 21. 인디케이터 여백은 기기의
    // 실제 하단 inset(SafeArea)으로 대신하고, 없는 기기에서는 21을 유지한다.
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s15),
      decoration: const BoxDecoration(
        color: AppColors.backgroundDefault,
        border: Border(
          top: BorderSide(
            color: AppColors.borderSubtle,
            width: AppBorderWidth.thin,
          ),
        ),
      ),
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.only(bottom: AppSpacing.s21),
        child: SizedBox(
          height: _contentHeight,
          child: Row(
            children: [
              for (final item in AppBottomNavItem.values)
                Expanded(
                  child: _NavButton(
                    item: item,
                    selected: item == selected,
                    onTap: () => onChanged(item),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final AppBottomNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isLive = item == AppBottomNavItem.live;
    return Semantics(
      button: true,
      selected: selected,
      label: item.label,
      child: InkWell(
        onTap: onTap,
        child: Center(
          child: isLive
              ? const AppSvgIcon(AppIcons.navLive, size: AppIconSize.navLive)
              : AppSvgIcon(
                  item.icon,
                  size: AppIconSize.lg,
                  color: selected ? AppColors.mainOrange : AppColors.neutral500,
                ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import 'root_tab_chrome.dart';

/// 루트 탭 셸의 화면 골격: 홈 상단 바 + 탭 본문 + 하단 내비.
///
/// 상태를 갖지 않는다. 어떤 탭이 선택됐고 어떤 chrome을 보일지는
/// [RootTabScreen]이 정해서 넘긴다.
class RootTabScaffold extends StatelessWidget {
  const RootTabScaffold({
    super.key,
    required this.body,
    required this.chrome,
    required this.selectedTab,
    required this.onTabChanged,
    this.onSearch,
    this.onNotification,
    this.hasNotification = false,
    this.onAvatarTap,
  });

  final Widget body;
  final RootTabChrome chrome;
  final AppBottomNavItem selectedTab;
  final ValueChanged<AppBottomNavItem> onTabChanged;
  final VoidCallback? onSearch;
  final VoidCallback? onNotification;
  final bool hasNotification;
  final VoidCallback? onAvatarTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: chrome.showTopBar
          ? AppTopBar.home(
              onSearch: onSearch,
              onNotification: onNotification,
              hasNotification: hasNotification,
              onAvatarTap: onAvatarTap,
            )
          : null,
      body: body,
      bottomNavigationBar: chrome.showBottomNav
          ? AppBottomNav(selected: selectedTab, onChanged: onTabChanged)
          : null,
    );
  }
}

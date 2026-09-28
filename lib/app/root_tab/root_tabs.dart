import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/home/presentation/screens/home_screen.dart';
import 'package:livion/features/live_detail/presentation/providers/live_detail_selection.dart';
import 'package:livion/features/live_detail/presentation/screens/live_detail_screen.dart';

import 'root_tab_chrome.dart';
import 'root_tab_placeholder.dart';
import 'root_tab_screen.dart';

/// 하단 내비 한 칸.
class RootTab {
  const RootTab({
    required this.item,
    required this.builder,
    this.chrome = const RootTabChrome(),
  });

  final AppBottomNavItem item;
  final WidgetBuilder builder;

  /// 이 탭의 상단 바·하단 내비 기본 정책.
  final RootTabChrome chrome;
}

/// 앱의 루트 탭 구성. 순서는 [AppBottomNavItem]과 같다.
///
/// 새 스크린이 생기면 해당 탭의 [RootTab.builder]만 바꾼다.
///
/// 라이브 탭은 [LiveDetailScreen]이다. 홈의 라이브 카드·공식 방송 히어로를 누르면
/// [LiveDetailSelection]에 id를 넣고 라이브 탭으로 옮기며, LIVE 탭을 바로 누르면
/// 마지막에 고른 방송(없으면 대표 공식 방송)을 보인다. 라이브 화면은 영상이
/// 전체를 덮는 전용 화면이라 상단 바·하단 내비를 모두 끄고, 자체 상단 줄의
/// 뒤로가기로 홈 탭에 돌아간다.
final List<RootTab> rootTabs = [
  RootTab(
    item: AppBottomNavItem.home,
    builder: (context) => Consumer(
      builder: (context, ref, _) => HomeScreen(
        onOpenLive: (live) {
          ref.read(liveDetailSelectionProvider.notifier).select(live.id);
          RootTabScope.of(context).selectTab(AppBottomNavItem.live);
        },
      ),
    ),
  ),
  RootTab(
    item: AppBottomNavItem.category,
    builder: (_) => const RootTabPlaceholder(title: '카테고리'),
  ),
  RootTab(
    item: AppBottomNavItem.live,
    chrome: const RootTabChrome(showTopBar: false, showBottomNav: false),
    builder: (context) => LiveDetailScreen(
      onBack: () => RootTabScope.of(context).selectTab(AppBottomNavItem.home),
    ),
  ),
  RootTab(
    item: AppBottomNavItem.schedule,
    builder: (_) => const RootTabPlaceholder(title: '편성표'),
  ),
  RootTab(
    item: AppBottomNavItem.my,
    builder: (_) => const RootTabPlaceholder(title: '마이'),
  ),
];

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/account/domain/entities/account_profile.dart';
import 'package:livion/features/account/presentation/providers/account_switch_controller.dart';
import 'package:livion/features/category/presentation/screens/category_screen.dart';
import 'package:livion/features/home/presentation/screens/home_screen.dart';
import 'package:livion/features/live_detail/presentation/providers/live_detail_selection.dart';
import 'package:livion/features/live_detail/presentation/screens/live_detail_screen.dart';
import 'package:livion/features/seller_channel/presentation/screens/seller_channel_screen.dart';

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
/// 카테고리 탭은 [CategoryScreen]이다.
///
/// 라이브 탭은 [LiveDetailScreen]이다. 홈·카테고리의 라이브 카드, 공식 방송 히어로를 누르면
/// [LiveDetailSelection]에 id를 넣고 라이브 탭으로 옮기며, LIVE 탭을 바로 누르면
/// 마지막에 고른 방송(없으면 대표 공식 방송)을 보인다. 라이브 화면은 영상이
/// 전체를 덮는 전용 화면이라 상단 바·하단 내비를 모두 끄고, 자체 상단 줄의
/// 뒤로가기로 홈 탭에 돌아간다. 우측 상단 "화면 축소"를 누르면 방송이 작은 창(PiP)으로
/// 줄어들며 홈 탭이 보이고, 작은 창을 누르거나 라이브 탭을 다시 열면 전체 화면으로 돌아온다.
///
/// 마이 탭은 판매자 계정일 때 그 판매자 페이지([SellerChannelScreen])이고,
/// 구매자 계정일 때는 아직 준비 중이다.
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
    builder: (context) => Consumer(
      builder: (context, ref, _) => CategoryScreen(
        onOpenLive: (live) {
          ref.read(liveDetailSelectionProvider.notifier).select(live.id);
          RootTabScope.of(context).selectTab(AppBottomNavItem.live);
        },
      ),
    ),
  ),
  RootTab(
    item: AppBottomNavItem.live,
    chrome: const RootTabChrome(showTopBar: false, showBottomNav: false),
    builder: (context) => LiveDetailScreen(
      onBack: () => RootTabScope.of(context).selectTab(AppBottomNavItem.home),
      onMinimize: () =>
          RootTabScope.of(context).selectTab(AppBottomNavItem.home),
    ),
  ),
  RootTab(
    item: AppBottomNavItem.schedule,
    builder: (_) => const RootTabPlaceholder(title: '편성표'),
  ),
  RootTab(
    item: AppBottomNavItem.my,
    builder: (context) => Consumer(
      builder: (context, ref, _) {
        final active = ref
            .watch(accountSwitchControllerProvider)
            .value
            ?.session
            .active;
        if (active?.role != AccountRole.seller) {
          return const RootTabPlaceholder(title: '마이');
        }
        return SellerChannelScreen(
          key: ValueKey(active!.id),
          sellerId: active.id,
          onOpenLive: (liveId) {
            ref.read(liveDetailSelectionProvider.notifier).select(liveId);
            RootTabScope.of(context).selectTab(AppBottomNavItem.live);
          },
        );
      },
    ),
  ),
];

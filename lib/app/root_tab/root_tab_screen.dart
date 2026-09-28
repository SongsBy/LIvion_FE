import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/design_gallery/presentation/screens/design_gallery_screen.dart';

import 'root_tab_chrome.dart';
import 'root_tab_scaffold.dart';
import 'root_tabs.dart';

/// 앱 루트. 상단 바와 하단 내비를 한 곳에서 관리하고 탭 본문을 [IndexedStack]으로 유지한다.
///
/// 탭 안의 화면은 [RootTabScope]로 탭 전환·chrome 변경을 요청한다.
class RootTabScreen extends StatefulWidget {
  const RootTabScreen({super.key, this.tabs, this.initialTab});

  /// 기본은 [rootTabs]. 테스트에서 바꿔 끼운다.
  final List<RootTab>? tabs;
  final AppBottomNavItem? initialTab;

  @override
  State<RootTabScreen> createState() => _RootTabScreenState();
}

class _RootTabScreenState extends State<RootTabScreen> {
  late List<RootTab> _tabs = widget.tabs ?? rootTabs;
  late AppBottomNavItem _selected = widget.initialTab ?? _tabs.first.item;
  final Map<AppBottomNavItem, RootTabChrome> _chromeRequests = {};

  @override
  void didUpdateWidget(covariant RootTabScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.tabs != oldWidget.tabs) {
      _tabs = widget.tabs ?? rootTabs;
      if (!_tabs.any((t) => t.item == _selected)) _selected = _tabs.first.item;
    }
  }

  RootTab get _current => _tabs.firstWhere((t) => t.item == _selected);

  RootTabChrome get _chrome =>
      _current.chrome.resolve(_chromeRequests[_selected]);

  void _selectTab(AppBottomNavItem item) {
    if (item == _selected || !_tabs.any((t) => t.item == item)) return;
    setState(() => _selected = item);
  }

  void _requestChrome(AppBottomNavItem item, RootTabChrome? chrome) {
    if (_chromeRequests[item] == chrome) return;
    setState(() {
      if (chrome == null) {
        _chromeRequests.remove(item);
      } else {
        _chromeRequests[item] = chrome;
      }
    });
  }

  void _openGallery() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(builder: (_) => const DesignGalleryScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final index = _tabs.indexOf(_current);
    return RootTabScope(
      selected: _selected,
      chrome: _chrome,
      selectTab: _selectTab,
      requestChrome: _requestChrome,
      child: RootTabScaffold(
        chrome: _chrome,
        selectedTab: _selected,
        onTabChanged: _selectTab,
        onSearch: () {},
        onNotification: () {},
        hasNotification: true,
        onAvatarTap: _openGallery,
        body: IndexedStack(
          index: index,
          children: [
            for (final tab in _tabs)
              Builder(key: ValueKey(tab.item), builder: tab.builder),
          ],
        ),
      ),
    );
  }
}

/// 탭 본문에서 루트 탭에 접근하는 창구.
class RootTabScope extends InheritedWidget {
  const RootTabScope({
    super.key,
    required this.selected,
    required this.chrome,
    required this.selectTab,
    required this.requestChrome,
    required super.child,
  });

  final AppBottomNavItem selected;

  /// 현재 탭에 실제로 적용된 chrome.
  final RootTabChrome chrome;
  final ValueChanged<AppBottomNavItem> selectTab;

  /// [item] 탭에 chrome을 요청한다. null이면 탭 기본 정책으로 돌아간다.
  /// [RootTabChrome.forced] 탭은 요청을 무시한다.
  final void Function(AppBottomNavItem item, RootTabChrome? chrome)
  requestChrome;

  static RootTabScope of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<RootTabScope>();
    assert(scope != null, 'RootTabScope가 위젯 트리에 없습니다.');
    return scope!;
  }

  static RootTabScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<RootTabScope>();

  @override
  bool updateShouldNotify(RootTabScope oldWidget) =>
      selected != oldWidget.selected || chrome != oldWidget.chrome;
}

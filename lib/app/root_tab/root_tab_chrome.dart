import 'package:flutter/foundation.dart';

/// 루트 탭 셸이 그리는 상단 바·하단 내비 표시 정책.
///
/// 탭마다 기본 정책을 갖고, 탭 안의 화면이 [RootTabScope.requestChrome]로
/// 일시적으로 바꿀 수 있다. [locked]인 탭은 그 요청을 무시하고
/// 항상 상단 바와 하단 내비를 켜 둔다. 라이브 탭은 둘 다 끈 기본 정책을 쓴다.
@immutable
class RootTabChrome {
  const RootTabChrome({this.showTopBar = true, this.showBottomNav = true})
    : locked = false;

  /// 상단 바·하단 내비를 항상 켜고, 화면의 숨김 요청을 받지 않는다.
  const RootTabChrome.forced()
    : showTopBar = true,
      showBottomNav = true,
      locked = true;

  final bool showTopBar;
  final bool showBottomNav;
  final bool locked;

  /// 화면이 요청한 [request]를 이 탭의 정책에 맞춰 최종 결정한다.
  RootTabChrome resolve(RootTabChrome? request) {
    if (locked || request == null) return this;
    return request;
  }

  @override
  bool operator ==(Object other) =>
      other is RootTabChrome &&
      other.showTopBar == showTopBar &&
      other.showBottomNav == showBottomNav &&
      other.locked == locked;

  @override
  int get hashCode => Object.hash(showTopBar, showBottomNav, locked);
}

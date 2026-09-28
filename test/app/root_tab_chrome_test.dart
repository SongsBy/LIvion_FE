import 'package:flutter_test/flutter_test.dart';

import 'package:livion/app/root_tab/root_tab_chrome.dart';

void main() {
  test('기본 정책은 화면 요청을 따른다', () {
    const base = RootTabChrome();
    const hidden = RootTabChrome(showTopBar: false, showBottomNav: false);

    expect(base.resolve(null), base);
    expect(base.resolve(hidden), hidden);
  });

  test('forced 탭은 숨김 요청을 무시하고 둘 다 켠다', () {
    const forced = RootTabChrome.forced();
    const hidden = RootTabChrome(showTopBar: false, showBottomNav: false);

    final resolved = forced.resolve(hidden);
    expect(resolved.showTopBar, isTrue);
    expect(resolved.showBottomNav, isTrue);
    expect(resolved.locked, isTrue);
  });
}

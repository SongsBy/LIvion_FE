import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'live_detail_selection.g.dart';

/// 라이브 탭이 보여 줄 방송 id. null이면 대표(공식) 방송이다.
///
/// 홈의 라이브 카드를 누르면 [select]로 id를 넣고 라이브 탭으로 옮긴다.
/// 탭 전환과 무관하게 살아 있어야 하는 앱 수준 선택 상태라 keepAlive다.
@Riverpod(keepAlive: true)
class LiveDetailSelection extends _$LiveDetailSelection {
  @override
  String? build() => null;

  void select(String liveId) => state = liveId;

  /// 대표 방송으로 되돌린다.
  void clear() => state = null;
}

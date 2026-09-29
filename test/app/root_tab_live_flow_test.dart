import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/app/app.dart';
import 'package:livion/features/live_detail/presentation/providers/live_detail_dependencies.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_floating_player.dart';
import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/home/presentation/widgets/home_feed_view.dart';
import 'package:livion/features/live_detail/presentation/widgets/live_detail_view.dart';

import '../helpers/app_launch.dart';
import '../helpers/fake_picture_in_picture.dart';

void main() {
  testWidgets('홈의 공식 방송을 누르면 라이브 탭에 그 방송이 열리고 뒤로가기로 홈에 돌아온다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const ProviderScope(child: LivionApp()));
    await enterHomeFromLaunch(tester);
    // 데모 repository의 지연(400ms)이 끝날 때까지 기다린다.
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(HomeFeedView), findsOneWidget);
    expect(find.byType(LiveDetailView), findsNothing);

    await tester.tap(find.byType(SellerLiveCard));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(LiveDetailView), findsOneWidget);
    expect(
      tester.widget<LiveDetailView>(find.byType(LiveDetailView)).detail.id,
      'official-1',
    );
    // 라이브 화면은 상단 바·하단 내비를 끈다.
    expect(find.byType(AppTopBar), findsNothing);
    expect(find.byType(AppBottomNav), findsNothing);

    await tester.tap(find.bySemanticsLabel('뒤로'));
    await tester.pump();
    expect(find.byType(HomeFeedView), findsOneWidget);
    expect(find.byType(LiveDetailView), findsNothing);
    expect(find.byType(AppTopBar), findsOneWidget);
    expect(find.byType(AppBottomNav), findsOneWidget);
  });

  testWidgets('화면 축소를 누르면 홈이 보이고 방송이 작은 창으로 뜨며, 작은 창을 누르면 라이브로 돌아온다', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);
    final pip = FakePictureInPicture();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [pictureInPictureProvider.overrideWithValue(pip)],
        child: const LivionApp(),
      ),
    );
    await enterHomeFromLaunch(tester);
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.byType(SellerLiveCard));
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    expect(find.byType(LiveDetailView), findsOneWidget);

    await tester.tap(find.bySemanticsLabel('화면 축소'));
    await tester.pump();
    await tester.pump();
    expect(find.byType(HomeFeedView), findsOneWidget);
    expect(find.byType(LiveDetailView), findsNothing);
    expect(find.byType(AppBottomNav), findsOneWidget);
    expect(find.byType(LiveFloatingPlayer), findsOneWidget);
    // Android: 앱 안 미니 플레이어 + 앱을 떠나면 시스템 PiP.
    expect(pip.calls, ['enterOnLeave']);
    expect(pip.contents.single.image, contains('asset/'));

    await tester.tap(find.bySemanticsLabel('라이브 방송으로 돌아가기'));
    await tester.pump();
    // 구독이 끊긴 PiP 상태는 다음 프레임 뒤에 dispose되며 창을 닫는다.
    await tester.pump(const Duration(milliseconds: 1));
    await tester.pump(const Duration(milliseconds: 1));
    expect(find.byType(LiveDetailView), findsOneWidget);
    expect(find.byType(LiveFloatingPlayer), findsNothing);
    expect(pip.calls.last, 'close');

    // 다시 홈으로 가도 축소가 풀렸으므로 작은 창은 뜨지 않는다.
    await tester.tap(find.bySemanticsLabel('뒤로'));
    await tester.pump();
    expect(find.byType(HomeFeedView), findsOneWidget);
    expect(find.byType(LiveFloatingPlayer), findsNothing);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/home/data/demo/home_demo_feed.dart';
import 'package:livion/features/home/domain/entities/home_feed.dart';
import 'package:livion/features/home/domain/repositories/home_repository.dart';
import 'package:livion/features/home/presentation/providers/home_dependencies.dart';
import 'package:livion/features/home/presentation/screens/home_screen.dart';
import 'package:livion/features/home/presentation/widgets/home_feed_view.dart';

/// 호출 횟수를 세고, 지정한 순서대로 성공/실패를 돌려주는 fake.
class _FakeHomeRepository implements HomeRepository {
  _FakeHomeRepository(this.results);

  final List<Object> results;
  int calls = 0;

  @override
  Future<HomeFeed> fetchHomeFeed() async {
    final result = results[calls.clamp(0, results.length - 1)];
    calls++;
    if (result is HomeFeed) return result;
    throw result;
  }
}

Widget _app(HomeRepository repository) {
  return ProviderScope(
    overrides: [homeRepositoryProvider.overrideWithValue(repository)],
    child: MaterialApp(
      theme: AppTheme.light,
      home: const Scaffold(body: HomeScreen()),
    ),
  );
}

void main() {
  testWidgets('로딩 → 데이터 순서로 그린다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final repo = _FakeHomeRepository([HomeDemoFeed.build()]);
    await tester.pumpWidget(_app(repo));
    expect(find.byType(AppLoadingView), findsOneWidget);

    await tester.pump();
    expect(find.byType(HomeFeedView), findsOneWidget);
    expect(find.text('Livion 공식 방송'), findsOneWidget);
    expect(repo.calls, 1);
  });

  testWidgets('실패하면 안내와 다시 시도 버튼을 보이고, 재시도 후 데이터를 그린다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    final repo = _FakeHomeRepository([
      StateError('network'),
      HomeDemoFeed.build(),
    ]);
    await tester.pumpWidget(_app(repo));
    await tester.pump();
    expect(find.byType(AppErrorView), findsOneWidget);
    expect(find.byType(HomeFeedView), findsNothing);

    await tester.tap(find.text('다시 시도'));
    await tester.pump();
    await tester.pump();
    expect(find.byType(HomeFeedView), findsOneWidget);
    expect(repo.calls, 2);
  });
}

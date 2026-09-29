import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/category/data/repositories/demo_category_repository.dart';
import 'package:livion/features/category/domain/entities/category_feed.dart';
import 'package:livion/features/category/domain/entities/product_category.dart';
import 'package:livion/features/category/domain/repositories/category_repository.dart';
import 'package:livion/features/category/presentation/providers/category_dependencies.dart';
import 'package:livion/features/category/presentation/screens/category_screen.dart';
import 'package:livion/features/home/presentation/widgets/home_footer.dart';

/// 데모 데이터를 지연 없이 돌려주고, [failCatalog]번까지 대분류 조회를 실패시키는 fake.
class _FakeCategoryRepository implements CategoryRepository {
  _FakeCategoryRepository({this.failCatalog = 0});

  final int failCatalog;
  final _demo = const DemoCategoryRepository(latency: Duration.zero);
  int catalogCalls = 0;
  final feedCalls = <(String, String?)>[];

  @override
  Future<CategoryCatalog> fetchCatalog() async {
    catalogCalls++;
    if (catalogCalls <= failCatalog) throw StateError('network');
    return _demo.fetchCatalog();
  }

  @override
  Future<CategoryFeed> fetchFeed({
    required String categoryId,
    String? subcategory,
  }) {
    feedCalls.add((categoryId, subcategory));
    return _demo.fetchFeed(categoryId: categoryId, subcategory: subcategory);
  }
}

Widget _app(
  CategoryRepository repository, {
  ValueChanged<LiveSummary>? onOpenLive,
}) {
  return ProviderScope(
    overrides: [categoryRepositoryProvider.overrideWithValue(repository)],
    child: MaterialApp(
      theme: AppTheme.light,
      home: Scaffold(body: CategoryScreen(onOpenLive: onOpenLive)),
    ),
  );
}

final _vertical = find.byWidgetPredicate(
  (w) => w is Scrollable && w.axisDirection == AxisDirection.down,
);

void _phoneSize(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

Future<void> _load(WidgetTester tester, CategoryRepository repo) async {
  await tester.pumpWidget(_app(repo));
  await tester.pump();
  await tester.pump();
}

void main() {
  testWidgets('Figma 카테고리 화면을 푸드 선택 상태로 순서대로 그린다', (tester) async {
    _phoneSize(tester);
    final repo = _FakeCategoryRepository();
    await _load(tester, repo);
    expect(tester.takeException(), isNull);

    expect(find.byType(AppSearchBar), findsOneWidget);
    expect(find.byType(AppCategoryIcon), findsWidgets);
    expect(find.text('ALL'), findsOneWidget);
    final food = tester.widget<AppCategoryIcon>(
      find.widgetWithText(AppCategoryIcon, '푸드'),
    );
    expect(food.selected, isTrue);
    expect(find.text('농산물'), findsOneWidget);
    expect(repo.feedCalls, [('food', null)]);

    for (final title in ['BEST 라이브', '인기 판매자', '전체 보기']) {
      await tester.scrollUntilVisible(
        find.text(title),
        300,
        scrollable: _vertical,
      );
      expect(find.text(title), findsOneWidget);
    }
    expect(find.byType(LiveCard), findsWidgets);
    expect(find.byType(AppLiveAvatarList), findsOneWidget);

    await tester.scrollUntilVisible(
      find.byType(HomeFooter),
      400,
      scrollable: _vertical,
    );
    expect(find.text('더보기'), findsOneWidget);
  });

  testWidgets('하위 분류 칩을 고르면 그 분류로 다시 조회한다', (tester) async {
    _phoneSize(tester);
    final repo = _FakeCategoryRepository();
    await _load(tester, repo);

    await tester.tap(find.text('농산물'));
    await tester.pump();
    await tester.pump();
    expect(repo.feedCalls.last, ('food', '농산물'));

    await tester.scrollUntilVisible(
      find.text('청정농산'),
      300,
      scrollable: _vertical,
    );
    expect(find.text('청정농산'), findsOneWidget);
    // 판매자 목록은 거르지 않으므로 한빛식품 이름 대신 한우 라이브 제목으로 확인한다.
    expect(find.text('안심한우 선물세트 추석 선물 고민 주말에 끝'), findsNothing);
  });

  testWidgets('내용이 없는 대분류는 안내 문구를 보이고 칩은 "전체"로 돌아간다', (tester) async {
    _phoneSize(tester);
    final repo = _FakeCategoryRepository();
    await _load(tester, repo);

    await tester.tap(find.text('농산물'));
    await tester.pump();
    await tester.pump();
    await tester.tap(find.text('뷰티'));
    await tester.pump();
    await tester.pump();

    expect(repo.feedCalls.last, ('beauty', null));
    expect(find.text('뷰티 카테고리에 진행 중인 라이브가 없어요.'), findsOneWidget);
    expect(find.text('농산물'), findsNothing);
  });

  testWidgets('예정 라이브 탭이 비어 있으면 안내 문구를 보인다', (tester) async {
    _phoneSize(tester);
    await _load(tester, _FakeCategoryRepository());

    await tester.scrollUntilVisible(
      find.text('예정 라이브'),
      300,
      scrollable: _vertical,
    );
    await tester.ensureVisible(find.text('예정 라이브'));
    await tester.pump();
    await tester.tap(find.text('예정 라이브'));
    await tester.pump();
    await tester.scrollUntilVisible(
      find.text('예정된 라이브가 없어요.'),
      300,
      scrollable: _vertical,
    );
    expect(find.text('예정된 라이브가 없어요.'), findsOneWidget);
    expect(find.text('더보기'), findsNothing);
  });

  testWidgets('라이브 카드를 누르면 onOpenLive로 알린다', (tester) async {
    _phoneSize(tester);
    LiveSummary? opened;
    await tester.pumpWidget(
      _app(_FakeCategoryRepository(), onOpenLive: (l) => opened = l),
    );
    await tester.pump();
    await tester.pump();

    await tester.scrollUntilVisible(
      find.text('굿모닝유통').first,
      300,
      scrollable: _vertical,
    );
    await tester.tap(find.text('(마감 임박) 견과믹스 특가 판매'));
    expect(opened?.id, 'cat-best-1');
  });

  testWidgets('대분류 조회가 실패하면 다시 시도로 복구한다', (tester) async {
    _phoneSize(tester);
    final repo = _FakeCategoryRepository(failCatalog: 1);
    await _load(tester, repo);
    expect(find.byType(AppErrorView), findsOneWidget);

    await tester.tap(find.text('다시 시도'));
    await tester.pump();
    await tester.pump();
    await tester.pump();
    expect(find.byType(AppSearchBar), findsOneWidget);
    expect(repo.catalogCalls, 2);
  });
}

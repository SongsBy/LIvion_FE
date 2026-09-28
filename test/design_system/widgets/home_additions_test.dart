import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';

Widget _wrap(Widget child) {
  return MaterialApp(
    theme: AppTheme.light,
    home: Scaffold(body: Center(child: child)),
  );
}

void main() {
  testWidgets('AppSectionHeader: 강조 앞/뒤, 전체 보기 동작', (tester) async {
    var tapped = 0;
    await tester.pumpWidget(
      _wrap(
        Column(
          children: [
            AppSectionHeader(
              title: '라이브',
              accent: '인기 급상승',
              actionLabel: '전체 보기',
              onAction: () => tapped++,
            ),
            const AppSectionHeader(
              title: '전체 라이브',
              accent: '24',
              accentLeading: false,
            ),
          ],
        ),
      ),
    );
    expect(find.text('인기 급상승'), findsOneWidget);
    expect(find.text('24'), findsOneWidget);
    expect(
      tester.getSize(find.byType(AppSectionHeader).first).height,
      AppSectionHeader.height,
    );

    await tester.tap(find.text('전체 보기'));
    expect(tapped, 1);
  });

  testWidgets('AppButton.more: 더보기 + 화살표', (tester) async {
    var tapped = 0;
    await tester.pumpWidget(_wrap(AppButton.more(onPressed: () => tapped++)));
    expect(find.text('더보기'), findsOneWidget);
    expect(find.byType(AppSvgIcon), findsOneWidget);
    expect(
      tester.getSize(find.byType(AppButton)).height,
      AppControlHeight.buttonMd,
    );
    await tester.tap(find.byType(AppButton));
    expect(tapped, 1);
  });

  testWidgets('AppLiveAvatar: isLive false면 뱃지를 숨기고 크기는 유지', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const Row(
          mainAxisSize: MainAxisSize.min,
          children: [AppLiveAvatar(), AppLiveAvatar(isLive: false)],
        ),
      ),
    );
    final sizes = tester
        .widgetList(find.byType(AppLiveAvatar))
        .map((w) => tester.getSize(find.byWidget(w)))
        .toList();
    expect(sizes[0], sizes[1]);
    final badgeVisibility = tester
        .widgetList<Visibility>(find.byType(Visibility))
        .map((v) => v.visible)
        .toList();
    expect(badgeVisibility, [true, false]);
  });

  testWidgets('LiveCard: showBookmark false면 북마크를 그리지 않는다', (tester) async {
    const product = ProductLineData(
      name: '상품',
      grade: AppGrade.a,
      price: '1,000',
    );
    await tester.pumpWidget(
      _wrap(
        const SingleChildScrollView(
          child: Column(
            children: [
              LiveCard(
                sellerName: 'a',
                title: 't',
                viewers: '1',
                product: product,
              ),
              LiveCard(
                sellerName: 'b',
                title: 't',
                viewers: '1',
                product: product,
                showBookmark: false,
              ),
            ],
          ),
        ),
      ),
    );
    final bookmarks = tester.widgetList<AppSvgIcon>(
      find.byWidgetPredicate(
        (w) => w is AppSvgIcon && w.asset == AppIcons.bookmark,
      ),
    );
    expect(bookmarks.length, 1);
  });

  testWidgets('AppCategoryTabBar: showDividers면 탭 사이에 구분선', (tester) async {
    await tester.pumpWidget(
      _wrap(
        AppCategoryTabBar(
          labels: const ['a', 'b', 'c'],
          selectedIndex: 0,
          onChanged: (_) {},
          showDividers: true,
        ),
      ),
    );
    expect(find.byType(AppCategoryTab), findsNWidgets(3));
    final dividers = tester.widgetList<Container>(
      find.byWidgetPredicate(
        (w) => w is Container && w.color == AppColors.borderDefault,
      ),
    );
    expect(dividers.length, 2);
  });

  testWidgets('AppErrorView·AppEmptyView·AppLoadingView', (tester) async {
    var retried = 0;
    await tester.pumpWidget(
      _wrap(
        Column(
          children: [
            AppErrorView(message: '실패', onRetry: () => retried++),
            const AppEmptyView(message: '없음'),
            const SizedBox(height: 40, child: AppLoadingView()),
          ],
        ),
      ),
    );
    expect(find.text('실패'), findsOneWidget);
    expect(find.text('없음'), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.tap(find.text('다시 시도'));
    expect(retried, 1);
  });

  testWidgets('AppBrandAvatar와 AppLogo', (tester) async {
    await tester.pumpWidget(
      _wrap(const Row(children: [AppBrandAvatar(), AppLogo()])),
    );
    expect(find.byType(AppLogo), findsNWidgets(2));
    expect(tester.getSize(find.byType(AppBrandAvatar)), const Size(32, 32));
  });
}

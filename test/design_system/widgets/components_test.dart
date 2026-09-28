import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';

Widget _wrap(Widget child) => MaterialApp(
  theme: AppTheme.light,
  home: Scaffold(body: Center(child: child)),
);

void main() {
  group('AppButton', () {
    testWidgets('onPressed가 null이면 탭해도 호출되지 않고 반투명', (tester) async {
      await tester.pumpWidget(
        _wrap(const AppButton.primary(label: '텍스트', onPressed: null)),
      );
      final opacity = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacity.opacity, AppOpacity.disabled);
    });

    testWidgets('isLoading이면 라벨 대신 인디케이터를 보이고 탭을 막는다', (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        _wrap(
          AppButton.cta(label: '입찰', onPressed: () => taps++, isLoading: true),
        ),
      );
      expect(find.text('입찰'), findsNothing);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
      await tester.tap(find.byType(InkWell));
      expect(taps, 0);
    });

    testWidgets('활성 버튼은 탭을 전달한다', (tester) async {
      var taps = 0;
      await tester.pumpWidget(
        _wrap(AppButton.outline(label: '텍스트', onPressed: () => taps++)),
      );
      await tester.tap(find.text('텍스트'));
      expect(taps, 1);
    });
  });

  group('AppTabBar / AppCategoryTab', () {
    testWidgets('탭을 누르면 인덱스를 돌려준다', (tester) async {
      int? changed;
      await tester.pumpWidget(
        _wrap(
          AppTabBar(
            items: const [
              AppTabItem(label: '채팅', count: '1,204'),
              AppTabItem(label: '입찰현황', count: '14'),
            ],
            selectedIndex: 0,
            onChanged: (i) => changed = i,
          ),
        ),
      );
      await tester.tap(find.text('입찰현황'));
      expect(changed, 1);
    });

    testWidgets('선택된 카테고리 탭은 오렌지 글자', (tester) async {
      await tester.pumpWidget(
        _wrap(AppCategoryTab(label: '추천', selected: true, onTap: () {})),
      );
      final text = tester.widget<Text>(find.text('추천'));
      expect(text.style?.color, AppColors.textBrand);
    });
  });

  group('AppBadge / GradeBadge', () {
    testWidgets('뱃지 6종이 각자 문구를 그린다', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const Column(
            children: [
              AppBadge.live(),
              AppBadge.viewers('1,204'),
              AppBadge.timer('00:47'),
              AppBadge.dim('1,204 시청'),
              AppBadge.seller(),
              AppBadge.neutral('D-12'),
            ],
          ),
        ),
      );
      for (final t in ['LIVE', '1,204', '00:47', '1,204 시청', '판매자', 'D-12']) {
        expect(find.text(t), findsOneWidget);
      }
    });

    test('등급별 색은 팔레트 토큰을 쓴다', () {
      expect(AppGrade.a.color, AppColors.gradeA);
      expect(AppGrade.b.color, AppColors.gradeB);
      expect(AppGrade.c.color, AppColors.gradeC);
    });
  });

  group('AppMessageField', () {
    testWidgets('비어 있으면 전송되지 않고, 입력 후 전송하면 비워진다', (tester) async {
      final sent = <String>[];
      await tester.pumpWidget(_wrap(AppMessageField(onSend: sent.add)));

      await tester.tap(find.text('전송'));
      expect(sent, isEmpty);

      await tester.enterText(find.byType(TextField), '입찰 문의드립니다');
      await tester.pump();
      await tester.tap(find.text('전송'));
      await tester.pump();

      expect(sent, ['입찰 문의드립니다']);
      expect(
        tester.widget<TextField>(find.byType(TextField)).controller?.text,
        isEmpty,
      );
    });
  });

  group('Navigation', () {
    testWidgets('하단 내비는 선택 항목을 돌려준다', (tester) async {
      AppBottomNavItem? changed;
      await tester.pumpWidget(
        _wrap(
          AppBottomNav(
            selected: AppBottomNavItem.home,
            onChanged: (i) => changed = i,
          ),
        ),
      );
      await tester.tap(find.bySemanticsLabel('편성표'));
      expect(changed, AppBottomNavItem.schedule);
    });

    testWidgets('단계 상단 바는 제목과 1/4을 그린다', (tester) async {
      var backs = 0;
      await tester.pumpWidget(
        _wrap(
          AppTopBar.steps(
            title: '판매자 전환',
            step: 1,
            totalSteps: 4,
            onBack: () => backs++,
          ),
        ),
      );
      expect(find.text('판매자 전환'), findsOneWidget);
      expect(find.text('1'), findsOneWidget);
      expect(find.text('/4'), findsOneWidget);
      await tester.tap(find.bySemanticsLabel('뒤로'));
      expect(backs, 1);
    });
  });

  group('Cards and rows', () {
    const product = ProductLineData(
      name: '상세 제품명',
      grade: AppGrade.a,
      price: '0,000',
      multiplier: '0',
    );

    testWidgets('LiveCard·SellerLiveCard·ProductCard가 값을 그린다', (tester) async {
      tester.view.physicalSize = const Size(800, 1200);
      tester.view.devicePixelRatio = 1;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(
        _wrap(
          const SingleChildScrollView(
            child: Column(
              children: [
                LiveCard(
                  sellerName: '업체명',
                  title: '라이브 타이틀',
                  viewers: '000',
                  tags: ['마감 임박', 'D-12'],
                  product: product,
                ),
                SellerLiveCard(
                  sellerName: '한빛식품',
                  title: '타이틀',
                  product: product,
                ),
                SizedBox(
                  width: 329,
                  child: ProductCard(
                    name: '상세 제품명',
                    grade: AppGrade.b,
                    price: '12,000',
                    startPriceLabel: '시작가 8,000원',
                    multiplier: '2',
                    remainingTime: '00:47',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      expect(tester.takeException(), isNull);
      expect(find.text('업체명'), findsOneWidget);
      expect(find.text('한빛식품'), findsOneWidget);
      expect(find.text('12,000원'), findsOneWidget);
      expect(find.text('00:47'), findsOneWidget);
    });

    testWidgets('BidRankRow는 1위를 point 색으로 표시한다', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const BidRankRow(
            rank: 1,
            name: '홍*동',
            price: '7,900원',
            timeAgo: '3초전',
          ),
        ),
      );
      final rank = tester.widget<Text>(find.text('1위'));
      expect(rank.style?.color, AppColors.textPoint);
    });
  });
}

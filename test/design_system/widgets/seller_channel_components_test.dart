import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';

Widget _wrap(Widget child) => MaterialApp(
  theme: AppTheme.light,
  home: Scaffold(
    body: Padding(
      padding: const EdgeInsets.all(AppSpacing.s16),
      child: Center(child: child),
    ),
  ),
);

const _long =
    '산지와 제조처에서 엄선한 신선식품과 간편식을 라이브로 소개합니다. '
    '상품의 상태와 특징을 직접 확인하고 합리적인 가격으로 만나보세요. '
    '매일 아침 입고되는 상품을 방송에서 바로 보여드립니다.';

void main() {
  testWidgets('AppExpandableText: 넘치면 전체보기, 누르면 접기', (tester) async {
    await tester.pumpWidget(
      _wrap(const SizedBox(width: 300, child: AppExpandableText(_long))),
    );
    expect(find.text('전체보기'), findsOneWidget);
    final collapsed = tester.getSize(find.text(_long)).height;

    await tester.tap(find.text('전체보기'));
    await tester.pump();
    expect(find.text('접기'), findsOneWidget);
    expect(tester.getSize(find.text(_long)).height, greaterThan(collapsed));
  });

  testWidgets('AppExpandableText: 짧은 글은 버튼이 없다', (tester) async {
    await tester.pumpWidget(_wrap(const AppExpandableText('짧은 소개')));
    expect(find.text('전체보기'), findsNothing);
  });

  testWidgets('AppPostCard: 좋아요를 누른 상태면 오렌지 하트 + 좋아요 N', (tester) async {
    Widget card({required bool liked}) => _wrap(
      SizedBox(
        width: 320,
        child: SingleChildScrollView(
          child: AppPostCard(
            authorName: '한빛식품',
            dateLabel: '2026.09.28',
            body: '본문',
            likeCount: 3,
            commentCount: 1,
            liked: liked,
            onLike: () {},
          ),
        ),
      ),
    );
    await tester.pumpWidget(card(liked: false));
    expect(find.text('좋아요 3'), findsNothing);
    expect(find.text('댓글 1'), findsOneWidget);
    await tester.pumpWidget(card(liked: true));
    expect(find.text('좋아요 3'), findsOneWidget);
    expect(
      find.byWidgetPredicate(
        (w) => w is AppSvgIcon && w.asset == AppIcons.heartFilled,
      ),
      findsOneWidget,
    );
  });

  testWidgets('CommentRow: 답글은 본문을 좌우 24 들여 쓰고 판매자 뱃지를 붙인다', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const SizedBox(
          width: 358,
          child: CommentRow(
            name: '한빛식품',
            message: '다행입니다',
            time: '오후 8:21',
            isReply: true,
            isSeller: true,
          ),
        ),
      ),
    );
    expect(find.text('판매자'), findsOneWidget);
    final row = tester.getRect(find.byType(CommentRow));
    expect(tester.getTopLeft(find.text('다행입니다')).dx - row.left, 24);
    expect(tester.getTopRight(find.text('오후 8:21')).dx, row.right);
  });

  testWidgets('LiveCard.compact: 판매자 줄이 없고, 방송 중이 아니면 LIVE가 없다', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const LiveCard.compact(
          title: '라이브',
          viewers: '000',
          isLive: false,
          product: ProductLineData(
            name: '상품',
            grade: AppGrade.a,
            price: '1,000',
          ),
        ),
      ),
    );
    expect(find.text('LIVE'), findsNothing);
    expect(find.byType(AppAvatar), findsNothing);
  });

  testWidgets('AppButton.compact: 36 높이, 외곽선이면 흰 바탕', (tester) async {
    await tester.pumpWidget(
      _wrap(
        AppButton.compact(
          label: '라이브 알림 신청',
          icon: AppIcons.bell,
          outlined: true,
          onPressed: () {},
        ),
      ),
    );
    expect(tester.getSize(find.byType(AppButton)).height, 36);
    final material = tester.widget<Material>(
      find.descendant(
        of: find.byType(AppButton),
        matching: find.byType(Material),
      ),
    );
    expect(material.color, AppColors.backgroundDefault);
  });
}

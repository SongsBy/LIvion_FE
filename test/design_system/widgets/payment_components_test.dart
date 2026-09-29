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

void main() {
  testWidgets('AppButton.cta는 보조 문구를 구분선 뒤에 잇고 한 번에 읽힌다', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(
        AppButton.cta(
          label: '라이브로 돌아가기',
          secondaryLabel: '다음 품목 4/5',
          onPressed: () => taps++,
        ),
      ),
    );
    expect(find.text('다음 품목 4/5'), findsOneWidget);
    expect(find.bySemanticsLabel('라이브로 돌아가기, 다음 품목 4/5'), findsOneWidget);
    await tester.tap(find.byType(InkWell));
    expect(taps, 1);
  });

  testWidgets('AppAmountRow는 항목과 금액을 한 번에 읽힌다', (tester) async {
    await tester.pumpWidget(
      _wrap(const AppAmountRow.total(label: '결제 금액', amount: '11,400')),
    );
    expect(find.bySemanticsLabel('결제 금액 11,400원'), findsOneWidget);
  });

  testWidgets('AppSelectField는 값이 없으면 힌트를, 누르면 콜백을 부른다', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(AppSelectField(hint: '선택해주세요', onTap: () => taps++)),
    );
    expect(find.text('선택해주세요'), findsOneWidget);
    await tester.tap(find.text('선택해주세요'));
    expect(taps, 1);
  });

  testWidgets('showAppSelectSheet는 고른 값을 돌려준다', (tester) async {
    String? picked;
    await tester.pumpWidget(
      _wrap(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async => picked = await showAppSelectSheet(
              context,
              title: '배송 메모',
              options: const ['A', 'B'],
              selected: 'A',
            ),
            child: const Text('열기'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();
    expect(find.text('배송 메모'), findsOneWidget);
    await tester.tap(find.text('B'));
    await tester.pumpAndSettle();
    expect(picked, 'B');
  });

  testWidgets('뱃지·단계 행·일러스트·링크가 그려진다', (tester) async {
    var links = 0;
    await tester.pumpWidget(
      _wrap(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppBadge.outline('자동결제'),
            const AppBadge.done('에스크로 예치 완료'),
            const AppStatusRow.step(4, '수취 확인', nextLabel: '판매자 지급'),
            const AppIllustrationBadge.card(semanticLabel: '카드'),
            const AppTitlePair(title: '우리집', value: '홍길동'),
            AppTextLink(label: '주문 상세 보기', onTap: () => links++),
          ],
        ),
      ),
    );
    for (final text in ['자동결제', '에스크로 예치 완료', '수취 확인', '판매자 지급', '우리집']) {
      expect(find.text(text), findsOneWidget);
    }
    expect(find.bySemanticsLabel('카드'), findsOneWidget);
    await tester.tap(find.text('주문 상세 보기'));
    expect(links, 1);
  });
}

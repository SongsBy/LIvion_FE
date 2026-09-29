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
  testWidgets('AppTopBar.steps: actionLabel이 있으면 "1/4" 대신 글자 버튼', (
    tester,
  ) async {
    var tapped = 0;
    await tester.pumpWidget(
      _wrap(
        AppTopBar.steps(
          title: '재고 등록',
          step: 1,
          totalSteps: 4,
          actionLabel: '임시저장',
          onAction: () => tapped++,
        ),
      ),
    );
    expect(find.text('/4'), findsNothing);
    await tester.tap(find.text('임시저장'));
    expect(tapped, 1);
  });

  testWidgets('AppPhotoTile: 빈 칸은 추가, 채운 칸은 삭제 버튼', (tester) async {
    var added = 0;
    var removed = 0;
    await tester.pumpWidget(
      _wrap(
        SizedBox(
          width: 360,
          child: AppTileGrid(
            columns: 2,
            spacing: AppSpacing.s12,
            children: [
              AppPhotoTile(label: '정면', onAdd: () => added++),
              AppPhotoTile(
                label: '라벨',
                image: const AssetImage(
                  'asset/images/demo/inventory_label.jpg',
                ),
                onRemove: () => removed++,
              ),
            ],
          ),
        ),
      ),
    );
    await tester.tap(find.bySemanticsLabel('정면 사진 추가'));
    await tester.tap(find.bySemanticsLabel('라벨 사진 삭제'));
    expect((added, removed), (1, 1));
    // 칸은 폭만큼 정사각형이다.
    final tile = tester.getSize(find.byType(AspectRatio).first);
    expect(tile.width, tile.height);
    expect(tile.width, (360 - AppSpacing.s12) / 2);
  });

  testWidgets('AppCriteriaTable: 강조 칸만 ✓ 라벨로 보인다', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const AppCriteriaTable(
          columns: ['A', 'B', 'C'],
          rows: [
            AppCriteriaRow(cells: ['1', '2', '3'], highlightedIndex: 1),
            AppCriteriaRow(cells: ['4', '5', '6']),
          ],
        ),
      ),
    );
    final check = tester.widget<AppCheckLabel>(find.byType(AppCheckLabel));
    expect((check.label, check.checked), ('2', true));
    expect(find.byType(AppDashedDivider), findsOneWidget);
  });

  testWidgets('GradeSummaryCard: 등급이 없으면 뱃지를 숨긴다', (tester) async {
    await tester.pumpWidget(
      _wrap(const GradeSummaryCard(title: '예상 검수 등급', caption: '-')),
    );
    expect(find.byType(GradeBadge), findsNothing);
    await tester.pumpWidget(
      _wrap(
        const GradeSummaryCard(
          title: '예상 검수 등급',
          caption: 'B 범위',
          grade: AppGrade.b,
        ),
      ),
    );
    expect(tester.getSize(find.byType(GradeBadge)), const Size(40, 40));
  });

  testWidgets('AppSegmentedChoice: 누른 칸 번호를 알린다', (tester) async {
    int? picked;
    await tester.pumpWidget(
      _wrap(
        AppSegmentedChoice(
          options: const ['월', '화', '수'],
          selectedIndex: 0,
          onChanged: (i) => picked = i,
        ),
      ),
    );
    await tester.tap(find.text('수'));
    expect(picked, 2);
  });

  testWidgets('AppCheckRow.consent: 누르면 반대 값', (tester) async {
    bool? value;
    await tester.pumpWidget(
      _wrap(
        AppCheckRow.consent(
          label: '확인했습니다',
          checked: false,
          onChanged: (v) => value = v,
        ),
      ),
    );
    await tester.tap(find.text('확인했습니다'));
    expect(value, isTrue);
  });

  testWidgets('비활성 cta는 흐리게 하지 않고 회색 바탕', (tester) async {
    await tester.pumpWidget(
      _wrap(const AppButton.cta(label: '검수 요청 및 편성 신청', onPressed: null)),
    );
    final material = tester.widget<Material>(
      find.descendant(
        of: find.byType(AppButton),
        matching: find.byType(Material),
      ),
    );
    expect(material.color, AppColors.backgroundDisabledCta);
    final opacity = tester.widget<Opacity>(
      find.descendant(
        of: find.byType(AppButton),
        matching: find.byType(Opacity),
      ),
    );
    expect(opacity.opacity, 1);
  });

  testWidgets('AppTooltipCard는 제목과 설명을 한 번에 읽힌다', (tester) async {
    await tester.pumpWidget(
      _wrap(const AppTooltipCard(title: '주의사항', message: '재 검수가 필요합니다')),
    );
    expect(find.bySemanticsLabel('주의사항, 재 검수가 필요합니다'), findsOneWidget);
  });
}

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
  testWidgets('AppTopBar.steps는 지금 단계까지 진행선을 채운다', (tester) async {
    await tester.pumpWidget(
      _wrap(const AppTopBar.steps(title: '판매자 전환', step: 2, totalSteps: 4)),
    );
    final bars = tester
        .widgetList<Container>(
          find.byWidgetPredicate(
            (w) => w is Container && w.constraints?.maxHeight == 2,
          ),
        )
        .map((c) => c.color)
        .toList();
    expect(bars, [
      AppColors.backgroundBrand,
      AppColors.backgroundBrand,
      AppColors.opacityBlack10,
      AppColors.opacityBlack10,
    ]);
  });

  testWidgets('AppStepIndicator는 지금 단계를 STEP 0N으로 보이고 한 번에 읽힌다', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        const AppStepIndicator(
          labels: ['유형', '사업자', '채널', '정산·약관'],
          currentIndex: 2,
        ),
      ),
    );
    expect(find.text('STEP 03'), findsOneWidget);
    expect(find.text('1'), findsOneWidget);
    expect(find.text('4'), findsOneWidget);
    expect(find.bySemanticsLabel('4단계 중 3단계, 채널'), findsOneWidget);
  });

  testWidgets('AppStepIndicator는 좁은 폭에서도 넘치지 않는다', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const SizedBox(
          width: 240,
          child: AppStepIndicator(
            labels: ['유형', '사업자', '채널', '정산·약관'],
            currentIndex: 3,
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('AppOptionTile은 선택 상태를 읽히고 누르면 알린다', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(
        AppTileGrid(
          columns: 2,
          children: [
            AppOptionTile.checkbox(
              label: '과잉',
              selected: true,
              onTap: () => taps++,
            ),
            AppOptionTile.radio(label: '1회', selected: false, onTap: () {}),
          ],
        ),
      ),
    );
    expect(
      tester.getSemantics(find.byType(AppOptionTile).first),
      containsSemantics(
        label: '과잉',
        isButton: true,
        hasCheckedState: true,
        isChecked: true,
        hasTapAction: true,
      ),
    );
    await tester.tap(find.text('과잉'));
    expect(taps, 1);
    expect(find.byType(AppCheckboxMark), findsOneWidget);
    expect(find.byType(AppRadioMark), findsOneWidget);
  });

  testWidgets('AppOptionCard는 onTap이 없으면 누를 수 없다', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const AppOptionCard(
          title: '개인 판매자',
          caption: '개인 재고 판매는 2년차 오픈 예정',
          selected: false,
          onTap: null,
          badge: AppBadge.subtle('준비중'),
        ),
      ),
    );
    expect(find.text('준비중'), findsOneWidget);
    final ink = tester.widget<InkWell>(find.byType(InkWell));
    expect(ink.onTap, isNull);
  });

  testWidgets('AppCheckRow는 행을 누르면 바뀌고, 화살표는 따로 눌린다', (tester) async {
    bool? changed;
    var opens = 0;
    await tester.pumpWidget(
      _wrap(
        AppCheckRow(
          label: '판매자 이용약관',
          checked: false,
          onChanged: (v) => changed = v,
          badge: const AppBadge.outline('필수'),
          onOpen: () => opens++,
        ),
      ),
    );
    await tester.tap(find.text('판매자 이용약관'));
    expect(changed, isTrue);
    await tester.tap(find.bySemanticsLabel('판매자 이용약관 보기'));
    expect(opens, 1);
    expect(changed, isTrue);
  });

  testWidgets('AppTextInput은 입력을 알리고, 흐린 버튼은 누를 수 없다', (tester) async {
    String? typed;
    var taps = 0;
    await tester.pumpWidget(
      _wrap(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextInput(
              hint: '휴대폰 번호',
              onChanged: (v) => typed = v,
              trailing: const AppInputTrailing.action('인증번호', onPressed: null),
            ),
            AppTextInput(
              hint: '채널명',
              trailing: AppInputTrailing.action(
                '중복확인',
                onPressed: () => taps++,
              ),
            ),
            const AppTextInput(
              hint: '사업자등록번호',
              trailing: AppInputTrailing.status('확인완료'),
            ),
          ],
        ),
      ),
    );
    await tester.enterText(find.byType(EditableText).first, '010');
    expect(typed, '010');
    await tester.tap(find.text('인증번호'));
    await tester.tap(find.text('중복확인'));
    expect(taps, 1);
    expect(find.text('확인완료'), findsOneWidget);
  });

  testWidgets('AppFormField는 필수·보조 문구를 라벨과 함께 읽힌다', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const AppFormField(
          label: '취급 재고 유형',
          note: '중복선택가능',
          isRequired: true,
          message: '안내',
          child: SizedBox.shrink(),
        ),
      ),
    );
    expect(find.bySemanticsLabel('취급 재고 유형, 중복선택가능, 필수'), findsOneWidget);
    expect(find.text('안내'), findsOneWidget);
  });

  testWidgets('showAppSelectSheet는 선택지가 많으면 스크롤된다', (tester) async {
    tester.view.physicalSize = const Size(390, 600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    String? picked;
    await tester.pumpWidget(
      _wrap(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async => picked = await showAppSelectSheet(
              context,
              title: '은행 선택',
              options: [for (var i = 0; i < 12; i++) '은행 $i'],
            ),
            child: const Text('열기'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    await tester.scrollUntilVisible(find.text('은행 11'), 100);
    await tester.tap(find.text('은행 11'));
    await tester.pumpAndSettle();
    expect(picked, '은행 11');
  });

  testWidgets('showAppLogoGridSheet는 고른 값을 돌려주고 선택된 칸을 알린다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.reset);

    String? picked;
    await tester.pumpWidget(
      _wrap(
        Builder(
          builder: (context) => TextButton(
            onPressed: () async => picked = await showAppLogoGridSheet<String>(
              context,
              semanticLabel: '은행 선택',
              selected: '088',
              options: const [
                AppLogoOption(
                  value: '090',
                  label: '카카오뱅크',
                  logo: AppBankLogos.kakao,
                ),
                AppLogoOption(
                  value: '088',
                  label: '신한은행',
                  logo: AppBankLogos.shinhan,
                ),
                AppLogoOption(value: '999', label: '새은행'),
                AppLogoOption(
                  value: '045',
                  label: 'MG새마을금고',
                  logo: AppBankLogos.mg,
                ),
                AppLogoOption(
                  value: '031',
                  label: 'IM뱅크',
                  logo: AppBankLogos.im,
                ),
              ],
            ),
            child: const Text('열기'),
          ),
        ),
      ),
    );
    await tester.tap(find.text('열기'));
    await tester.pumpAndSettle();
    expect(tester.takeException(), isNull);

    expect(find.byType(AppLogoTile), findsNWidgets(5));
    expect(find.text('새'), findsOneWidget, reason: '로고가 없으면 첫 글자 타일');
    expect(
      tester.getSemantics(find.widgetWithText(AppLogoTile, '신한은행')),
      containsSemantics(label: '신한은행', isSelected: true, hasTapAction: true),
    );

    await tester.tap(find.text('카카오뱅크'));
    await tester.pumpAndSettle();
    expect(picked, '090');
  });

  testWidgets('AppStepProgress는 완료 단계 수를 읽히고 좁아도 넘치지 않는다', (tester) async {
    await tester.pumpWidget(
      _wrap(
        const SizedBox(
          width: 300,
          child: AppStepProgress(
            labels: ['접수', '서류확인', '채널 개설', '첫 편성'],
            completedCount: 1,
          ),
        ),
      ),
    );
    expect(tester.takeException(), isNull);
    expect(find.bySemanticsLabel('4단계 중 1단계 완료, 접수'), findsOneWidget);
  });

  testWidgets('AppResultHeader·AppNavRow는 제목과 누르기를 알린다', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppResultHeader(title: '판매자 심사 접수 완료', message: '안내'),
            AppNavRow(label: '재고 미리 등록', onTap: () => taps++),
          ],
        ),
      ),
    );
    expect(find.text('판매자 심사 접수 완료'), findsOneWidget);
    await tester.tap(find.bySemanticsLabel('재고 미리 등록'));
    expect(taps, 1);
  });
}

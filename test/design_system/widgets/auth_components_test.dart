import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';

Widget _wrap(Widget child) => MaterialApp(
  theme: AppTheme.light,
  home: Scaffold(
    body: Padding(padding: const EdgeInsets.all(16), child: child),
  ),
);

void main() {
  testWidgets('AppFieldButton: 누를 수 없으면 onPressed를 부르지 않는다', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(
        Column(
          children: [
            AppFieldButton(label: '중복 확인', onPressed: () => taps++),
            const AppFieldButton(label: '인증번호 받기', onPressed: null),
          ],
        ),
      ),
    );
    await tester.tap(find.text('중복 확인'));
    await tester.tap(find.text('인증번호 받기'));
    expect(taps, 1);
    expect(tester.getSize(find.byType(AppFieldButton).first).height, 44);
  });

  testWidgets('AppAgreementRow: 줄과 "보기"를 따로 누른다', (tester) async {
    var checked = false;
    var views = 0;
    await tester.pumpWidget(
      _wrap(
        StatefulBuilder(
          builder: (context, setState) => AppAgreementRow(
            label: '[필수] 약관',
            checked: checked,
            onChanged: (v) => setState(() => checked = v),
            onView: () => views++,
          ),
        ),
      ),
    );
    await tester.tap(find.text('[필수] 약관'));
    await tester.pump();
    expect(checked, isTrue);
    await tester.tap(find.text('보기'));
    expect(views, 1);
    expect(checked, isTrue);
  });

  testWidgets('AppSocialLoginButton: 46 높이, 넓은 화면에서도 전체 폭', (tester) async {
    var taps = 0;
    await tester.pumpWidget(
      _wrap(
        Column(
          children: [
            AppSocialLoginButton.kakao(onPressed: () => taps++),
            AppSocialLoginButton.naver(onPressed: () => taps++),
          ],
        ),
      ),
    );
    final kakao = tester.getSize(find.byType(AppSocialLoginButton).first);
    expect(kakao.height, AppControlHeight.socialLogin);
    expect(kakao.width, 800 - 32);
    await tester.tap(find.bySemanticsLabel('카카오 로그인'));
    await tester.tap(find.bySemanticsLabel('네이버 로그인'));
    expect(taps, 2);
  });

  testWidgets('AppButton.ctaMedium: 50 높이 전체 폭', (tester) async {
    await tester.pumpWidget(
      _wrap(AppButton.ctaMedium(label: '로그인', onPressed: () {})),
    );
    expect(tester.getSize(find.byType(AppButton)).height, 50);
  });

  testWidgets('AppTopBar.title: 제목만 있고 단계 표시가 없다', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          appBar: AppTopBar.title(title: '회원가입', onBack: () {}),
        ),
      ),
    );
    expect(find.text('회원가입'), findsOneWidget);
    expect(find.textContaining('/'), findsNothing);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/auth/data/repositories/demo_auth_repository.dart';
import 'package:livion/features/auth/presentation/providers/auth_dependencies.dart';
import 'package:livion/features/auth/presentation/screens/login_screen.dart';
import 'package:livion/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:livion/features/auth/presentation/screens/splash_screen.dart';

void _phoneSize(WidgetTester tester) {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
}

Widget _app(Widget home, {bool requiresInput = false}) {
  final now = DateTime(2026, 9, 29, 12);
  return ProviderScope(
    overrides: [
      authRepositoryProvider.overrideWithValue(
        const DemoAuthRepository(latency: Duration.zero),
      ),
      authClockProvider.overrideWithValue(() => now),
      authRequiresInputProvider.overrideWithValue(requiresInput),
    ],
    child: MaterialApp(theme: AppTheme.light, home: home),
  );
}

Finder _input(String hint) => find.descendant(
  of: find.byWidgetPredicate((w) => w is AppTextInput && w.hint == hint),
  matching: find.byType(EditableText),
);

void main() {
  testWidgets('스플래시: 로고·문구를 보이고 시간이 지나면 한 번 알린다', (tester) async {
    _phoneSize(tester);
    var finished = 0;
    await tester.pumpWidget(_app(SplashScreen(onFinished: () => finished++)));

    expect(find.byType(AppLogo), findsOneWidget);
    expect(find.text('취향을 만나는 라이브 쇼핑'), findsOneWidget);
    expect(finished, 0);

    await tester.pump(SplashScreen.defaultDuration);
    expect(finished, 1);
    await tester.pump(SplashScreen.defaultDuration);
    expect(finished, 1);
  });

  testWidgets('로그인: Figma 요소를 모두 보인다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app(LoginScreen(onSignedIn: () {})));

    expect(find.text('취향을 만나는 라이브 쇼핑'), findsOneWidget);
    expect(find.text('아이디를 입력해주세요.'), findsOneWidget);
    expect(find.text('비밀번호를 입력해주세요.'), findsOneWidget);
    expect(find.widgetWithText(AppButton, '로그인'), findsOneWidget);
    expect(find.text('아이디 찾기'), findsOneWidget);
    expect(find.text('비밀번호 찾기'), findsOneWidget);
    expect(find.text('SNS 로그인'), findsOneWidget);
    expect(find.bySemanticsLabel('카카오 로그인'), findsOneWidget);
    expect(find.bySemanticsLabel('네이버 로그인'), findsOneWidget);
    expect(find.text('회원가입'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('로그인: 입력하고 누르면 onSignedIn', (tester) async {
    _phoneSize(tester);
    var signedIn = 0;
    await tester.pumpWidget(
      _app(LoginScreen(onSignedIn: () => signedIn++), requiresInput: true),
    );

    await tester.tap(find.widgetWithText(AppButton, '로그인'));
    await tester.pump();
    expect(find.text('아이디를 입력해주세요.'), findsNWidgets(2), reason: '안내 스낵바');
    expect(signedIn, 0);

    await tester.enterText(_input('아이디를 입력해주세요.'), 'hong');
    await tester.enterText(_input('비밀번호를 입력해주세요.'), 'pw1234');
    await tester.tap(find.widgetWithText(AppButton, '로그인'));
    // 성공하면 화면이 바뀔 때까지 진행 표시가 돌아 pumpAndSettle은 끝나지 않는다.
    await tester.pump();
    await tester.pump();
    expect(signedIn, 1);
  });

  testWidgets('로그인 → 회원가입 → 가입하기면 아이디가 채워진다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app(LoginScreen(onSignedIn: () {})));

    await tester.tap(find.text('회원가입'));
    await tester.pumpAndSettle();
    expect(find.byType(SignUpScreen), findsOneWidget);

    await tester.enterText(_input('아이디를 입력해주세요.'), 'hanbit01');
    await tester.tap(find.widgetWithText(AppButton, '가입하기'));
    await tester.pumpAndSettle();

    expect(find.byType(SignUpScreen), findsNothing);
    expect(find.text('hanbit01'), findsOneWidget);
    expect(find.text('회원가입이 완료되었어요. 로그인해 주세요.'), findsOneWidget);
  });

  testWidgets('회원가입: Figma 요소를 보이고 넘치지 않는다', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app(const SignUpScreen()));

    expect(find.text('회원가입'), findsOneWidget);
    expect(find.text('리비온에 오신 것을 환영해요'), findsOneWidget);
    for (final label in ['아이디', '비밀번호', '비밀번호 확인', '이메일', '휴대폰 번호']) {
      expect(
        find.byWidgetPredicate((w) => w is AppFormField && w.label == label),
        findsOneWidget,
        reason: label,
      );
    }
    expect(find.widgetWithText(AppFieldButton, '중복 확인'), findsOneWidget);
    expect(find.widgetWithText(AppFieldButton, '인증번호 받기'), findsOneWidget);
    expect(find.text('선택'), findsOneWidget);
    expect(find.text('전체 동의'), findsOneWidget);
    expect(find.text('[필수] 개인정보 수집 · 이용 동의'), findsOneWidget);
    expect(find.widgetWithText(AppButton, '가입하기'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('회원가입: 중복 확인·전체 동의·이메일 도메인', (tester) async {
    _phoneSize(tester);
    await tester.pumpWidget(_app(const SignUpScreen()));

    await tester.enterText(_input('아이디를 입력해주세요.'), 'Hanbit01');
    await tester.pump();
    expect(find.text('hanbit01'), findsOneWidget, reason: '소문자로 바꾼다');
    await tester.tap(find.widgetWithText(AppFieldButton, '중복 확인'));
    await tester.pumpAndSettle();
    expect(find.text('사용가능'), findsOneWidget);

    await tester.tap(find.text('선택'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('gmail.com'));
    await tester.pumpAndSettle();
    expect(find.text('gmail.com'), findsOneWidget);

    await tester.scrollUntilVisible(
      find.text('전체 동의'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.tap(find.text('전체 동의'));
    await tester.pump();
    final rows = tester.widgetList<AppAgreementRow>(
      find.byType(AppAgreementRow),
    );
    expect(rows.every((r) => r.checked), isTrue);
  });
}

import 'package:flutter_test/flutter_test.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/features/auth/presentation/screens/splash_screen.dart';

/// 앱 첫 흐름(스플래시 → 로그인)을 지나 홈에 들어간다.
///
/// 데모 앱은 필수 입력 검사가 꺼져 있어 빈 칸으로도 로그인된다.
Future<void> enterHomeFromLaunch(WidgetTester tester) async {
  await tester.pump(SplashScreen.defaultDuration);
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
  await tester.tap(find.widgetWithText(AppButton, '로그인'));
  await tester.pump();
  await tester.pump(const Duration(milliseconds: 500));
}

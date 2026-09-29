import 'package:flutter/material.dart';

import 'package:livion/design_system/theme/app_theme.dart';
import 'package:livion/features/auth/presentation/screens/login_screen.dart';
import 'package:livion/features/auth/presentation/screens/splash_screen.dart';

import 'root_tab/root_tab_screen.dart';

/// MaterialApp. 스플래시 → 로그인 → 루트 탭(홈) 순서로 연다.
class LivionApp extends StatelessWidget {
  const LivionApp({super.key});

  static final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livion',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      navigatorKey: _navigatorKey,
      home: const SplashScreen(onFinished: _openLogin),
    );
  }

  static void _openLogin() {
    _navigatorKey.currentState?.pushReplacement(
      MaterialPageRoute<void>(
        builder: (_) => const LoginScreen(
          onSignedIn: _openHome,
          // 데모: 로그인 없이 둘러보기.
          onClose: _openHome,
        ),
      ),
    );
  }

  /// 로그인·스플래시를 모두 빼고 홈만 남긴다.
  static void _openHome() {
    _navigatorKey.currentState?.pushAndRemoveUntil(
      MaterialPageRoute<void>(builder: (_) => const RootTabScreen()),
      (_) => false,
    );
  }
}

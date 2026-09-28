import 'package:flutter/material.dart';

import 'package:livion/design_system/theme/app_theme.dart';

import 'root_tab/root_tab_screen.dart';

/// MaterialApp. 첫 화면은 루트 탭(홈)이다.
class LivionApp extends StatelessWidget {
  const LivionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Livion',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const RootTabScreen(),
    );
  }
}

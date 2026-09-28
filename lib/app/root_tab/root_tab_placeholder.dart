import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// 아직 구현되지 않은 탭의 임시 본문. 실제 화면이 생기면 `root_tabs.dart`에서 교체한다.
class RootTabPlaceholder extends StatelessWidget {
  const RootTabPlaceholder({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppEmptyView(message: '$title 화면은 준비 중입니다.');
  }
}

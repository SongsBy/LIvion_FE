import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 여러 단계 폼의 단계 본문 스크롤. 좌우 16, 위 [top](기본 24), 아래는 하단 고정 줄 위로 24 띄운다.
///
/// Scaffold `extendBody: true`라 아래 padding에 하단 버튼 줄 높이가 들어 있다.
/// 단계들을 IndexedStack에 함께 두므로 PrimaryScrollController를 나눠 쓰지 않는다.
class AppFormScrollView extends StatelessWidget {
  const AppFormScrollView({
    super.key,
    required this.children,
    this.top = AppSpacing.s24,
  });

  final List<Widget> children;

  /// 첫 항목 위 여백. 로그인·회원가입은 Figma 머리 위치에 맞춰 더 띄운다.
  final double top;

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return ListView(
      primary: false,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      padding: EdgeInsets.fromLTRB(
        AppSpacing.s16,
        top,
        AppSpacing.s16,
        bottomInset + AppSpacing.s24,
      ),
      children: children,
    );
  }
}

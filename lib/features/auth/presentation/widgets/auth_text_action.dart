import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// 12pt 글자 버튼 ("아이디 찾기", "회원가입").
///
/// 글자는 작아도 누르기 쉽게 위아래로 [touchPadding]만큼 누를 자리를 넓힌다.
/// 둘레 간격은 이 여백을 빼고 잡는다.
class AuthTextAction extends StatelessWidget {
  const AuthTextAction({
    super.key,
    required this.label,
    required this.style,
    required this.onTap,
  });

  final String label;
  final TextStyle style;
  final VoidCallback? onTap;

  static const double touchPadding = AppSpacing.s12;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: onTap != null,
      label: label,
      excludeSemantics: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: touchPadding),
          child: Text(label, style: style),
        ),
      ),
    );
  }
}

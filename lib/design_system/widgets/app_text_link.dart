import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 밑줄 텍스트 링크 ("주문 상세 보기"). 글자는 작아도 터치 영역은 44를 확보한다.
class AppTextLink extends StatelessWidget {
  const AppTextLink({super.key, required this.label, required this.onTap});

  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      link: true,
      button: true,
      enabled: onTap != null,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.r4All,
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: AppIconSize.touch),
          child: Center(
            widthFactor: 1,
            child: Text(
              label,
              style: AppTextStyles.archivoBody2Regular.copyWith(
                decoration: TextDecoration.underline,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

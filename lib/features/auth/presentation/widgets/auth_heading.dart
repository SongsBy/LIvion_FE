import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

/// 로그인·회원가입 머리 글: Archivo Bold 22 제목 + 회색 14 안내.
///
/// Figma 로그인은 가운데 (37:4058), 회원가입은 왼쪽 정렬 (37:4079).
class AuthHeading extends StatelessWidget {
  const AuthHeading({
    super.key,
    required this.title,
    required this.message,
    this.centered = false,
  });

  final String title;
  final String message;
  final bool centered;

  @override
  Widget build(BuildContext context) {
    final align = centered ? TextAlign.center : TextAlign.start;
    return Column(
      crossAxisAlignment: centered
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            title,
            style: AppTextStyles.archivoTitle,
            textAlign: align,
          ),
        ),
        const SizedBox(height: AppSpacing.s12),
        Text(
          message,
          style: AppTextStyles.pretendardBody2Regular.copyWith(
            color: AppColors.textDisabled,
          ),
          textAlign: align,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 입력창 옆에 붙는 44 회색 버튼 ("중복 확인", "인증번호 받기").
///
/// Figma 회원가입 (37:4093, 37:4130): 검정 10% 바탕, radius 4, 글자 Pretendard Regular 16.
/// 누를 수 없으면 Figma 그대로 검정 40% 글자, 누를 수 있으면 진한 글자로 보인다.
/// 입력창 안쪽에 두는 글자 버튼은 [AppInputTrailing.action]을 쓴다.
class AppFieldButton extends StatelessWidget {
  const AppFieldButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;

  /// null이면 누를 수 없다.
  final VoidCallback? onPressed;

  /// 요청 중. 글자 폭을 그대로 두고 가운데에 진행 표시를 보인다.
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;
    final text = Text(
      label,
      style: AppTextStyles.pretendardBody1Regular.copyWith(
        color: enabled ? AppColors.textPrimary : AppColors.textDisabled,
      ),
      maxLines: 1,
    );
    return Semantics(
      button: true,
      enabled: enabled,
      label: label,
      excludeSemantics: true,
      child: Material(
        color: AppColors.opacityBlack10,
        borderRadius: AppRadius.r4All,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: AppRadius.r4All,
          child: Container(
            height: AppControlHeight.inputLg,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s12),
            alignment: Alignment.center,
            child: isLoading
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(opacity: 0, child: text),
                      const SizedBox.square(
                        dimension: AppIconSize.stat,
                        child: CircularProgressIndicator(
                          strokeWidth: AppBorderWidth.thick,
                          color: AppColors.mainOrange,
                        ),
                      ),
                    ],
                  )
                : text,
          ),
        ),
      ),
    );
  }
}

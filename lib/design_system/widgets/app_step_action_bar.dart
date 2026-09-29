import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_button.dart';
import 'app_frosted_bar.dart';

/// 여러 단계 폼 아래 고정 줄: 흰 "이전"(120) + 오렌지 [nextLabel].
///
/// Figma 판매자 전환 · 재고 등록 공통. Scaffold `bottomNavigationBar`에 두고
/// `extendBody: true`로 쓴다. [isLoading]이면 "이전"이 막히고 오른쪽에 진행 표시가 돈다.
/// [onNext]가 null이면 오른쪽 버튼이 회색으로 막힌다.
class AppStepActionBar extends StatelessWidget {
  const AppStepActionBar({
    super.key,
    required this.nextLabel,
    required this.onBack,
    required this.onNext,
    this.backLabel = '이전',
    this.isLoading = false,
  });

  final String nextLabel;
  final String backLabel;
  final VoidCallback onBack;
  final VoidCallback? onNext;
  final bool isLoading;

  /// Figma "이전" 버튼 폭.
  static const double _backWidth = 120;

  @override
  Widget build(BuildContext context) {
    return AppFrostedBar(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.s16,
        AppSpacing.s8,
        AppSpacing.s16,
        0,
      ),
      minBottom: AppSpacing.s25,
      child: Row(
        children: [
          SizedBox(
            width: _backWidth,
            child: AppButton.ctaOutline(
              label: backLabel,
              onPressed: isLoading ? null : onBack,
            ),
          ),
          const SizedBox(width: AppSpacing.s10),
          Expanded(
            child: AppButton.cta(
              label: nextLabel,
              isLoading: isLoading,
              onPressed: onNext,
            ),
          ),
        ],
      ),
    );
  }
}

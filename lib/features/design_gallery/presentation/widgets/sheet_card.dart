import 'package:flutter/material.dart';

import 'package:livion/design_system/tokens/tokens.dart';

/// Figma 갤러리 시트 공통 틀: 흰 카드 + 2px 테두리 + 제목 + 구분선 + 내용.
class SheetCard extends StatelessWidget {
  const SheetCard({super.key, required this.title, required this.children});

  /// Figma 시트 프레임 폭. 좁은 화면에서는 가용 폭에 맞춰 줄어든다.
  static const double maxWidth = 900;

  final String title;

  /// 구분선 아래에 24 간격으로 쌓이는 내용.
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: maxWidth),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: AppColors.backgroundDefault,
                  borderRadius: AppRadius.r16All,
                  border: Border.all(
                    color: AppColors.borderStrong,
                    width: AppBorderWidth.thick,
                  ),
                ),
                padding: const EdgeInsets.all(AppSpacing.s28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(title, style: AppTextStyles.sheetHeading),
                    const SizedBox(height: AppSpacing.s24),
                    const Divider(
                      height: AppBorderWidth.thick,
                      thickness: AppBorderWidth.thick,
                      color: AppColors.borderStrong,
                    ),
                    for (final child in children) ...[
                      const SizedBox(height: AppSpacing.s24),
                      child,
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 여러 단계 진행 표시 알약 ("STEP 01 유형 · 2 사업자 · 3 채널 · 4 정산·약관").
///
/// 흰 알약(radius 16) 위에 단계를 고르게 늘어놓는다.
/// - 지난 단계: 오렌지 번호 원 + 오렌지 굵은 라벨, 50% 흐리게
/// - 지금 단계: 오렌지 "STEP 0N" 알약 + 오렌지 굵은 라벨
/// - 다음 단계: 회색 번호 원 + 회색 라벨
class AppStepIndicator extends StatelessWidget {
  const AppStepIndicator({
    super.key,
    required this.labels,
    required this.currentIndex,
  }) : assert(currentIndex >= 0);

  final List<String> labels;

  /// 0부터 센 지금 단계.
  final int currentIndex;

  static const double _markerSize = 20;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label:
          '${labels.length}단계 중 ${currentIndex + 1}단계, '
          '${labels[currentIndex]}',
      excludeSemantics: true,
      child: Container(
        padding: const EdgeInsets.only(
          left: AppSpacing.s3,
          right: AppSpacing.s8,
          top: AppSpacing.s3,
          bottom: AppSpacing.s3,
        ),
        decoration: const BoxDecoration(
          color: AppColors.backgroundDefault,
          borderRadius: AppRadius.r16All,
          boxShadow: AppShadows.floating,
        ),
        // 단계는 글자 폭 그대로 두고 남는 폭을 사이에 나눈다.
        // 좁은 화면·큰 글씨로 넘치면 줄이지 않고 통째로 축소한다.
        child: LayoutBuilder(
          builder: (context, constraints) => FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [for (var i = 0; i < labels.length; i++) _step(i)],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _step(int index) {
    final isCurrent = index == currentIndex;
    final isDone = index < currentIndex;
    final number = index + 1;

    final Widget marker = isCurrent
        ? Container(
            height: _markerSize,
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s5),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.backgroundBrand,
              borderRadius: AppRadius.r10All,
            ),
            child: Text(
              'STEP ${number.toString().padLeft(2, '0')}',
              style: AppTextStyles.pretendardCaption1Bold.copyWith(
                color: AppColors.textInverse,
              ),
            ),
          )
        : Container(
            width: _markerSize,
            height: _markerSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isDone
                  ? AppColors.backgroundBrand
                  : AppColors.backgroundPlaceholder,
              shape: BoxShape.circle,
            ),
            child: Text(
              '$number',
              style: AppTextStyles.pretendardCaption1Bold.copyWith(
                color: AppColors.textInverse,
              ),
            ),
          );

    final Widget step = Padding(
      padding: const EdgeInsets.only(
        left: AppSpacing.s2,
        right: AppSpacing.s6,
        top: AppSpacing.s2,
        bottom: AppSpacing.s2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          marker,
          const SizedBox(width: AppSpacing.s8),
          Text(
            labels[index],
            style: isCurrent || isDone
                ? AppTextStyles.pretendardCaption1Bold.copyWith(
                    color: AppColors.textBrand,
                  )
                : AppTextStyles.pretendardCaption1Regular.copyWith(
                    color: AppColors.textSecondary,
                  ),
            maxLines: 1,
          ),
        ],
      ),
    );

    return isDone ? Opacity(opacity: AppOpacity.muted, child: step) : step;
  }
}

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

/// 가운데 정렬 수치 강조: 제목(한두 줄) 아래 오렌지 큰 숫자 + 단위.
///
/// Figma 판매자 전환(37:3621): "참여 기업 / 평균 시작가 대비 · 2.0배".
class AppStatFigure extends StatelessWidget {
  const AppStatFigure({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
  });

  final String title;

  /// 포맷된 숫자 ("2.0", "68").
  final String value;

  /// 숫자 뒤 단위 ("배", "%").
  final String unit;

  /// Archivo Bold 48의 대문자 높이 (Figma 숫자 줄 높이).
  static const double _valueCapHeight = 33;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.textBrand;
    return Semantics(
      container: true,
      label: '$title $value$unit',
      excludeSemantics: true,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: AppTextStyles.archivoH1Relaxed,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.s16),
          // Figma는 숫자 줄을 대문자 높이(33)로 잘라(text-box-trim) 배치한다.
          // 기준선을 33에 맞추고 그 아래 글자 여백은 자리를 차지하지 않게 한다.
          SizedBox(
            height: _valueCapHeight,
            child: OverflowBox(
              alignment: Alignment.topCenter,
              maxHeight: double.infinity,
              child: Baseline(
                baseline: _valueCapHeight,
                baselineType: TextBaseline.alphabetic,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      value,
                      style: AppTextStyles.archivoDisplay.copyWith(
                        color: color,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.s2),
                    Text(
                      unit,
                      style: AppTextStyles.archivoDisplayUnit.copyWith(
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../tokens/tokens.dart';

enum _AppInfoRowTone { standard, regular, emphasis }

/// 안내 표 한 줄: 왼쪽 항목, 오른쪽 값.
///
/// - 기본: 항목 Regular 14, 값 Bold 14 ("수수료 · 낙찰가의 12% · 유찰 시 0원").
///   값 뒤에 [badge]를 둘 수 있다 ("소비기한 · 2026.09.26 [D-12]").
/// - [AppInfoRow.regular]: 항목·값 모두 Regular 14 (예상 정산 "수수료 12% · -948원")
/// - [AppInfoRow.emphasis]: 항목·값 모두 Bold 14 (예상 정산 합계)
///
/// 금액을 굵은 숫자 + 단위로 나눠 보일 때는 [AppAmountRow].
class AppInfoRow extends StatelessWidget {
  const AppInfoRow({
    super.key,
    required this.label,
    required this.value,
    this.badge,
  }) : _tone = _AppInfoRowTone.standard;

  const AppInfoRow.regular({
    super.key,
    required this.label,
    required this.value,
  }) : badge = null,
       _tone = _AppInfoRowTone.regular;

  const AppInfoRow.emphasis({
    super.key,
    required this.label,
    required this.value,
  }) : badge = null,
       _tone = _AppInfoRowTone.emphasis;

  final String label;
  final String value;
  final Widget? badge;
  final _AppInfoRowTone _tone;

  @override
  Widget build(BuildContext context) {
    final labelStyle = _tone == _AppInfoRowTone.emphasis
        ? AppTextStyles.pretendardH3
        : AppTextStyles.pretendardBody2Regular;
    final valueStyle = _tone == _AppInfoRowTone.regular
        ? AppTextStyles.pretendardBody2Regular
        : AppTextStyles.pretendardH3;
    final valueText = Text(value, style: valueStyle, textAlign: TextAlign.end);

    return Semantics(
      label: '$label, $value',
      excludeSemantics: true,
      child: Row(
        crossAxisAlignment: badge == null
            ? CrossAxisAlignment.start
            : CrossAxisAlignment.center,
        children: [
          Text(label, style: labelStyle),
          const SizedBox(width: AppSpacing.s16),
          if (badge == null)
            Expanded(child: valueText)
          else
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(child: valueText),
                  const SizedBox(width: AppSpacing.s12),
                  badge!,
                ],
              ),
            ),
        ],
      ),
    );
  }
}

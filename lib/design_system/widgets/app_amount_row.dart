import 'package:flutter/material.dart';

import '../tokens/tokens.dart';
import 'app_price_label.dart';

/// 금액 한 줄: 왼쪽 항목명, 오른쪽 "8,400원".
///
/// - 기본: 항목 Regular 14, 금액 Bold 14 + 단위 Medium 14 ("낙찰가", "배송비")
/// - [AppAmountRow.total]: 항목 Bold 16, 금액·단위 Bold 18 ("결제 금액")
class AppAmountRow extends StatelessWidget {
  const AppAmountRow({
    super.key,
    required this.label,
    required this.amount,
    this.unit = '원',
  }) : _total = false;

  const AppAmountRow.total({
    super.key,
    required this.label,
    required this.amount,
    this.unit = '원',
  }) : _total = true;

  final String label;

  /// 이미 포맷된 금액 (예: "8,400").
  final String amount;
  final String unit;
  final bool _total;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: '$label $amount$unit',
      excludeSemantics: true,
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: _total
                  ? AppTextStyles.pretendardH2
                  : AppTextStyles.pretendardBody2Regular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: AppSpacing.s8),
          AppPriceLabel(
            price: amount,
            unit: unit,
            size: _total ? AppPriceSize.xl : AppPriceSize.md,
          ),
        ],
      ),
    );
  }
}

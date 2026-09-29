import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/order_payment.dart';
import 'payment_ui.dart';

/// 결제 수단 상자 ("국민카드 ****1234 [자동결제]") + 등록 카드 결제 안내.
class PaymentMethodPanel extends StatelessWidget {
  const PaymentMethodPanel({super.key, required this.card});

  final PaymentCard card;

  @override
  Widget build(BuildContext context) {
    final noteStyle = AppTextStyles.pretendardCaption1Medium.copyWith(
      color: AppColors.textSecondary,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppPanel(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.s10,
            AppSpacing.s16,
            AppSpacing.s16,
            AppSpacing.s16,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTitlePair(title: card.issuer, value: card.maskedNumber),
                    const SizedBox(height: AppSpacing.s10),
                    Text(card.registrationLabel, style: noteStyle),
                  ],
                ),
              ),
              if (card.isAutoPay) ...[
                const SizedBox(width: AppSpacing.s8),
                const AppBadge.outline('자동결제'),
              ],
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s10),
        Text(
          '입찰 참여 전 카드 1장을 등록해야 하며, 낙찰 즉시 해당 카드로 결제됩니다. '
          '충전·선불 예치는 없습니다.',
          style: noteStyle,
        ),
      ],
    );
  }
}

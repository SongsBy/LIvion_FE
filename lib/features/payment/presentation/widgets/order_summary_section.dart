import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/presentation/inspection_grade_ui.dart';

import '../../domain/entities/order_payment.dart';
import 'payment_ui.dart';

/// 상품 요약 카드 + 금액 상자 (낙찰가 · 배송비 · 구매자 수수료 · 결제 금액).
class OrderSummarySection extends StatelessWidget {
  const OrderSummarySection({super.key, required this.payment});

  final OrderPayment payment;

  @override
  Widget build(BuildContext context) {
    final item = payment.item;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ProductSummaryCard(
          name: item.name,
          grade: item.grade.toAppGrade(),
          dDay: item.dDayLabel,
          startPriceLabel: item.startPriceLabel,
          price: payment.winningPriceLabel,
          multiplier: payment.multiplierLabel,
          thumbnail: resolveAppImageOrNull(item.thumbnail),
        ),
        const SizedBox(height: AppSpacing.s10),
        AppPanel(
          child: Column(
            children: [
              AppAmountRow(label: '낙찰가', amount: payment.winningPriceLabel),
              const _Gap(),
              const AppDivider(),
              const _Gap(),
              AppAmountRow(
                label: payment.shippingFeeTitle,
                amount: payment.shippingFeeLabel,
              ),
              const _Gap(),
              const AppDivider(),
              const _Gap(),
              AppAmountRow(label: '구매자 수수료', amount: payment.buyerFeeLabel),
              const _Gap(),
              const AppDivider.bold(),
              const _Gap(),
              AppAmountRow.total(label: '결제 금액', amount: payment.totalLabel),
            ],
          ),
        ),
      ],
    );
  }
}

class _Gap extends StatelessWidget {
  const _Gap();

  @override
  Widget build(BuildContext context) => const SizedBox(height: AppSpacing.s16);
}

import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/order_payment.dart';
import 'escrow_progress.dart';
import 'order_summary_section.dart';
import 'payment_method_panel.dart';
import 'payment_result_header.dart';
import 'payment_ui.dart';
import 'shipping_address_panel.dart';

/// 조회가 끝난 [OrderPayment]를 Figma 결제(node 37:5982) 배치로 그린다.
///
/// 결과 머리 · 상품과 금액 · 배송지 · 결제 수단 · 에스크로 진행이 함께 스크롤된다.
/// 아래 고정 줄은 화면이 따로 둔다. 상태는 갖지 않고 동작은 콜백으로 알린다.
class PaymentCompleteView extends StatelessWidget {
  const PaymentCompleteView({
    super.key,
    required this.payment,
    this.onChangeAddress,
    this.onManageCards,
    this.onMemoTap,
  });

  final OrderPayment payment;
  final VoidCallback? onChangeAddress;
  final VoidCallback? onManageCards;
  final VoidCallback? onMemoTap;

  /// 머리 영역은 상자 안 글자와 줄을 맞춘다 (화면 여백 16 + 상자 여백 10).
  static const double _headerInset = AppSpacing.s16 + AppSpacing.s10;

  /// 섹션 사이 32, 섹션 제목과 상자 사이 16. 제목 줄의 터치 여백만큼 뺀다.
  static const double _beforeSectionTitle =
      AppSpacing.s32 - AppSectionHeader.touchInset;
  static const double _afterSectionTitle =
      AppSpacing.s16 - AppSectionHeader.touchInset;

  @override
  Widget build(BuildContext context) {
    // extendBody로 아래 고정 줄 높이가 아래 여백에 들어 있다.
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: AppSpacing.s24,
        bottom: bottomInset + AppSpacing.s20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: _headerInset),
            child: PaymentResultHeader(
              paidAtLabel: payment.paidAtLabel,
              cardLabel: payment.card.displayName,
              escrowed: payment.isEscrowed,
            ),
          ),
          const SizedBox(height: AppSpacing.s32),
          _Inset(child: OrderSummarySection(payment: payment)),
          const SizedBox(height: _beforeSectionTitle),
          AppSectionHeader(
            title: '배송지',
            actionLabel: '배송지 변경',
            onAction: onChangeAddress,
          ),
          const SizedBox(height: _afterSectionTitle),
          _Inset(
            child: ShippingAddressPanel(
              address: payment.address,
              deliveryMemo: payment.deliveryMemo,
              onMemoTap: onMemoTap,
            ),
          ),
          const SizedBox(height: _beforeSectionTitle),
          AppSectionHeader(
            title: '결제 수단',
            actionLabel: '관리',
            onAction: onManageCards,
          ),
          const SizedBox(height: _afterSectionTitle),
          _Inset(child: PaymentMethodPanel(card: payment.card)),
          const SizedBox(height: _beforeSectionTitle),
          const AppSectionHeader(title: '에스크로 진행'),
          const SizedBox(height: _afterSectionTitle),
          _Inset(child: EscrowProgress(stage: payment.stage)),
        ],
      ),
    );
  }
}

class _Inset extends StatelessWidget {
  const _Inset({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s16),
    child: child,
  );
}

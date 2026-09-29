import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/order_payment.dart';

/// 배송지 상자: "우리집 홍길동" · "010-0000-0000 | 주소" · 배송 메모 선택.
class ShippingAddressPanel extends StatelessWidget {
  const ShippingAddressPanel({
    super.key,
    required this.address,
    this.deliveryMemo,
    this.onMemoTap,
  });

  final ShippingAddress address;
  final String? deliveryMemo;
  final VoidCallback? onMemoTap;

  static const double _contactDividerHeight = AppSpacing.s8;

  @override
  Widget build(BuildContext context) {
    final contactStyle = AppTextStyles.pretendardBody2Regular;
    return AppPanel(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTitlePair(title: address.label, value: address.recipient),
          const SizedBox(height: AppSpacing.s10),
          Row(
            children: [
              Text(address.phone, style: contactStyle),
              const SizedBox(width: AppSpacing.s12),
              const AppVerticalDivider(height: _contactDividerHeight),
              const SizedBox(width: AppSpacing.s12),
              Expanded(
                child: Text(
                  address.address,
                  style: contactStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.s16),
          const AppDivider(),
          const SizedBox(height: AppSpacing.s16),
          Text('배송 메모', style: AppTextStyles.pretendardH3),
          const SizedBox(height: AppSpacing.s10),
          AppSelectField(
            hint: '선택해주세요',
            value: deliveryMemo,
            onTap: onMemoTap,
            semanticLabel: '배송 메모',
          ),
        ],
      ),
    );
  }
}

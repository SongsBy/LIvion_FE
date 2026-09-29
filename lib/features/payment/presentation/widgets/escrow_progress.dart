import 'package:flutter/material.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/order_payment.dart';

/// 에스크로 진행 4단계와 안내. 지난 단계는 체크, 남은 단계는 번호로 보인다.
class EscrowProgress extends StatelessWidget {
  const EscrowProgress({super.key, required this.stage});

  final EscrowStage stage;

  /// [EscrowStage] 순서와 같다. 마지막 단계는 "수취 확인 › 판매자 지급"으로 잇는다.
  static const List<(String, String?)> _steps = [
    ('결제완료', null),
    ('에스크로 예치', null),
    ('배송 중', null),
    ('수취 확인', '판매자 지급'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (var i = 0; i < _steps.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.s8),
          _step(i),
        ],
        const SizedBox(height: AppSpacing.s10),
        Text(
          '결제 금액은 Livion 에스크로에 보관되며 수취 확인(또는 배송 완료 후 3일) 시 '
          '판매자에게 지급됩니다. 등급·소비기한 불일치 시 수취 확인 전 반품 요청 가능.',
          style: AppTextStyles.pretendardCaption1Medium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }

  Widget _step(int index) {
    final (label, next) = _steps[index];
    if (index <= stage.index) {
      return AppStatusRow.checked(next == null ? label : '$label · $next');
    }
    return AppStatusRow.step(index + 1, label, nextLabel: next);
  }
}

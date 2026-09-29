import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_application.dart';
import '../providers/seller_application_controller.dart';

/// 1단계 "유형" (Figma 판매자 전환_01, node 37:2861).
///
/// 판매자 유형 선택 · 심사 절차 · 준비 서류. 절차·서류는 정책 문구라 고정으로 둔다.
class SellerTypeStep extends ConsumerWidget {
  const SellerTypeStep({super.key});

  static const _reviewSteps = ['접수', '서류 확인', '채널 개설', '첫 편성'];

  /// (필수 여부, 서류 이름, 덧붙이는 설명)
  static const _documents = [
    (true, '사업자등록번호', null),
    (true, '담당자 휴대폰 인증', null),
    (true, '정산 계좌', '1원 인증'),
    (false, '통신판매업 신고번호', null),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellerType = ref.watch(
      sellerApplicationControllerProvider.select((s) => s.sellerType),
    );
    final controller = ref.read(sellerApplicationControllerProvider.notifier);
    final caption = AppTextStyles.pretendardCaption1MediumRelaxed.copyWith(
      color: AppColors.textSecondary,
    );

    return AppFormScrollView(
      children: [
        AppOptionCard(
          title: '사업자',
          caption: '사업자등록번호로 즉시 심사 · 통신판매업 신고번호 선택',
          selected: sellerType == SellerType.business,
          onTap: () => controller.selectSellerType(SellerType.business),
        ),
        const SizedBox(height: AppSpacing.s10),
        const AppOptionCard(
          title: '개인 판매자',
          caption: '개인 재고 판매는 2년차 오픈 예정',
          selected: false,
          onTap: null,
          badge: AppBadge.subtle('준비중'),
        ),
        const SizedBox(height: AppSpacing.s10),
        Text(
          '입찰 참여 전 카드 1장을 등록해야 하며, 낙찰 즉시 해당 카드로 결제됩니다.\n'
          '충전·선불 예치는 없습니다.',
          style: caption,
        ),
        const SizedBox(height: AppSpacing.s32),
        Text('심사 절차', style: AppTextStyles.archivoH1),
        const SizedBox(height: AppSpacing.s16),
        AppTileGrid(
          columns: 2,
          children: [
            for (var i = 0; i < _reviewSteps.length; i++)
              AppStatusRow.step(i + 1, _reviewSteps[i], dimmed: false),
          ],
        ),
        const SizedBox(height: AppSpacing.s10),
        Text('접수 후 영업일 2일 이내 결과 안내 · 심사 중에도 재고 등록 가능', style: caption),
        const SizedBox(height: AppSpacing.s32),
        Text('준비 서류', style: AppTextStyles.archivoH1),
        const SizedBox(height: AppSpacing.s16),
        for (var i = 0; i < _documents.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.s8),
          _DocumentRow(
            required: _documents[i].$1,
            name: _documents[i].$2,
            detail: _documents[i].$3,
          ),
        ],
      ],
    );
  }
}

/// "필수 사업자등록번호", "필수 정산 계좌 1원 인증".
class _DocumentRow extends StatelessWidget {
  const _DocumentRow({required this.required, required this.name, this.detail});

  final bool required;
  final String name;
  final String? detail;

  @override
  Widget build(BuildContext context) {
    return AppPanel.compact(
      child: Row(
        children: [
          required
              ? const AppBadge.outline('필수')
              : const AppBadge.outlineMuted('선택'),
          const SizedBox(width: AppSpacing.s10),
          Flexible(child: Text(name, style: AppTextStyles.pretendardH3)),
          if (detail != null) ...[
            const SizedBox(width: AppSpacing.s5),
            Text(detail!, style: AppTextStyles.pretendardBody2Regular),
          ],
        ],
      ),
    );
  }
}

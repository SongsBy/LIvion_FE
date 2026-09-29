import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_application.dart';
import '../providers/seller_application_controller.dart';
import '../providers/seller_onboarding_providers.dart';
import 'seller_application_ui.dart';

/// 4단계 "정산·약관" (Figma 판매자 전환_04, node 37:3209).
///
/// 정산 계좌(은행 + 1원 인증) · 세금계산서 이메일 · 정산 안내 · 필수 약관 동의.
/// 정산 안내는 정책 문구라 고정으로 둔다.
class SettlementTermsStep extends ConsumerWidget {
  const SettlementTermsStep({
    super.key,
    required this.onMessage,
    required this.onOpenAgreement,
  });

  /// 은행 목록을 못 불러왔을 때 등 짧은 안내.
  final ValueChanged<String> onMessage;

  /// 약관 행의 화살표를 눌렀을 때. 약관 본문은 아직 준비 중이다.
  final ValueChanged<SellerAgreement> onOpenAgreement;

  static const _settlementInfo = [
    ('수수료', '낙찰가의 12% · 유찰 시 0원'),
    ('프라임 편성료', '토·일 19:00 · 10~30만 원'),
    ('지급 시점', '구매자 수취 확인 후 영업일 1일'),
    ('세금계산서', '월 1회 자동 발행'),
  ];

  /// Figma: 이메일 입력과 "정산 안내" 사이 25 + 4(바탕색 구분 띠) + 25.
  static const double _sectionBreak =
      AppSpacing.s25 + AppSpacing.s4 + AppSpacing.s25;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 은행 목록을 미리 받아 둔다. 이 단계가 떠 있는 동안 살아 있다.
    ref.watch(sellerBanksProvider);
    final state = ref.watch(sellerApplicationControllerProvider);
    final controller = ref.read(sellerApplicationControllerProvider.notifier);

    final accountMessage = checkFailureMessage(
      state.accountCheck,
      rejected: '계좌를 확인하지 못했어요. 은행과 계좌번호를 확인해 주세요.',
    );

    return AppFormScrollView(
      children: [
        AppFormField(
          label: '정산 계좌',
          isRequired: true,
          message: accountMessage,
          isError: accountMessage != null,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppPickerField(
                hint: '은행 선택',
                value: state.bank?.name,
                semanticLabel: '정산 은행',
                onTap: () => _pickBank(context, ref, state.bank),
              ),
              const SizedBox(height: AppSpacing.s12),
              AppTextInput(
                hint: '계좌번호 입력',
                semanticLabel: '정산 계좌번호',
                initialValue: state.accountNumber,
                onChanged: controller.setAccountNumber,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(
                    SellerApplicationRules.accountNumberMaxLength,
                  ),
                ],
                trailing: checkTrailing(
                  status: state.accountCheck,
                  actionLabel: '1원 인증',
                  passedLabel: '인증완료',
                  onAction:
                      state.bank != null &&
                          SellerApplicationRules.isAccountNumber(
                            state.accountNumber,
                          )
                      ? controller.verifyAccount
                      : null,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '세금계산서 이메일',
          isRequired: true,
          child: AppTextInput(
            hint: '이메일을 입력해주세요.',
            semanticLabel: '세금계산서 이메일',
            initialValue: state.taxInvoiceEmail,
            onChanged: controller.setTaxInvoiceEmail,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
          ),
        ),
        const SizedBox(height: _sectionBreak),
        Text('정산 안내', style: AppTextStyles.archivoH1),
        const SizedBox(height: AppSpacing.s16),
        AppPanel(
          padding: const EdgeInsets.all(AppSpacing.s16),
          child: Column(
            children: [
              for (var i = 0; i < _settlementInfo.length; i++) ...[
                if (i > 0) ...[
                  const SizedBox(height: AppSpacing.s16),
                  const AppDivider(),
                  const SizedBox(height: AppSpacing.s16),
                ],
                AppInfoRow(
                  label: _settlementInfo[i].$1,
                  value: _settlementInfo[i].$2,
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppCheckRow.heading(
          label: '전체동의',
          checked: state.agreedToAll,
          onChanged: (agreed) => controller.setAllAgreements(agreed: agreed),
        ),
        const SizedBox(height: AppSpacing.s16),
        for (var i = 0; i < SellerAgreement.values.length; i++) ...[
          if (i > 0) const SizedBox(height: AppSpacing.s8),
          _agreementRow(SellerAgreement.values[i], state, controller),
        ],
      ],
    );
  }

  Widget _agreementRow(
    SellerAgreement agreement,
    SellerApplicationState state,
    SellerApplicationController controller,
  ) {
    return AppCheckRow(
      label: agreement.label,
      checked: state.agreements.contains(agreement),
      onChanged: (agreed) => controller.setAgreement(agreement, agreed: agreed),
      badge: const AppBadge.outline('필수'),
      onOpen: () => onOpenAgreement(agreement),
    );
  }

  Future<void> _pickBank(
    BuildContext context,
    WidgetRef ref,
    SettlementBank? selected,
  ) async {
    final List<SettlementBank> banks;
    try {
      banks = await ref.read(sellerBanksProvider.future);
    } catch (_) {
      ref.invalidate(sellerBanksProvider);
      onMessage('은행 목록을 불러오지 못했어요. 다시 시도해 주세요.');
      return;
    }
    if (!context.mounted) return;
    final bank = await showAppLogoGridSheet<SettlementBank>(
      context,
      semanticLabel: '은행 선택',
      options: [
        for (final b in banks)
          AppLogoOption(value: b, label: b.name, logo: b.logo),
      ],
      selected: selected,
    );
    if (bank != null && context.mounted) {
      ref.read(sellerApplicationControllerProvider.notifier).selectBank(bank);
    }
  }
}

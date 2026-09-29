import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../../domain/entities/seller_application.dart';
import '../providers/seller_application_controller.dart';
import 'phone_verification_field.dart';
import 'seller_application_ui.dart';

/// 2단계 "사업자" (Figma 판매자 전환_02, node 37:2974).
///
/// 사업자등록번호 확인 · 상호 · 대표자명 · 담당자 휴대폰 인증 · 통신판매업 신고번호(선택)
/// · 취급 재고 유형(여러 개) · 월 예상 방송.
class BusinessInfoStep extends ConsumerWidget {
  const BusinessInfoStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sellerApplicationControllerProvider);
    final controller = ref.read(sellerApplicationControllerProvider.notifier);

    final businessMessage = checkFailureMessage(
      state.businessNumberCheck,
      rejected: '확인되지 않는 사업자등록번호예요.',
    );

    return AppFormScrollView(
      children: [
        AppFormField(
          label: '사업자등록번호',
          isRequired: true,
          message: businessMessage,
          isError: businessMessage != null,
          child: AppTextInput(
            hint: '사업자등록번호를 입력해주세요.',
            semanticLabel: '사업자등록번호',
            initialValue: state.businessNumber,
            onChanged: controller.setBusinessNumber,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(
                SellerApplicationRules.businessNumberLength,
              ),
            ],
            trailing: checkTrailing(
              status: state.businessNumberCheck,
              actionLabel: '확인',
              passedLabel: '확인완료',
              onAction:
                  SellerApplicationRules.isBusinessNumber(state.businessNumber)
                  ? controller.verifyBusinessNumber
                  : null,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '상호',
          isRequired: true,
          child: AppTextInput(
            hint: '상호명을 입력해주세요.',
            semanticLabel: '상호',
            initialValue: state.companyName,
            onChanged: controller.setCompanyName,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '대표자명',
          isRequired: true,
          child: AppTextInput(
            hint: '대표자명을 입력해주세요.',
            semanticLabel: '대표자명',
            initialValue: state.representativeName,
            onChanged: controller.setRepresentativeName,
            textInputAction: TextInputAction.next,
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        const PhoneVerificationField(),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '통신판매업 신고번호',
          message: 'Livion은 통신판매중개자입니다',
          child: AppTextInput(
            hint: '선택 사항',
            semanticLabel: '통신판매업 신고번호',
            initialValue: state.mailOrderNumber,
            onChanged: controller.setMailOrderNumber,
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '취급 재고 유형',
          note: '중복선택가능',
          isRequired: true,
          child: AppTileGrid(
            columns: 2,
            children: [
              for (final type in StockType.values)
                AppOptionTile.checkbox(
                  label: type.label,
                  selected: state.stockTypes.contains(type),
                  onTap: () => controller.toggleStockType(type),
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '월 예상 방송',
          isRequired: true,
          spacing: AppSpacing.s10,
          child: AppTileGrid(
            columns: MonthlyBroadcasts.values.length,
            children: [
              for (final value in MonthlyBroadcasts.values)
                AppOptionTile.radio(
                  label: value.label,
                  selected: state.monthlyBroadcasts == value,
                  onTap: () => controller.selectMonthlyBroadcasts(value),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

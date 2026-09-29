import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/presentation/verification_countdown.dart';

import '../../domain/entities/seller_application.dart';
import '../providers/seller_application_controller.dart';
import '../providers/seller_onboarding_providers.dart';
import 'seller_application_ui.dart';

/// "담당자 연락처": 휴대폰 번호 + 인증번호 입력 (Figma 37:3034).
///
/// 번호 옆 "인증번호"로 보내면(다시 누르면 재전송) 아래에 인증번호 칸과 남은 시간이 보인다.
/// 6자리를 넣으면 바로 확인하고, 통과하면 번호 옆이 "✓ 인증완료"로 바뀐다.
class PhoneVerificationField extends ConsumerWidget {
  const PhoneVerificationField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(sellerApplicationControllerProvider);
    final controller = ref.read(sellerApplicationControllerProvider.notifier);
    final expiresAt = state.phoneCodeExpiresAt;
    final verified = state.phoneCheck.isPassed;

    final Widget phoneTrailing = verified
        ? const AppInputTrailing.status('인증완료')
        : state.phoneCodeRequest.isChecking
        ? const AppInputTrailing.progress()
        // Figma: 보낸 뒤에도 같은 "인증번호" 버튼으로 다시 보낸다.
        : AppInputTrailing.action(
            '인증번호',
            onPressed: SellerApplicationRules.isMobilePhone(state.contactPhone)
                ? controller.requestPhoneCode
                : null,
          );

    final message = state.phoneCodeRequest == CheckStatus.failed
        ? '인증번호를 보내지 못했어요. 잠시 후 다시 시도해 주세요.'
        : checkFailureMessage(state.phoneCheck, rejected: '인증번호가 맞지 않아요.');

    return AppFormField(
      label: '담당자 연락처',
      isRequired: true,
      message: message,
      isError: message != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppTextInput(
            hint: '휴대폰 번호를 입력해주세요.',
            semanticLabel: '담당자 휴대폰 번호',
            initialValue: state.contactPhone,
            onChanged: controller.setContactPhone,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(
                SellerApplicationRules.mobilePhoneMaxLength,
              ),
            ],
            trailing: phoneTrailing,
          ),
          if (expiresAt != null && !verified) ...[
            const SizedBox(height: AppSpacing.s12),
            AppTextInput(
              // 다시 보내면 새 칸으로 바꿔 입력한 번호를 비운다.
              key: ValueKey(expiresAt),
              hint: '인증번호 입력',
              semanticLabel: '인증번호',
              initialValue: state.phoneCode,
              onChanged: controller.setPhoneCode,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(
                  SellerApplicationRules.verificationCodeLength,
                ),
              ],
              trailing: state.phoneCheck.isChecking
                  ? const AppInputTrailing.progress()
                  : VerificationCountdown(
                      expiresAt: expiresAt,
                      now: ref.watch(sellerOnboardingClockProvider),
                    ),
            ),
          ],
        ],
      ),
    );
  }
}

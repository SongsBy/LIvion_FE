import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';
import 'package:livion/shared/domain/contact_rules.dart';
import 'package:livion/shared/presentation/verification_countdown.dart';

import '../../domain/entities/sign_up.dart';
import '../providers/auth_dependencies.dart';
import '../providers/sign_up_controller.dart';
import 'auth_ui.dart';

/// "아이디 *": 입력 + "중복 확인" (Figma 37:4084).
///
/// 영문 대문자는 소문자로 바꾸고 영문·숫자만 받는다. 통과하면 입력창 안에 "✓ 사용가능".
class SignUpUsernameField extends ConsumerWidget {
  const SignUpUsernameField({super.key});

  static final _formatters = [
    TextInputFormatter.withFunction(
      (_, value) => value.copyWith(text: value.text.toLowerCase()),
    ),
    FilteringTextInputFormatter.allow(RegExp('[a-z0-9]')),
    LengthLimitingTextInputFormatter(AuthRules.usernameMaxLength),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username = ref.watch(
      signUpControllerProvider.select((s) => s.username),
    );
    final check = ref.watch(
      signUpControllerProvider.select((s) => s.usernameCheck),
    );
    final controller = ref.read(signUpControllerProvider.notifier);
    final valid = AuthRules.isUsername(username);
    final failure = checkFailureMessage(check, rejected: '이미 사용 중인 아이디예요.');

    return AppFormField(
      label: '아이디',
      isRequired: true,
      message: failure ?? '4~12자 / 영문 소문자(숫자 조합 가능)',
      isError: failure != null || (username.isNotEmpty && !valid),
      child: Row(
        children: [
          Expanded(
            child: AppTextInput(
              hint: '아이디를 입력해주세요.',
              semanticLabel: '아이디',
              initialValue: username,
              onChanged: controller.setUsername,
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.next,
              autofillHints: const [AutofillHints.newUsername],
              inputFormatters: _formatters,
              trailing: check.isPassed
                  ? const AppInputTrailing.status('사용가능')
                  : null,
            ),
          ),
          const SizedBox(width: AppSpacing.s12),
          AppFieldButton(
            label: '중복 확인',
            isLoading: check.isChecking,
            onPressed: valid && !check.isPassed
                ? controller.checkUsername
                : null,
          ),
        ],
      ),
    );
  }
}

/// "비밀번호 *" + "비밀번호 확인 *" (Figma 37:4096, 37:4104).
class SignUpPasswordFields extends ConsumerWidget {
  const SignUpPasswordFields({super.key});

  static final _formatters = [
    FilteringTextInputFormatter.deny(RegExp(r'\s')),
    LengthLimitingTextInputFormatter(AuthRules.passwordMaxLength),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(
      signUpControllerProvider.select((s) => s.password),
    );
    final confirm = ref.watch(
      signUpControllerProvider.select((s) => s.passwordConfirm),
    );
    final controller = ref.read(signUpControllerProvider.notifier);
    final mismatch = confirm.isNotEmpty && confirm != password;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppFormField(
          label: '비밀번호',
          isRequired: true,
          message: '6~20자 / 영문 대문자, 소문자, 숫자, 특수문자 중 2가지 이상 조합',
          isError: password.isNotEmpty && !AuthRules.isPassword(password),
          child: AppTextInput(
            hint: '비밀번호를 입력해주세요.',
            semanticLabel: '비밀번호',
            initialValue: password,
            onChanged: controller.setPassword,
            obscureText: true,
            textInputAction: TextInputAction.next,
            autofillHints: const [AutofillHints.newPassword],
            inputFormatters: _formatters,
          ),
        ),
        const SizedBox(height: AppSpacing.s25),
        AppFormField(
          label: '비밀번호 확인',
          isRequired: true,
          message: mismatch ? '비밀번호가 일치하지 않아요.' : null,
          isError: mismatch,
          child: AppTextInput(
            hint: '비밀번호를 다시 입력해주세요.',
            semanticLabel: '비밀번호 확인',
            initialValue: confirm,
            onChanged: controller.setPasswordConfirm,
            obscureText: true,
            textInputAction: TextInputAction.next,
            inputFormatters: _formatters,
            trailing: confirm.isNotEmpty && !mismatch
                ? const AppInputTrailing.status('일치')
                : null,
          ),
        ),
      ],
    );
  }
}

/// "이메일 *": 아이디 입력 + "@" + 도메인 선택 (Figma 37:4110).
class SignUpEmailField extends ConsumerWidget {
  const SignUpEmailField({super.key});

  static final _formatters = [
    FilteringTextInputFormatter.deny(RegExp(r'[@\s]')),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final local = ref.watch(
      signUpControllerProvider.select((s) => s.emailLocal),
    );
    final domain = ref.watch(
      signUpControllerProvider.select((s) => s.emailDomain),
    );
    final controller = ref.read(signUpControllerProvider.notifier);

    return AppFormField(
      label: '이메일',
      isRequired: true,
      child: Row(
        children: [
          Expanded(
            child: AppTextInput(
              hint: '이메일',
              semanticLabel: '이메일 아이디',
              initialValue: local,
              onChanged: controller.setEmailLocal,
              keyboardType: TextInputType.emailAddress,
              inputFormatters: _formatters,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.s12),
            child: ExcludeSemantics(
              child: Text(
                '@',
                style: AppTextStyles.pretendardBody1Regular.copyWith(
                  color: AppColors.textDisabled,
                ),
              ),
            ),
          ),
          Expanded(
            child: AppPickerField.dropdown(
              hint: '선택',
              value: domain,
              semanticLabel: '이메일 도메인',
              onTap: () async {
                FocusScope.of(context).unfocus();
                final picked = await showAppSelectSheet(
                  context,
                  title: '이메일 도메인',
                  options: AuthRules.emailDomains,
                  selected: domain,
                );
                if (picked != null) controller.selectEmailDomain(picked);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/// "휴대폰 번호 *": 번호 + "인증번호 받기", 보낸 뒤 인증번호 칸 (Figma 37:4122).
///
/// 6자리를 넣으면 바로 확인하고, 통과하면 번호 칸 안이 "✓ 인증완료"로 바뀐다.
class SignUpPhoneField extends ConsumerWidget {
  const SignUpPhoneField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signUpControllerProvider);
    final controller = ref.read(signUpControllerProvider.notifier);
    final expiresAt = state.phoneCodeExpiresAt;
    final verified = state.phoneCheck.isPassed;

    final message = state.phoneCodeRequest == CheckStatus.failed
        ? '인증번호를 보내지 못했어요. 잠시 후 다시 시도해 주세요.'
        : checkFailureMessage(state.phoneCheck, rejected: '인증번호가 맞지 않아요.');

    return AppFormField(
      label: '휴대폰 번호',
      isRequired: true,
      message: message,
      isError: message != null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextInput(
                  hint: '휴대폰 번호를 입력해주세요.',
                  semanticLabel: '휴대폰 번호',
                  initialValue: state.phone,
                  onChanged: controller.setPhone,
                  keyboardType: TextInputType.phone,
                  autofillHints: const [AutofillHints.telephoneNumber],
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(
                      ContactRules.mobilePhoneMaxLength,
                    ),
                  ],
                  trailing: verified
                      ? const AppInputTrailing.status('인증완료')
                      : null,
                ),
              ),
              const SizedBox(width: AppSpacing.s12),
              // 보낸 뒤에도 같은 버튼으로 다시 보낸다.
              AppFieldButton(
                label: '인증번호 받기',
                isLoading: state.phoneCodeRequest.isChecking,
                onPressed: ContactRules.isMobilePhone(state.phone) && !verified
                    ? controller.requestPhoneCode
                    : null,
              ),
            ],
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
              autofillHints: const [AutofillHints.oneTimeCode],
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(
                  ContactRules.verificationCodeLength,
                ),
              ],
              trailing: state.phoneCheck.isChecking
                  ? const AppInputTrailing.progress()
                  : VerificationCountdown(
                      expiresAt: expiresAt,
                      now: ref.watch(authClockProvider),
                    ),
            ),
          ],
        ],
      ),
    );
  }
}

/// 약관 동의 목록: 전체 동의 + 약관별 줄 (Figma 37:4133).
class SignUpAgreements extends ConsumerWidget {
  const SignUpAgreements({super.key, required this.onView});

  /// 약관 "보기".
  final ValueChanged<SignUpAgreement> onView;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final agreements = ref.watch(
      signUpControllerProvider.select((s) => s.agreements),
    );
    final controller = ref.read(signUpControllerProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AppAgreementRow.all(
          checked: agreements.length == SignUpAgreement.values.length,
          onChanged: controller.setAllAgreements,
        ),
        // Figma: 전체 동의(16)와 첫 약관 줄(20)의 높이 차이만큼 더 띄운다.
        const SizedBox(height: AppSpacing.s2),
        for (final agreement in SignUpAgreement.values)
          AppAgreementRow(
            label: agreement.label,
            checked: agreements.contains(agreement),
            onChanged: (_) => controller.toggleAgreement(agreement),
            onView: () => onView(agreement),
          ),
      ],
    );
  }
}

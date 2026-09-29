import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../providers/sign_up_controller.dart';
import '../widgets/auth_heading.dart';
import '../widgets/auth_ui.dart';
import '../widgets/sign_up_fields.dart';

/// 회원가입 (Figma 37:4077).
///
/// "가입하기"를 마치면 가입한 아이디를 돌려주며 닫힌다 (로그인 화면이 채워 둔다).
/// 뒤로 가면 null로 닫힌다. 약관 "보기"는 아직 "준비 중"이다.
class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});

  /// 화면을 띄우고, 가입을 마쳤으면 아이디를 돌려준다.
  static Future<String?> open(BuildContext context) {
    return Navigator.of(
      context,
    ).push<String>(MaterialPageRoute(builder: (_) => const SignUpScreen()));
  }

  /// Figma: 상단 바 아래 제목까지 40 (상단 바 56, 제목 위 96).
  static const double _headerTop = AppSpacing.s40;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSubmitting = ref.watch(
      signUpControllerProvider.select((s) => s.isSubmitting),
    );

    return PopScope(
      canPop: !isSubmitting,
      child: Scaffold(
        backgroundColor: AppColors.backgroundSubtle,
        extendBody: true,
        appBar: AppTopBar.title(
          title: '회원가입',
          onBack: () => Navigator.of(context).maybePop(),
        ),
        bottomNavigationBar: AppFrostedBar(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.s16,
            AppSpacing.s8,
            AppSpacing.s16,
            0,
          ),
          minBottom: AppSpacing.s25,
          child: AppButton.ctaMedium(
            label: '가입하기',
            isLoading: isSubmitting,
            onPressed: () => _submit(context, ref),
          ),
        ),
        body: AutofillGroup(
          child: AppFormScrollView(
            top: _headerTop,
            children: [
              const AuthHeading(
                title: '리비온에 오신 것을 환영해요',
                message: '회원가입하고 라이브 쇼핑을 시작해보세요.',
              ),
              const SizedBox(height: AppSpacing.s28),
              const SignUpUsernameField(),
              const SizedBox(height: AppSpacing.s25),
              const SignUpPasswordFields(),
              const SizedBox(height: AppSpacing.s25),
              const SignUpEmailField(),
              const SizedBox(height: AppSpacing.s25),
              const SignUpPhoneField(),
              const SizedBox(height: AppSpacing.s32 + AppSpacing.s4),
              SignUpAgreements(
                onView: (agreement) =>
                    _showMessage(context, '${agreement.label} 보기는 준비 중입니다.'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submit(BuildContext context, WidgetRef ref) async {
    FocusScope.of(context).unfocus();
    final outcome = await ref.read(signUpControllerProvider.notifier).submit();
    if (!context.mounted || outcome == null) return;
    switch (outcome) {
      case SignUpCompleted(:final username):
        TextInput.finishAutofillContext();
        Navigator.of(context).pop(username);
      case SignUpIncomplete(:final issue):
        _showMessage(context, issue.message);
      case SignUpFailed():
        _showMessage(context, '회원가입에 실패했어요. 잠시 후 다시 시도해 주세요.');
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

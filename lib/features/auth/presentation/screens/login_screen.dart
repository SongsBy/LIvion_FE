import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:livion/design_system/design_system.dart';

import '../providers/login_controller.dart';
import '../widgets/auth_text_action.dart';
import '../widgets/auth_ui.dart';
import '../widgets/login_sections.dart';
import 'sign_up_screen.dart';

/// 로그인 (Figma 37:4019).
///
/// 로그인에 성공하면 [onSignedIn]을 부른다. 다음 화면으로 넘기는 일은 여는 쪽이 정한다.
/// "회원가입"은 [SignUpScreen]을 열고, 가입을 마치면 아이디를 채워 둔다.
/// 아이디·비밀번호 찾기와 SNS 로그인은 아직 "준비 중"이다.
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key, required this.onSignedIn, this.onClose});

  final VoidCallback onSignedIn;

  /// 상단 뒤로가기. null이면 이전 화면으로 돌아간다.
  final VoidCallback? onClose;

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();

  /// Figma: 상단 바 아래 로고까지 69 (상단 바 56, 로고 위 125).
  static const double _headerTop = 69;

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSubmitting = ref.watch(loginControllerProvider);
    // 12pt 글자 버튼은 위아래로 누를 자리를 넓혔으므로 그만큼 간격을 줄인다.
    const touch = AuthTextAction.touchPadding;

    return Scaffold(
      backgroundColor: AppColors.backgroundDefault,
      appBar: AppTopBar.back(
        onBack: widget.onClose ?? () => Navigator.of(context).maybePop(),
      ),
      body: AutofillGroup(
        child: AppFormScrollView(
          top: _headerTop,
          children: [
            const LoginHeader(),
            const SizedBox(height: AppSpacing.s48),
            AppFormField(
              label: '아이디',
              spacing: AppSpacing.s10,
              child: AppTextInput(
                hint: '아이디를 입력해주세요.',
                semanticLabel: '아이디',
                controller: _username,
                bordered: true,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.next,
                autofillHints: const [AutofillHints.username],
              ),
            ),
            const SizedBox(height: AppSpacing.s20),
            AppFormField(
              label: '비밀번호',
              spacing: AppSpacing.s10,
              child: AppTextInput(
                hint: '비밀번호를 입력해주세요.',
                semanticLabel: '비밀번호',
                controller: _password,
                bordered: true,
                obscureText: true,
                textInputAction: TextInputAction.done,
                autofillHints: const [AutofillHints.password],
              ),
            ),
            const SizedBox(height: AppSpacing.s20),
            AppButton.ctaMedium(
              label: '로그인',
              isLoading: isSubmitting,
              onPressed: _submit,
            ),
            const SizedBox(height: AppSpacing.s18 - touch),
            LoginHelpLinks(
              onFindUsername: () => _showMessage('아이디 찾기는 준비 중입니다.'),
              onFindPassword: () => _showMessage('비밀번호 찾기는 준비 중입니다.'),
            ),
            const SizedBox(height: AppSpacing.s48 + AppSpacing.s4 - touch),
            SocialLoginSection(
              onKakao: () => _showMessage('카카오 로그인은 준비 중입니다.'),
              onNaver: () => _showMessage('네이버 로그인은 준비 중입니다.'),
            ),
            const SizedBox(height: AppSpacing.s28 - touch),
            SignUpPrompt(onSignUp: _openSignUp),
          ],
        ),
      ),
    );
  }

  Future<void> _submit() async {
    FocusScope.of(context).unfocus();
    final result = await ref
        .read(loginControllerProvider.notifier)
        .submit(username: _username.text, password: _password.text);
    if (!mounted || result == null) return;
    final message = result.message;
    if (message == null) {
      TextInput.finishAutofillContext();
      widget.onSignedIn();
    } else {
      _showMessage(message);
    }
  }

  Future<void> _openSignUp() async {
    FocusScope.of(context).unfocus();
    final username = await SignUpScreen.open(context);
    if (!mounted || username == null) return;
    _username.text = username;
    _password.clear();
    _showMessage('회원가입이 완료되었어요. 로그인해 주세요.');
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}
